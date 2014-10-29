require 'spec_helper'

describe "post pair schedule" do
  it "posts to campfire" do
    room_id = 12345
    stub_user
    stub_room_request(room_id)
    paste_request = stub_paste_message(room_id)

    PairUp::CLI.new([fake_roster]).run

    expect(paste_request).to have_been_requested
  end

  private

  def stub_user
    stub_request(:get, /campfirenow.com\/users\/me.json/).
      to_return(status: 200, body: "\{ \"user\": \{\"api_auth_token\": 1 \}\}", headers: {})
  end

  def stub_room_request(room_id)
    ENV['campfire_room_id'] = room_id.to_s
    rooms = "{\"rooms\": [{\"id\": #{room_id}}]}"
    stub_request(:get, /campfirenow.com\/rooms.json/).
      to_return(status: 200, body: rooms, headers: {})
  end

  def stub_paste_message(room_id)
    stub_request(:post, /campfirenow.com\/room\/#{room_id}\/speak.json/)
  end

  def fake_roster
    File.expand_path('spec/fixtures/fake_roster')
  end
end
