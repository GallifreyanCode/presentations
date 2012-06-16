!SLIDE subsection transition=fade
.notes Section about the new NIO packages.
# NIO.2 #

!SLIDE bullets transition=fade
.notes What about NIO.2.

# NIO.2?

* Asynchronous channel functionality
* New file system API's

!SLIDE transition=fade
.notes The asynchronous channel functionality.

# Asynchronous Channels 

* java.nio.channels
	* AsynchronousSocketChannel
	* AsynchronousServerSocketChannel
	* AsynchronousFileChannel
	* AsynchronousDatagramChannel
* Future represents asynchronous result

!SLIDE smaller transition=fade
.notes AsynchronousServerSocketChannel.

# AsynchronousServerSocketChannel

	@@@ java
	//Server
	AsynchronousServerSocketChannel server =
		AsynchronousServerSocketChannel.open().bind(null);

	Future<AsynchronousSocketChannel> acceptFuture =
		server.accept();

!SLIDE smaller transition=fade
.notes AsynchronousSocketChannel.

# AsynchronousSocketChannel

	@@@ java
	//Client
	AsynchronousSocketChannel client = AsynchronousSocketChannel.open();
	client.connect(server.getLocalAddress()).get();

	// send a message to the server
	ByteBuffer message = ByteBuffer.wrap("ping".getBytes());
	client.write(message).get();

	// read a message from the client
	worker.read(readBuffer).get(10, TimeUnit.SECONDS);
	System.out.println("Message: " + new String(readBuffer.array()));

!SLIDE transition=fade
.notes The filesystem api's.

# Filesystem API's

* FileVisitor
* WatchService
* AttributeView

!SLIDE bullets transition=fade
.notes FileVisitor.

# FileVisitor

* walk through file systems
* query files/directories
* callback methods for each one found

!SLIDE smaller transition=fade
.notes FileVisitor example.

# FileVisitor Example

	@@@ java
	FileVisitor<Path> myFileVisitor =
		new SimpleFileVisitor<Path>() { 

    public FileVisitResult preVisitDirectory(Path dir) { 
       	System.out.println("Pre visiting."); 
       	return FileVisitResult.CONTINUE;
    }
  
    public FileVisitResult visitFile(Path file, 
		BasicFileAttributes attribs) {
       	System.out.println("I'm visiting the file");
       	return FileVisitResult.CONTINUE;
    }
	};

	Path headDir = Paths.get("headDir");
	Files.walkFileTree(headDir, myFileVisitor);

!SLIDE bullets transition=fade
.notes WatchService.

# WatchService

* register a specific directory
* created, modified, or deleted notifactions
* demo

!SLIDE transition=fade
.notes AttributeView.

# AttributeView

* more file/directory attributes
	* file owner
	* group permissions
	* access-control lists
	* ...