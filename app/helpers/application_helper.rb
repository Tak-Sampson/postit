module ApplicationHelper
  def fix_url(str)
    str.match(/^https(s)?\:\/\//) ? str : "https://#{str}"
  end

  def display_datetime(dt)
    dt.strftime("%m/%d/%Y %l:%M%P %Z")
  end
end
