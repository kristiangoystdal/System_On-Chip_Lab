import pandas as pd
import matplotlib.pyplot as plt
import os

# Define paths to the CSV files
current_dir = os.path.dirname(os.path.abspath(__file__))
data_folder = os.path.join(current_dir, "data")
old_battery_path = os.path.join(data_folder, "values_battery_old.csv")
new_battery_path = os.path.join(data_folder, "values_battery_new.csv")

try:
    # Step 1: Load the CSV files into DataFrames
    old_battery_data = pd.read_csv(old_battery_path)
    new_battery_data = pd.read_csv(new_battery_path)
    print("First few rows of the old control CSV file:")
    print(old_battery_data.head())  # Inspect the structure of the old control CSV file

    # Step 2: Extract column names for time, voltage, and current
    time_column = old_battery_data.columns[0]  # First column as time
    old_battery_values_voltage = old_battery_data.columns[
        1
    ]  # Second column as old control voltage
    old_battery_values_current = old_battery_data.columns[
        2
    ]  # Third column as old control current

    new_battery_values_voltage = new_battery_data.columns[
        1
    ]  # Second column as new control voltage
    new_battery_values_current = new_battery_data.columns[
        2
    ]  # Third column as new control current

    # Step 3: Create subplots for voltage and current
    fig, axs = plt.subplots(2, 1, figsize=(8, 6), sharex=True)

    # Plot voltage signals
    axs[0].plot(
        old_battery_data[time_column],
        old_battery_data[old_battery_values_voltage],
        color="blue",
    )
    axs[0].plot(
        new_battery_data[time_column],
        new_battery_data[new_battery_values_voltage],
        color="red",
    )
    axs[0].set_ylabel("Voltage")
    axs[0].grid(True)
    axs[0].legend(["Old Battery", "New Battery"])

    # Plot current signals
    axs[1].plot(
        old_battery_data[time_column],
        old_battery_data[old_battery_values_current],
        color="green",
    )
    axs[1].plot(
        new_battery_data[time_column],
        new_battery_data[new_battery_values_current],
        color="orange",
    )
    axs[1].set_xlabel("Time")
    axs[1].set_ylabel("Current")
    axs[1].grid(True)
    axs[1].legend(["Old Battery", "New Battery"])

    # Set a shared title for the plots
    fig.suptitle("Voltage and Current Signals", fontsize=16)
    plt.tight_layout(rect=[0, 0, 1, 0.95])  # Adjust layout to make room for the title
    plt.show()

except FileNotFoundError as e:
    print(f"File not found: {e}")
except Exception as e:
    print(f"An error occurred: {e}")
