local string = require 'std.string'

describe('should be awesome', function()
	it('should be easy to use', function()
		local f = io.popen('lua index.lua 2>&1')
		finally(function() f:close() end)

		local s = f:read('*a')
		print(s)
		assert.equals('Hello World!', string.trim(s))
	end)
end)
