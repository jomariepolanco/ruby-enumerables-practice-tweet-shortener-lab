# Write your code here.
require 'pry'
def dictionary
    dictionary = {
        "hello" => "hi",
        "to" => "2", 
        "two" => "2",
        "too" => "2",
        "for" => "4",
        "four" => "4",
        "be" => "b",
        "you" => "u",
        "at" => "@",
        "and" => "&"
    }
end

def word_substituter(tweet) 
    tweet.split.collect do |word|
        if dictionary.keys.include? word.downcase 
            word = dictionary[word.downcase]
        else
            word
        end
    end.join(" ")
end

def bulk_tweet_shortener(tweet_array)
    tweet_array.each do |tweet|
        puts word_substituter(tweet)     
    end
end

def selective_tweet_shortener(tweet)
    if tweet.chars.count > 140
        word_substituter(tweet)
    elsif tweet.chars.count <= 140
        tweet 
    end
end

def shortened_tweet_truncator(tweet)
    new_tweet = ""
    if tweet.chars.count > 140
        new_tweet = word_substituter(tweet)
        if new_tweet.chars.count > 140
            new_tweet = new_tweet[0..139]
            new_tweet[139] ="."
            new_tweet[138] = "."
            new_tweet[127] = "."
            new_tweet 
        elsif new_tweet.chars.count <= 140
            new_tweet
        end
    elsif tweet.chars.count <= 140
        tweet 
    end
end