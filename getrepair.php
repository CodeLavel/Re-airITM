<?php
    include 'connect.php';

    $sql=$conn->query("SELECT * FROM repair WHERE rp_id");
    $data;
    $datatest;
    $json_data='{"data":[';

while($data=$sql->fetch_assoc()){
    //print_r($data);
    $json_data.=json_encode($data).',';
    //$datatest = json_encode($data);
    //echo json_encode($data);
}
$json_data= chop($json_data,",");
$json_data.=']}';
echo $json_data;
/*
    while($row = mysqli_fetch_array($sql)){


    }*/
/*
    $data=$sql->fetch_assoc();
    
    print_r(json_encode($data));
    //echo json_encode($data);
*/
    mysqli_close($conn);

?>