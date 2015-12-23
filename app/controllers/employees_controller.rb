class EmployeesController < ApplicationController

  def show
    @employee = Employee.find(params[:id])
  end

  def index
    @employees = Employee.all
  end

  def create
    @employee = Employee.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], birthdate: params[:birthdate], ssn: params[:ssn])
    # @employee = Unirest.post("http://localhost:3000/employees.json", headers: {
    #   "Accept" => "application/json"}, parameters: {first_name: params[:first_name], last_name: params[:last_name], birthdate: params[:birthdate], email: params[:email], ssn: params[:ssn]}).body
    redirect_to "/employees/#{@employee.id}"
  end

  def new
  end

  def edit
    @employee = Unirest.get("http://localhost:3000/employees/#{params[:id]}.json").body
  end

  def update
    @employee = Employee.find(:id).update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], birthdate: params[:birthdate], ssn: params[:ssn])
    # @employee = Unirest.patch("http://localhost:3000/employees/#{params[:id]}.json", headers: {
    #   "Accept" => "application/json"}, parameters: {first_name: params[:first_name], last_name: params[:last_name], birthdate: params[:birthdate], email: params[:email], ssn: params[:ssn]}).body
    redirect_to "/employees/#{@employee["id"]}"
  end

  def destroy
    Employee.find(params[:id]).destroy
    # @employee = Unirest.delete("http://localhost:3000/employees/#{params[:id]}.json").body
    redirect_to "/employees"
  end

end
