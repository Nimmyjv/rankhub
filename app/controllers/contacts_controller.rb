class ContactsController < ApplicationController
 
 def create
    @contact = Contact.new(contact_params)
    if @contact.save
      UserMailer.contact_email(@contact).deliver_now
      redirect_to root_path
       flash[:note]="Your message successfully saved"
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
