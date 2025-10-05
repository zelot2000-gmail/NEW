<?php
	ob_start();
	session_cache_expire(270);
	session_start();
	date_default_timezone_set("Asia/Bangkok");
	ini_set('error_reporting', E_ALL & ~E_NOTICE);
	error_reporting(E_ALL & ~E_NOTICE);

# DB connect ------------------------------------------------------------------------------------------------
	
	$DB_HOSTNAME = "localhost";
	$DB_NAME = "prj_rss";
	$DB_USERNAME = "root";
	$DB_PASSWORD = "0000";

	$SITE_NAME = "องค์การบริหารส่วนตำบลสูงเนิน";
	$SITE_ENAME = "Soong Nern";
	$SITE_COPY = "Copyright &copy; องค์การบริหารส่วนตำบลสูงเนิน";
	$SITE_EMAIL = "";

	$SITE_ADDR = "องค์การบริหารส่วนตำบลสูงเนิน  ตำบลสูงเนิน  อำเภอกระสัง จังหวัดบุรีรัมย์ 31160";
	$SITE_PHONE = "044 666 587";
# end connect ------------------------------------------------------------------------------------------------
	
/* id */
	$deptid = "0304";

/* type */
	$_AT[] = "P0";
	$_AT[] = "15";
	$_AT[] = "B0";
	$_AT[] = "D0";
	$_AT[] = "W0";
	$_AT[] = "D1";
	$_AT[] = "W1";
	$_AT[] = "D2";
	$_AT[] = "W2";

/* type name */
	$_AT_NAME["P0"] = "แผนการจัดซื้อจัดจ้าง";
	$_AT_NAME["15"] = "ประกาศราคากลาง";
	$_AT_NAME["B0"] = "ร่างเอกสารประกวดราคา (e-Bidding) และร่างเอกสารซื้อหรือจ้างด้วยวิธีสอบราคา";
	$_AT_NAME["D0"] = "ประกาศเชิญชวน";
	$_AT_NAME["W0"] = "ประกาศรายชื่อผู้ชนะการเสนอราคา / ประกาศผู้ได้รับการคัดเลือก";
	$_AT_NAME["D1"] = "ยกเลิกประกาศเชิญชวน";
	$_AT_NAME["W1"] = "ยกเลิกประกาศรายชื่อผู้ชนะการเสนอราคา / ประกาศผู้ได้รับการคัดเลือก";
	$_AT_NAME["D2"] = "เปลี่ยนแปลงประกาศเชิญชวน";
	$_AT_NAME["W2"] = "เปลี่ยนแปลงประกาศรายชื่อผู้ชนะการเสนอราคา";

	$M_THAI_LONG = array("","มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฎาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม");
	$M_THAI_SHORT = array("","ม.ค.","ก.พ.","มี.ค.","เม.ย.","พ.ค.","มิ.ย.","ก.ค.","ส.ค.","ก.ย.","ต.ค.","พ.ย.","ธ.ค.");	

/* #### connect DB ########################################## */

	$mysqli = mysqli_connect($DB_HOSTNAME, $DB_USERNAME, $DB_PASSWORD, $DB_NAME);
	if (!$mysqli) {
		echo "Error: Unable to connect to MySQL." . PHP_EOL."<br>";
		echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL."<br>";
		echo "Debugging error: " . mysqli_connect_error() . PHP_EOL."<br>";
		exit;
	}
	// แก้ไขบรรทัดนี้: เปลี่ยนไปใช้ฟังก์ชันมาตรฐาน
	// mysqli_query($mysqli, "set names 'utf8' "); // <-- ลบหรือคอมเมนต์บรรทัดนี้
    mysqli_set_charset($mysqli, "utf8"); // <-- เพิ่มบรรทัดนี้เข้าไปแทน



	function alert($msg,$link) {
		print "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"> \n
					<script>  \n
					<!-- Begin  \n
						alert('".$msg."');  \n";

		if($link=="next") {
			print "			// End -->  \n
					</script>  \n";

		} else if($link=="") { 
			print "	history.back();  \n
						// End -->  \n
					</script>  \n";
			exit();	

		} else { 
			print "	window.location.href='".$link."' \n
					// End -->  \n
					</script>  \n";
			exit();	
		}
	}	

	function is_image($mediapath) {
		if(@is_array(getimagesize($mediapath))){
			return true;
		} else {
			return false;
		}
	}

	function show_en_date($tmp) {
		if($tmp!="0000-00-00" && $tmp!=""  && $tmp!="0000-00-00 00:00:00") {
			list($date,$time) = explode(" ",$tmp);
			list($y,$m,$d) = explode("-",$date);
			return $d."/".$m."/".$y;
		}
	}

	function show_date($tmp) {
		if($tmp!="0000-00-00" && $tmp!="" && $tmp!="0000-00-00 00:00:00") {
			list($date,$time) = explode(" ",$tmp);
			list($y,$m,$d) = explode("-",$date);
			$y += 543;
			return $d."/".$m."/".$y;
		}
	}
	function show_time($tmp) {
		list($date, $time) = explode(" ", $tmp);
		if($time!="") {
			list($h,$m,$s) = explode(":",$time);
			return "$h:$m:$s";
		} else {
			list($h,$m,$s) = explode(":",$date);
			return "$h:$m:$s";
		}
	}

	function show_long_date($tmp) {
		if($tmp!="0000-00-00" && $tmp!=""  && $tmp!="0000-00-00 00:00:00") {
			global $M_THAI_LONG;
			list($date,$time) = explode(" ",$tmp);
			list($y,$m,$d) = explode("-",$date);
			$y += 543;
			return intval($d)." ".$M_THAI_LONG[intval($m)]." ".$y;
		}
	}

	function show_short_date($tmp) {
		if($tmp!="0000-00-00" && $tmp!=""  && $tmp!="0000-00-00 00:00:00") {
			global $M_THAI_SHORT;
			list($date,$time) = explode(" ",$tmp);
			list($y,$m,$d) = explode("-",$date);
			$y += 543;
			return intval($d)."-".$M_THAI_SHORT[intval($m)]."-".($y-2500);
		}
	}

	function show_datetime($tmp) {
		list($date, $time)  = explode(" ", $tmp);
		return show_date($date)." ".show_time($time);
	}

	function dateDifference($date_1 , $date_2 , $differenceFormat = '%a' )
	 {
		 $datetime1 = date_create($date_1);
		 $datetime2 = date_create($date_2);
		 
		 $interval = date_diff($datetime1, $datetime2);
		 
		 return $interval->format($differenceFormat);
		 
	 } 

?>
