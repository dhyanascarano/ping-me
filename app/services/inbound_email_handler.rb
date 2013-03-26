require "multi_json"

class InboundEmailHandler
  def self.receive(data)
    parsed = MultiJson.load(data, :symbolize_keys => true)
    new({
      :to => parsed.fetch(:envelope).fetch(:to),
      :from => parsed.fetch(:envelope).fetch(:from),
      :body => parsed.fetch(:plain),
      :subject => parsed.fetch(:headers).fetch(:Subject)
    })
  end
  
  attr_accessor :to, :from, :body, :subject, :record
  private :to=, :from=, :body=, :subject=, :record=
  
  def initialize(params)
    self.record = Email.new
    params.each do |key, value|
      record.send(:"#{key}=", value)
    end
  end
end