<?php
	include('lib/functions.php');
	header('Content-type: application/pdf');
	header("Content-Disposition: attachment; filename=completeIjmbForm-".date('Y')."-schoolsearch.org.ng.pdf");
	readfile('application/form.pdf');
?>