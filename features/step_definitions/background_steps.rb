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
      fhash["thurday"] = fhash.delete("thu")
    end
    if fhash.has_key? "fri"
      fhash["friday"] = fhash.delete("fri")
    end
    if fhash.has_key? "sat"
      fhash["saturday"] = fhash.delete("sat")
    end

    Course.create!(fhash)
  end
end
