<?php
//handling technical error messages from client side
error_reporting(E_ERROR | E_WARNING | E_PARSE);

//Starting Session of User
session_start();

// including database connection
include('connection.php');

// inserting booking
if (isset($_POST['book'])) {
  $playerid =  mysqli_real_escape_string($database_connection, $_SESSION['playerID']);
  $onDate =  mysqli_real_escape_string($database_connection, $_POST['ondate']);

  //trim to get time
  $atTime =  mysqli_real_escape_string($database_connection, $_POST['time']);
  $newatTime = substr($atTime, 0, -2);
  $newatTime =  mysqli_real_escape_string($database_connection, $newatTime);

  //trim to get coach id
  $coachID = substr($atTime, 5);
  $coachID =  mysqli_real_escape_string($database_connection, $coachID);

  $query = "INSERT INTO training (playerID, onDate, atTime, coachID)
            VALUES ('$playerid','$onDate','$newatTime','$coachID')";
  $result = mysqli_query($database_connection, $query);
    if($result){
        $_SESSION['status'] = 'success';
        $coachquery = "SELECT name FROM coach WHERE coachID = '$coachID'";
        $coachresult = mysqli_query($database_connection, $coachquery);
        $row = mysqli_fetch_array($coachresult);
        $coachname = $row['name'];
    }
    else{
        $_SESSION['status'] = 'failed';
    }
}
?>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Coaches Page</title>
  </head>
  <body>
    <div class="container">
      <header>
        <nav>
          <a href="coach.php">Coaches</a>
          <a href="index.php">Exit</a>
        </nav>
      </header>

      <div class="blur">
        <div class="message">
          <?php if ($_SESSION['status'] === 'success') {?>
            <img src="images/correct.png" alt="success image">
            <h3> Thank you <?php echo $_SESSION['name']; ?>, your booking was successful!.
              <br> Summary: training with <?php echo $coachname; ?> on <?php echo $onDate;  ?> at <?php echo $newatTime.':00';  ?>  </h3>
            <p> <a id="again" href="coach.php">Book Again</a> &nbsp; <a id="exit" href="index.php">Exit Booking</a> </p>
          <?php }else { ?>
            <img src="images/wrong.png" alt="success image">
            <h3> Sorry <?php echo $_SESSION['name']; ?>, your booking fail, try again. </h3>
            <a id="again" href="coach.php">Try Again</a>
          <?php } ?>
        </div>
      </div>

    </div>
  </body>
</html>
