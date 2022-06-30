Feature: Login in App

  Background:
    Given Pagina de Log in de un App

    #usuario
  Scenario: Usuario correcto: happy path
    When Click en introducir usuario
    And  Usuario es formato email con @ y .
    And  Click en Log in
    Then Usuario valido

  Scenario: Usuario incorrecto: vacio
    When Click en introducir usuario
    And  Usuario queda como campo vacio
    And  Click en Log in
    Then Mostramos mensaje 'Usuario no es correo valido'

  Scenario: Usuario incorrecto: No contiene .
    When Click en introducir usuario
    And  Usuario no contiene .
    And  Click en Log in
    Then Mostramos mensaje 'Usuario no es correo valido'

  Scenario: Usuario incorrecto: No contiene @
    When Click en introducir usuario
    And  Usuario no contiene @
    And  Click en Log in
    Then Mostramos mensaje 'Usuario no es correo valido'

    Scenario: Usuario incorrecto: Caracteres Especiales
      When Click en introducir usuario
      And  Usuario contiene caracteres especiales
      And  Click en Log in
      Then Mostramos mensaje 'Usuario no es correo valido'

  Scenario: Usuario incorrecto: Demasiado largo
    When Click en introducir usuario
    And  Usuario tiene formato demasiado largo
    And  Click en Log in
    Then Mostramos mensaje 'Usuario no es correo valido'

    #contraseña
  Scenario: Contraseña tiene menos de 6 caracteres
    When Click en introducir contraseña
    And  Introduce contraseña con menos de 6 caracteres
    And  Click en Log in
    Then Contraseña incorrecta

  Scenario: Contraseña tiene mas de 18 caracteres
    When Click en introducir contraseña
    And  Introduce contraseña con mas de 18 caracteres
    And  Click en Log in
    Then Contraseña incorrecta

  Scenario: Contraseña tiene exactamente 6 caracteres
    When Click en introducir contraseña
    And  Introduce contraseña con exactamente 6 caracteres
    And  Contraseña contiene mayusculas , minusculas y al menos un numero
    Then Contraseña correcta

  Scenario: Contraseña tiene exactamente 18 caracteres
    When Click en introducir contraseña
    And  Introduce contraseña con exactamente 18 caracteres
    And  Contraseña contiene mayusculas , minusculas y al menos un numero
    Then Contraseña correcta

  Scenario: Contraseña tiene entre 6 y 18 caracteres
    When Click en introducir contraseña
    And  Introduce contraseña con ente 6 y 18 caracteres
    And  Contraseña contiene mayusculas , minusculas y al menos un numero
    Then Contraseña correcta

  Scenario: Contraseña tiene entre 6 y 18 caracteres
    When Click en introducir contraseña
    And  Introduce contraseña con ente 6 y 18 caracteres
    And  Contraseña no contiene al menos mayusculas , minusculas y un numero
    Then Contraseña incorrecta

  Scenario: Contraseña vacia
    When Click en introducir contraseña
    And  Campo de contraseña vacio
    And  Click en log in
    Then Contraseña incorrecta

    #log in
  Scenario: Login Erroneo usuario no exitente : Usuario Nuevo
    When  Usuario no esta registrado
    And   Click en Log in
    Then  Mensaje de error 'Usuario no registrado'
    And   Mostrar enlace a pagina de registro

  Scenario: Login Erroneo : Usuario existe y Contraseña incorrecta
    When Usuario esta registrado
    And  Contraseña no coincide con la del usuario
    And  Click en Log in
    Then Mensaje de error 'Password Incorrecto'

  Scenario: Login Erroneo : Sin campos
    When Los campos de usuario y contraseña estan vacios
    And  Click en Log in
    Then Mensaje de error 'Login Erroneo los campos son obligatorios'

  Scenario: Login Exitoso
    When El usuario y contraseña son correctos
    And  Click en Log in
    Then Se carga la pagina de perfil de usuario


#  Scenario Outline: Usuario Correcto o Incorrecto
#    When  Click en introducir usuario
#    And   Introduce <usuario>
#    Then  usuario es <estado>
#
#    Examples:
#      | usuario     |    estado     |
#      | abccc.ccc   |   incorrecto  |
#      | ab@cccccc   |   incorrecto  |
#      | abcccccc    |   incorrecto  |
#      | abcccccc    |   incorrecto  |
#      |             |   incorrecto  |
#      | abc@cc.ccc  |   correcto    |
#
#  Scenario Outline: Contraseña Correcta o Incorrecta
#    When Click en introducir <contraseña>
#    Then Contraseña es <estado>
#
#    Examples:
#      |    contraseña         |    estado     |
#      | aaa                   |   incorrecta  |
#      | aaaaaaaaaaaaaaaaaaa   |   incorrecta  |
#      | AAAAAA                |   incorrecta  |
#      | aaaaaa                |   incorrecta  |
#      |                       |   incorrecta  |
#      | 1Aaaaaaaa             |   correcta    |