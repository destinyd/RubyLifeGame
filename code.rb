def handle(event)
  if(event.params[:type] == :work)
    event.choice(:normal)
  else
    event.choice(:hard)
  end
end
