class BooksController < ApplicationController

  def home
  end

  def index
  	@book = Book.new
  	@books = Book.all
  
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  end

  def edit
  	@book = Book.find(params[:id])
end

  def create
    # １. データを新規登録するためのインスタンス作成
    @book = Book.new(book_params)
  	@books = Book.all
    # ２. データをデータベースに保存するためのsaveメソッド実行
    flash[:notice] = "Book was successfully updated."
    if @book.save
    # ３. トップ画面へリダイレクト
     redirect_to book_path(@book.id)
    else
     render 'index'
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book)
    else
    	render 'edit'
    end
  end

  def destroy
  	book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end