class SalesReceiptsController < ApplicationController
  before_action :set_sales_receipt, only: [:show, :edit, :update, :destroy]

  # GET /sales_receipts
  # GET /sales_receipts.json
  def index
    @sales_receipts = SalesReceipt.all
  end

  # GET /sales_receipts/1
  # GET /sales_receipts/1.json
  def show
  end

  # GET /sales_receipts/new
  def new
    @sales_receipt = SalesReceipt.new
    @employees = Employee.all
  end

  # GET /sales_receipts/1/edit
  def edit
  end

  # POST /sales_receipts
  # POST /sales_receipts.json
  def create
    @sales_receipt = SalesReceipt.new(sales_receipt_params)

    respond_to do |format|
      if @sales_receipt.save
        format.html { redirect_to @sales_receipt, notice: 'Sales receipt was successfully created.' }
        format.json { render :show, status: :created, location: @sales_receipt }
      else
        format.html { render :new }
        format.json { render json: @sales_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_receipts/1
  # PATCH/PUT /sales_receipts/1.json
  def update
    respond_to do |format|
      if @sales_receipt.update(sales_receipt_params)
        format.html { redirect_to @sales_receipt, notice: 'Sales receipt was successfully updated.' }
        format.json { render :show, status: :ok, location: @sales_receipt }
      else
        format.html { render :edit }
        format.json { render json: @sales_receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_receipts/1
  # DELETE /sales_receipts/1.json
  def destroy
    @sales_receipt.destroy
    respond_to do |format|
      format.html { redirect_to sales_receipts_url, notice: 'Sales receipt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_receipt
      @sales_receipt = SalesReceipt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sales_receipt_params
      params.require(:sales_receipt).permit(:emp_id, :amount, :date)
    end
end
