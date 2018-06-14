class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = find_employee
  end

  def edit
    @employee = find_employee
    @all_dogs = Dog.all
  end

  def update
    @employee = find_employee
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end
  end

  def new
    @employee = Employee.new
    @all_dogs = Dog.all
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.valid?
      @employee.save
      redirect_to @employee
    else
      render :new
    end
  end

  def find_employee
    Employee.find(params[:id])
  end

private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :title, :alias, :office, :img_url, :dog_id)
  end

end
