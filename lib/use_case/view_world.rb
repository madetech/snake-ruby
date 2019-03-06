class UseCase::ViewWorld
  def initialize(world_gateway:)
    @world_gateway = world_gateway
  end

  def execute(*)
    world = @world_gateway.fetch


    {
      grid: to_presentable_grid(world)
    }
  end

  private

  def to_presentable_grid(world)
    grid = []
    world.height.times do 
      grid << []
    end

    world.width.times do
      grid.each_index { |index| grid[index] << nil }
    end

    if world.food_location != nil
      grid[0][0] = :food
    end

    grid
  end
end
