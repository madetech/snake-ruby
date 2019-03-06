describe 'snake' do
  class InMemoryWorldGateway
    def fetch
    end
  end

  let(:random_number_seed) { 1 }
  let(:world_gateway) { InMemoryWorldGateway.new }


  let(:random_gateway) { Gateway::RandomNumber.new(random_number_seed) }
  let(:start_game) { UseCase::StartGame.new(random_gateway: random_gateway) }
  let(:view_world) { UseCase::ViewWorld.new(world_gateway: world_gateway) }

  xit 'can see the starting world' do
    start_game.execute(height: 4, width: 8)

    response = view_world.execute({})
    expect(response[:grid]).to eq([
                                    [nil, nil, nil, nil, nil, nil, nil, nil],
                                    [nil, :food, nil, nil, nil, nil, nil, nil],
                                    [nil, nil, nil, nil, :head, :body, :body, nil],
                                    [nil, nil, nil, nil, nil, nil, nil, nil]
                                  ])
  end
end
