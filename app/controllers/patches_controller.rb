class PatchesController < ApplicationController
  def create
    patch = Patch.create!(patch_params)
    render json: { location: patch_url(patch) }, status: 201
  end

  def show
    @patch = find_patch.decorate
  end

  private

  def find_patch
    Patch.where(permalink: permalink_param).first!
  end

  def patch_params
    params.require(:patch).permit(:raw)
  end

  def permalink_param
    params[:id] || params[:permalink]
  end
end
