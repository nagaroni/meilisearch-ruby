# frozen_string_literal: true

RSpec.describe 'MeiliSearch::Client requests' do
  let(:key) { SecureRandom.uuid }

  before(:each) do
    @client = MeiliSearch::Client.new(URL, MASTER_KEY)

    expect(MeiliSearch::Client).to receive(:post)
      .with(kind_of(String), hash_including(body: "{\"primaryKey\":\"#{key}\",\"uid\":\"#{key}\"}"))
      .and_call_original
  end

  it 'parses options when they are in a snake_case' do
    @client.create_index(key, primary_key: key)
  end

  it 'parses options when they are in a different shape' do
    @client.create_index(key, priMARy_kEy: key)
  end
end
