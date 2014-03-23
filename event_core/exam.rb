# coding: utf-8
module EventCore
  module Exam
    def result
      {
        money: success? ? how_hard : 0,
        health: @result_health,
        happy: success? ? calculate_happy : - calculate_happy
      }
    end
    protected
    def hard
      @actual_value = iq * 1.5
      @result_health = -2
      @happy_rate = 1
    end

    def normal
      @actual_value = iq * 1.2
      @result_health = -1
      @happy_rate = 1
    end

    def ignore
      @actual_value  = iq * 1.0
      @result_health = 0
      @happy_rate = 2
    end
  end
end
