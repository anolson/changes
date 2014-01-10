class LineDecorator < Draper::Decorator
  delegate_all

  def context_css_class
    case
      when addition? then 'addition'
      when deletion? then 'deletion'
    end
  end
end