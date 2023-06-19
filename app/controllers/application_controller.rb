class ApplicationController < ActionController::Base
    http_basic_authenticate_with name: "lpr", password: ENV.fetch("LPR_PASS")
end
