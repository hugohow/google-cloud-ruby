# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "google/cloud/errors"
require "google/api/servicecontrol/v1/service_controller_pb"

module Google
  module Cloud
    module ServiceControl
      module V1
        module ServiceController
          ##
          # Client for the ServiceController service.
          #
          # [Google Service Control API](https://cloud.google.com/service-control/overview)
          #
          # Lets clients check and report operations against a [managed
          # service](https://cloud.google.com/service-management/reference/rpc/google.api/servicemanagement.v1#google.api.servicemanagement.v1.ManagedService).
          #
          class Client
            # @private
            attr_reader :service_controller_stub

            ##
            # Configure the ServiceController Client class.
            #
            # See {::Google::Cloud::ServiceControl::V1::ServiceController::Client::Configuration}
            # for a description of the configuration fields.
            #
            # ## Example
            #
            # To modify the configuration for all ServiceController clients:
            #
            #     ::Google::Cloud::ServiceControl::V1::ServiceController::Client.configure do |config|
            #       config.timeout = 10.0
            #     end
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            # @return [Client::Configuration]
            #
            def self.configure
              @configure ||= begin
                namespace = ["Google", "Cloud", "ServiceControl", "V1"]
                parent_config = while namespace.any?
                                  parent_name = namespace.join "::"
                                  parent_const = const_get parent_name
                                  break parent_const.configure if parent_const.respond_to? :configure
                                  namespace.pop
                                end
                default_config = Client::Configuration.new parent_config

                default_config
              end
              yield @configure if block_given?
              @configure
            end

            ##
            # Configure the ServiceController Client instance.
            #
            # The configuration is set to the derived mode, meaning that values can be changed,
            # but structural changes (adding new fields, etc.) are not allowed. Structural changes
            # should be made on {Client.configure}.
            #
            # See {::Google::Cloud::ServiceControl::V1::ServiceController::Client::Configuration}
            # for a description of the configuration fields.
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            # @return [Client::Configuration]
            #
            def configure
              yield @config if block_given?
              @config
            end

            ##
            # Create a new ServiceController client object.
            #
            # ## Examples
            #
            # To create a new ServiceController client with the default
            # configuration:
            #
            #     client = ::Google::Cloud::ServiceControl::V1::ServiceController::Client.new
            #
            # To create a new ServiceController client with a custom
            # configuration:
            #
            #     client = ::Google::Cloud::ServiceControl::V1::ServiceController::Client.new do |config|
            #       config.timeout = 10.0
            #     end
            #
            # @yield [config] Configure the ServiceController client.
            # @yieldparam config [Client::Configuration]
            #
            def initialize
              # These require statements are intentionally placed here to initialize
              # the gRPC module only when it's required.
              # See https://github.com/googleapis/toolkit/issues/446
              require "gapic/grpc"
              require "google/api/servicecontrol/v1/service_controller_services_pb"

              # Create the configuration object
              @config = Configuration.new Client.configure

              # Yield the configuration if needed
              yield @config if block_given?

              # Create credentials
              credentials = @config.credentials
              # Use self-signed JWT if the scope and endpoint are unchanged from default,
              # but only if the default endpoint does not have a region prefix.
              enable_self_signed_jwt = @config.scope == Client.configure.scope &&
                                       @config.endpoint == Client.configure.endpoint &&
                                       !@config.endpoint.split(".").first.include?("-")
              credentials ||= Credentials.default scope: @config.scope,
                                                  enable_self_signed_jwt: enable_self_signed_jwt
              if credentials.is_a?(String) || credentials.is_a?(Hash)
                credentials = Credentials.new credentials, scope: @config.scope
              end
              @quota_project_id = @config.quota_project
              @quota_project_id ||= credentials.quota_project_id if credentials.respond_to? :quota_project_id

              @service_controller_stub = ::Gapic::ServiceStub.new(
                ::Google::Cloud::ServiceControl::V1::ServiceController::Stub,
                credentials:  credentials,
                endpoint:     @config.endpoint,
                channel_args: @config.channel_args,
                interceptors: @config.interceptors
              )
            end

            # Service calls

            ##
            # Checks whether an operation on a service should be allowed to proceed
            # based on the configuration of the service and related policies. It must be
            # called before the operation is executed.
            #
            # If feasible, the client should cache the check results and reuse them for
            # 60 seconds. In case of any server errors, the client should rely on the
            # cached results for much longer time to avoid outage.
            # WARNING: There is general 60s delay for the configuration and policy
            # propagation, therefore callers MUST NOT depend on the `Check` method having
            # the latest policy information.
            #
            # NOTE: the {::Google::Cloud::ServiceControl::V1::CheckRequest CheckRequest} has the size limit of 64KB.
            #
            # This method requires the `servicemanagement.services.check` permission
            # on the specified service. For more information, see
            # [Cloud IAM](https://cloud.google.com/iam).
            #
            # @overload check(request, options = nil)
            #   Pass arguments to `check` via a request object, either of type
            #   {::Google::Cloud::ServiceControl::V1::CheckRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Cloud::ServiceControl::V1::CheckRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload check(service_name: nil, operation: nil, service_config_id: nil)
            #   Pass arguments to `check` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param service_name [::String]
            #     The service name as specified in its service configuration. For example,
            #     `"pubsub.googleapis.com"`.
            #
            #     See
            #     [google.api.Service](https://cloud.google.com/service-management/reference/rpc/google.api#google.api.Service)
            #     for the definition of a service name.
            #   @param operation [::Google::Cloud::ServiceControl::V1::Operation, ::Hash]
            #     The operation to be checked.
            #   @param service_config_id [::String]
            #     Specifies which version of service configuration should be used to process
            #     the request.
            #
            #     If unspecified or no matching version can be found, the
            #     latest one will be used.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Google::Cloud::ServiceControl::V1::CheckResponse]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Google::Cloud::ServiceControl::V1::CheckResponse]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            def check request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::ServiceControl::V1::CheckRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.check.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::ServiceControl::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {
                "service_name" => request.service_name
              }
              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.check.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.check.retry_policy
              options.apply_defaults metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @service_controller_stub.call_rpc :check, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Reports operation results to Google Service Control, such as logs and
            # metrics. It should be called after an operation is completed.
            #
            # If feasible, the client should aggregate reporting data for up to 5
            # seconds to reduce API traffic. Limiting aggregation to 5 seconds is to
            # reduce data loss during client crashes. Clients should carefully choose
            # the aggregation time window to avoid data loss risk more than 0.01%
            # for business and compliance reasons.
            #
            # NOTE: the {::Google::Cloud::ServiceControl::V1::ReportRequest ReportRequest} has the size limit (wire-format byte size) of
            # 1MB.
            #
            # This method requires the `servicemanagement.services.report` permission
            # on the specified service. For more information, see
            # [Google Cloud IAM](https://cloud.google.com/iam).
            #
            # @overload report(request, options = nil)
            #   Pass arguments to `report` via a request object, either of type
            #   {::Google::Cloud::ServiceControl::V1::ReportRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Cloud::ServiceControl::V1::ReportRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries, etc. Optional.
            #
            # @overload report(service_name: nil, operations: nil, service_config_id: nil)
            #   Pass arguments to `report` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param service_name [::String]
            #     The service name as specified in its service configuration. For example,
            #     `"pubsub.googleapis.com"`.
            #
            #     See
            #     [google.api.Service](https://cloud.google.com/service-management/reference/rpc/google.api#google.api.Service)
            #     for the definition of a service name.
            #   @param operations [::Array<::Google::Cloud::ServiceControl::V1::Operation, ::Hash>]
            #     Operations to be reported.
            #
            #     Typically the service should report one operation per request.
            #     Putting multiple operations into a single request is allowed, but should
            #     be used only when multiple operations are natually available at the time
            #     of the report.
            #
            #     There is no limit on the number of operations in the same ReportRequest,
            #     however the ReportRequest size should be no larger than 1MB. See
            #     {::Google::Cloud::ServiceControl::V1::ReportResponse#report_errors ReportResponse.report_errors} for partial failure behavior.
            #   @param service_config_id [::String]
            #     Specifies which version of service config should be used to process the
            #     request.
            #
            #     If unspecified or no matching version can be found, the
            #     latest one will be used.
            #
            # @yield [response, operation] Access the result along with the RPC operation
            # @yieldparam response [::Google::Cloud::ServiceControl::V1::ReportResponse]
            # @yieldparam operation [::GRPC::ActiveCall::Operation]
            #
            # @return [::Google::Cloud::ServiceControl::V1::ReportResponse]
            #
            # @raise [::Google::Cloud::Error] if the RPC is aborted.
            #
            def report request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Cloud::ServiceControl::V1::ReportRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              metadata = @config.rpcs.report.metadata.to_h

              # Set x-goog-api-client and x-goog-user-project headers
              metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Cloud::ServiceControl::V1::VERSION
              metadata[:"x-goog-user-project"] = @quota_project_id if @quota_project_id

              header_params = {
                "service_name" => request.service_name
              }
              request_params_header = header_params.map { |k, v| "#{k}=#{v}" }.join("&")
              metadata[:"x-goog-request-params"] ||= request_params_header

              options.apply_defaults timeout:      @config.rpcs.report.timeout,
                                     metadata:     metadata,
                                     retry_policy: @config.rpcs.report.retry_policy
              options.apply_defaults metadata:     @config.metadata,
                                     retry_policy: @config.retry_policy

              @service_controller_stub.call_rpc :report, request, options: options do |response, operation|
                yield response, operation if block_given?
                return response
              end
            rescue ::GRPC::BadStatus => e
              raise ::Google::Cloud::Error.from_error(e)
            end

            ##
            # Configuration class for the ServiceController API.
            #
            # This class represents the configuration for ServiceController,
            # providing control over timeouts, retry behavior, logging, transport
            # parameters, and other low-level controls. Certain parameters can also be
            # applied individually to specific RPCs. See
            # {::Google::Cloud::ServiceControl::V1::ServiceController::Client::Configuration::Rpcs}
            # for a list of RPCs that can be configured independently.
            #
            # Configuration can be applied globally to all clients, or to a single client
            # on construction.
            #
            # # Examples
            #
            # To modify the global config, setting the timeout for check
            # to 20 seconds, and all remaining timeouts to 10 seconds:
            #
            #     ::Google::Cloud::ServiceControl::V1::ServiceController::Client.configure do |config|
            #       config.timeout = 10.0
            #       config.rpcs.check.timeout = 20.0
            #     end
            #
            # To apply the above configuration only to a new client:
            #
            #     client = ::Google::Cloud::ServiceControl::V1::ServiceController::Client.new do |config|
            #       config.timeout = 10.0
            #       config.rpcs.check.timeout = 20.0
            #     end
            #
            # @!attribute [rw] endpoint
            #   The hostname or hostname:port of the service endpoint.
            #   Defaults to `"servicecontrol.googleapis.com"`.
            #   @return [::String]
            # @!attribute [rw] credentials
            #   Credentials to send with calls. You may provide any of the following types:
            #    *  (`String`) The path to a service account key file in JSON format
            #    *  (`Hash`) A service account key as a Hash
            #    *  (`Google::Auth::Credentials`) A googleauth credentials object
            #       (see the [googleauth docs](https://googleapis.dev/ruby/googleauth/latest/index.html))
            #    *  (`Signet::OAuth2::Client`) A signet oauth2 client object
            #       (see the [signet docs](https://googleapis.dev/ruby/signet/latest/Signet/OAuth2/Client.html))
            #    *  (`GRPC::Core::Channel`) a gRPC channel with included credentials
            #    *  (`GRPC::Core::ChannelCredentials`) a gRPC credentails object
            #    *  (`nil`) indicating no credentials
            #   @return [::Object]
            # @!attribute [rw] scope
            #   The OAuth scopes
            #   @return [::Array<::String>]
            # @!attribute [rw] lib_name
            #   The library name as recorded in instrumentation and logging
            #   @return [::String]
            # @!attribute [rw] lib_version
            #   The library version as recorded in instrumentation and logging
            #   @return [::String]
            # @!attribute [rw] channel_args
            #   Extra parameters passed to the gRPC channel. Note: this is ignored if a
            #   `GRPC::Core::Channel` object is provided as the credential.
            #   @return [::Hash]
            # @!attribute [rw] interceptors
            #   An array of interceptors that are run before calls are executed.
            #   @return [::Array<::GRPC::ClientInterceptor>]
            # @!attribute [rw] timeout
            #   The call timeout in seconds.
            #   @return [::Numeric]
            # @!attribute [rw] metadata
            #   Additional gRPC headers to be sent with the call.
            #   @return [::Hash{::Symbol=>::String}]
            # @!attribute [rw] retry_policy
            #   The retry policy. The value is a hash with the following keys:
            #    *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
            #    *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
            #    *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
            #    *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
            #       trigger a retry.
            #   @return [::Hash]
            # @!attribute [rw] quota_project
            #   A separate project against which to charge quota.
            #   @return [::String]
            #
            class Configuration
              extend ::Gapic::Config

              config_attr :endpoint,      "servicecontrol.googleapis.com", ::String
              config_attr :credentials,   nil do |value|
                allowed = [::String, ::Hash, ::Proc, ::Symbol, ::Google::Auth::Credentials, ::Signet::OAuth2::Client, nil]
                allowed += [::GRPC::Core::Channel, ::GRPC::Core::ChannelCredentials] if defined? ::GRPC
                allowed.any? { |klass| klass === value }
              end
              config_attr :scope,         nil, ::String, ::Array, nil
              config_attr :lib_name,      nil, ::String, nil
              config_attr :lib_version,   nil, ::String, nil
              config_attr(:channel_args,  { "grpc.service_config_disable_resolution" => 1 }, ::Hash, nil)
              config_attr :interceptors,  nil, ::Array, nil
              config_attr :timeout,       nil, ::Numeric, nil
              config_attr :metadata,      nil, ::Hash, nil
              config_attr :retry_policy,  nil, ::Hash, ::Proc, nil
              config_attr :quota_project, nil, ::String, nil

              # @private
              def initialize parent_config = nil
                @parent_config = parent_config unless parent_config.nil?

                yield self if block_given?
              end

              ##
              # Configurations for individual RPCs
              # @return [Rpcs]
              #
              def rpcs
                @rpcs ||= begin
                  parent_rpcs = nil
                  parent_rpcs = @parent_config.rpcs if defined?(@parent_config) && @parent_config.respond_to?(:rpcs)
                  Rpcs.new parent_rpcs
                end
              end

              ##
              # Configuration RPC class for the ServiceController API.
              #
              # Includes fields providing the configuration for each RPC in this service.
              # Each configuration object is of type `Gapic::Config::Method` and includes
              # the following configuration fields:
              #
              #  *  `timeout` (*type:* `Numeric`) - The call timeout in seconds
              #  *  `metadata` (*type:* `Hash{Symbol=>String}`) - Additional gRPC headers
              #  *  `retry_policy (*type:* `Hash`) - The retry policy. The policy fields
              #     include the following keys:
              #      *  `:initial_delay` (*type:* `Numeric`) - The initial delay in seconds.
              #      *  `:max_delay` (*type:* `Numeric`) - The max delay in seconds.
              #      *  `:multiplier` (*type:* `Numeric`) - The incremental backoff multiplier.
              #      *  `:retry_codes` (*type:* `Array<String>`) - The error codes that should
              #         trigger a retry.
              #
              class Rpcs
                ##
                # RPC-specific configuration for `check`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :check
                ##
                # RPC-specific configuration for `report`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :report

                # @private
                def initialize parent_rpcs = nil
                  check_config = parent_rpcs.check if parent_rpcs.respond_to? :check
                  @check = ::Gapic::Config::Method.new check_config
                  report_config = parent_rpcs.report if parent_rpcs.respond_to? :report
                  @report = ::Gapic::Config::Method.new report_config

                  yield self if block_given?
                end
              end
            end
          end
        end
      end
    end
  end
end
