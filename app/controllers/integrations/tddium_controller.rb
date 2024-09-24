# frozen_string_literal: true
require 'octokit'

class Integrations::TddiumController < Integrations::BaseController
  protected

  def deploy?
    params[:status] == 'passed' && params[:event] == 'stop'
  end

  def branch
    params[:branch]
  end

  def commit
    params[:commit_id]
  end

  # Tddium doesn't send commit message, so we have to get creative
  def message
    repo_name = "#{params[:repository][:org_name]}/#{params[:repository][:name]}"
    data = GITHUB.commit(repo_name, CGI.escape(params[:commit_id]))
    data.commit.message
  rescue Octokit::Error => e
    record_log :info, "Error trying to grab commit: #{e.message}"
    '' # If we don't hear back, don't skip
  end
end
