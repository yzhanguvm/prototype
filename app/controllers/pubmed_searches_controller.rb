class PubmedSearchesController < ApplicationController
  before_action :correct_user, only: :destroy


  def create
    if (signed_in?)
      @pubmed_search = current_user.pubmed_searches.build(pubmed_search_params)
      @pubmed_search.pubmed_link = "http://www.ncbi.nlm.nih.gov/pubmed/?term=#{@pubmed_search.query}"
      if @pubmed_search.save
        redirect_to current_user
      else
        flash.now[:error] = "Invalid query."
        render 'static_pages/home'
      end
    else
      @pubmed_search = PubmedSearch.new(pubmed_search_params)
      if @pubmed_search.query.blank?
        flash.now[:error] = "Invalid query."
        render 'static_pages/home'
      else
        @pubmed_search.pubmed_link = "http://www.ncbi.nlm.nih.gov/pubmed/?term=#{@pubmed_search.query}"
        render 'show'
      end
    end
  end
     
  def show
  end

  def destroy
    @pubmed_search.destroy
    redirect_to user_path(current_user)
  end

  private

    def pubmed_search_params
      params.require(:pubmed_search).permit(:query)
    end

    def correct_user
      @pubmed_search = current_user.pubmed_searches.find_by(id: params[:id])
      redirect_to root_url if @pubmed_search.nil?
    end
end
