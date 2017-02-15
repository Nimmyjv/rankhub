ActiveAdmin.register User do
    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    action_item only: :index do
      link_to "Disable SignUp", "#"
    end

    filter :email

    index do
        selectable_column
        id_column
        column :name
        column :email
        column :lists_number
        column :sites_number
        column :created_at
        column :sign_in_count
        actions
    end
    permit_params :name, :email, :lists_number, :sites_number, :sites ,:password, :password_confirmation

    form do |f|
        f.inputs 'User' do
            f.input :name
            f.input :email
            f.input :lists_number
            f.input :sites_number
            f.input :sites
            f.input :password
            f.input :password_confirmation
        end
        f.actions
    end
end
