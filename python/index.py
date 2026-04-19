import sys
# Get Python version
print(f"Python version: {sys.version}")
# Command line arguments
print(f"Script name: {sys.argv[0]}")

print(f"Number of arguments: {sys.argv[1]}")
# Exit program
if len(sys.argv) < 2:
 print("Error: Need more arguments!")
 sys.exit(1) # Exit with error code
