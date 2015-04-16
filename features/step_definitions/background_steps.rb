Given /^these courses:$/i do |table|
  table.hashes.each do |fhash|
    if fhash.has_key? "desc"
      fhash["description"] = fhash.delete("desc")
    end
    if fhash.has_key? "sun"
      fhash["sunday"] = fhash.delete("sun")
    end
    if fhash.has_key? "mon"
      fhash["monday"] = fhash.delete("mon")
    end
    if fhash.has_key? "tue"
      fhash["tuesday"] = fhash.delete("tue")
    end
    if fhash.has_key? "wed"
      fhash["wednesday"] = fhash.delete("wed")
    end
    if fhash.has_key? "thu"
      fhash["thursday"] = fhash.delete("thu")
    end
    if fhash.has_key? "fri"
      fhash["friday"] = fhash.delete("fri")
    end
    if fhash.has_key? "sat"
      fhash["saturday"] = fhash.delete("sat")
    end
    if fhash.has_key? "start"
      fhash["start_time"] = fhash.delete("start")
    end
    if fhash.has_key? "end"
      fhash["end_time"] = fhash.delete("end")
    end
    if fhash.has_key? "order"
      fhash["ordering"] = fhash.delete("order")
    end

    if fhash.has_key? "first" and fhash.has_key? "last" and fhash.has_key? "email"  # user object present!
        temphash["first_name"] = fhash.delete("first")
        temphash["last_name"] = fhash.delete("last")
        temphash["email"] = fhash.delete("email")
        User.create!(temphash) 
    end
    
    Course.create!(fhash)
  end
end

Given(/^these schedules:$/i) do |table|
    Schedule.create!(table.hashes)
end

Given(/^these users:$/i) do |table|
    User.create!(table.hashes)
end
