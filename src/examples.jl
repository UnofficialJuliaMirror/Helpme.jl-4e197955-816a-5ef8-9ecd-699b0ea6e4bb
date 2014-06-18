@example("Keywords like using, import, and export can only appear at "*
"global-level scopes. They can't even show up in a quote block in a macro "*
"definition. An ugly workaround, if you absolutely cannot avoid it, is to use "*
"expressions like eval(parse(\"import ...\") instead.") do
	function ex()
		import Base
	end

	ex()
end

@example("Julia attempts to choose the proper type for Dicts when [brackets] "*
"are used, and merge can be fussy when types don't match up. To force Julia to "*
"assign the type Dict{Any,Any}, use {braces} in your variable definitions for "*
"Dicts.") do
	merge(["key"=>"value"], ["key"=>12345])
end

@example("Strings are concatenated with the * operator, not the + operator.") do
	"foo" + "bar"
end

@example("When iterating over regex matches with functions like eachmatch, "*
"especially when using the matches as indices or keys, you might mean m.match "*
"where you have just m or m.captures.") do
	a = [1:2]
	for i in eachmatch(r"\d", "12")
		a[i]
	end
end

@example("Iteration over dictionaries in Julia is iteration over (key, value), "*
"not just over key or over value like in other languages. Use expressions like "*
"\"for (k,v) in mydict\" where possible to avoid confusion.") do
	for i in {"a"=>1}
		i + 5
	end
end

@example("Type parameters in Julia are invariant, meaning although Int <: Number is true, "*
"Array{Int} <: Array{Number} is false. This can be annoying when defining functions. "*
"Instead of \"f(Array{Number})=...\" try \"f{T<:Number}(Array{T})=...\"") do
	function ex(a::Array{Number,1})
	end

	ex([1, 2, 3])
end

@example("Julia is not Python. All if, for, begin, function, etc. blocks must be "*
"completed with an end statement. Similarly, all end statements must have been \"opened\""*
"with an if, for, etc. statement. Count your open and closes and make sure they match.") do
	eval(parse("if true"))
end

@example("Julia is not Python. All if, for, begin, function, etc. blocks must be "*
"completed with an end statement. Similarly, all end statements must have been \"opened\""*
"with an if, for, etc. statement. Count your open and closes and make sure they match.") do
	eval(parse("end"))
end

@example("Because && and || are logical operators with short-circuit behavior, "*
"it is not possible to override or access Base.&& and Base.||.") do
	eval(parse("Base.&&"))
end

@example("Because && and || are logical operators with short-circuit behavior, "*
"it is not possible to override or access Base.&& and Base.||.") do
	eval(parse("Base.||"))
end

@example("The i in the expression \"Array{Int,i}\" is not the length of the array "*
"but instead the number of dimensions.") do
	function ex(a::Array{Number,2})
	end

	ex(Number[1, 2, 3])
end