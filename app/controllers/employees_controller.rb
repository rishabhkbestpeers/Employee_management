require "prawn"
class EmployeesController < ApplicationController

  # USERS = { "lifo" => "filo" }

  # before_action :authenticate

  def download_pdf
    # employee = Employee.first
    # send_data generate_pdf(employee),
    #             filename: "#{employee.name}.pdf"
    #             type: "application/pdf"
  end

  def index
    @employees = Employee.all
  end
  
  def show
    @employee = Employee.find(params[:id])
    # respond_to do |format|
    #   format.html
    #   format.pdf { render pdf: generate_pdf(@employee) }
    # end
  end

  def new
    
    # employee = Employee.first
    # send_file("#{Rails.root}/files/1.pdf",
    #           filename: "1.pdf",
    #           type: "application/pdf")
    
    @employee = Employee.new

    # employee = Employee.first
    # send_data generate_pdf(employee),
    #             filename: "#{employee.name}.pdf",
    #             type: "application/pdf"
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.save
    redirect_to '/'
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])    
    @employee.update(employee_params)
    redirect_to '/'
  end 

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    flash[:notice] = "You have deleted the Info"
    redirect_to root_path, status: :see_other
  end
  
  private 

   def employee_params
    params.require(:employee).permit(:name, :position)
  end

  def generate_pdf(employee)
    Prawn::Document.new do
      text employee.name, align: :center
      text "email: #{employee.name}"
      text "position: #{employee.position}"
    end.render
  end

  # def authenticate
  #   authenticate_or_request_with_http_digest do |username|
  #     USERS[username]
  #   end
  # end
end
