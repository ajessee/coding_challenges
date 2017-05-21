class RickyRackMiddleware

  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    if env['PATH_INFO'] == '/quote' && env['REQUEST_METHOD'] == 'GET'
      ricky_says = "#{RickyQuoteParser.new.quotes.sample}"
    else
      ricky_says = "Sorry mate, that's a bad request (404). Try the '/quote' path."
      status = 404
    end
    [status, headers, [ricky_says]]
  end

end
