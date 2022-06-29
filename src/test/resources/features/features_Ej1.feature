Feature: Login in App

  Background:
    Given Pagina de Log in de un App

  Scenario: Introducir Usuario correcto
    When Click para introducir el Usuario
    And El usuario debe de ser un correo electronico
    And El usuario debe de contener un '@'
    Then Usuario correcto

  Scenario: Introducir Usuario Incorrecto
    When Click para introducir el Usuario
    And El usuario no es un correo electronico
    And El usuario no contiene un '@'
    Then Usuario incorrecto

  Scenario: Introducir Contraseña Correcta
    When Click para introducir la contraseña
    And La contraseña es mayor a 6 caracteres
    And La contraseña es menor a 18 caracteres
    And La contraseña tiene letras en mayusculas
    And La contraseña tiene letras en minusculas
    And  La contraseña tiene al menos un numero
    Then Contraseña correcta

  Scenario: Introducir Contraseña Incorrecta
    When Click para introducir la contraseña
    And La contraseña es menor a 6 caracteres
    And La contraseña es mayor a 18 caracteres
    And La contraseña no tiene letras en mayusculas
    And La contraseña no tiene letras en minusculas
    And  La contraseña no tiene al menos un numero
    Then Contraseña Incorrecta

  Scenario: Usuario Nuevo
    When Usuario no esta registrado
    Then  Mensaje de error 'Usuario no registrado'
    When Click en Log in
    And Mostrar enlace a pagina de registro

  Scenario: Usuario Registrado y Contraseña incorrecta
    When Usuario esta registrado
    And Contraseña incorrecta
    When Click en Log in
    Then  Mensaje de error 'Password Incorrecto'

  Scenario: Usuario Registrado y Contraseña no cumple requisitos
    When Usuario esta registrado
    And Contraseña no cumple los requisitos
    When Click en Log in
    Then  Mensaje de error 'Password no cumple los requisitos'

  Scenario: Log in Exitoso
    When Usuario esta registrado
    And La contraseña es correcta
    And Click en log-in
    Then  Cargar pagina de incio de perfil de usuario

    Scenario: Log in Erroneo
      When Usuario incorrecto
      And Contraseña incorrecta
      When Click en Log in
      Then Log in Erroneo