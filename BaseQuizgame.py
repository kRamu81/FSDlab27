#@motioncut_team week1 pythonproject
def quiz():
    questions = [
        {
            "question": "what is the capital of india?",
            "options": ["America", "B. Madrid", "C.NewDelhi", "D.Mumbai"],
            "answer": "C"
        },
        {
            "question": "Which language is used in this program?",
            "options": ["A. Java", "B. Python", "C. C++", "D. JavaScript"],
            "answer": "B"
        },
        {
            "question": "Which planet is known as the Red Planet?",
            "options": ["A. Earth", "B. Mars", "C. Jupiter", "D. Venus"],
            "answer": "B"
        }
    ]

    score = 0

    for q in questions:
        print(q["question"])
        for option in q["options"]:
            print(option)
       
        answer = input("Enter your answer (A, B, C, D): ").strip().upper()

        if answer == q["answer"]:
            print("Correct!\n")
            score += 1
        else:
            print(f"Wrong! The correct answer is {q['answer']}.\n")

    print(f"Your total score: {score}/{len(questions)}")

# Run the quiz
quiz()
