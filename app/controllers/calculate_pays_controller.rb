class CalculatePaysController < ApplicationController
  before_action :clean_pay, only: [:index,:calculating_pay]
  before_action :calculating_pay, only: [:index]
  before_action :set_calculate_pay, only: [:show, :edit, :update, :destroy]

  # GET /calculate_pays
  # GET /calculate_pays.json
  def index
    @calculate_pays = CalculatePay.all
  end

  # GET /calculate_pays/1
  # GET /calculate_pays/1.json
  def show
  end

  # GET /calculate_pays/new
  def new
    @calculate_pay = CalculatePay.new
  end

  # GET /calculate_pays/1/edit
  def edit
  end

  # POST /calculate_pays
  # POST /calculate_pays.json
  def create
    @calculate_pay = CalculatePay.new(calculate_pay_params)

    respond_to do |format|
      if @calculate_pay.save
        format.html { redirect_to @calculate_pay, notice: 'Calculate pay was successfully created.' }
        format.json { render :show, status: :created, location: @calculate_pay }
      else
        format.html { render :new }
        format.json { render json: @calculate_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calculate_pays/1
  # PATCH/PUT /calculate_pays/1.json
  def update
    respond_to do |format|
      if @calculate_pay.update(calculate_pay_params)
        format.html { redirect_to @calculate_pay, notice: 'Calculate pay was successfully updated.' }
        format.json { render :show, status: :ok, location: @calculate_pay }
      else
        format.html { render :edit }
        format.json { render json: @calculate_pay.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calculate_pays/1
  # DELETE /calculate_pays/1.json
  def destroy
    @calculate_pay.destroy
    respond_to do |format|
      format.html { redirect_to calculate_pays_url, notice: 'Calculate pay was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calculate_pay
      @calculate_pay = CalculatePay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calculate_pay_params
      params.require(:calculate_pay).permit(:emp_id, :pay)
    end
    
    #임금 추출
    def calculating_pay
      
    @employee = Employee.all
    @timecards = TimeCard.all
    #월급쟁이
    @salaryman = @employee.where(payment_type: 'salary')
      @salaryman.each do |salaryman|
        CalculatePay.create(emp_id: salaryman.emp_id, pay: salaryman.salary)
      end
      
    #시급인생  
    @hourlyman = @employee.where(payment_type: 'hourly')
      @hourlyman.each do |hourlyman|
        @someones_timecards = @timecards.where(emp_id: hourlyman.emp_id) #특정인의 타임카드수집
        totaltime = 0 #일한 종합시간 초기화
       
        @someones_timecards.each do |somecard| totaltime += somecard.time end #특정인 총합
        @hourlypay = hourlyman.hourly_rate * totaltime
        CalculatePay.create(emp_id: hourlyman.emp_id, pay: @hourlypay)
      end  
    end
    
    def clean_pay
      @calculate_pays = CalculatePay.all
      @calculate_pays.each do |pays| pays.destroy() end
    end
    
end

## 해야할일! 20150610
## sqlite3 의 데이터타입인 time을 integer로 바꾸는 방법 찾기.