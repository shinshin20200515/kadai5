require 'cgi'
cgi = CGI.new

cgi.out("type" => "text/html", "charset" => "UTF-8"){
  get = cgi['kadai1']
  "<html>
    <body>
      <p>譲渡先が自家消費ではないもののgoyaの情報は下記になります</p>
      文字列：#{get}
    </body>
  </html>"
}
