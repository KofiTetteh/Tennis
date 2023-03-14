<?php
//Starting Session of User
//ssion_start();

// including database connection
include('connection.php');

// user verification
if (isset($_POST['enter'])) {
 $name =  mysqli_real_escape_string($database_connection, $_POST['name']);
  $playerid =  mysqli_real_escape_string($database_connection, $_POST['playerid']);

  $query = "SELECT * FROM player WHERE playerID = '$playerid' AND name = '$name'";
  $result = mysqli_query($database_connection, $query);

  if(mysqli_num_rows($result) >= ""
 ){
    $row = mysqli_fetch_array($result);
    $_SESSION['name'] = $row['name'];
    $_SESSION['playerID'] = $row['playerID'];
  }
  
}


?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/style.css">
	
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

      <div class="welcome">
        <h4>Hi <?php echo $_SESSION['name']; ?>!</h4>
      </div>

      <form class="coach-section" id="coachform" action="check.php" method="post">
        <h3>Coaches</h3>
        <p id="errormsg">
          <?php
            if (!empty($_SESSION['error'])){
              echo $_SESSION['error'];
              unset($_SESSION['error']);
            }
          ?>
        </p>
        <p>Select date: <input type="date" name="ondate" value="<?php echo date('Y-m-d');?>"></p> 
        <table>
          <thead>
            <tr>
              <th>Name</th>
              <th>Location</th>
              <th>Gender</th>
            </tr>
          </thead>
          <?php
            $query = "SELECT coachID, name, gender, location
                      FROM coach JOIN court
                      ON coach.courtNo = court.courtNo
                      ORDER By name ASC";
            $result = mysqli_query($database_connection, $query);
           ?>
          <tbody>
            <?php while($row = mysqli_fetch_array($result)){ ?>
            <tr>
              <td><?php echo $row['name']; ?></td>
              <td><?php echo $row['location']; ?></td>
              <td><?php echo $row['gender']; ?></td>
              <td> <input type="checkbox" name="coachID[]" id='checklist' value="<?php echo $row['coachID']; ?>"> </td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
        <button type="submit" name="check">Check Availability</button>
      </form>

    </div>
  </body>
</html>
