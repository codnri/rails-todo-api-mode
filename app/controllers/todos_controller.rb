class TodosController < ApplicationController
    before_action :set_todo, only: [ :update, :destroy]
    # GET /todos
    def index
      @todos = Todo.all
      render json: @todos
    end
  
    # GET /todos/1
    def show
      @todo = Todo.find(params[:id])
      render json: @todo
    end
  
    
    
    # POST /todos
    def create
      @todo = Todo.new(todo_params)
      # @todo = current_user.todos.build(todo_params)
  
      if @todo.save
          render json: @todo, status: :created, location: @todo
      else
          render json: @todo.errors, status: :unprocessable_entity      
      end
    end
    

    # PATCH/PUT /todos/1
    def update
      # @todo = Todo.find(params[:id])
      if @todo.update(todo_params)
          # flash[:notice] = "Todo has been updated"
          render json: @comment
      else
          # flash[:alert] = "Todo is not updated"
          render json: @comment.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /todos/1
    def destroy            
      @todo.destroy
      
    end
  
    private
      def todo_params
        params.require(:todo).permit(:subject,:description,:is_completed)
      end
  
      def set_todo
        @todo = Todo.find(params[:id])
      end
end
