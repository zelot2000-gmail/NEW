<?php include("inc_connect.php");?>
<?php
	@extract($_POST);

	switch($cond) {
		
		case "show" :
				
				
				$SQL = "select link_id, title, link, sdate from tb_rss where type='".$val."' and deptid='".$val1."' and confirm=1 order by sdate desc ";
				$result = mysqli_query($mysqli, $SQL) or die(mysqli_error($mysqli).$SQL);
				$i = 0;

				while($tmp = mysqli_fetch_array($result)) {
					$i++;
					$body .= $i.'|'.addslashes($tmp["title"]).'|'.('<a class="btn btn-primary btn-sm" href="'.$tmp["link"].'" role="button" target="_blank"><i class="fas fa-eye fa-1x"></i></a>').'|'.show_date($tmp["sdate"]).'[next]';

				}
				print $body;

			break;

		case "mgt" :
				
				
				$SQL = "select link_id, title, link, sdate from tb_rss where type='".$val."' and deptid='".$val1."' and confirm=1 order by sdate desc ";
				$result = mysqli_query($mysqli, $SQL) or die(mysqli_error($mysqli).$SQL);
				$i = 0;

				while($tmp = mysqli_fetch_array($result)) {
					$i++;
					$body .= $i.'|'.addslashes($tmp["title"]).'|'.('<a class="btn btn-primary btn-sm" href="'.$tmp["link"].'" role="button" target="_blank"><i class="fas fa-eye fa-1x"></i></a> <a class="btn btn-danger btn-sm" href="?link_id='.$tmp["link_id"].'" role="button" onclick="return del();"><i class="fas fa-trash-alt fa-1x"></i></a>').'|'.show_date($tmp["sdate"]).'|'.show_date($tmp["sdate"]).'[next]';

				}
				print $body;

			break;

	}

?>