class Event
  ATTITUDE = [:hard, :normal, :ignore]
  TYPES = %i(exam work fun love morework danger)
  def initialize(args)
    @params = args
    raise 'need params' unless @params
    @type = @params[:type]

    @age = @params[:age]
    @is_choice = false
    @how_hard = rand(100)
    extend Object.const_get("EventCore::#{@type.capitalize}")
  end

  def how_hard
    @how_hard
  end

  def params
    {
      money: @money,
      age: @age,
      health: @health,
      eq: @eq,
      charm: @charm,
      how_hard: @how_hard,
      type: @type
    }
  end

  def choice(method)
    if !@is_choice and ATTITUDE.include?(method)
      send(method)
      @is_choice = true
    end
  end

  def human_result
    "#{@type} is#{ ' not' unless success?} successs, get #{result}"
  end

  private
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
