require_relative "fetch_tweet"

class PasswordEvaluator

  def initialize
    @characters = 0
    @words = 0
  end

  def counter_char_words(message)
    if message.empty?
      @words += 0
      @characters += 0
    else
      matches_char = message.scan(/[a-zA-Z]+/)
        @words += matches_char.size
        @characters += 1
      matches_number = message.scan(/[0-9]+/)
        @words += matches_number.size
        @characters += 1
      matches_space = message.scan(/\s+/)
        @words += matches_space.size
        @characters += 1
      matches_other = message.scan(/[^\s\da-zA-Z]+/)
        @words += matches_other.size
        @characters += 1
    end
  end

  def strength_rating
    @characters * @words
  end

  def password_category(rating, message)
    if rating >= 50
      FetchTweet.update_status("Your password is Strong")
    elsif rating > 10 && rating < 50
      better_password = improve_password(message)
      FetchTweet.update_status("Your password is Weak, try with #{better_password}")
    else
      FetchTweet.update_status("Your password is Unacceptable, try again with a better password")
    end
  end

  def improve_password(message)
    improved_password = ''
		message.each_char do |letter|
			case letter.downcase
			when "a" then improved_password << "4"
			when "e" then improved_password << "3"
			when "i" then improved_password << "1"
			when "o" then improved_password << "0"
			else improved_password << letter
			end
		end
		improved_password
  end
end
