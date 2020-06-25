require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'kadai.html.erb')
# この一行を追記
server.mount('/kadai1.cgi', WEBrick::HTTPServlet::CGIHandler, 'kadai1.rb')
server.mount('/kadai2.cgi', WEBrick::HTTPServlet::CGIHandler, 'kadai2.rb')
server.start
