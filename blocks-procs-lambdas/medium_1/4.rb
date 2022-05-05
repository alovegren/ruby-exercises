def group_animals(animals_arr)
    yield(animals_arr)
end

animals = %w(raven finch hawk eagle)
group_animals(animals) do |_, _, *raptors|
  p raptors
end
