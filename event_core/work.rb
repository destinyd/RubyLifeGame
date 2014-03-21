# coding: utf-8
module EventCore
  module Work
    def eq
      @params[:eq]
    end

    def result
      {
        money: success? ? how_hard * 10 : 0,
        health: @result_health,
        happy: success? ? calculate_happy : - (@how_hard / @happy_rate).round
      }
    end


    def human_result
      "#{@type} is#{ ' not' unless success?} successs, get #{result}"
    end

    def hard
      @actual_value = (iq + eq) / 2.0 * 1.5
      @result_health = -2
      @happy_rate = 1.0
    end

    def normal
      @actual_value = (iq + eq) / 2.0 * 1.2
      @result_health = -1
      @happy_rate = 1.0
    end

    def ignore
      @actual_value = (iq + eq) / 2.0 * 1.0
      @result_health = 0
      @happy_rate = 2.0
    end
    private
    def iq
      @params[:iq]
    end
  end
end
