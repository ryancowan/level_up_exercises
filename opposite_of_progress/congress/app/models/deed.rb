class Deed < ActiveRecord::Base
  scope :all_sorted, ->(page, sort_by = "occurrence_date DESC") { order(sort_by).paginate(page: page) }
  scope :related_bill, ->(deed) { where(bioguide_id: deed.bioguide_id).first }
  scope :all_related, ->(deed) { where('id != ? and (bioguide_id = ? or bill_id = ?)', deed.id, deed.bioguide_id, deed.bill_id) }
end
