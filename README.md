# Watchr

A CLI tool to constantly watch a set of files and execute commands when they change.

Originally written as a development tool so I could hack away at my perl scripts and see my changes immediately as I saved.

## Usage

`watchr '[command to run]' <files to watch>`

Example

`watchr 'perl scrape_content.pl http://www.bbc.co.uk/news' scrape_content.pl modules/web_scraper.pm`

## Disclaimer

I pulled this script together in an afternoon, I accept no responsibility if you use it and your computer breaks and all pond water pours out of the usb sockets.
