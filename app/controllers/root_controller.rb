class RootController < ApplicationController
  def index
    render text: html
  end

  private

  def html
    $redis.get "record-keeper-client:index:#{current_revision_key}"
  end

  def current_revision_key
    if Rails.env.development?
      '__development__'
    else
      'current'
    end
  end
end
