require 'sentencify/sentencify_helper'

module Sentencify
  class Railtie < Rails::Railtie
    initializer 'sentencize.sentencify_helper' do
      ActionView::Base.send :include, SentencifyHelper
    end
  end
end
