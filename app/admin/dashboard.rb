# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
  end 
end

ActiveAdmin.setup do |config|
  config.namespace :admin do |admin|
    admin.build_menu do |menu|
      menu.add label: 'Posts', priority: 1, url: '/admin/posts' do |posts_menu|
        posts_menu.add label: 'Reviews', url: '/admin/reviews'
        posts_menu.add label: "Catalogues", url: '/admin/catalogues'
        posts_menu.add label: "Amenity", url: '/admin/amenities'
        posts_menu.add label: "Catalogue_Amenity", url: '/admin/catalogue_amenities'
        posts_menu.add label: "Test", url: '/admin/tests'
      end
    end
  end
end