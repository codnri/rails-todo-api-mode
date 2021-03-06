class TodosController < ApplicationController
    # before_filter :set_headers
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
      # def set_headers
      #   headers['Access-Control-Allow-Origin'] = 'localhost:3000'
      #   headers['Access-Control-Expose-Headers'] = 'ETag'
      #   headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
      #   headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
      #   headers['Access-Control-Max-Age'] = '86400'
      # end
end
