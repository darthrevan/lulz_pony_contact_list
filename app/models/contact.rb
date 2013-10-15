class Contact < ActiveRecord::Base
  belongs_to :contact_group, foreign_key: 'group_id'
end
