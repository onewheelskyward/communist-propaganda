class App < Sinatra::Base
  def resolve_bolshevik(propaganda)
    commie = Shortening.first(bolshevik: propaganda)
  end
end
