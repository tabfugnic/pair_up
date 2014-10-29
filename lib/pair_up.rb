require "pair_up/version"
require "pair_up/campfire"
require "pair_up/cli"
require "pair_up/combiner"
require "pair_up/file_reader"
require "tinder"

module PairUp
  def self.campfire_room_id
    ENV['campfire_room_id']
  end

  def self.campfire_subdomain
    ENV['campfire_subdomain']
  end

  def self.campfire_token
    ENV['campfire_token']
  end
end
