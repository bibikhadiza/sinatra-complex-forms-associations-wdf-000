require 'pry'

class OwnersController < ApplicationController




  get '/owners' do
    @owners = Owner.all

    erb :'/owners/index'
  end

  get '/owners/new' do                #create a new owner
    erb :'/owners/new'
  end


    post '/owners' do
    @owner = Owner.create(params[:owner])                    #we create the new owner and if the pet name is not empty meaning
    if !params["pet"]["name"].empty?                          #the pet is newly created then we shover that pet name to the owners
      @owner.pets << Pet.create(name: params["pet"]["name"])    #pets array remember owners has many pets therefore they have the pets array
    end                                                          #while we do this we are also creating the pet with the pet name. the pet
      @owner.save                                                 #will automatically have a id. we save the owner and we redriect to
      redirect to "owners/#{@owner.id}"                           #owner/:id
    end

  get '/owners/:id/edit' do
    @owner = Owner.find(params[:id])
    erb :'/owners/edit'
  end

  get '/owners/:id' do
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

  post '/owners/:id' do
    @owner = Owner.find(params[:id])
    @owner.update(params["owner"])
    if !params["pet"]["name"].empty?
      @owner.pets << Pet.create(name: params["pet"]["name"])
    end
    @owner.save
    redirect to "owners/#{@owner.id}"
  end





end
