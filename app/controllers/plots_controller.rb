class PlotsController < ApplicationController
    def index
        #here we will present the calculator and suggest a 'new' calculation
    end
    
    def new
        @plot = Plot.new
    end
    
    def show
    end
end
