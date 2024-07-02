# Load required libraries
library(pdftools)
library(writexl)

# Open a file chooser dialog to select the PDF file
pdf_file <- file.choose()

# Extract text from the selected PDF
pdf_text <- pdf_text(pdf_file)

# Combine all lines into a single string (if not already)
all_text <- paste(pdf_text, collapse=" ")

# Use a broad regular expression to potentially capture more variants
node_ids <- regmatches(all_text, gregexpr("2019[−-][A-Z]+\\d{2,3}[−-][A-Z]*\\d*E?\\d*", all_text))

# Flatten the list of matches into a single vector
node_ids <- unlist(node_ids)

# Check if IDs are extracted
if (length(node_ids) == 0) {
  cat("No IDs found. Check the regular expression.")
} else {
  # Specify a path where you have permission to write
  output_file_path <- "C:/Users/Poliolab/Documents/Node_IDs.xlsx"
  
  # Try saving again
  tryCatch({
    write_xlsx(data.frame(Node_IDs = node_ids), output_file_path)
    cat("File saved successfully at:", output_file_path, "\n")
  }, error = function(e) {
    cat("Failed to save file:", e$message, "\n")
  })
  
  # Print number of IDs to confirm extraction
  cat("Number of IDs extracted:", length(node_ids), "\n")
  
  # Optionally print IDs if number is unexpected
  if (length(node_ids) < 1000) {
    cat("Sample IDs extracted:", paste(head(node_ids, 20), collapse=", "), "\n")
  }
}

# Debugging: Output parts of the text for manual inspection to adjust the regex
cat(substr(all_text, 1000, 2000), "\n")
