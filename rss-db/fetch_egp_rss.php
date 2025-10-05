<?php
// 1. เรียกใช้งานไฟล์เชื่อมต่อฐานข้อมูลและฟังก์ชันยูทิลิตี้
include("inc_connect.php");

// ------------------------------------------------------------------------------------------------
// ** A. กลไกตรวจสอบและควบคุมเวลา **
// ------------------------------------------------------------------------------------------------

$current_hour = date("H");
$current_date = date("Y-m-d");
$time_column = ""; // ตัวแปรสำหรับเก็บชื่อคอลัมน์ใน tb_setting

// 1.1 กำหนดช่วงเวลาที่ต้องการให้รันสคริปต์
if ($current_hour >= 7 && $current_hour < 12) {
    // รันในช่วงเช้า (8:00 - 11:59)
    $time_column = "time8";
} elseif ($current_hour >= 12 && $current_hour < 17) {
    // รันในช่วงกลางวัน (12:00 - 16:59)
    $time_column = "time12";
} elseif ($current_hour >= 17 && $current_hour < 20) {
    // รันในช่วงเย็น (17:00 - 19:59)
    $time_column = "time17";
} elseif ($current_hour >= 20 || $current_hour < 7) { 
    // รันในช่วงกลางคืน (20:00 - 06:59)
    $time_column = "time20";
}

if (empty($time_column)) {
    // หากไม่เข้าเงื่อนไขใดๆ เลย (ไม่น่าจะเกิดขึ้น)
    die("Time control error.");
}

// 1.2 ดึงวันที่ล่าสุดที่รันสคริปต์สำหรับช่วงเวลานั้นๆ
$SQL_CHECK_TIME = "SELECT {$time_column} FROM tb_setting WHERE set_id = 1 LIMIT 1";
$result_check_time = mysqli_query($mysqli, $SQL_CHECK_TIME);
$row = mysqli_fetch_assoc($result_check_time);
$last_run_date = $row[$time_column];


// 1.3 ตรวจสอบเงื่อนไข: หากวันที่รันครั้งล่าสุดไม่ใช่ 'วันนี้' ให้เริ่มดึงข้อมูล
if ($last_run_date == $current_date) {
    // หากรันแล้ววันนี้ ให้จบการทำงาน
    die("RSS fetch already executed for {$time_column} on {$current_date}. Skipping run.");
}

// ------------------------------------------------------------------------------------------------
// ** B. โค้ดดึงและบันทึกข้อมูล RSS (ส่วนนี้จะรันเมื่อผ่านการตรวจสอบเวลาแล้ว) **
// ------------------------------------------------------------------------------------------------

// ** แทนที่โค้ดจำลองด้านล่างนี้ด้วยโค้ดดึง RSS จริงของคุณ **
$rss_items = array(
    // ... (โค้ดจำลองการดึงและแปลง TIS-620 เป็น UTF-8) ...
    // ...
);
// ** สิ้นสุดโค้ดดึง RSS จริงของคุณ **

$inserted_count = 0;
// วนลูปและ INSERT ข้อมูล (รวมถึงการแปลงภาษา TIS-620 -> UTF-8)
// ... (ใช้โค้ดวนลูปจากคำตอบก่อนหน้า) ...

// ------------------------------------------------------------------------------------------------
// ** C. อัปเดตตารางเวลาหลังจากดึงข้อมูลสำเร็จ **
// ------------------------------------------------------------------------------------------------

$SQL_UPDATE_TIME = "UPDATE tb_setting SET {$time_column} = '{$current_date}' WHERE set_id = 1";
mysqli_query($mysqli, $SQL_UPDATE_TIME);

echo "Process completed. {$inserted_count} new item(s) inserted. Time column '{$time_column}' updated to {$current_date}.\n";

?>
