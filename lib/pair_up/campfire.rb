class PairUp::Campfire
  def paste(text)
    room.paste(text)
  end

  private

  def room
    @room ||= campfire.find_room_by_id(room_id)
  end

  def campfire
    Tinder::Campfire.new(subdomain, token: token)
  end

  def subdomain
    PairUp.campfire_subdomain
  end

  def token
    PairUp.campfire_token
  end

  def room_id
    PairUp.campfire_room_id
  end
end
