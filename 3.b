Write an HTML program to embed audio and video into an HTML web page:


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Embedding Audio and Video</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
    header, footer { background: #333; color: white; text-align: center; padding: 1em; }
    nav { background: #555; padding: 1em; }
    nav a { color: white; margin: 10px; text-decoration: none; }
    main { padding: 20px; text-align: center; }
    figure { text-align: center; }
    figcaption { font-style: italic; }
    section { margin-bottom: 20px; }
  </style>
</head>
<body>

  <header>
    <h1>Embedding Audio and Video</h1>
  </header>

  <nav>
    <a href="#">Home</a>
    <a href="#">About</a>
    <a href="#">Contact</a>
  </nav>

  <main>
    <section>
      <h2>Audio Example</h2>
      <audio controls>
        <source src="audio.mp3" type="audio/mpeg">
        <source src="audio.ogg" type="audio/ogg">
        Your browser does not support the audio element.
      </audio>
    </section>

    <section>
      <h2>Video Example</h2>
      <video width="600" controls>
        <source src="video.mp4" type="video/mp4">
        <source src="video.ogg" type="video/ogg">
        Your browser does not support the video tag.
      </video>
    </section>
  </main>

  <footer>
    <p>&copy; 2025 My Website. All rights reserved.</p>
  </footer>

</body>
</html>