require 'dotenv'
Dotenv.load
require 'aws-sdk'
require 'pp'



if ARGV.length < 2
  puts "Usage: #{$0} <filename> <filename>"
  exit 1
end

reko_client = Aws::Rekognition::Client.new

reko_comparison_response = reko_client.compare_faces(
  source_image: {
    bytes: File.read(ARGV.shift)
  },
  target_image: {
    bytes: File.read(ARGV.shift)
  }
)
pp reko_comparison_response
