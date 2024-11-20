<?php
// Built from MaxMind's example program at https://maxmind.github.io/GeoIP2-php/
// I use Composer to load in third-party libraries.

require_once 'vendor/autoload.php';
use GeoIp2\Database\Reader;
$version = "GeoLite2-City_20241119";
$reader = new Reader('./GeoLite2-City.mmdb');

header('Content-Type: application/json');
$data = json_decode(file_get_contents("php://input"), true);

$record = $reader->city($data["ip"]);

$data = array(
        "country"=>$record->country->name,
        "subdiv"=>$record->mostSpecificSubdivision->name,
        "city"=>$record->city->name,
        "lat"=>$record->location->latitude,
        "lon"=>$record->location->longitude
);
echo json_encode($data);
?>
