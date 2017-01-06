# Change log

This document represents a high-level overview of changes made to this project.
It will not list every miniscule change, but will allow you to view - at a
glance - what to expact from upgrading to a new version.

## [unpublished]

### Added

### Changed

### Fixed

### Security

### Deprecated

### Removed


## [0.1.2] - 2017-01-06

### Fixed

- Removes seconds part of output of `timespan_in_words` in single-unit mode due
  to floating point inaccuracies.


## [0.1.1] - 2017-01-03

### Fixed

- Missing rounding within `::timespan_in_words.`


## [0.1.0] - 2017-01-03

### Added

- Function to convert timespan in seconds to human-readable words.
- Function to convert integer to string with thousands-separator
- Function to convert fraction to rounded percentage
