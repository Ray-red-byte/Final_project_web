<?php
include("mysql_connect.inc.php");

$json = file_get_contents("php://input");
$object = json_decode($json, true);
$bookID = (int)$object['bookId'];

$sql_book_delete = "DELETE FROM BOOK WHERE BOOK_ID = '$bookID'";
//$sql_book_order_delete = "DELETE FROM ORDERS WHERE ORDER_BOOK_ID = '$bookID'";

$result_book_delete = mysqli_query($conn, $sql_book_delete);
//$result_order_delete = mysqli_query($conn, $sql_book_order_delete);

if (!$result_book_delete) {
    echo json_encode(array('error' => 'Failed to retrieve books.'));
}
else
{
    echo json_encode(array('error' => 'Failed to retrieve books.'));
}

?>
