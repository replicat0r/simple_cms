module ApplicationHelper

  def status_tag(boolean, options={})
    options[:true_text]  ||= ''
    options[:false_text] ||= ''

    if boolean
      content_tag(:span, options[:true_text], :class => 'status true')
    else
      content_tag(:span, options[:false_text], :class => 'status false')
    end
  end
  def error_messages_for(object)
  	render(:partial => 'application/error_messages',:locals => {:object => object})
  end

  def sortable(column, title = nil)

    #set defaut for title
    title || title = column.titleize
    #set direction 
    direction = column == params[:sort] && params[:direction] == 'asc' ? 'desc' : 'asc'

      #if the column matches the current column selected, AND if the direction is asc, then its desc, otherwise its asc
    #link to the column, and sort by the column name,, and direction
    link_to title, :sort => column , :direction => direction



  end

end
