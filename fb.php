<?php
session_start();
require_once __DIR__ .'/auth/facebook/src/Facebook/autoload.php';

$fb = new Facebook\Facebook([
  'app_id' => '1638304303131446',
  'app_secret' => '80d51cb2584fb49b49133e11cf9daa9b',
  'default_graph_version' => 'v2.8',
]);
$helper = $fb->getRedirectLoginHelper();
$permissions = ['user_managed_groups', 'publish_actions']; // optionnal
$loginUrl = $helper->getLoginUrl('http://ijmboffice.org.ng/fb-callback.php', $permissions);
echo "<script>window.top.location.href='".$loginUrl."'</script>";
?>