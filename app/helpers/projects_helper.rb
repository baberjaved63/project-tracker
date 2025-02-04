module ProjectsHelper
  def project_status_class(status)
    {
      "not_started" => "secondary",
      "planning" => "info",
      "in_progress" => "warning",
      "completed" => "success",
    }.fetch(status, "dark")
  end
end
