require 'sidekiq'
require 'logger'

module Sidekiq

  def self.load_json(string)
    Marshal.load(string)
  rescue => ex
    log = Logger.new('/tmp/sq_marshal.log')
    log.info ex.message
    log.info string.class
    log.info string.inspect
    {}
  end

  def self.dump_json(object)
    Marshal.dump(object)
  end

end
