module Sentencify
  module SentencifyHelper
    def sentencize_images(to_sentencify = [], options = {})
      will_sentencized = to_sentencify.map { |o| image_tag(o.send(options[:on])) }
      raw(will_sentencized.sentencize(options.merge({ image: true })))
    end
  end
end
