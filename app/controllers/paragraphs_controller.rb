# frozen_string_literal:true

# Paragraph Controller
class ParagraphsController < ApplicationController
  before_action :set_paragraph, only: %i[update destroy]
  before_action :set_notebook, only: %i[create update]
  before_action :set_page, only: %i[create update]

  # POST /paragraphs or /paragraphs.json
  def create
    @page.paragraphs.create
    redirect_to notebook_page_path(@notebook, @page)
  end

  # PATCH/PUT /paragraphs/1 or /paragraphs/1.json
  def update
    if @paragraph.update(paragraph_params)
      redirect_to notebook_page_path(@notebook, @page),
                  notice: 'Paragraph was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /paragraphs/1 or /paragraphs/1.json
  def destroy
    @paragraph.destroy

    respond_to do |format|
      format.html do
        redirect_to paragraphs_url,
                    notice: 'Paragraph was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_notebook
    @notebook = current_user.notebooks.find(params[:notebook_id])
  end

  def set_page
    @page = @notebook.pages.find(params[:page_id])
  end

  def set_paragraph
    @paragraph = Paragraph.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def paragraph_params
    params.require(:paragraph).permit(:content)
  end
end
