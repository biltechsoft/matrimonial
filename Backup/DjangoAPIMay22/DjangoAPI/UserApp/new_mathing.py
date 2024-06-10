def calculate_matching_percentage(male_table, female_table):
    # Ensure both tables have the same keys
    if male_table.keys() != female_table.keys():
        raise ValueError("Both tables must have the same parameters.")
    
    total_parameters = len(male_table)
    matching_parameters = 0

    for key in male_table:
        if male_table[key] == female_table[key]:
            matching_parameters += 1
    
    matching_percentage = (matching_parameters / total_parameters) * 100
    return matching_percentage

# Example tables
male_table = {
    "cute": True,
    "job_holder": True,
    "rich": False,
    "millionaire": False,
    "educated": True,
    "believer": True,
    "carefully": True
}

female_table = {
    "cute": True,
    "job_holder": True,
    "rich": True,
    "millionaire": False,
    "educated": True,
    "believer": True,
    "carefully": True
}

matching_percentage = calculate_matching_percentage(female_table, male_table)
print(f"Matching Percentage: {matching_percentage}%")
