# OpenAPI\Client\RoutingApi

Calcul des trajets

All URIs are relative to /api/v1, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**calculerRoute()**](RoutingApi.md#calculerRoute) | **POST** /routes |  |


## `calculerRoute()`

```php
calculerRoute($route_request): \OpenAPI\Client\Model\Route
```



Calculer un trajet A → B

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: bearerAuth
$config = OpenAPI\Client\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new OpenAPI\Client\Api\RoutingApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$route_request = {"fromStationId":"MX","toStationId":"ZW","analyticCode":"ANA-123"}; // \OpenAPI\Client\Model\RouteRequest

try {
    $result = $apiInstance->calculerRoute($route_request);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling RoutingApi->calculerRoute: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **route_request** | [**\OpenAPI\Client\Model\RouteRequest**](../Model/RouteRequest.md)|  | |

### Return type

[**\OpenAPI\Client\Model\Route**](../Model/Route.md)

### Authorization

[bearerAuth](../../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: `application/json`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
