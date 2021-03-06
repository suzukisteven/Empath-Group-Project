class Company < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :users, dependent: :destroy

    def search_employees(query)
        self.users.where("firstname ILIKE :firstname", firstname:  "%#{query}%")
    end

    def self.search_companies(query)
        where("name ILIKE :name", name: "%#{query}%")
    end
end
