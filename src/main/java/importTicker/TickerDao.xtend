package importTicker

import java.util.List

interface TickerDao {
	
	def List<Ticker> importTicket()
	
}