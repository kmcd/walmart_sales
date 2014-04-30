# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :test do
  watch(%r{^test/.+_test\.rb$})
  watch('test/helper.rb')  { 'test' }
  watch(%r{^lib/(.+)\.rb$}) { |m| "test/#{m[1]}_test.rb" }
end

guard :test do
  watch(%r{^test/.+_test\.rb$})
  watch('test/helper.rb')  { 'test' }
  watch(%r{^lib/(.+)\.rb$}) { |m| "test/#{m[1]}_test.rb" }
end
