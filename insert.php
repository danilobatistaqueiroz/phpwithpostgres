<html>
<head>
  <title>Insert data to PostgreSQL with php - creating a simple web application</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <style>
    li {listt-style: none;}
  </style>
</head>
<body>
  <h2>Enter information regarding book</h2>
  <ul>
    <form name="insert" action="insert.php" method="POST" >
      <li>Book ID:</li><li><input type="text" name="bookid" /></li>
      <li>Book Name:</li><li><input type="text" name="book_name" /></li>
      <li>Author:</li><li><input type="text" name="author" /></li>
      <li>Publisher:</li><li><input type="text" name="publisher" /></li>
      <li>Date of publication:</li><li><input type="text" name="dop" /></li>
      <li>Price (USD):</li><li><input type="text" name="price" /></li>
      <li><input type="submit" /></li>
    </form>
  </ul>
</body>
</html>
<?php
  if(isset($_POST['bookid'])){
    $db = pg_connect("host=localhost port=5432 dbname='dbLibrary' user='admLibrary' password=123");
    $query = "INSERT INTO \"Book\" (book_id,book_name,author,publisher,date_of_publication,price) ".
      "VALUES ('".$_POST['bookid']."','".$_POST['book_name']."',
    '".$_POST['author']."','".$_POST['publisher']."','".$_POST['dop']."',
    ".$_POST['price'].")";
    $result = pg_query($query); 
  }
?>