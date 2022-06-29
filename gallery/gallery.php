<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <title>Poems</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>

<body>
    <h1> Gallery </h1>
    <p> Below you can find a bunch of images I've taken, comissioned, or drawn! </p>
<div class="gallery">

    <?php
        $scan_arr = scandir('.');
        $files_arr = array_diff($scan_arr, array('.', '..'));
        $images;
        foreach ($files_arr as $file) {
            if (str_ends_with($file, ".png") || str_ends_with($file, ".jpg")) {

        ?>
          <img class="gallery" src="<?=$file?>"/>
    <?php
        }
      } ?>
</div>
</body>

</html>
