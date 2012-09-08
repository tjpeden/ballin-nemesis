class NotesController < ApplicationController
  before_filter :authenticate_user!

  # GET /notes
  def index
    @starred = Note.starred
    @categories = Category.all

    respond_to do |format|
      format.html
    end
  end

  # GET /notes/1
  def show
    @note = Note.unscoped.find(params[:id])

    respond_to do |format|
      format.json { render json: @note }
    end
  end

  # GET /notes/new
  def new
    @note = Note.new

    respond_to do |format|
      format.html
    end
  end

  # GET /notes/1/edit
  def edit
    @note = Note.unscoped.find(params[:id])
  end

  # POST /notes
  def create
    @note = Note.new(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path, notice: 'Note was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /notes/1
  def update
    @note = Note.unscoped.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to notes_path, notice: 'Note was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # PUT /notes/1/star
  def star
    @note = Note.unscoped.find(params[:id])
    @note.update_attributes(params[:note])

    @starred = Note.starred
    @categories = Category.all
    render partial: 'side'
  end

  # DELETE /notes/1
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    @starred = Note.starred
    @categories = Category.all
    respond_to do |format|
      format.html { render partial: 'side' }
    end
  end
end
