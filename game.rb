# coding: utf-8
class Game
  def initialize(args={})
    #show
    @money = 0
    @age = 5
    @health = 95
    @charm = rand(1..99)
    @eq = 100 - @charm #rand(100)
    #hide
    #@iq = 60 + rand(140)
    @rp = rand(1..99)
    @iq = 100 - @rp #rand(100)

    #score
    @happy = 100

    @alive = true

    @name = args[:name]
    @is_print_attrs = args[:is_print_attrs]
  end

  def run_by(user)
    while @alive
      print_attrs if @is_print_attrs
      @events = build_events
      @events.each do |event|
        user.handle(event)
        deal_with(event)
      end
      print_events
      grow_up
    end
    print_scopes
  end

  def params
    {
      money: @money,
      age: @age,
      health: @health,
      eq: @eq,
      charm: @charm,
      iq: @iq,
      rp: @rp,
      #happy: @happy
    }
  end

  def money
    @money
  end

  def age
    @age
  end

  def health
    @health
  end

  def eq
    @eq
  end

  def charm
    @charm
  end
  private
  def deal_with(event)
    event.result.each do |key,val|
      eval "@#{key} += #{val}"
    end
  end

  def build_events
    [
      Event.new(params.merge(type: age <= 22 ? :exam : :work)),
      rand_rp > 30 ? Event.new(params.merge(type: :fun)) : nil
    ].compact
  end

  def grow_up
    @health -= 1
    if @health <= 0
      @alive = false
    else
      @age += 1
    end
  end

  def print_scopes
    p "your life: die on #{@age} money:#{@money} happy:#{@happy}"
  end

  def print_events
    p "age: #{@age} " + @events.map(&:human_result).join(';')
  end

  def print_attrs
    p params.map{|key, value|
      "#{key}: #{value}"
    }.join(" ")
  end

  def rand_rp
    rand(1..@rp)
  end
end
