*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class zcl_earth definition.
    PUBLIC SECTION.
    METHODS: leave_orbit EXPORTING VALUE(rvalue) TYPE string.
ENDCLASS.
class zcl_earth IMPLEMENTATION.
    METHOD leave_orbit.
        rvalue = 'The Satellite is leaving Earths orbit'.
    ENDMETHOD.
ENDCLASS.
class zcl_mars definition.
    PUBLIC SECTION.
    METHODS: enter_orbit EXPORTING VALUE(rvalue) TYPE string.
    METHODS: leave_orbit EXPORTING VALUE(rvalue) TYPE string.
ENDCLASS.
class zcl_mars IMPLEMENTATION.
    METHOD leave_orbit.
        rvalue = 'The Satellite is leaving Mars orbit'.
    ENDMETHOD.
    METHOD enter_orbit.
        rvalue = 'The Satellite is entering Mars orbit'.
    ENDMETHOD.
ENDCLASS.
class zcl_jupiter definition.
    PUBLIC SECTION.
    METHODS: land_orbit EXPORTING VALUE(rvalue) TYPE string.
    METHODS: enter_orbit EXPORTING VALUE(rvalue) TYPE string.
ENDCLASS.
class zcl_jupiter IMPLEMENTATION.
    METHOD land_orbit.
        rvalue = 'The Satellite is landing on Jupiter'.
    ENDMETHOD.
    METHOD enter_orbit.
        rvalue = 'The Satellite is entering Jupiters orbit'.
    ENDMETHOD.
ENDCLASS.
