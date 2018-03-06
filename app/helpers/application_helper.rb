module ApplicationHelper

  def fak yu
    yu ? '<i class="fa fa-check" style="color: green;"></i>' : '<i class="fa fa-remove" style="color: red;"></i>' 
  end

  def active(*paths)
    full_path = request.fullpath+""
    full_path.slice!(0)
    routes = full_path.split("/")
    if (routes & paths).size > 0
      "active"
    else
      ""
    end
  end

end
