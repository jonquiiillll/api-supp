class IssuesController < ApplicationController
  def index
    issues = Issue.all
    render json: issues
  end

  def create
  end

  def update
  end

  def destroy
  end
end
