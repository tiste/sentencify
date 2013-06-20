require 'active_support/core_ext/array'

class Array
  def sentencize(options = {})
    options.assert_valid_keys(:on, :limit, :empty, :words_connector, :two_words_connector, :last_word_connector, :final_singular_connector, :final_plural_connector)

    default_connectors = {
      on:                       :title,
      limit:                    5,
      empty:                    'No element found',
      words_connector:          ', ',
      two_words_connector:      ' and ',
      last_word_connector:      ' and ',
      final_singular_connector: ' other',
      final_plural_connector:   ' others'
    }

    if defined?(I18n)
      i18n_connectors = I18n.translate(:'sentencify', default: {})
      default_connectors.merge!(i18n_connectors)
    end

    options = default_connectors.merge!(options)

    case length
    when 0
      options[:empty]
    when 1
      self[0][options[:on]]
    when 2
      elts = self.map(&options[:on])
      "#{elts[0]}#{options[:two_words_connector]}#{elts[1]}"
    else
      elts = self.map(&options[:on])
      if options[:limit] >= length
        "#{elts[0...-1].join(options[:words_connector])}#{options[:last_word_connector]}#{elts[-1]}"
      else
        nb_others = length-options[:limit]
        others    = (nb_others != 1) ? options[:final_plural_connector] : options[:final_singular_connector]
        "#{elts[0..options[:limit]-1].join(options[:words_connector])}#{options[:last_word_connector]}#{nb_others}#{others}"
      end
    end
  end
end
