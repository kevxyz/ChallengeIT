Feature: Busqueda Basica

  Scenario: Realizar una busqueda basica en Google
    Given el usuario esta en la pagina principal de Google
    When el usuario ingresa "YouTube: Inicio" en la barra de busqueda
    And presiona el boton de busqueda
    Then se deben mostrar resultados relacionados con "YouTube: Inicio"

Feature: Búsqueda por Imagen

  Scenario: Buscar usando una URL de imagen
    Given el usuario esta en la pagina principal de Google
    When el usuario selecciona la opción de búsqueda por imagen
    And  el usuario ingresa "Ford" en la barra de busqueda
    Then se deben mostrar resultados relacionados con "Ford"


Feature: Autocompletado

  Scenario: Sugerencias basadas en un termino especifico
    Given el usuario esta en la pagina principal de Google
    When el usuario ingresa "Lionel" en la barra de busqueda
    Then el sistema muestra sugerencias relacionadas "Lionel Messi"