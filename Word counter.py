def count_words(text):
    """
    Counts the number of words in the input text.
    :param text: str - Input sentence or paragraph
    :return: int - Number of words in the text
    """
    # Split the text by whitespace and count the resulting words
    words = text.split()
    return len(words)

def main():
    print("Welcome to the Word Counter Program!")
    # Take input from the user
    text = input("Please enter a sentence or paragraph: ").strip()
    
    # Error handling for empty input
    if not text:
        print("Error: Input cannot be empty. Please enter some text.")
        return
    
    # Count words and display the result
    word_count = count_words(text)
    print(f"The number of words in the given text is: {word_count}")

# Run the main function
if __name__ == "__main__":
    main()
