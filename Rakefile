require 'opal'
require 'opal-jquery'

desc "Build our app to sudoku.js"
task :build do
  env = Opal::Environment.new
  env.append_path "app"

  File.open("sudoku.js", "w+") do |out|
    out << env["sudoku"].to_s
  end
end