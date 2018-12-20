class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by(email:params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "הכניסה בוצעה בהצלחה"
            redirect_to root_path
        else
            flash[:danger] = "שגיאה בפרטי כניסה - כתובת דואר אלקטרוני או סיסמא"
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "היציאה בוצעה בהצלחה"
        redirect_to root_path
    end

end
