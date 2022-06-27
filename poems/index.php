<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <title>Poems</title>
    <link rel="stylesheet" type="text/css" href="/css/main.css">
</head>

<body>
    <h1> Poems </h1>
    <p> Below is a number of poems I've written over the years (most of which I'm still proud of). Some are humorous, some are depressing, and some are just weird, but I hope you enjoy! </p>

    <?php
        $scan_arr = scandir('.');
        $files_arr = array_diff($scan_arr, array('.', '..'));
        foreach ($files_arr as $file) {
            if (str_ends_with($file, ".txt")) {
                $lines = preg_split('#\r?\n#',  file_get_contents($file), -1);
                $title = $lines[0];
                $text = trim(join("\n", array_splice($lines, 2)));

        ?>
    <details>
        <summary>
            <?= $title ?>
            </a>
        </summary>
        <a href="<?= $file ?>"> Download </a> <br>
        <pre>
<?= $text ?> </pre>
    </details>
    <?php
        }
        }
        ?>
</body>

</html>
