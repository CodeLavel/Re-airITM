<?php
    include 'connect.php';

    $sql=$conn->query("SELECT * FROM repair WHERE rp_id");

    $data=$sql->fetch_assoc();

    echo json_encode($data);

    mysqli_close($conn);

?>