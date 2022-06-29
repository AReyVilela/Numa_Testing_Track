Feature: Track Testing

  Scenario: Buscar en la pagina de Stratio
    Given Google abierto y acepto cookies
    And Escribo Stratio en el buscador y pulso enter
    And Click en el primer enlace
    And Acepto cookies de pagina de Stratio
    When Hago click en el drop down Solutions y Governance
    Then Imprimo Titulo de primer caso de uso
