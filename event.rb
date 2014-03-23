class Event
  ATTITUDE = [:hard, :normal, :ignore]
  TYPES = %i(exam work fun love morework danger)
  def initialize(args)
    @params = args
    raise 'need params' unless @params
    t = @params[:type]

    @is_choice = false
    @how_hard = rand(100)
    extend Object.const_get("EventCore::#{t.capitalize}")
  end

  def params
    {
      money: money,
      age: age,
      health: health,
      eq: eq,
      charm: charm,
      how_hard: how_hard,
      type: type
    }
  end

  def choice(method)
    if !@is_choice and ATTITUDE.include?(method)
      send(method)
      @is_choice = true
      @choice = method
    end
  end

  def human_result
    "#{type} is #{@how_hard} hard choice #{@choice} is#{ ' not' unless success?} successs, get #{result}"
  end

  def health
    @params[:health]
  end
  def charm
    @params[:charm]
  end

  def money
    @params[:money]
  end

  def age
    @params[:age]
  end

  def how_hard
    @how_hard
  end

  def type
    @params[:type]
  end

  def eq
    @params[:eq]
  end

  def money
    @params[:money]
  end
  private
  def iq
    @params[:iq]
  end

  def rp
    @params[:rp]
  end

  def rand_rp
    rand(1..rp)
  end

  def success?
    @actual_value + rand_rp >= how_hard
  end

  def calculate_happy
    (@how_hard * @happy_rate).round
  end
end
