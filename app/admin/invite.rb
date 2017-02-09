ActiveAdmin.register Invite do

  index do
        selectable_column
        id_column
        column :name
        column :email
        actions  do |user|
          link_to 'Invite',  mail_accepts_path(:invite => { :name => user.name ,:email => user.email}),  method: :post ,:id => 'invite'
        end
  end

end