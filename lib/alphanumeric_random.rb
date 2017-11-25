require 'singleton'

class AlphanumericRandom
  include Singleton

  BASE = [*('A'..'Z')] + [*('a'..'z')] + [*('0'..'9')]
  HUMAN_EXCULUDE = ['1', '0', 'O', 'l', 'I']
  HUMAN = BASE - HUMAN_EXCULUDE

  def self.generate(options = {})
    options = {
      length: 8,
      unique: false,
      human: false,
      additional_chars: []
    }.merge!(options)

    throw 'Integer expected for length' unless options[:length].kind_of?(Integer)
    throw 'negative length given' unless options[:length] >= 0
    throw 'non boolean value for :unique' unless [true, false].include?(options[:unique])
    throw 'non boolean value for :human' unless [true, false].include?(options[:human])
    throw 'Array expected for :additional_chars' unless options[:additional_chars].kind_of?(Array)

    chars = options[:human] ? HUMAN : BASE
    chars += options[:additional_chars]
    chars = chars.uniq

    random_array = if options[:unique]
      chars.sample(options[:length])
    else
      (0..(options[:length] - 1)).map { chars.sample }
    end
    random_array.join
  end

  def self.human(options = {})
    options.merge!(human: true)
    self.generate(options)
  end

  def self.uniq(options = {})
    options.merge!(unique: true)
    self.generate(options)
  end
end
