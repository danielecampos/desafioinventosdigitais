# Importando as bibliotecas
require 'slack-notifier'

class BugsController < ApplicationController
  before_action :set_bug, only: [:show, :edit, :update, :destroy]
  
  #Devise
  before_action :authenticate_user!
  
  # GET /bugs
  # GET /bugs.json
  def index
    @bugs = Bug.all
  end

  # GET /bugs/1
  # GET /bugs/1.json
  def show
  end

  # GET /bugs/new
  def new
    @bug = Bug.new
  end

  # GET /bugs/1/edit
  def edit
  end

  # POST /bugs
  # POST /bugs.json
  def create
    @bug = Bug.new(bug_params)

    respond_to do |format|
      if @bug.save
        format.html { redirect_to @bug, notice: 'Bug was successfully created.' }
        format.json { render :show, status: :created, location: @bug }
        # Slack
        notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
        notifier.ping "Novo Bug (#{@bug.titulo}) cadastrado para (#{@bug.projeto.titulo})"
      else
        format.html { render :new }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bugs/1
  # PATCH/PUT /bugs/1.json
  def update
    respond_to do |format|
      if @bug.update(bug_params)
        format.html { redirect_to @bug, notice: 'Bug was successfully updated.' }
        format.json { render :show, status: :ok, location: @bug }
        # Slack Atualização
        notifier = Slack::Notifier.new "https://hooks.slack.com/services/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"
        notifier.ping "O Status do Bug (#{@bug.titulo}) foi atualizado para (#{@bug.status})"
      else
        format.html { render :edit }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bugs/1
  # DELETE /bugs/1.json
  def destroy
    @bug.destroy
    respond_to do |format|
      format.html { redirect_to bugs_url, notice: 'Bug deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bug
      @bug = Bug.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bug_params
      params.require(:bug).permit(:projeto_id, :titulo, :versao_bug_detectado, :descricao, :status)
    end
    
end
