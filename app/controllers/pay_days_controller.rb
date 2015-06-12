class PayDaysController < ApplicationController
  before_action :clean_pay_day, only: [:index,:running_pay_day]
  before_action :running_pay_day, only: [:index]
  before_action :set_pay_day, only: [:show, :edit, :update, :destroy]

  # GET /pay_days
  # GET /pay_days.json
  def index
    @pay_days = PayDay.all
  end

  # GET /pay_days/1
  # GET /pay_days/1.json
  def show
  end

  # GET /pay_days/new
  def new
    @pay_day = PayDay.new
  end

  # GET /pay_days/1/edit
  def edit
  end

  # POST /pay_days
  # POST /pay_days.json
  def create
    @pay_day = PayDay.new(pay_day_params)

    respond_to do |format|
      if @pay_day.save
        format.html { redirect_to @pay_day, notice: 'Pay day was successfully created.' }
        format.json { render :show, status: :created, location: @pay_day }
      else
        format.html { render :new }
        format.json { render json: @pay_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pay_days/1
  # PATCH/PUT /pay_days/1.json
  def update
    respond_to do |format|
      if @pay_day.update(pay_day_params)
        format.html { redirect_to @pay_day, notice: 'Pay day was successfully updated.' }
        format.json { render :show, status: :ok, location: @pay_day }
      else
        format.html { render :edit }
        format.json { render json: @pay_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pay_days/1
  # DELETE /pay_days/1.json
  def destroy
    @pay_day.destroy
    respond_to do |format|
      format.html { redirect_to pay_days_url, notice: 'Pay day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pay_day
      @pay_day = PayDay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pay_day_params
      params.require(:pay_day).permit(:emp_id, :name, :payment_type, :pay, :lastPayday)
    end
    
    def running_pay_day
    @calculate_pays = CalculatePay.all
    @employee = Employee.all
    
    @salaryman = @employee.where(payment_type: 'salary')
    @hourlyman = @employee.where(payment_type: 'hourly')
    @commisionman = @employee.where(payment_type: 'commision')
    
      @calculate_pays.each do |payment|
        if @salaryman.where(emp_id: payment.emp_id).exists?  # @salaryman.where(emp_id: payment.emp_id).exists?는 해당 요소가 존재하는지에 대한 불린값을 제공
          if Time.new == getDayOfWeekForLastDay #월말평일일 경우 동작 #월급쟁이는 매달 마지막 평일에 급여를 받음
             PayDay.create(emp_id: payment.emp_id, pay: payment.pay, lastPayday: Time.new)
          end
          
        elsif @hourlyman.where(emp_id: payment.emp_id).exists?  # @salaryman.where(emp_id: payment.emp_id).exists?는 해당 요소가 존재하는지에 대한 불린값을 제공
           PayDay.create(emp_id: payment.emp_id, pay: payment.pay)
          
        elsif @commisionman.where(emp_id: payment.emp_id).exists?  # @salaryman.where(emp_id: payment.emp_id).exists?는 해당 요소가 존재하는지에 대한 불린값을 제공
           PayDay.create(emp_id: payment.emp_id, pay: payment.pay)
        
        end
      
      end
    
   
    
    
    end
    
    def clean_pay_day #중복되는 지난 레코드 삭제
      @pay_days = PayDay.all
      @pay_days.each do |pays| 
        if pays.lastPayday <= Time.now
          pays.destroy()
        end
      end
    end
    
    def getDayOfWeekForLastDay(targetYear=Time.new.year, targetMonth=Time.new.month) #월말 평일 확인용 함수 #인자로 변수를 선언함으로 써, 클로저Clouser 기능 사용
      returnTime = Time.local(targetYear, targetMonth+1, 1)
      if (returnTime.wday == 0) #일요일일경우 0
        returnTime -2
      elsif (returnTime.wday == 7) #토요일일경우 7
        returnTime -1
      end 
      return returnTime #.wday
    end
    
end
