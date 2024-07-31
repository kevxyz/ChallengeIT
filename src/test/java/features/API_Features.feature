Feature: Validacion de entrada en la API

  Scenario: Solicitud con datos validos
    Given el usuario envia los siguientes datos:
      | agreement       | cardType | amount | expirationDate | storeId | dni        | sku | order | subOrder |
      | 1               | 1        | 20000  | 2020-01-31     | 1037    | 111111111  | 26  | 30991 | 2601     |
    When la API procesa la solicitud
    Then la API responde con un codigo de estado 200
    And la respuesta contiene un mensaje de exito

Feature: Validacion de parametro de monto en la API

  Scenario: Solicitud con monto negativo
    Given el usuario envia los siguientes datos:
      | agreement       | cardType | amount | expirationDate | storeId | dni        | sku | order | subOrder |
      | 1               | 1        | -5000  | 2020-01-31     | 1037    | 111111111  | 26  | 30991 | 2601     |
    When la API procesa la solicitud
    Then la API responde con un código de estado 400
    And la respuesta contiene un mensaje de error relacionado con el monto

Feature: Validacion de parametros de Fecha en la API

  Scenario: Solicitud con fecha de expiracion en el pasado
    Given el usuario envía los siguientes datos:
      | agreement       | cardType | amount | expirationDate | storeId | dni        | sku | order | subOrder |
      | 1               | 1        | 20000  | 2019-12-31     | 1037    | 111111111  | 26  | 30991 | 2601     |
    When la API procesa la solicitud
    Then la API responde con un código de estado 400
    And la respuesta contiene un mensaje de error relacionado con la fecha de expiracion

Feature: Validacion de parametros de DNI en la API

  Scenario: Solicitud con DNI invalido
    Given el usuario envía los siguientes datos:
      | agreement       | cardType | amount | expirationDate | storeId | dni        | sku | order | subOrder |
      | 1               | 1        | 20000  | 2020-01-31     | 1037    | abc123     | 26  | 30991 | 2601     |
    When la API procesa la solicitud
    Then la API responde con un codigo de estado 400
    And la respuesta contiene un mensaje de error relacionado con el DNI

Feature: Validación de parámetros de entrada en la API

  Scenario: Solicitud con SKU no numerico
    Given el usuario envía los siguientes datos:
      | agreement       | cardType | amount | expirationDate | storeId | dni        | sku  | order | subOrder |
      | 1               | 1        | 20000  | 2020-01-31     | 1037    | 111111111  | ABC  | 30991 | 2601     |
    When la API procesa la solicitud
    Then la API responde con un código de estado 400
    And la respuesta contiene un mensaje de error relacionado con el SKU

Feature: Validacion de parametros de entrada en la API

  Scenario: Solicitud con storeId inexistente
    Given el usuario envía los siguientes datos:
      | agreement       | cardType | amount | expirationDate | storeId | dni        | sku | order | subOrder |
      | 1               | 1        | 20000  | 2020-01-31     |         | 111111111  | 26  | 30991 | 2601     |
    When la API procesa la solicitud
    Then la API responde con un código de estado 404
    And la respuesta contiene un mensaje de error relacionado con el storeid