<?php
    include 'connect.php';

    $code = $_GET['code'];

    $sql=$conn->query("SELECT * FROM ac_data WHERE ac_id='$code'");

    $data=$sql->fetch_assoc();

    echo json_encode($data);

    mysqli_close($conn);

?>