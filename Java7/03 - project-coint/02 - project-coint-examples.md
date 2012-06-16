!SLIDE transition=fade
.notes Before Java 7.

# Before Java 7
	@@@ java
	public void printDay(int dayOfWeek) { 
	switch (dayOfWeek) { 
		case 0:
			System.out.println("Sunday");
			break;
		case 1:
			System.out.println("Monday");
			break; 
		case 2:
			System.out.println("Tuesday");
			break; 
		... 
	}}

!SLIDE transition=fade
.notes Java 7 String In Switch.

# String In Switch
	@@@ java
	public void printMenu(String dayOfWeek) {
	switch (dayOfWeek) { 
		case "Sunday":
			System.out.println("Menu1");
			break;
		case "Monday":
			System.out.println("Menu2");
			break; 
		case "Tuesday":
			System.out.println("Menu3");
			break; 
		... 
	}}

!SLIDE small transition=fade
.notes Before Java 7.

# Before Java 7
	@@@ java
	int x = Integer.parseInt("1100110", 2);

* Really verbose 
* Method call != performance
* Know about 2arg parseInt()
* Hard for JIT compiler
* Compile-time constant as a runtime expression...
* ...so can't be used as a value in a switch statement
* RuntimeException for binary typo

!SLIDE transition=fade
.notes Numeric contants as binary.

# Numeric contants as binary
	@@@ java
	int x = 0b1100110;

Add 0b or 0B

!SLIDE transition=fade
.notes Before Java 7.

# Before Java 7

	@@@ java
	// $100,000,000
	int dollars = 100000000;
	// 404-555-0122
	int creditcard = 4045550122:

* Pattern recognition
* "," and "-" has to many meanings

!SLIDE transition=fade
.notes Underscores In Numbers.

# Underscores In Numbers

	@@@ java
	int dollars = 100_000_000;

* Compile time syntax
* Strips underscores and stores digits

!SLIDE smaller transition=fade
.notes Before Java 7.

# Before Java 7

	@@@ java
	public Configuration getConfig(String fileName) {    
    	Configuration cfg = null; 
    	try { 
      		String fileText = getFile(fileName); 
      		cfg = verifyConfig(parseConfig(fileText)); 
    	} catch (FileNotFoundException fnfx) { 
      		System.err.println("Missing file."); 
    	} catch (IOException e) { 
      		System.err.println("Error while processing file."); 
    	} catch (ConfigurationException e) { 
			System.err.println("Config file is not consistent."); 
    	} catch (ParseException e) { 
      		System.err.println("Config file is malformed."); 
    	} 
    return cfg
}

!SLIDE smaller transition=fade
.notes Before Java 7.

# Before Java 7

	@@@ java
	//FILE DOES NOT EXIST
	catch (FileNotFoundException fnfx) { 
      		System.err.println("Missing file."); 
    	}
	//IT DISAPEARS WHILE READING
	catch (FileNotFoundException fnfx) { 
      		System.err.println("Missing file."); 
    	}
	//SYNTAX IS MALFORMED
	catch (FileNotFoundException fnfx) { 
      		System.err.println("Missing file."); 
    	}
	//INVALID INFORMATION !#@&
	catch (FileNotFoundException fnfx) { 
      		System.err.println("Missing file."); 
    	}

!SLIDE smaller transition=fade
.notes Before Java 7.

# Before Java 7

	@@@ java
	//BAD OR NON EXISTING
	catch (FileNotFoundException fnfx) { 
      		System.err.println("Missing file."); 
    	}
	//UNABLE TO RETRIEVE
	catch (FileNotFoundException fnfx) { 
      		System.err.println("Missing file."); 
    	}
	//BAD OR NON EXISTING
	catch (FileNotFoundException fnfx) { 
      		System.err.println("Missing file."); 
    	}
	//BAD OR NON EXISTING
	catch (FileNotFoundException fnfx) { 
      		System.err.println("Missing file."); 
    	}

!SLIDE smaller transition=fade
.notes Multi-catch.

# Multi-catch

	@@@ java
	public Configuration getConfig(String fileName) { 
		Configuration cfg = null; 
		try { 
			String fileText = getFile(fileName); 
			cfg = verifyConfig(parseConfig(fileText)); 
		} catch (FileNotFoundException|ParseException|ConfEx e)    {
			System.err.println("File missing or malformed."); 
		} catch (IOException iox) { 
			System.err.println("Error processing file"); 
		}   
	return cfg; 
	}

!SLIDE small transition=fade
.notes Before Java 7.

# Before Java 7

	@@@ java
	try { 
		doSomethingWhichMightThrowIOException(); 
		doSomethingElseWhichMightThrowSQLException(); 
	} catch (Exception e) { 
		…
		throw e;
	}

* Manipulating thrown exception before rethrowing
* Real exception type swallowed

!SLIDE small transition=fade
.notes Final rethrow.

# Final rethrow

	@@@ java
	try { 
		doSomethingWhichMightThrowIOException(); 
		doSomethingElseWhichMightThrowSQLException(); 
	} catch (final Exception e) { 
		… 
		throw e; 
	}

* Indicates that thrown type is the runtime type
* No general exception

!SLIDE smaller transition=fade
.notes Before Java 7.

# Before Java 7

	@@@ java
	InputStream is = null; 
	try { 
    is = url.openStream(); 
    OutputStream out = new FileOutputStream(file); 
    try { byte[] buf = new byte[4096]; 
		int n; 
		while ((n = is.read(buf)) >= 0) 
        out.write(buf, 0, n); 
    	} catch (IOException iox) { ...
    	} finally {
	try { 
		out.close(); 
		} catch (IOException closeOutx) {...} 
		}
	} catch (FileNotFoundException fnfx) { 
	} catch (IOException openx) { 
	} finally { 
		try {
			if (is != null) is.close(); 
		} catch (IOException closeInx) { 
    }

!SLIDE smaller transition=fade
.notes Try-with-resources.

# Try-with-resources

	@@@ java
	try (FileOutputStream fos = new FileOutputStream(file);  
		InputStream is = url.openStream()) { 
 
		byte[] buf = new byte[4096]; 
		int len;
		while ((len = is.read(buf)) > 0) { 
			fos.write(buf, 0, len); 
		} 
	}

* Resource scoped to block
* Automatically disposed
* @Java API > Closable/AutoClosable interface

!SLIDE small transition=fade
.notes Before Java 7.

# Before Java 7

	@@@ java
	Map<Integer, List<String, String>> usersLists =
	new HashMap<Integer, List<String, String>>();

* Readability problem
* Duplicated characters

!SLIDE smaller transition=fade
.notes Diamond Syntax.

# Diamond Syntax

	@@@ java
	Map<Integer, List<String, String>> usersLists =
	new HashMap<>();

* Let compiler figure out the right side
* Backwards compatible
* New form of type inference in compiler

!SLIDE smaller transition=fade
.notes Simplified Varargs.

# Simplified Varargs

	@@@ java
	public static <T> Collection<T> doSomething(T... entries) {
		...
	}

* Varargs combined with generics
* Varargs method?
	* Variable number of parameters at the end
	* Put in array and passed as one parameter

!SLIDE smaller transition=fade
.notes Simplified Varargs.

# Simplified Varargs

	@@@ java
	// Won't compile
	HashMap<String, String>[] arryHm = new HashMap<>[2];

* Array-of-HashMap
* Java generics weakness
	* Array of a known generic type not allowed to be created

!SLIDE smaller transition=fade
.notes Simplified Varargs.

# Simplified Varargs

	@@@ java
	// Will compile
	HashMap<String, String>[] warnHm = new HashMap[2];

* Warning
* Force instance of raw type

!SLIDE smaller transition=fade
.notes Simplified Varargs.

# Simplified Varargs

	@@@ java
	HashMap<String, String> hm1 = new HashMap<>(); 
	HashMap<String, String> hm2 = new HashMap<>(); 
	Collection<HashMap<String, String>> coll =
		doSomething(hm1, hm2);

* Attempt creation of array
* But type of array should be one of the forbidden array types
* A bunch of weird warnings which don't make sense

!SLIDE smaller transition=fade
.notes Simplified Varargs.

# Simplified Varargs

* Change warning system
* But...potential violating type safety
* So?
	* Either it does or it doesn't
	* Concern of API developer
	* Not the consumer
* Warnings changed sides
* @SafeVarargs to suppress it when API is developed
