# frozen_string_literal: true

class ArticlesController < ApplicationController
  def new; end

  def create
    Article.create(params[:article])
    render plain: params[:article].inspect + ' now there are ' + Article.all.count
  end
end
