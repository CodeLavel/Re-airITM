<?php


        include('connect.php');

        $ac_code = $_POST['ac_code'];
        $ac_detail = $_POST['ac_detail'];
        

        $query = $conn->query("SELECT * FROM loginuser WHERE emp_code = '$emp_code' AND password = '$password'");

        $result=array();

        while($fetchData=$query->fetch_assoc()){
            $result[]=$fetchData;
        }
        echo json_encode($result);


?>