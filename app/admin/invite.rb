ActiveAdmin.register Invite do

  index do
        selectable_column
        id_column
        column :name
        column :email
        actions  do |invitation|
        link_to 'Invite',  mail_accepts_path(:invite => { :name =>  invitation.name ,:email => invitation.email}),  method: :post if invitation.accept?
        end
  end

end