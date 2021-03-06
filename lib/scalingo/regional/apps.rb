require "scalingo/api/endpoint"

module Scalingo
  class Regional::Apps < API::Endpoint
    def all(headers = nil, &block)
      data = nil

      response = connection.get(
        "apps",
        data,
        headers,
        &block
      )

      unpack(:apps) { response }
    end

    def find(id, headers = nil, &block)
      data = nil

      response = connection.get(
        "apps/#{id}",
        data,
        headers,
        &block
      )

      unpack(:app) { response }
    end

    def create(payload = {}, headers = nil, &block)
      data = {app: payload}

      dry_run = !!(payload[:dry_run] || payload["dry_run"])

      request_headers = {}
      request_headers["X-Dry-Run"] = "true" if dry_run
      request_headers.update(headers) if headers

      response = connection.post(
        "apps",
        data,
        request_headers,
        &block
      )

      unpack(:app) { response }
    end

    def update(id, payload = {}, headers = nil, &block)
      data = {app: payload}

      response = connection.patch(
        "apps/#{id}",
        data,
        headers,
        &block
      )

      unpack(:app) { response }
    end

    def logs_url(id, headers = nil, &block)
      data = nil

      response = connection.get(
        "apps/#{id}/logs",
        data,
        headers,
        &block
      )

      unpack(:logs_url) { response }
    end

    def destroy(id, payload = {}, headers = nil, &block)
      response = connection.delete(
        "apps/#{id}",
        payload,
        headers,
        &block
      )

      unpack { response }
    end

    def rename(id, payload = {}, headers = nil, &block)
      response = connection.post(
        "apps/#{id}/rename",
        payload,
        headers,
        &block
      )

      unpack(:app) { response }
    end

    def transfer(id, payload = {}, headers = nil, &block)
      response = connection.patch(
        "apps/#{id}",
        payload,
        headers,
        &block
      )

      unpack(:app) { response }
    end
  end
end
