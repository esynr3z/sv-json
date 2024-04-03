// JSON string value
class json_string extends json_value implements json_string_encodable;
  string value;

  // Normal constructor
  extern function new(string value);

  // Create `json_string` from string
  extern static function json_string from(string value);

  // Create a deep copy of an instance
  extern virtual function json_value clone();

  // Compare with another instance
  extern virtual function bit compare(json_value value);

  // Interface json_string_encodable
  extern virtual function string get_value();
endclass : json_string


function json_string::new(string value);
  this.value = value;
endfunction : new


function json_string json_string::from(string value);
  json_string obj = new(value);
  return obj;
endfunction : from


function json_value json_string::clone();
  return json_string::from(this.value);
endfunction : clone


function bit json_string::compare(json_value value);
  json_result#(json_string) casted;
  json_error err;
  json_string rhs;

  if (value == null) begin
    return 0;
  end

  casted = value.as_json_string();
  case (1)
    casted.matches_err(err): return 0;
    casted.matches_ok(rhs): return this.value == rhs.value;
  endcase
endfunction : compare


function string json_string::get_value();
  return this.value;
endfunction : get_value
