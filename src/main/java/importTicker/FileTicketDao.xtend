package importTicker

import java.util.LinkedList
import java.util.Scanner

class FileTicketDao implements TickerDao {

	val Scanner sc

	new(Scanner sc) {
		this.sc = sc
	}

	override importTicket() {
		var listTicker = new LinkedList
		var String[] line
		while (sc.hasNextLine) {
			line = sc.nextLine.split(";")
			if (line.size != 2)
				throw new TicketReaderException
			listTicker.push(new Ticker(line.get(0), line.get(1)))
		}
		return listTicker
	}

}
