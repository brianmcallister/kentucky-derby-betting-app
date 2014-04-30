<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">

  <title>Kentucky Derby</title>
  
  <link rel="stylesheet" href="/public/css/style.css">

  <script type="text/javascript" src="//use.typekit.net/qyf1cot.js"></script>
  <script type="text/javascript">try{Typekit.load();}catch(e){}</script>

  <script async data-main="/public/js/main.js" src="/public/js/libs/require.js"></script>
  <script async src="/public/js/templates.js"></script>
</head>

<body>
  <marquee scrollspeed="10"><img src="/public/img/laurel.jpg"></marquee>
  
  <?php if ($_GET['admin'] && $_GET['admin'] === 'true'): ?>
    <div class="calculate-winner">
      <h2>select winner:</h2>
      
      <form class="winner-form">
        <select class="winner-select"></select>
      </form>
      
      <div class="final-winners"></div>
    </div>
  <?php else: ?>
    <div class="start-page-content">
      <input class="bettor-name" type="text" name="name" placeholder="yes i definitely want to lose all my money">
      <button class="start-button">deal me in</button>
    </div>
  <?php endif; ?>
  
  <marquee direction="right"><img src="/public/img/horse-mask.jpg"></marquee>
</body>
</html>