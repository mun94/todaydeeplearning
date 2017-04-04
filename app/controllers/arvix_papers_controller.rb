class ArvixPapersController < ApplicationController
  before_action :load_paper, only: [:show, :upvote, :downvote, :update]
  before_action :require_login, only: [:upvote, :downvote]

  def index
    if params[:latest]
      @arvix_papers = ArvixPaper.includes(:authors, :votes_for)
                                .latest(params[:category])
                                .page(params[:page])
    else
      @arvix_papers = ArvixPaper.includes(:authors, :votes_for)
                                .within(params[:period], params[:category])
                                .page(params[:page])
    end
  end

  def show
  end

  def upvote
    @arvix_paper.liked_by current_user
    redirect_to arvix_papers_path
  end

  def downvote
    @arvix_paper.downvote_from current_user
    redirect_to arvix_papers_path
  end

  private

  def load_paper
    @arvix_paper = ArvixPaper.find(params[:id])
  end
end
