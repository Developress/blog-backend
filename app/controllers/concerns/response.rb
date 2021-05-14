module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def error_response(object)
    render json: object, status: 404
  end
end
