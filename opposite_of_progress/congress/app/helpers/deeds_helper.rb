# Deeds helper module
module DeedsHelper
  def self.law_voted_on
    Bill.order(:updated_at).all.each do |bill|
      if bill.last_vote_at && bill.short_title
        deed_text = "#{bill.short_title} was last voted on " \
          "#{ApplicationHelper.date_display(bill.last_vote_at)}"

        deed = Deed.find_or_create_by(bill_id: bill.bill_id,
                                      bioguide_id: bill.sponsor_id,
                                      deed: deed_text,
                                      occurrence_date: bill.last_vote_at)
        deed.save
      end
    end
  end

  def self.enacted_into_law
    Bill.order(:updated_at).all.each do |bill|
      if bill.congress == 113 && bill.enacted_at && bill.short_title
        deed_text = "#{bill.short_title} was enacted on " \
          "#{ApplicationHelper.date_display(bill.enacted_on)}"

        deed = Deed.find_or_create_by(bill_id: bill.bill_id,
                                      bioguide_id: bill.sponsor_id,
                                      deed: deed_text,
                                      occurrence_date: bill.enacted_on)
        deed.save
      end
    end
  end

  def self.related_legislator deed
    Legislator.where(bioguide_id: deed.bioguide_id).first
  end

  def self.related_bill deed
    Bill.where(bill_id: deed.bill_id).first
  end
end
