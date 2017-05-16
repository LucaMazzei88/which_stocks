package importTicket

import importTicker.FileTicketDao
import importTicker.TicketReaderException
import java.util.Scanner
import org.junit.Test

import static org.junit.Assert.*

class FileTicketDaoTest {

	var FileTicketDao sut

	@Test
	def void aLine() {
		var ticker = "ACE.MI;Acea Spa"
		var s = new Scanner(ticker)
		sut = new FileTicketDao(s)

		assertEquals(1, sut.importTicket.size)

		s.close
	}

	@Test
	def void emptyLine() {
		var ticker = ""
		var s = new Scanner(ticker)
		sut = new FileTicketDao(s)

		assertEquals(0, sut.importTicket.size)

		s.close
	}

	@Test
	def void wrongLine() {
		var ticker = "c"
		var s = new Scanner(ticker)
		sut = new FileTicketDao(s)

		try {
			sut.importTicket.size
			fail
		} catch (TicketReaderException e) {
		} finally {
			s.close
		}
	}

	@Test
	def void twoLine() {
		var ticker = "ACE.MI;Acea Spa\nACO.MI;Acotel Group"
		var s = new Scanner(ticker)
		sut = new FileTicketDao(s)

		assertEquals(2, sut.importTicket.size)

		s.close
	}

	@Test
	def void content() {
		var ticker = "ACE.MI;Acea Spa"
		var s = new Scanner(ticker)
		sut = new FileTicketDao(s)

		var list = sut.importTicket

		assertEquals("ACE.MI", list.get(0).ticker)
		assertEquals("Acea Spa", list.get(0).name)

		s.close
	}

	@Test
	def void fileInteract() {
		var s = new Scanner(class.getResourceAsStream("/MLSETest.txt"))
		sut = new FileTicketDao(s)

		assertEquals(3, sut.importTicket.size)

		s.close
	}
}
