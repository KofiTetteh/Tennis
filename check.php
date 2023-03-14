<?php
//hidden error messages from server
error_reporting(E_ERROR | E_WARNING | E_PARSE);

//Starting Session of User
session_start();

// including database connection
include('connection.php');


//including user session verification
if (empty($_SESSION['playerID']) AND empty($_SESSION['name'])) {
  echo '<script> alert("Enter your details first"); window.location="index.php"</script>';
}

//including empty On Date value
if (empty($_POST['ondate'])) {
  header('location:coach.php');
}

?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Check Page</title>
  </head>
  <body>
    <div class="container">
      <header>
        <nav>
          <a href="coach.php">Coaches</a>
          <a href="index.php">Exit</a>
        </nav>
      </header>

      <form class="coach-section" action="book.php" method="post">
        <h3><a href="coach.php">< Back</a></h3>
        <p>Avaliability of coaches you selected, on <?php echo $_POST['ondate']; ?> </p>
        <input type="date" name="ondate" value="<?php echo $_POST['ondate'];?>" hidden>
        <?php
        $ondate = mysqli_real_escape_string($database_connection, $_POST['ondate']);

        if (isset($_POST['check'])) {
          if(empty($_POST['coachID'])){
            $_SESSION['error'] = "Please select a coach";
            header('location:coach.php');
          }

          echo '<table><thead>
            <tr>
              <th></th>
              <th>10:00</th>
              <th>12:00</th>
              <th>16:00</th>
            </tr>
          </thead><tbody>';

          if(!empty($_POST['coachID'])){
            foreach ($_POST['coachID'] as $coachID) {
              echo '<tr>';
              $query = "SELECT coachID, name, gender, location
                        FROM coach JOIN court
                        ON coach.courtNo = court.courtNo
                        WHERE coachID = '$coachID'";
              $result = mysqli_query($database_connection, $query);
              $row = mysqli_fetch_array($result);
              if($result){
                echo '<td>'. $row['name'].'</td>';
              }


              //checking availability of time 10:00
              $query1 = "SELECT training.* FROM training
                         WHERE coachID = '$coachID' AND onDate = '$ondate' AND atTime = '10:00' AND playerID = '1' ";
              $result1 = mysqli_query($database_connection, $query1);
              $row1 = mysqli_fetch_array($result1);
              if($result1){
                $onDate1 = $row1['onDate'];
                $coachID1 = $row1['coachID'];
                if(mysqli_num_rows($result1) == 0){
                  echo '<td><input type="radio" name="time" value="10:00'.$coachID.'" required></td>';
                }else{
                  echo '<td><input type="radio" name="time" disabled required></td>';
                }
              }

              //checking availability of time 12:00
              $query2 = "SELECT training.* FROM training
                         WHERE coachID = '$coachID' AND onDate = '$ondate' AND atTime = '12:00' AND playerID = '1'";
              $result2 = mysqli_query($database_connection, $query2);
              $row2 = mysqli_fetch_array($result2);
              if($result2){
                $onDate2 = $row2['onDate'];
                $coachID2 = $row2['coachID'];
                if(mysqli_num_rows($result2) == 0){
                  echo '<td><input type="radio" name="time" value="12:00'.$coachID.'" required></td>';
                }else{
                  echo '<td><input type="radio" name="time" disabled required></td>';
                }
              }

              //checking availability of time 16:00
              $query3 = "SELECT training.* FROM training
                         WHERE coachID = '$coachID' AND onDate = '$ondate' AND atTime = '16:00' AND playerID = '1'";
              $result3 = mysqli_query($database_connection, $query3);
              $row3 = mysqli_fetch_array($result3);
              if($result3){
                $onDate3 = $row3['onDate'];
                $coachID3 = $row3['coachID'];
                if(mysqli_num_rows($result3) == 0){
                  echo '<td><input type="radio" name="time" value="16:00'.$coachID.'" required></td>';
                }else{
                  echo '<td><input type="radio" name="time" disabled></td>';
                }
              }

              echo ' </tr>';
            }
          }
          echo '</tbody></table>';
        }
        ?>
        <button type="submit" name="book">Book Training</button>
      </form>

    </div>
  </body>
</html>
