class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @pubmed_search = current_user.pubmed_searches.build
    else
      @pubmed_search = PubmedSearch.new
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
