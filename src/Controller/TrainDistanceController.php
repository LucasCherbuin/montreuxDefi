<?php
require_once(__DIR__ . '/vendor/autoload.php');



// Configure Bearer (JWT) authorization: bearerAuth
$config = OpenAPI\Client\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new OpenAPI\Client\Api\AnalyticsApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$from = new \DateTime('2013-10-20T19:20:30+01:00'); // \DateTime | Date de début (inclus)
$to = new \DateTime('2013-10-20T19:20:30+01:00'); // \DateTime | Date de fin (inclus)
$group_by = 'none'; // string | Optionnel, groupement additionnel

try {
    $result = $apiInstance->getAnalyticDistances($from, $to, $group_by);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling AnalyticsApi->getAnalyticDistances: ', $e->getMessage(), PHP_EOL;
}

