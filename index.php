  <?php
//Starting Session of User
session_start();

session_unset();
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">

  
    <title>Index Page</title>
  </head>
  <body>
   <h1>tennis</h1>
    <div class="container">
      <div class="section">
        <form class="index-form" action="coach.php" method="post">
          <h2>Please insert your name and player id to begin</h2>
          <div class="label-form">
            <label for="name">Name</label> <br>
            <input type="text" name="name" value="" required>
          </div>
          <div class="label-form">
            <label for="playerid">Player ID</label> <br>
            <input type="text" name="playerid" required>
          </div>
          <div class="label-form">
            <button type="submit" name="enter">Enter</button>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>
