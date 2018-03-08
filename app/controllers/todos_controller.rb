class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  def index
    @todos = Todo.all
    json_response(@todos)
  end

  def create
    @todo = Todo.create!(todo_params)

    if @todo.save
      params[:item][:document_data].each do |file|
        @todo.documents.create!(:document => file)
      end

      json_response(@todo, :created)
    else
      json(@todo.errors)
    end
  end

  def show
    json_response(@todo)
  end

  def update
    @todo.update(todo_params)
    head :no_content
  end

  def destroy
    @todo.destroy
    head :no_content
  end

  private
    def todo_params
      params.permit(:title, :created_by, :picture, :document_data => [])
    end

    def set_todo
      @todo = Todo.find(params[:id])
    end
end
