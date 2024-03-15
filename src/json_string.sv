class json_string extends json_value;
  string value;

  // Normal constructor
  extern function new(string value);

  // Create json_string from string
  extern static function json_string from(string value);

  // Get string size
  extern virtual function int unsigned size();

  // Create full copy of a value
  extern virtual function json_value clone();

  // Compare with value
  extern virtual function bit compare(json_value value);

  // Get kind of current value
  extern virtual function json_value_e kind();
endclass : json_string


function json_string::new(string value);
  this.value = value;
endfunction : new


function json_string json_string::from(string value);
  json_string obj = new(value);
  return obj;
endfunction : from


function int unsigned json_string::size();
  return this.value.len();
endfunction : size


function json_value json_string::clone();
  return json_string::from(this.value);
endfunction : clone


function bit json_string::compare(json_value value);
  return value.is_json_string() && (value.as_json_string().unwrap().value == this.value);
endfunction : compare


function json_value_e json_string::kind();
  return JSON_VALUE_STRING;
endfunction : kind
