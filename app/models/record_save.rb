class RecordSave
  attr_accessor :errors

  def initialize(params, klass, user)
    @params = params
    @user = user
    @klass = klass
    @errors = []
  end

  def save
    begin
      ActiveRecord::Base.transaction do
        records = @user.send(@klass.underscore.pluralize).create(@params)
        records.map{|a| @errors << a.errors if a.errors.any?}
        raise ActiveRecord::RecordInvalid if @errors.present?
        return true unless @errors.any?
      end
    rescue ActiveRecord::RecordInvalid
      return false
    end
  end
end
