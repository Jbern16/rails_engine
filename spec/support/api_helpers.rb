module ApiHelpers

  def json_body
    JSON.parse(response.body)
  end

  def parse_time(time)
    time.to_json[1..-2]
  end

  def parse_date(date)
    date.to_json[1..-2]
  end


end

RSpec.configure do |config|
  config.include ApiHelpers, type: :request
end
