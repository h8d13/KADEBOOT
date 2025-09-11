from __future__ import annotations

import builtins
import gettext
from dataclasses import dataclass
from typing import override


@dataclass
class Language:
	abbr: str
	name_en: str
	translation: gettext.NullTranslations
	translation_percent: int
	translated_lang: str | None

	@property
	def display_name(self) -> str:
		name = self.name_en
		return f'{name} ({self.translation_percent}%)'

	def is_match(self, lang_or_translated_lang: str) -> bool:
		if self.name_en == lang_or_translated_lang:
			return True
		elif self.translated_lang == lang_or_translated_lang:
			return True
		return False

	@override
	def __str__(self) -> str:
		return self.display_name

	def json(self) -> str:
		"""Return the language name for JSON serialization"""
		return self.name_en


class TranslationHandler:
	def __init__(self) -> None:
		# Create a single English language entry
		null_translation = gettext.NullTranslations()
		self._translated_languages = [
			Language(
				abbr='en',
				name_en='English',
				translation=null_translation,
				translation_percent=100,
				translated_lang='English'
			)
		]
		# Set English as default
		self.activate('English')

	@property
	def translated_languages(self) -> list[Language]:
		return self._translated_languages

	def activate(self, language_name: str) -> None:
		"""
		Set active language - always English in this minimal version
		"""
		# Find English language and activate it
		language = self.get_language_by_name('English')
		language.translation.install()

	def get_language_by_name(self, name: str) -> Language:
		"""
		Get a language object by its name
		"""
		try:
			return next(filter(lambda x: x.name_en == name, self._translated_languages))
		except StopIteration:
			# Always return English if not found
			return self._translated_languages[0]

	def get_language_by_abbr(self, abbr: str) -> Language:
		"""
		Get a language object by its abbreviation
		"""
		try:
			return next(filter(lambda x: x.abbr == abbr, self._translated_languages))
		except StopIteration:
			# Always return English if not found
			return self._translated_languages[0]


# Create global instance
translation_handler = TranslationHandler()


def tr(message: str) -> str:
	"""
	Translation function - just returns the message as-is (English)
	"""
	return message