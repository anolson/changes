class PullRequestsController < ApplicationController
  def create
    pull_request = PullRequest.create(pull_request_params)
    render nothing: true, status: 201
  end

  def show
    @pull_request = PullRequest.find(params[:id])
  end

  private

  def pull_request_params
    params.require(:pull_request).permit(:diff)
  end
end
