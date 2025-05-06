class DigitPatternCalculator:
    def __init__(self, digit):
        self.digit = digit
        self.validate_input()

    def validate_input(self):
        if not isinstance(self.digit, int):
            raise TypeError("Input must be an integer.")
        if self.digit < 0 or self.digit > 9:
            raise ValueError("Input must be a single decimal digit (0–9).")

    def calculate_pattern_sum(self):
        total = 0
        pattern = ""
        for i in range(1, 5):  # For X, XX, XXX, XXXX
            pattern += str(self.digit)
            total += int(pattern)
        return total


# Example usage
if __name__ == "__main__":
    try:
        digit = int(input("Enter a single decimal digit (0-9): "))
        calculator = DigitPatternCalculator(digit)
        result = calculator.calculate_pattern_sum()
        print(f"Result of X + XX + XXX + XXXX for X={digit} is: {result}")
    except (TypeError, ValueError) as e:
        print(f"Error: {e}")
