## Data Transformation Practice with dplyr

This README file outlines a set of practice exercises for data transformation using the `dplyr` package in R. The exercises utilize the `A64_traffic` dataset from TidyTuesday.

**Functions Used:**

* **`filter()`:** Selects rows based on specified conditions.
* **`arrange()`:** Sorts the data frame by one or more columns.
* **`desc()`:** Sorts data in descending order.
* **`distinct()`:** Returns unique rows from a data frame.
* **`.keep_all = TRUE`:** Keeps all columns when using `distinct()`.
* **`count()`:** Counts the number of occurrences of each unique value in a column.
* **`%in%`:** Checks if elements belong to a specified set.
* **`mutate()`:** Adds new variables or modifies existing ones in a data frame.
* **`.before`, `.after`:** Arguments used in functions like `relocate()` to specify the position of columns.
* **`select()`:** Chooses specific columns from a data frame.
* **`rename()`:** Changes the names of columns in a data frame.
* **`relocate()`:** Changes the order of columns in a data frame.

**Exercises:**

1. **Filtering:**
   - Extract all observations from `A64_traffic` where `traffic_volume` is greater than 1000.

2. **Renaming:**
   - Rename the `traffic_volume` column to `vehicle_count`.

3. **Selecting:**
   - Select only the `date`, `time`, and `speed` columns.

4. **Arranging:**
   - Order the `A64_traffic` dataset by `time` in ascending order.

5. **Creating a new column:**
   - Create a new column called `is_day` that is TRUE if the `hour_of_day` is between 6 and 18, and FALSE otherwise.

6. **Filtering with `%in%`:**
   - Extract observations where the `month` is "January", "June", and "December".

7. **Rearranging Columns:**
   - Move the `speed` column to the end of the data frame.

8. **Finding Unique Combinations:**
   - Find all unique values in the `SiteId` column.

This set of exercises provides a good foundation for practicing data transformation using the `dplyr` package in R. 

**Note:** 

* These exercises assume that you have loaded the `A64_traffic` dataset and the necessary libraries (e.g., `dplyr`, `tidyverse`) in your R environment.