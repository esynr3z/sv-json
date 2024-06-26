package test_utils_pkg;
  import json_pkg::*;

  // Check that JSON string parsing finishes with OK status.
  // It also compares parsed value with the golden one, if the latest is provided.
  // Returns error message if something is wrong.
  function automatic string expect_ok_load_str(string raw, json_value golden);
    json_error err;
    json_value val;
    json_result parsed = json_decoder::load_string(raw);

    case (1)
      parsed.matches_err(err): begin
        return err.to_string();
      end
      parsed.matches_ok(val): begin
        if ((val == null) && (golden == null)) begin
          return "";
        end else if (val.compare(golden) || (golden == null)) begin
          return "";
        end else begin
          return "Loaded JSON value do not match the golden one!";
        end
      end
    endcase
  endfunction : expect_ok_load_str


  // Check that JSON file parsing finishes with OK status.
  // It also compares parsed value with the golden one, if the latest is provided.
  // Returns error message if something is wrong.
  function automatic string expect_ok_load_file(string path, json_value golden);
    json_error err;
    json_value val;
    json_result parsed = json_decoder::load_file(path);

    case (1)
      parsed.matches_err(err): begin
        return err.to_string();
      end
      parsed.matches_ok(val): begin
        if ((val == null) && (golden == null)) begin
          return "";
        end else if (val.compare(golden) || (golden == null)) begin
          return "";
        end else begin
          return "Loaded JSON value do not match the golden one!";
        end
      end
    endcase
  endfunction : expect_ok_load_file


  // Check that JSON string parsing finishes with error status.
  // It also compares error with the golden one, if the latest is provided.
  // Returns error message if something is not expected.
  function automatic string expect_err_load_str(string raw, json_error golden);
    json_error err;
    json_value val;
    json_result parsed = json_decoder::load_string(raw);

    case (1)
      parsed.matches_err(err): begin
        if (golden != null) begin
          if (err.kind != golden.kind) begin
            return $sformatf(
              "Expect %s error but got %s intead! Captured error:\n%s",
              golden.kind.name(), err.kind.name(), err.to_string()
            );
          end

          if ((golden.json_pos >= 0) && (err.json_pos != golden.json_pos)) begin
            return $sformatf(
              "Expect to get error for %0d symbol but got for %0d intead! Captured error:\n%s",
              golden.json_pos, err.json_pos, err.to_string()
            );
          end
        end
        return "";
      end

      parsed.matches_ok(val): begin
        return "JSON parsed succesfully, but error was expected!";
      end
    endcase
  endfunction : expect_err_load_str


  // Check that JSON file parsing finishes with error status.
  // It also compares error with the golden one, if the latest is provided.
  // Returns error message if something is not expected.
  function automatic string expect_err_load_file(string path, json_error golden);
    json_error err;
    json_value val;
    json_result parsed = json_decoder::load_file(path);

    case (1)
      parsed.matches_err(err): begin
        if (golden != null) begin
          if (err.kind != golden.kind) begin
            return $sformatf(
              "Expect %s error but got %s intead! Captured error:\n%s",
              golden.kind.name(), err.kind.name(), err.to_string()
            );
          end

          if ((golden.json_pos >= 0) && (err.json_pos != golden.json_pos)) begin
            return $sformatf(
              "Expect to get error for %0d symbol but got for %0d intead! Captured error:\n%s",
              golden.json_pos, err.json_pos, err.to_string()
            );
          end
        end
        return "";
      end

      parsed.matches_ok(val): begin
        return "JSON parsed succesfully, but error was expected!";
      end
    endcase
  endfunction : expect_err_load_file


  // SystemVerilog does not support \r escape code, however, for JSON testing it has to be used.
  // So that function replace every two consecutive chars "\" and "r" with a single ASCII char 'd13 (CR).
  // Note: it looks like Verilator actually supports \r, so replacing for it is not required.
  function automatic string replace_cr(input string str);
    string res = "";
    byte prev_char = "";

    for (int i = 0; i < str.len(); i++) begin
      byte curr_char = str[i];
      if ((prev_char == "\\") && (curr_char == "r")) begin
        res[res.len() - 1] = 8'd13;
      end else begin
        res = {res, curr_char};
      end
      prev_char = curr_char;
    end

    return res;
  endfunction : replace_cr


  // Dummy enum for testing purposes
  typedef enum {
    DUMMY_FOO,
    DUMMY_BAR,
    DUMMY_BAZ
  } dummy_e;

  typedef json_enum#(dummy_e) json_dummy_enum;

  // Some simulators do not support '{} for empty associative arrays, so this a workaround
  json_value empty_jvalue_map [string];

endpackage : test_utils_pkg
