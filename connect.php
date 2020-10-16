<?PHP
  	// 1.	เชื่อมต่อเซิร์ฟเวอร์ MySQL
	$conn = mysqli_connect("localhost","root","","nsmdb");
	
	if(!$conn){
		die("cannot connect DB" . mysqli_error($conn));
	}
?>
