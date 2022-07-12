# frozen_string_literal:true

# ChecklistsItem Controller
class ChecklistItem < ApplicationRecord
  belongs_to :checklist
end
