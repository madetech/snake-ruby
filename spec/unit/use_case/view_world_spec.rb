describe UseCase::ViewWorld do
  [
    [0, 0, []],
    [0, 1, []],
    [1, 0, [[]]],
    [2, 0, [[],[]]],
    [3, 0, [[],[],[]]],
    [1, 1, [[nil]]],
    [1, 2, [[nil, nil]]],
    [1, 3, [[nil, nil, nil]]],
    [2, 1, [[nil], [nil]]],
    [3, 1, [[nil], [nil], [nil]]],
    [3, 2, [[nil, nil], [nil, nil], [nil, nil]]],
  ].each do |test_case|
    height, width, expected_grid = test_case

    it "can view an empty world with height #{height} and width #{width}" do
      world = Domain::World.new
      world.height = height
      world.width = width

      use_case = described_class.new(
        world_gateway: double(fetch: world)
      )

      response = use_case.execute({})

      expect(response[:grid]).to eq(
        expected_grid
      )
    end
  end

  it 'can view a world with only food' do 
    world = Domain::World.new
    world.height = 1
    world.width = 1
    world.food_location = Domain::Location.new(0, 0)

    use_case = described_class.new(
      world_gateway: double(fetch: world)
    )

    response = use_case.execute({})

    expect(response[:grid]).to eq(
      [[:food]]
    )
  end
end
