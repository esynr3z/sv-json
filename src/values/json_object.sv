// JSON object value
class json_object extends json_value implements json_object_encodable;
  typedef json_value values_t[string];

  values_t values;

  // Normal constructor
  extern function new(values_t values);

  // Create `json_object` from associative array
  extern static function json_object from(values_t values);

  // Create a deep copy of an instance
  extern virtual function json_value clone();

  // Compare with another instance
  extern virtual function bit compare(json_value value);

  // Interface json_object_encodable
  extern virtual function json_object_encodable::values_t get_values();
endclass : json_object


function json_object::new(values_t values);
  foreach (values[key]) begin
    this.values[key] = values[key];
  end
endfunction : new


function json_object json_object::from(values_t values);
  json_object obj = new(values);
  return obj;
endfunction : from


function json_value json_object::clone();
  json_value new_values [string];

  foreach (this.values[key]) begin
    if (this.values[key] == null) begin
      new_values[key] = null;
    end else begin
      new_values[key] = this.values[key].clone();
    end
  end

  return json_object::from(new_values);
endfunction : clone


function bit json_object::compare(json_value value);
  json_result#(json_object) casted;
  json_error err;
  json_object rhs;

  if (value == null) begin
    return 0;
  end

  casted = value.as_json_object();
  case (1)
    casted.matches_err(err): return 0;
    casted.matches_ok(rhs): begin
      if (rhs.values.size() != this.values.size()) begin
        return 0;
      end

      foreach (this.values[key]) begin
        if ((rhs.values.exists(key) == 0)) begin
          return 0;
        end else if ((this.values[key] != null) && (rhs.values[key] != null)) begin
          if (!this.values[key].compare(rhs.values[key])) begin
            return 0;
          end
        end else if ((this.values[key] == null) && (rhs.values[key] == null)) begin
          continue;
        end else begin
          return 0;
        end
      end
      return 1;
    end
  endcase
endfunction : compare


function json_object_encodable::values_t json_object::get_values();
  json_object_encodable::values_t values;

  foreach(this.values[key]) begin
    values[key] = this.values[key];
  end

  return values;
endfunction : get_values