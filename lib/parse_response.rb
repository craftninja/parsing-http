class HTTPResponseParser

  def initialize(something)
    @something = something
  end

  def response_code
    @something.split("\n").first[9..11].to_i
  end

  def version
    @something.split("\n").first[0..7]
  end

  def body
    response = @something.split("\n")
    response[9..response.length].join
  end

  def header
    header = {}
    header_list = @something.split("\n")[1..7]
    header_list.each do |component|
      parts = component.split(": ")
      header["#{parts[0]}:"] = parts[1]
    end
    header
  end

  def content_type
    header["Content-Type:"]
  end

  def server
    header["Server:"]
  end

  def location
    header["Location:"]
  end

end
