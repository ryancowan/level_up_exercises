class Deed < ActiveRecord::Base
  belongs_to :legislator, primary_key: "bioguide_id", foreign_key: "bioguide_id", class_name: :Legislator
  belongs_to :bill, primary_key: "bill_id", class_name: :Bill

  scope :all_sorted, ->(page, sort_by = "occurrence_date DESC") { order(sort_by).paginate(page: page) }
  scope :related_bill, ->(deed) { where(bioguide_id: deed.bioguide_id).first }
  scope :all_related, ->(deed) { where('id != ? and (bioguide_id = ? or bill_id = ?)', deed.id, deed.bioguide_id, deed.bill_id) }
end
