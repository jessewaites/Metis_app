class BookDownload < ActiveRecord::Base

  def purchased_book?
    current_user.purchased_book
  end

end
