<?php
if (isset($_GET['phrase'])) {
	$s = $_GET['phrase'];
	$pattern = '/[Bb][Oo][Nn][Ss]?/';
	preg_match_all($pattern,$s,$tab_match);
}
?>
<html>
<body>
<h2> Combien de 'bon' (ou 'bons') ?</h2>
<form method="get" action="ex6.php">
	<label for="phrase">Votre phrase</label>
	<input type=text name="phrase">
	<input type="submit" name="submit">
</form>
<p>Nombre d'occurrence de l'adjectif bon.s : <?php echo count($tab_match[0]);?> </p>
</body>
</html>