<?php


        include('connect.php');

        $emp_code = $_POST['emp_code'];
        $password = $_POST['password'];
        

        $query = $conn->query("SELECT * FROM loginuser WHERE emp_code = '$emp_code' AND password = '$password'");

        $result=array();

        while($fetchData=$query->fetch_assoc()){
            $result[]=$fetchData;
        }
        echo json_encode($result);


?>