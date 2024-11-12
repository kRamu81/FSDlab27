import json
from datetime import datetime

# Define categories
CATEGORIES = ["Food", "Transportation", "Entertainment", "Bills", "Others"]

# File to store expenses
FILE_NAME = "expenses.json"

# Load expenses from file
def load_expenses():
    try:
        with open(FILE_NAME, "r") as file:
            return json.load(file)
    except FileNotFoundError:
        return []

# Save expenses to file
def save_expenses(expenses):
    with open(FILE_NAME, "w") as file:
        json.dump(expenses, file)

# Add an expense
def add_expense():
    amount = float(input("Enter the amount spent: "))
    description = input("Enter a brief description: ")
    category = input(f"Enter the category ({', '.join(CATEGORIES)}): ")
    if category not in CATEGORIES:
        print("Invalid category! Using 'Others'.")
        category = "Others"
    date = datetime.now().strftime("%Y-%m-%d")

    expense = {"amount": amount, "description": description, "category": category, "date": date}
    expenses.append(expense)
    save_expenses(expenses)
    print("Expense added successfully!")

# View expense summary
def view_summary():
    monthly_expenses = {}
    for expense in expenses:
        month = expense["date"][:7]  # Extract year and month
        monthly_expenses[month] = monthly_expenses.get(month, 0) + expense["amount"]

    print("\nMonthly Expense Summary:")
    for month, total in monthly_expenses.items():
        print(f"{month}: ${total:.2f}")

# View category-wise summary
def category_summary():
    category_expenses = {category: 0 for category in CATEGORIES}
    for expense in expenses:
        category_expenses[expense["category"]] += expense["amount"]

    print("\nCategory-wise Expense Summary:")
    for category, total in category_expenses.items():
        print(f"{category}: ${total:.2f}")

# Main menu
def main():
    while True:
        print("\nExpense Tracker")
        print("1. Add an Expense")
        print("2. View Monthly Summary")
        print("3. View Category Summary")
        print("4. Exit")
        choice = input("Enter your choice: ")

        if choice == "1":
            add_expense()
        elif choice == "2":
            view_summary()
        elif choice == "3":
            category_summary()
        elif choice == "4":
            print("Goodbye!")
            break
        else:
            print("Invalid choice. Please try again.")

# Run the program
expenses = load_expenses()
main()
