# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/vision/v1p3beta1/web_detection.proto

require 'google/api/annotations_pb'
require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/vision/v1p3beta1/web_detection.proto", :syntax => :proto3) do
    add_message "google.cloud.vision.v1p3beta1.WebDetection" do
      repeated :web_entities, :message, 1, "google.cloud.vision.v1p3beta1.WebDetection.WebEntity"
      repeated :full_matching_images, :message, 2, "google.cloud.vision.v1p3beta1.WebDetection.WebImage"
      repeated :partial_matching_images, :message, 3, "google.cloud.vision.v1p3beta1.WebDetection.WebImage"
      repeated :pages_with_matching_images, :message, 4, "google.cloud.vision.v1p3beta1.WebDetection.WebPage"
      repeated :visually_similar_images, :message, 6, "google.cloud.vision.v1p3beta1.WebDetection.WebImage"
      repeated :best_guess_labels, :message, 8, "google.cloud.vision.v1p3beta1.WebDetection.WebLabel"
    end
    add_message "google.cloud.vision.v1p3beta1.WebDetection.WebEntity" do
      optional :entity_id, :string, 1
      optional :score, :float, 2
      optional :description, :string, 3
    end
    add_message "google.cloud.vision.v1p3beta1.WebDetection.WebImage" do
      optional :url, :string, 1
      optional :score, :float, 2
    end
    add_message "google.cloud.vision.v1p3beta1.WebDetection.WebPage" do
      optional :url, :string, 1
      optional :score, :float, 2
      optional :page_title, :string, 3
      repeated :full_matching_images, :message, 4, "google.cloud.vision.v1p3beta1.WebDetection.WebImage"
      repeated :partial_matching_images, :message, 5, "google.cloud.vision.v1p3beta1.WebDetection.WebImage"
    end
    add_message "google.cloud.vision.v1p3beta1.WebDetection.WebLabel" do
      optional :label, :string, 1
      optional :language_code, :string, 2
    end
  end
end

module Google
  module Cloud
    module Vision
      module V1p3beta1
        WebDetection = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.WebDetection").msgclass
        WebDetection::WebEntity = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.WebDetection.WebEntity").msgclass
        WebDetection::WebImage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.WebDetection.WebImage").msgclass
        WebDetection::WebPage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.WebDetection.WebPage").msgclass
        WebDetection::WebLabel = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.WebDetection.WebLabel").msgclass
      end
    end
  end
end
