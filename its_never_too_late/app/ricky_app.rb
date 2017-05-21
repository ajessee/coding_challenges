class RickyApp

  def call(env)
    [200, {"Content-Type" => "text/plain"}, ["Fresh quote coming right up"]]
  end

end
