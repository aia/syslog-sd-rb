#! /usr/bin/env ruby

require 'benchmark'
require 'thread'
require 'rubygems'
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'syslog-sd'

Thread.abort_on_exception = true

puts "Running on #{RUBY_DESCRIPTION}"
puts "Generating random data..."
srand(1)
RANDOM_DATA = ('A'..'z').to_a
k3_message = (1..3*1024).map { RANDOM_DATA[rand(RANDOM_DATA.count)] }.join

TARGET_HOST = 'localhost'
TARGET_PORT = 5140
DEFAULT_OPTIONS = { '_host' => 'localhost' }
MESSAGES_COUNT = 5000
THREADS_COUNT = 50

SHORT_HASH = { 'short_message' => 'message' }
LONG_HASH  = { 'short_message' => 'message', 'long_message' => k3_message }

def notify(n, hash)
  threads = []
  THREADS_COUNT.times do
    threads << Thread.new do
      (MESSAGES_COUNT / THREADS_COUNT).times { n.notify!(hash) }
    end
  end
  raise threads.count.to_s
  threads.each { |t| t.join }
end

n = SyslogSD::Notifier.new(TARGET_HOST, TARGET_PORT, DEFAULT_OPTIONS)

# to create mongo collections, etc.
n.notify!(LONG_HASH)
sleep(5)

puts "Sending #{MESSAGES_COUNT} notifications...\n"
tms = Benchmark.bm(25) do |b|
  b.report('short data') { notify(n, SHORT_HASH) }
  sleep(5)
  b.report('short data') { notify(n, LONG_HASH) }
end
