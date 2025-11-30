# OpenAPI\Client\AnalyticsApi

Statistiques de distances par code analytique

All URIs are relative to /api/v1, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**getAnalyticDistances()**](AnalyticsApi.md#getAnalyticDistances) | **GET** /stats/distances | BONUS : Distances agrégées par code analytique |


## `getAnalyticDistances()`

```php
getAnalyticDistances($from, $to, $group_by): \OpenAPI\Client\Model\AnalyticDistanceList
```

BONUS : Distances agrégées par code analytique

Retourne la somme des distances parcourues par code analytique sur une période donnée. Si aucune période n’est fournie, utilise la période complète disponible.

### Example

```php
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
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **from** | **\DateTime**| Date de début (inclus) | [optional] |
| **to** | **\DateTime**| Date de fin (inclus) | [optional] |
| **group_by** | **string**| Optionnel, groupement additionnel | [optional] [default to &#39;none&#39;] |

### Return type

[**\OpenAPI\Client\Model\AnalyticDistanceList**](../Model/AnalyticDistanceList.md)

### Authorization

[bearerAuth](../../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
