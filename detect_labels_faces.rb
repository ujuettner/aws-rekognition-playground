require 'dotenv'
Dotenv.load
require 'aws-sdk'
require 'pp'
require 'table_print'



if ARGV.length < 1
  puts "Usage: #{$0} <filename>"
  exit 1
end

reko_client = Aws::Rekognition::Client.new

puts "LABELS:"
reko_labels_response = reko_client.detect_labels(
  image: {
    bytes: File.read(ARGV.first)
  }
)
tp reko_labels_response.labels
puts "OrientationCorrection: #{reko_labels_response.orientation_correction}"

puts "\nFACES:"
reko_faces_response = reko_client.detect_faces(
  image: {
    bytes: File.read(ARGV.first)
  }
)
pp reko_faces_response
tp reko_faces_response.face_details
