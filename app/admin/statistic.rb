ActiveAdmin.register Statistic do
 permit_params :recieved_requests ,:accepted_requests ,:registered_users,:lists,:sites
  index do
        selectable_column
        id_column
        column :recieved_requests
        column :accepted_requests
        column :registered_users
        column :lists
        column :sites
        actions 
  end
  form do |f|
        f.inputs 'Statistic' do
            f.input :recieved_requests
            f.input :accepted_requests
            f.input :registered_users
            f.input :lists
            f.input :sites
        end
        f.actions
    end
end


