class Employee

attr_accessor :first_name, :last_name, :email, :birthdate, :ssn, :id

def initialize(hash)
  @id = hash["id"]
  @first_name = hash["first_name"]
  @last_name = hash["last_name"]
  @email = hash["email"]
  @birthdate = hash["birthdate"]
  @ssn = hash ["ssn"]
end

def self.find(id)
  employee_keys = Unirest.get("http://localhost:3000/api/v1/employees/#{id}.json").body
  Employee.new(employee_keys)
end

def self.all
  all_array = []
  Unirest.get("http://localhost:3000/api/v1/employees.json").body.each do |hash|
    all_array << Employee.new(hash)
  end
  return all_array
end

def destroy
  Unirest.delete("http://localhost:3000/api/v1/employees/#{id}").body
end

def self.update(parameters)
  employee_hash = Unirest.patch("http://localhost:3000/api/v1/employees/#{id}.json", headers: {"Accept" => "application/json"}, parameters: {first_name: parameters[:first_name], last_name: parameters[:last_name], birthdate: parameters[:birthdate], email: parameters[:email], ssn: parameters[:ssn]}).body
  
  Employee.new(employee_hash)
end

def self.create(parameters)
    employee_keys = Unirest.post("http://localhost:3000/api/v1/employees.json", headers: {
      "Accept" => "application/json"}, parameters: {first_name: parameters[:first_name], last_name: parameters[:last_name], birthdate: parameters[:birthdate], email: parameters[:email], ssn: parameters[:ssn]}).body
    Employee.new(employee_hash)

end



end