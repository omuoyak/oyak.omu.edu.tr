class SuggestionsController < ApplicationController
  def index
    @suggestions = Suggestion.all.order(id: :desc)
  end
end
