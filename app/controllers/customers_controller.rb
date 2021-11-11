class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update]
  def index
    @customers = Customer.all
  end

  def show; end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    
    if @customer.save
      redirect_to customers_path, notice: 'Customer registered successfully'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: 'Customer updated successfully'
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :smoker, :phone, :avatar)
  end

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
