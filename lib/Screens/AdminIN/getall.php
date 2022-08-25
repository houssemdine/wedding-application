<?php
include "connection.php";
$data = array();
$sql = "SELECT ID, post_title, post_name from wp_posts ORDER BY ID DESC";
$result = $conn->query($sql);
if($result->num_rows > 0){
    while($row = $result->fetch_assoc()){
        $data[] = $row;
    }
    
    echo json_encode($data);
}else{
    echo "error";
}

?>