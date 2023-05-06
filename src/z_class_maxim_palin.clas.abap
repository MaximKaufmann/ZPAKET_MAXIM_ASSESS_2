CLASS z_class_maxim_palin DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES z_int_maxim .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_class_maxim_palin IMPLEMENTATION.
  METHOD z_int_maxim~is_palindrome.

"lv_data = Ergebnis - lv_data ist der umgedrehte Wert von iv_value"
  DATA lv_data TYPE string.
       lv_data = reverse( iv_value ).

"Hier findet der Vergleich statt, ob es ein Palindrom ist, oder nicht (Wrong = Ist ein Palindrom. False = Ist kein Palindrom)"
  IF iv_value EQ lv_data.
  WRITE: iv_value, 'Wrong'.
  ELSE.
  WRITE: iv_value, 'True'.
  ENDIF.

  ENDMETHOD.

  METHOD z_int_maxim~reverse_string.
  rv_result = reverse(  iv_input ).

  ENDMETHOD.
ENDCLASS.
