<?php include("inc_connect.php");?>
<?php
	
	$SQL = "select * from tb_setting where 1";
	$result = mysqli_query($mysqli, $SQL) or die(mysqli_error($mysqli).$SQL);
	$tmp = mysqli_fetch_array($result);

	if( (@date("H")==8  && $tmp["time8"]!=date("Y-m-d") ) || (date("H")==12 && $tmp["time12"]!=date("Y-m-d")) || (@date("H")==17 && $tmp["time17"]!=date("Y-m-d")) || (@date("H")==20 && $tmp["time20"]!=date("Y-m-d"))  ) { 
		
		
		if(date("H")==8) {
			$SQL = "update tb_setting set time8='".date("Y-m-d")."' where 1 ";

		} elseif(date("H")==12) {
			$SQL = "update tb_setting set time12='".date("Y-m-d")."' where 1 ";

		} elseif(date("H")==17) {
			$SQL = "update tb_setting set time17='".date("Y-m-d")."' where 1 ";

		} elseif(date("H")==20) {
			$SQL = "update tb_setting set time20='".date("Y-m-d")."' where 1 ";
		}
		mysqli_query($mysqli, $SQL) or die(mysqli_error($mysqli).$SQL);

		if(@$_GET["id"]!="") {
			if(strlen($_GET["id"])<10) {
				$deptid = $_GET["id"];
			} else {
				$deptsubId = $_GET["id"];
			}
		} else {
			$deptid = "0304";
		}
		if(@strtolower($_GET["type"])=="e-bidding") {
			$ebidding = "&methodId=16";
		}

		$no = 0;
		foreach($_AT as $key => $type) {
	/*		
			if($deptid!="") {
				if($ebidding=="") {
					$url = "http://process3.gprocurement.go.th/EPROCRssFeedWeb/egpannouncerss.xml?deptId=".$deptid."&anounceType=W0";
				} else {
					$url = "http://process3.gprocurement.go.th/EPROCRssFeedWeb/egpannouncerss.xml?deptId=".$deptid."&anounceType=B0".$ebidding;
				}
			} else {
				$url = "http://process3.gprocurement.go.th/EPROCRssFeedWeb/egpannouncerss.xml?deptsubId=".$deptsubId."&anounceType=B0".$ebidding;
			}
	*/
			$url = "http://process3.gprocurement.go.th/EPROCRssFeedWeb/egpannouncerss.xml?deptId=".$deptid."&anounceType=".$type;
#print $url."<br>";

			$xml = @simplexml_load_file($url);// or die("Error: Cannot create object.".$url);
			
			if($xml!==false) {
				$i = 0;
				foreach($xml->children()->children() as $rss) { 
					if($rss->pubDate) {
    $i++;
    $title = $rss->title;
    $link = $rss->link;
    $description = $rss->description;
    $date = $rss->pubDate;
    list($y,$m,$d) = explode("-",$date);
    
    $SQL =  "select * from tb_rss where deptid='".$deptid."' and type='".$type."' and title='".$title."' and sdate='".$date."'  ";
    // ... (ส่วนที่เหลือของโค้ด SELECT และ INSERT)
``` | ```php
if($rss->pubDate) {
    $i++;
    // เก็บข้อมูลดิบจาก RSS
    $title_raw = (string)$rss->title;
    $link_raw = (string)$rss->link;
    $description_raw = (string)$rss->description;
    $date = $rss->pubDate;
    list($y,$m,$d) = explode("-",$date);
    
    // ** จุดแก้ไขปัญหาภาษาต่างดาว (TIS-620 -> UTF-8) **
    // 1. แปลง Character Set
    $title_utf8 = @iconv("TIS-620", "UTF-8//IGNORE", $title_raw);
    $description_utf8 = @iconv("TIS-620", "UTF-8//IGNORE", $description_raw);

    // 2. Escape String เพื่อความปลอดภัยในฐานข้อมูล
    $title_safe = mysqli_real_escape_string($mysqli, $title_utf8);
    $link_safe = mysqli_real_escape_string($mysqli, $link_raw);
    $description_safe = mysqli_real_escape_string($mysqli, $description_utf8);
    // ** สิ้นสุดการแก้ไข **

    // ใช้ $title_safe ในการค้นหา (SELECT)
    $SQL =  "select * from tb_rss where deptid='".$deptid."' and type='".$type."' and title='".$title_safe."' and sdate='".$date."'  ";
    $result = mysqli_query($mysqli, $SQL) or die(mysqli_error($mysqli).$SQL);
    if(mysqli_num_rows($result)<=0) {
        
        $SQL = "insert into tb_rss (
                        deptid,
                        type,
                        title, 
                        link, 
                        description, 
                        sdate, 
                        confirm, 
                        lastupdate
                    ) values(
                        '".$deptid."',
                        '".$type."',
                        '".$title_safe."',         // ใช้ตัวแปรที่แปลงและปลอดภัยแล้ว
                        '".$link_safe."',          // ใช้ตัวแปรที่ปลอดภัยแล้ว
                        '".$description_safe."',   // ใช้ตัวแปรที่แปลงและปลอดภัยแล้ว
                        '".$date."',
                        1, 
                        '".date("Y-m-d H:i:s")."'
                    )";
        mysqli_query($mysqli, $SQL) or die(mysqli_error($mysqli).$SQL);
        $no++;
    }

} // if($rss->pubDate) {
				} // foreach($xml->children()->children() as $rss) { 
			} // if($xml!==false) {
		} // foreach($_AT as $key => $type) {
		print "total = ".$no;
	} // if(@date("H")>=17 || @date("H")<=8 || date("H")==12) { 

?>
<!doctype html>
<html lang="en-TH">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="<?php print $SITE_NAME?>">
    <meta name="author" content="<?php print $elink?>">
    <meta name="generator" content="<?php print $SITE_NAME?>">
	<link rel="icon" href="images/logo.png?v=4">
	<title><?php print $SITE_NAME?></title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link href="fontawesome-free-5.10.2-web/css/all.css" rel="stylesheet">

	<link href="datatables/jquery.dataTables.min.css" rel="stylesheet">
	<link href="datatables/responsive.dataTables.min.css" rel="stylesheet">

  <body>

		<div class="container-fluid">


			<div class="card">

			  <div class="card-header">
					<div class="row">
						<div class="col-sm-4">
							<span class="mt-2" style="font-size:20px;text-shadow:5px 5px 5px #5b5b5b;">ข้อมูลจัดซื้อ/จัดจ้าง (e-GP)</span>
						</div>
						<div class="col-sm-3"></div>
						<div class="col-sm-5">
							<select class="form-control" name="type" id="type" onchange="go_ajax('show', this.value, '<?php print $deptid?>')">
						<?php foreach($_AT as $key => $val) { ?>
								<option value="<?php print $val?>"><?php print $_AT_NAME[$val]?></option>
						<?php } ?>
							</select>
						</div>
					</div>
			  </div>

			  <div class="card-body">
					<table class="table table-bordered display" id="data-tb">
						<thead>
							<tr>
								<th width="5%" class="text-center">ลำดับ</th>
								<th width="80%">ประกาศ</th>
								<th width="5%" class="text-center">เอกสาร</th>
								<th width="10%" class="text-center">วันที่</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="text-center"></td>
								<td></td>
								<td class="text-center"></td>
								<td class="text-center"></td>
							</tr>
						</tbody>
					</table>
			  </div>
		  </div>

		</div>

		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script>window.jQuery || document.write('<script src="js/jquery-slim.min.js"><\/script>')</script>
		<script src="js/popper.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery.min.js"></script>

		<script src="datatables/jquery.dataTables.min.js"></script>
		<script src="datatables/dataTables.responsive.min.js"></script>


		<script>
			var Table;
			$(document).ready(function() {
				Table = $('#data-tb').DataTable(
				{
					"columns": [
						{ "data": "no" },
						{ "data": "title" },
						{ "data": "link" },
						{ "data": "date" }
					],
				  "columnDefs": [
					{
						"targets": [0,2,3],
						"className": 'dt-body-center'
					}
				  ]
				}
				);
			} );
			

		function go_ajax(cond, val, val1, val2) {
//			console.log(val);
			$.ajax({
				method: "POST",
				url: "ajax.php",
				data: { cond:cond, val:val, val1:val1, val2:val2  }
			})
			.done(function( msg ) {
	//			console.log(msg);

				if(cond=="show") {
	//				$('#show').html( msg );
					console.log(msg);

					Table.clear().draw();
//					Table.rows.add(msg).draw();
					
					var arr = msg.split('[next]');
					for(var i=0;i<arr.length-1;i++) {
						var arr1 = arr[i].split('|');

						var obj = { no: arr1[0], title: arr1[1], link: arr1[2], date: arr1[3] };

						Table.rows.add( [ obj ] ).draw();
					}
				}
			});

		}

		go_ajax('show', 'P0', '<?php print $deptid?>' );

		</script>

  </head>
  <body>


