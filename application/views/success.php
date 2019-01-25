<html>

<head>

<title>Codeigniter File Upload Success</title>

</head>

<body>

<h3>File has been uploaded.</h3>

<ul>
	<img src="<?php echo base_url(); ?>assets/images/services-01.jpg">
<img src="<?php echo base_url(); ?>uplods/9ad03d1be00db96fe779b55c7dbc0e9569.jpg">
<!-- <?php foreach ($upload_data as $item => $value): ?>

<li><?php echo $item; ?>: <?php echo $value; ?></li>

<?php endforeach; ?> -->

<li><?php echo "<h3>Uploaded file:</h3>"; ?></li>
<li>
  <img src="<?php echo base_url().'/uploads/'.$userfile; ?>" /></li>

</ul>

<p><?php echo anchor('upload_page', 'Upload Another File!'); ?></p>

</body>

</html>