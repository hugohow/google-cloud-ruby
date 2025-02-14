# frozen_string_literal: true

# Copyright 2021 Google LLC
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


module Google
  module Cloud
    module Channel
      module V1
        module CloudChannelService
          # Path helper methods for the CloudChannelService API.
          module Paths
            ##
            # Create a fully-qualified ChannelPartnerLink resource string.
            #
            # The resource will be in the following format:
            #
            # `accounts/{account}/channelPartnerLinks/{channel_partner_link}`
            #
            # @param account [String]
            # @param channel_partner_link [String]
            #
            # @return [::String]
            def channel_partner_link_path account:, channel_partner_link:
              raise ::ArgumentError, "account cannot contain /" if account.to_s.include? "/"

              "accounts/#{account}/channelPartnerLinks/#{channel_partner_link}"
            end

            ##
            # Create a fully-qualified Customer resource string.
            #
            # The resource will be in the following format:
            #
            # `accounts/{account}/customers/{customer}`
            #
            # @param account [String]
            # @param customer [String]
            #
            # @return [::String]
            def customer_path account:, customer:
              raise ::ArgumentError, "account cannot contain /" if account.to_s.include? "/"

              "accounts/#{account}/customers/#{customer}"
            end

            ##
            # Create a fully-qualified Entitlement resource string.
            #
            # The resource will be in the following format:
            #
            # `accounts/{account}/customers/{customer}/entitlements/{entitlement}`
            #
            # @param account [String]
            # @param customer [String]
            # @param entitlement [String]
            #
            # @return [::String]
            def entitlement_path account:, customer:, entitlement:
              raise ::ArgumentError, "account cannot contain /" if account.to_s.include? "/"
              raise ::ArgumentError, "customer cannot contain /" if customer.to_s.include? "/"

              "accounts/#{account}/customers/#{customer}/entitlements/#{entitlement}"
            end

            ##
            # Create a fully-qualified Offer resource string.
            #
            # The resource will be in the following format:
            #
            # `accounts/{account}/offers/{offer}`
            #
            # @param account [String]
            # @param offer [String]
            #
            # @return [::String]
            def offer_path account:, offer:
              raise ::ArgumentError, "account cannot contain /" if account.to_s.include? "/"

              "accounts/#{account}/offers/#{offer}"
            end

            ##
            # Create a fully-qualified Product resource string.
            #
            # The resource will be in the following format:
            #
            # `products/{product}`
            #
            # @param product [String]
            #
            # @return [::String]
            def product_path product:
              "products/#{product}"
            end

            extend self
          end
        end
      end
    end
  end
end
