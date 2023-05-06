interface Z_INT_MAXIM
  public.

"Palindrom"
METHODS: is_palindrome IMPORTING iv_value TYPE string RETURNING VALUE(is_result) TYPE abap_bool.

"Reverse String"
METHODS: reverse_string IMPORTING iv_input TYPE string RETURNING VALUE(rv_result) TYPE string.

ENDINTERFACE.
