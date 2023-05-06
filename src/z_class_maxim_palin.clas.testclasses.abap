*"* use this source file for your ABAP unit test classes
CLASS ltcl_z_int_maxim DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA cut TYPE REF TO z_class_maxim_palin.
    METHODS:
      setup,
      test_empty_string FOR TESTING,
      test_word FOR TESTING,
      test_capitalized_word FOR TESTING,
      test_sentence_with_punctuation FOR TESTING,
      test_palindrome FOR TESTING,
      test_even_sized_word FOR TESTING.

      METHODS:
      test_anna FOR TESTING,
      test_ein_esel_lese_nie FOR TESTING,
      test_reittier FOR TESTING,
      test_nicht_palindrom FOR TESTING.
ENDCLASS.


CLASS ltcl_z_int_maxim IMPLEMENTATION.

  METHOD setup.
    cut = NEW z_class_maxim_palin( ).
  ENDMETHOD.

  METHOD test_empty_string.
    cl_abap_unit_assert=>assert_equals( act = cut->z_int_maxim~reverse_string( '' )
                                        exp = '' ).
  ENDMETHOD.
  METHOD test_word.
    cl_abap_unit_assert=>assert_equals( act = cut->z_int_maxim~reverse_string( 'robot' )
                                        exp = 'tobor' ).
  ENDMETHOD.
  METHOD test_capitalized_word.
    cl_abap_unit_assert=>assert_equals( act = cut->z_int_maxim~reverse_string( 'Ramen' )
                                        exp = 'nemaR' ).
  ENDMETHOD.
  METHOD test_sentence_with_punctuation.
    cl_abap_unit_assert=>assert_equals( act = cut->z_int_maxim~reverse_string( `I'm hungry!` )
                                        exp = `!yrgnuh m'I` ).
  ENDMETHOD.
  METHOD test_palindrome.
    cl_abap_unit_assert=>assert_equals( act = cut->z_int_maxim~reverse_string( 'racecar' )
                                        exp = 'racecar' ).
  ENDMETHOD.
  METHOD test_even_sized_word.
    cl_abap_unit_assert=>assert_equals( act = cut->z_int_maxim~reverse_string( 'drawer' )
                                        exp = 'reward' ).
  ENDMETHOD.

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  METHOD test_anna.
  cl_abap_unit_assert=>assert_equals( act = cut->z_int_maxim~reverse_string( 'ANNA' )
                                               exp = REVERSE( 'ANNA' )
                                               msg = '"ANNA" ist EIN Palindrom".' ).
  ENDMETHOD.
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  METHOD test_ein_esel_lese_nie.
  cl_abap_unit_assert=>assert_equals( act = cut->z_int_maxim~reverse_string( 'EIN ESEL LESE NIE' )
                                               exp = REVERSE( 'EIN ESEL LESE NIE' )
                                               msg = '"EIN ESEL LESE NIE" ist EIN Palindrom".' ).
  ENDMETHOD.
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  METHOD test_reittier.
  cl_abap_unit_assert=>assert_equals( act = cut->z_int_maxim~reverse_string( 'REITTIER' )
                                                 exp = REVERSE( 'REITTIER' )
                                                 msg = '"REITTIER" ist EIN Palindrom".' ).
  ENDMETHOD.
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  METHOD test_nicht_palindrom.
  cl_abap_unit_assert=>assert_equals( act = cut->z_int_maxim~reverse_string( 'MAXIM' )
                                             exp = REVERSE( 'MAXIM' )
                                             msg = '"MAXIM" ist KEIN Palindrom".' ).
  ENDMETHOD.

ENDCLASS.
