class User
  def initialize(args = {})
    #class_eval args[:handle]
  end

  def handle
    raise 'you have no define user.handle'
  end
end
