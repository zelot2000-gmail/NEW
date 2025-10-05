<?php
// 1. เรียกใช้งานไฟล์เชื่อมต่อฐานข้อมูลและฟังก์ชันยูทิลิตี้
include("inc_connect.php");

// ------------------------------------------------------------------------------------------------
// ** หมายเหตุ: โค้ดส่วนนี้เป็นการจำลองการดึงและอ่านข้อมูล RSS **
// ในการใช้งานจริง คุณต้องแทนที่โค้ดส่วนนี้ด้วยวิธีการดึงข้อมูล RSS ที่ถูกต้องของคุณ 
// เช่น การใช้ cURL, SimpleXML, หรือ library อื่นๆ 
// ------------------------------------------------------------------------------------------------

// ตัวอย่างข้อมูล RSS Feed ที่สมมติว่าดึงมาจาก EGP (เป็น TIS-620)
// ในการใช้งานจริง คุณต้องดึงข้อมูล XML มาจาก URL ของ EGP
$rss_items = array(
    // ข้อมูลจาก EGP ที่สมมติว่าเป็น TIS-620 (อักขระแปลกๆ ในโค้ดคือการจำลอง TIS-620)
    // สำหรับการสาธิตนี้ ผมจะใช้ข้อความที่สมมติว่าต้องการการแปลงภาษา
    // (ในโค้ด PHP จริง ๆ การแสดงผล TIS-620 จะทำให้เห็นอักขระเหล่านี้เป็นภาษาต่างดาว)
    array(
        "deptid" => $deptid, // ใช้ ID ที่ตั้งไว้ใน inc_connect.php
        "types" => "D0",
        "title" => "ประกวดราคาจ้างก่อสร&#2336;างทางระบ&#2361;าย&#2362;&#2367;&#2353;&#2375;&#2352;&#2360;&#2379; &#2371; &#2358;&#2363;&#2369;&#2350;&#2366;&#2357;&#2361; &#2361;&#2358;&#2355; &#2347;&#2367;&#2379;&#2352;&#2361;", // สมมติว่านี่คือ Mojibake
        "link" => "http://process3.gprocurement.go.th/link/example1",
        "sdate" => date("Y-m-d"),
    ),
    array(
        "deptid" => $deptid,
        "types" => "W0",
        "title" => "ซื้อวัสดุสำนักงานสำหร&#2352;&#2375;&#2372; &#2361;&#2358;&#2353; &#2347;&#2367;&#2379;&#2352;&#2361;&#2371; &#2361;&#2358;&#2361;",
        "link" => "http://process3.gprocurement.go.th/link/example2",
        "sdate" => date("Y-m-d"),
    ),
    // ในการใช้งานจริง: ลูปอ่านข้อมูลจาก XML Element
);

// ------------------------------------------------------------------------------------------------
// ** เริ่มกระบวนการบันทึกข้อมูล **
// ------------------------------------------------------------------------------------------------

$inserted_count = 0;
foreach ($rss_items as $item) {
    $deptid_raw = $item['deptid'];
    $types_raw = $item['types'];
    $title_raw = $item['title'];
    $link_raw = $item['link'];
    $sdate_raw = $item['sdate'];

    // -------------------------------------------------------------------
    // ** จุดสำคัญ: การแปลง Character Set ก่อนบันทึก **
    // -------------------------------------------------------------------
    
    // (1) แปลง TIS-620 เป็น UTF-8
    // เนื่องจากปัญหาเกิดจากการดึงข้อมูล TIS-620 เข้าสู่ DB ที่เป็น UTF-8
    $title_utf8 = @iconv("TIS-620", "UTF-8//IGNORE", $title_raw);
    $link_utf8 = @iconv("TIS-620", "UTF-8//IGNORE", $link_raw);
    
    // หาก title_utf8 แปลงแล้วเป็นค่าว่าง (null) ให้ใช้ค่าเดิม 
    // หรือทำการจัดการข้อผิดพลาดตามความเหมาะสม
    if (empty($title_utf8)) {
        // หากแปลงไม่สำเร็จ อาจหมายความว่าข้อมูลต้นทางเป็น UTF-8 อยู่แล้ว
        // หรือเกิดข้อผิดพลาดในการแปลงจริงๆ
        $title_utf8 = $title_raw;
    }
    if (empty($link_utf8)) {
        $link_utf8 = $link_raw;
    }

    // -------------------------------------------------------------------
    // (2) ทำการ Escape String เพื่อป้องกัน SQL Injection
    // -------------------------------------------------------------------
    $safe_title = mysqli_real_escape_string($mysqli, $title_utf8);
    $safe_link = mysqli_real_escape_string($mysqli, $link_utf8);
    $safe_deptid = mysqli_real_escape_string($mysqli, $deptid_raw);
    $safe_types = mysqli_real_escape_string($mysqli, $types_raw);
    $safe_sdate = mysqli_real_escape_string($mysqli, $sdate_raw);

    // -------------------------------------------------------------------
    // (3) ตรวจสอบว่ามีข้อมูลนี้อยู่แล้วหรือไม่ (เพื่อหลีกเลี่ยงรายการซ้ำ)
    // -------------------------------------------------------------------
    $SQL_CHECK = "SELECT link_id FROM tb_rss WHERE link = '{$safe_link}' AND sdate = '{$safe_sdate}' LIMIT 1";
    $result_check = mysqli_query($mysqli, $SQL_CHECK);

    if (mysqli_num_rows($result_check) == 0) {
        // ไม่มีรายการนี้อยู่แล้ว ให้ทำการ INSERT

        $SQL_INSERT = "INSERT INTO tb_rss (`deptid`, `types`, `title`, `link`, `description`, `sdate`, `confirm`, `lastupdate`) 
                       VALUES ('{$safe_deptid}', '{$safe_types}', '{$safe_title}', '{$safe_link}', '', '{$safe_sdate}', 1, NOW())";
        
        $insert_result = mysqli_query($mysqli, $SQL_INSERT);

        if ($insert_result) {
            $inserted_count++;
        } else {
            // กรณี INSERT ไม่สำเร็จ
            echo "Error inserting data: " . mysqli_error($mysqli) . "\n";
        }
    } else {
        // มีรายการนี้อยู่แล้ว สามารถทำการ Update `lastupdate` ได้หากต้องการ
        // $SQL_UPDATE = "UPDATE tb_rss SET lastupdate = NOW() WHERE link = '{$safe_link}'";
        // mysqli_query($mysqli, $SQL_UPDATE);
    }
}

echo "Process completed. {$inserted_count} new item(s) inserted.\n";

?>
