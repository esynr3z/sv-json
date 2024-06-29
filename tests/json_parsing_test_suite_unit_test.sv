`include "svunit_defines.svh"
`include "test_utils_macros.svh"

// Tests based on `contrib/json_test_suite/test_parsing/*.json` files.
// Decoder should accept y_*.json.
// Decoder should reject n_*.json.
// Decoder should either accept or reject i_*.json (implementation defined).
module json_parsing_test_suite_unit_test;
  import svunit_pkg::svunit_testcase;
  import json_pkg::*;

  string name = "json_parsing_test_suite_ut";
  svunit_testcase svunit_ut;

  function void build();
    svunit_ut = new(name);
  endfunction

  task setup();
    svunit_ut.setup();
  endtask

  task teardown();
    svunit_ut.teardown();
  endtask

  // Construct and return full path to a JSON file from `contrib/json_test_suite`
  function automatic string resolve_path(string file);
    return {`STRINGIFY(`JSON_TEST_SUITE_INSTALL), "/test_parsing/", file};
  endfunction : resolve_path

  `SVUNIT_TESTS_BEGIN

  `SVTEST(accept_test) begin
    `EXPECT_OK_LOAD_FILE(resolve_path("y_array_arraysWithSpaces.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_array_empty.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_array_empty-string.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_array_ending_with_newline.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_array_false.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_array_heterogeneous.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_array_null.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_array_with_1_and_newline.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_array_with_leading_space.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_array_with_several_null.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_array_with_trailing_space.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_0e+1.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_0e1.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_after_space.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_double_close_to_zero.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_int_with_exp.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_minus_zero.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_negative_int.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_negative_one.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_negative_zero.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_real_capital_e.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_real_capital_e_neg_exp.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_real_capital_e_pos_exp.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_real_exponent.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_real_fraction_exponent.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_real_neg_exp.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_real_pos_exponent.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_simple_int.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_number_simple_real.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_object_basic.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_object_duplicated_key_and_value.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_object_duplicated_key.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_object_empty.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_object_empty_key.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_object_escaped_null_in_key.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_object_extreme_numbers.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_object.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_object_long_strings.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_object_simple.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_object_string_unicode.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_object_with_newlines.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_1_2_3_bytes_UTF-8_sequences.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_accepted_surrogate_pair.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_accepted_surrogate_pairs.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_allowed_escapes.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_backslash_and_u_escaped_zero.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_backslash_doublequotes.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_comments.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_double_escape_a.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_double_escape_n.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_escaped_control_character.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_escaped_noncharacter.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_in_array.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_in_array_with_leading_space.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_last_surrogates_1_and_2.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_nbsp_uescaped.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_null_escape.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_one-byte-utf-8.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_simple_ascii.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_space.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_surrogates_U+1D11E_MUSICAL_SYMBOL_G_CLEF.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_three-byte-utf-8.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_two-byte-utf-8.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_uescaped_newline.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_uEscape.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_unescaped_char_delete.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_unicodeEscapedBackslash.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_unicode_escaped_double_quote.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_unicode.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_unicode_U+10FFFE_nonchar.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_unicode_U+1FFFE_nonchar.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_unicode_U+200B_ZERO_WIDTH_SPACE.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_unicode_U+2064_invisible_plus.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_unicode_U+FDD0_nonchar.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_unicode_U+FFFE_nonchar.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_string_with_del_character.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_structure_lonely_false.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_structure_lonely_int.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_structure_lonely_negative_real.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_structure_lonely_null.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_structure_lonely_string.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_structure_lonely_true.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_structure_string_empty.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_structure_trailing_newline.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_structure_true_in_array.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("y_structure_whitespace_array.json"))
    //FIXME: Flaky tests - may fail or pass depending on simulator
    //`EXPECT_OK_LOAD_FILE(resolve_path("y_string_nonCharacterInUTF-8_U+10FFFF.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("y_string_nonCharacterInUTF-8_U+FFFF.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("y_string_pi.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("y_string_reservedCharacterInUTF-8_U+1BFFF.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("y_string_u+2028_line_sep.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("y_string_u+2029_par_sep.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("y_string_unicode_2.json"))
    // `EXPECT_OK_LOAD_FILE(resolve_path("y_string_utf8.json"))
  end `SVTEST_END


  `SVTEST(impl_defined_test) begin
    `EXPECT_OK_LOAD_FILE(resolve_path("i_number_double_huge_neg_exp.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_number_huge_exp.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_number_neg_int_huge_exp.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_number_pos_double_huge_exp.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_number_real_neg_overflow.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_number_real_pos_overflow.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_number_real_underflow.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_number_too_big_neg_int.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_number_too_big_pos_int.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_number_very_big_negative_int.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_object_key_lone_2nd_surrogate.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_string_1st_surrogate_but_2nd_missing.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_string_1st_valid_surrogate_2nd_invalid.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_string_incomplete_surrogate_and_escape_valid.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_string_incomplete_surrogate_pair.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_string_incomplete_surrogates_escape_valid.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_string_invalid_lonely_surrogate.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_string_invalid_surrogate.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_string_inverted_surrogates_U+1D11E.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_string_lone_second_surrogate.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("i_string_utf16BE_no_BOM.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("i_string_utf16LE_no_BOM.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("i_string_UTF-16LE_with_BOM.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("i_structure_500_nested_arrays.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("i_structure_UTF-8_BOM_empty_object.json"))
    // \b and \u are not supported
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_1_surrogate_then_escape.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("n_string_1_surrogate_then_escape_u1.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("n_string_1_surrogate_then_escape_u1x.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("n_string_1_surrogate_then_escape_u.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("n_string_incomplete_escaped_character.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("n_string_incomplete_surrogate.json"))
    `EXPECT_OK_LOAD_FILE(resolve_path("n_string_invalid_unicode_escape.json"))
    //FIXME: Flaky tests - may fail or pass depending on simulator
    //`EXPECT_OK_LOAD_FILE(resolve_path("i_string_invalid_utf-8.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("i_string_iso_latin_1.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("i_string_lone_utf8_continuation_byte.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("i_string_not_in_unicode_range.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("i_string_overlong_sequence_2_bytes.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("i_string_overlong_sequence_6_bytes.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("i_string_overlong_sequence_6_bytes_null.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("i_string_truncated-utf-8.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("i_string_UTF-8_invalid_sequence.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("i_string_UTF8_surrogate_U+D800.json"))
    //`EXPECT_OK_LOAD_FILE(resolve_path("n_string_invalid-utf-8-in-escape.json"))
  end `SVTEST_END


  `SVTEST(reject_test) begin
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_1_true_without_comma.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_a_invalid_utf8.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_colon_instead_of_comma.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_comma_after_close.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_comma_and_number.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_double_comma.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_double_extra_comma.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_extra_close.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_extra_comma.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_incomplete_invalid_value.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_incomplete.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_inner_array_no_comma.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_invalid_utf8.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_items_separated_by_semicolon.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_just_comma.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_just_minus.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_missing_value.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_newlines_unclosed.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_number_and_comma.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_number_and_several_commas.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_spaces_vertical_tab_formfeed.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_star_inside.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_unclosed.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_unclosed_trailing_comma.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_unclosed_with_new_lines.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_array_unclosed_with_object_inside.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_incomplete_false.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_incomplete_null.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_incomplete_true.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_0.1.2.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_-01.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_0.3e+.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_0.3e.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_0_capital_E+.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_0_capital_E.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_0.e1.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_0e+.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_0e.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_1_000.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_1.0e+.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_1.0e-.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_1.0e.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_-1.0..json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_1eE2.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_+1.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_.-1.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_2.e+3.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_2.e-3.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_2.e3.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_.2e-3.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_-2..json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_9.e+.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_expression.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_hex_1_digit.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_hex_2_digits.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_infinity.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_+Inf.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_Inf.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_invalid+-.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_invalid-negative-real.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_invalid-utf-8-in-bigger-int.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_invalid-utf-8-in-exponent.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_invalid-utf-8-in-int.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_++.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_minus_infinity.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_minus_sign_with_trailing_garbage.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_minus_space_1.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_-NaN.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_NaN.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_neg_int_starting_with_zero.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_neg_real_without_int_part.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_neg_with_garbage_at_end.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_real_garbage_after_e.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_real_with_invalid_utf8_after_e.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_real_without_fractional_part.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_starting_with_dot.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_U+FF11_fullwidth_digit_one.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_with_alpha_char.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_with_alpha.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_number_with_leading_zero.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_bad_value.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_bracket_key.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_comma_instead_of_colon.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_double_colon.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_emoji.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_garbage_at_end.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_key_with_single_quotes.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_lone_continuation_byte_in_key_and_trailing_comma.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_missing_colon.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_missing_key.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_missing_semicolon.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_missing_value.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_no-colon.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_non_string_key_but_huge_number_instead.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_non_string_key.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_repeated_null_null.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_several_trailing_commas.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_single_quote.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_trailing_comma.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_trailing_comment.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_trailing_comment_open.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_trailing_comment_slash_open_incomplete.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_trailing_comment_slash_open.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_two_commas_in_a_row.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_unquoted_key.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_unterminated-value.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_with_single_string.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_object_with_trailing_garbage.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_single_space.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_accentuated_char_no_quotes.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_backslash_00.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_escaped_backslash_bad.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_escaped_ctrl_char_tab.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_escaped_emoji.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_escape_x.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_incomplete_escape.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_incomplete_surrogate_escape_invalid.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_invalid_backslash_esc.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_invalid_utf8_after_escape.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_leading_uescaped_thinspace.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_no_quotes_with_bad_escape.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_single_doublequote.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_single_quote.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_single_string_no_double_quotes.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_start_escape_unclosed.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_unescaped_ctrl_char.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_unescaped_newline.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_unescaped_tab.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_unicode_CapitalU.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_string_with_trailing_garbage.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_100000_opening_arrays.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_angle_bracket_..json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_angle_bracket_null.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_array_trailing_garbage.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_array_with_extra_array_close.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_array_with_unclosed_string.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_ascii-unicode-identifier.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_capitalized_True.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_close_unopened_array.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_comma_instead_of_closing_brace.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_double_array.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_end_array.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_incomplete_UTF8_BOM.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_lone-invalid-utf-8.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_lone-open-bracket.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_no_data.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_null-byte-outside-string.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_number_with_trailing_garbage.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_object_followed_by_closing_object.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_object_unclosed_no_value.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_object_with_comment.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_object_with_trailing_garbage.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_open_array_apostrophe.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_open_array_comma.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_open_array_object.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_open_array_open_object.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_open_array_open_string.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_open_array_string.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_open_object_close_array.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_open_object_comma.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_open_object.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_open_object_open_array.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_open_object_open_string.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_open_object_string_with_apostrophes.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_open_open.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_single_eacute.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_single_star.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_trailing_#.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_U+2060_word_joined.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_uescaped_LF_before_string.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_unclosed_array.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_unclosed_array_partial_null.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_unclosed_array_unfinished_false.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_unclosed_array_unfinished_true.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_unclosed_object.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_unicode-identifier.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_UTF8_BOM_no_data.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_whitespace_formfeed.json"))
    `EXPECT_ERR_LOAD_FILE(resolve_path("n_structure_whitespace_U+2060_word_joiner.json"))
    //FIXME: Flaky tests - may fail or pass depending on simulator
    //`EXPECT_ERR_LOAD_FILE(resolve_path("n_multidigit_number_then_00.json"))
  end `SVTEST_END
  `SVUNIT_TESTS_END

endmodule : json_parsing_test_suite_unit_test
