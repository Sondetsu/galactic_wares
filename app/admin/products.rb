# frozen_string_literal: true

ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :title, :description, :price, :image, product_categories_attributes: [:id, :product_id, :category_id, :_destroy]

  index do
    selectable_column
    column :id
    column :title
    column :description
    column :price
    column :image
    column :categories do |product|
      product.categories.map { |p| p.title }.join(", ").html_safe
    end
    actions
  end

  show do |product|
    attributes_table do
      row :title
      row :description
      row :price
      row :image
      row :categories do |product|
        product.categories.map { |p| p.title }.join(", ").html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys

    f.inputs "Product" do
      f.input :title
      f.input :description
      f.input :price
      f.input :image
      f.has_many :product_categories, allow_destroy: true do |n_f|
        n_f.input :category
      end
    end

    f.actions
  end
end

