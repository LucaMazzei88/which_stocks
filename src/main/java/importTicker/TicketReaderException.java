package importTicker;

public class TicketReaderException extends Exception {

	private static final long serialVersionUID = 1L;

	public TicketReaderException() {
		super("Error in data file");
	}

	public TicketReaderException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public TicketReaderException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public TicketReaderException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	
}
