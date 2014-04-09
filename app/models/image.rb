class Image
  include ActiveModel::Model

  attr_reader :id, :description, :repository

  def initialize(attributes)
    @attributes = attributes
    @id = attributes['id']
    @description = attributes['description']
    @repository = attributes['repository']
  end

  def status_label
    if @attributes['recommended']
      'Recommended'
    elsif @attributes['is_trusted']
      'Trusted'
    else
      'Repository'
    end
  end

  def as_json(options={})
    super.
      except('attributes').
      merge({
        'status_label' => status_label
      })
  end
end