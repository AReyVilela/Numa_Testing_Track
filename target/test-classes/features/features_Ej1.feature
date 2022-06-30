Feature: Login in App

  Background:
    Given Pagina de Log in de un App

  Scenario Outline: Usuario Correcto o Incorrecto
    When  Click en introducir usuario
    And   Introduce <usuario>
    Then  usuario es <estado>

    Examples:
      | usuario     |    estado     |
      | abccc.ccc   |   incorrecto  |
      | ab@cccccc   |   incorrecto  |
      | abcccccc    |   incorrecto  |
      | abc@cc.ccc  |   correcto    |

  Scenario Outline: Contraseña Correcta o Incorrecta
    When Click en introducir <contraseña>
    Then Contraseña es <estado>

    Examples:
      |    contraseña         |    estado     |
      | aaa                   |   incorrecta  |
      | aaaaaaaaaaaaaaaaaaa   |   incorrecta  |
      | AAAAAA                |   incorrecta  |
      | aaaaaa                |   incorrecta  |
      | 1Aaaaaaaa             |   correcta    |

  Scenario: Login erroneo : Usuario Nuevo
    When  Usuario no esta registrado
    And   Click en Log in
    Then  Mensaje de error 'Usuario no registrado'
    And   Mostrar enlace a pagina de registro

  Scenario: Login Erroneo : Usuario existe y Contraseña incorrecta
    When Usuario esta registrado
    And  Contraseña no coincide con la del usuario
    And  Click en Log in
    Then Mensaje de error 'Password Incorrecto'

  Scenario: Log in Erroneo : Usuario no registrado
    When El usuario no registrado
    And  Click en Log in
    Then Mensaje de error 'Usuario no es correo valido'




    
