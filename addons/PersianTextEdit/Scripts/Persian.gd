extends Node

class_name Persian

enum {
	NOT_SUPPORTED = -1,
	ISOLATED,
	INITIAL,
	MEDIAL,
	FINAL
}

const LETTERS : = {
	# alef
	'آ' : ['ﺁ', '', '', 'ﺂ'],
	'ا' : ['ﺍ', '', '', 'ﺎ'],
	# be
	'ب' : ['ﺏ', 'ﺑ', 'ﺒ', 'ﺐ'],
	# pe
	'پ' : ['ﭖ', 'ﭘ', 'ﭙ', 'ﭗ'],
	# te
	'ت' : ['ﺕ', 'ﺗ', 'ﺘ', 'ﺖ'],
	# se
	'ث' : ['ﺙ', 'ﺛ', 'ﺜ', 'ﺚ'],
	# jim
	'ج' : ['ﺝ', 'ﺟ', 'ﺠ', 'ﺞ'],
	# che
	'چ' : ['ﭺ', 'ﭼ', 'ﭽ', 'ﭻ'],
	# he jimi
	'ح' : ['ﺡ', 'ﺣ', 'ﺤ', 'ﺢ'],
	# khe
	'خ' : ['ﺥ', 'ﺧ', 'ﺨ', 'ﺦ'],
	# dal
	'د' : ['ﺩ', '', '', 'ﺪ'],
	# zal
	'ذ' : ['ﺫ', '', '', 'ﺬ'],
	# re
	'ر' : ['ﺭ', '', '', 'ﺮ'],
	# ze
	'ز' : ['ﺯ', '', '', 'ﺰ'],
	# je
	'ژ' : ['ﮊ', '', '', 'ﮋ'],
	# sin
	'س' : ['ﺱ', 'ﺳ', 'ﺴ', 'ﺲ'],
	# shin
	'ش' : ['ﺵ', 'ﺷ', 'ﺸ', 'ﺶ'],
	# sad
	'ص' : ['ﺹ', 'ﺻ', 'ﺼ', 'ﺺ'],
	# zad
	'ض' : ['ﺽ', 'ﺿ', 'ﻀ', 'ﺾ'],
	# ta
	'ط' : ['ﻁ', 'ﻃ', 'ﻄ', 'ﻂ'],
	# za
	'ظ' : ['ﻅ', 'ﻇ', 'ﻈ', 'ﻆ'],
	# ayn
	'ع' : ['ﻉ', 'ﻋ', 'ﻌ', 'ﻊ'],
	# gayn
	'غ' : ['ﻍ', 'ﻏ', 'ﻐ', 'ﻎ'],
	# fa
	'ف' : ['ﻑ', 'ﻓ', 'ﻔ', 'ﻒ'],
	# qaf
	'ق' : ['ﻕ', 'ﻗ', 'ﻘ', 'ﻖ'],
	# kaf
	'ک' : ['ﮎ', 'ﮐ', 'ﮑ', 'ﮏ'],
	# gaf
	'گ' : ['ﮒ', 'ﮔ', 'ﮕ', 'ﮓ'],
	# lam
	'ل' : ['ﻝ', 'ﻟ', 'ﻠ', 'ﻞ'],
	# la
	'ﻻ' : ['ﻻ', '', '', 'ﻼ'],
	# mim
	'م' : ['ﻡ', 'ﻣ', 'ﻤ', 'ﻢ'],
	# nun
	'ن' : ['ﻥ', 'ﻧ', 'ﻨ', 'ﻦ'],
	# vav
	'و' : ['ﻭ', '', '', 'ﻮ'],
	# he
	'ه' : ['ﻩ', 'ﻫ', 'ﻬ', 'ﻪ'],
	# ye
	'ی' : ['ﯼ', 'ﯾ', 'ﯿ', 'ﯽ'],
	# hamzeh
	'أ' : ['ﺃ', '', '', 'ﺄ'],
	'ؤ' : ['ﺅ', '', '', 'ﺆ'],
	'ئ' : ['ﺉ', 'ﺋ', 'ﺌ', 'ﺊ'],
	'ء' : ['ﺀ', '', '', ''],
}

const BRACKETS : = [
	['(', ')'], ['«', '»'], ['{', '}'], ['[', ']'], ['<', '>']
]

const NUMBERS : = [
	'۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹',
	'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
]

const ENGLISH : = [
	'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
	'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
	'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
	'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
]


static func reshaper(_str : String) -> String:
	return reverse(reshape(_str))


static func reverse(_str : String) -> String:
	_str = reverse_brackets(_str)
	return reverse_persian_letters(_str)


# TODO: Fix English words order inside Persian text.
static func reverse_english_words(_str : String) -> String:
	return ''


static func reverse_brackets(_str : String) -> String:
	for letter in _str.length():
		for bracke in BRACKETS:
			if _str[letter] in bracke:
				_str[letter] = bracke[int(bracke.find(_str[letter]) == 0)]
	return _str


static func reverse_persian_letters(_str : String) -> String:
	var rtl : = ''
	var letter_idx : = 0
	for letter in _str.length():
		if _str[-letter - 1] in NUMBERS or _str[-letter - 1] in ENGLISH:
			rtl = rtl.insert(letter - letter_idx, _str[-letter - 1])
			letter_idx += 1
		else:
			letter_idx = 0
			rtl += _str[-letter - 1]
	return rtl


static func reshape(_str : String) -> String:
	_str = _str.replace('لا', 'ﻻ')

	for letter in _str.length():
		if _str[letter] in LETTERS.keys():
			# first letter
			if previous(letter, _str) == NOT_SUPPORTED:
				if next(letter, _str) == NOT_SUPPORTED:
					_str[letter] = LETTERS.get(_str[letter])[ISOLATED]
				else:
					if LETTERS.get(_str[letter])[INITIAL] == '':
						_str[letter] = LETTERS.get(_str[letter])[ISOLATED]
					else:
						_str[letter] = LETTERS.get(_str[letter])[INITIAL]
			# last letter
			elif next(letter, _str) == NOT_SUPPORTED:
				if previous(letter, _str) == ISOLATED or previous(letter, _str) == FINAL:
					_str[letter] = LETTERS.get(_str[letter])[ISOLATED]
				else:
					_str[letter] = LETTERS.get(_str[letter])[FINAL]
			# middle letter
			else:
				if previous(letter, _str) == ISOLATED:
					if LETTERS.get(_str[letter])[INITIAL] == '':
						_str[letter] = LETTERS.get(_str[letter])[ISOLATED]
					else:
						_str[letter] = LETTERS.get(_str[letter])[INITIAL]
				elif previous(letter, _str) == INITIAL:
					if LETTERS.get(_str[letter])[INITIAL] == '' or LETTERS.get(_str[letter])[MEDIAL] == '':
						_str[letter] = LETTERS.get(_str[letter])[FINAL]
					else:
						_str[letter] = LETTERS.get(_str[letter])[MEDIAL]
				elif previous(letter, _str) == MEDIAL:
					if next(letter, _str) == NOT_SUPPORTED:
						_str[letter] = LETTERS.get(_str[letter])[FINAL]
					else:
						if LETTERS.get(_str[letter])[MEDIAL] == '':
							_str[letter] = LETTERS.get(_str[letter])[FINAL]
						else:
							_str[letter] = LETTERS.get(_str[letter])[MEDIAL]
				else:
					if LETTERS.get(_str[letter])[INITIAL] == '':
						_str[letter] = LETTERS.get(_str[letter])[ISOLATED]
					else:
						_str[letter] = LETTERS.get(_str[letter])[INITIAL]
	return _str


static func previous(_letter : int, _str : String) -> int:
	if _letter - 1 < 0:
		return NOT_SUPPORTED
	else:
		if _str[_letter - 1] in LETTERS.keys():
			for replacement in LETTERS.get(_str[_letter - 1]):
				return LETTERS.get(_str[_letter - 1]).find(replacement)
		else:
			for replacement in LETTERS.values():
				if _str[_letter - 1] in replacement:
					return replacement.find(_str[_letter - 1])
	return NOT_SUPPORTED


static func next(_letter : int, _str : String) -> int:
	if _letter + 1 > _str.length() - 1:
		return NOT_SUPPORTED
	else:
		if _str[_letter + 1] in LETTERS.keys():
			for replacement in LETTERS.get(_str[_letter + 1]):
				return LETTERS.get(_str[_letter + 1]).find(replacement)
		else:
			for replacement in LETTERS.values():
				if _str[_letter + 1] in replacement:
					return replacement.find(_str[_letter + 1])
	return NOT_SUPPORTED


static func line_length(_node: Object) -> int:
	return int(_node.rect_size.x/11)

static func upside_down_line(text:String) -> String:
	var lines = text.split("\n")
	var result : PoolStringArray = []
	var i = lines.size()-1
	while i >= 0:
		result.append(lines[i])
		i -= 1
#	return join("\n",result)
	return result.join("\n")


static func join(sparator:String , array:Array , endsprator:bool=true) -> String:
	var result = ""
	for string in array:
		if endsprator:
			result += string + sparator
		else:
			result += sparator + string
	return result


static func toPersian(text:String) -> String:
	var persian = reshaper(text)
	persian = upside_down_line(persian)
	if persian.length() > 0 and persian[persian.length()-1] == '\n':
		persian.erase(persian.length() - 1, 1)
	return persian

static func to_persian_number(string:String) -> String:
	var result:String
	for character in string:
		var i = NUMBERS.size()/2
		while i < NUMBERS.size():
			if character == NUMBERS[i]:
				result += NUMBERS[i-10]
			i += 1
	return result

static func to_english_number(string:String) -> String:
	var result:String
	for character in string:
		for i in NUMBERS.size():
			if character == NUMBERS[i]:
				result += NUMBERS[i+10]
	return result
