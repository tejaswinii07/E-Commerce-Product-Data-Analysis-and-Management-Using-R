# 🛒 E-Commerce Product Data Analysis Using R

An interactive **E-Commerce Product Data Analysis Dashboard** built using **R, Shiny, Plotly, and DataTables**. The project analyzes product information such as categories, prices, ratings, and stock levels through an interactive web dashboard.

---

## 📌 Project Overview

This project demonstrates how R can be used for **data reading, data manipulation, statistical analysis, and interactive visualization**.

The project uses a dataset containing **100 e-commerce products** and provides an interactive dashboard where users can filter products and explore different aspects of the dataset.

The project is also designed around fundamental R data-handling operations such as:

* Reading CSV files
* Creating data frames
* Creating frequency tables
* Converting categorical data into factors
* Performing mathematical operations
* Filtering and manipulating data
* Deleting unwanted rows and columns
* Visualizing data interactively

---

## 🎯 Objectives

The main objectives of this project are:

1. To read and process e-commerce product data from a CSV file.
2. To create and manipulate data frames using R.
3. To analyze product categories using frequency tables.
4. To convert categorical variables into factors.
5. To perform mathematical operations on numerical data.
6. To analyze product prices, ratings, and stock levels.
7. To provide interactive data visualization.
8. To create an easy-to-use dashboard using R Shiny.
9. To allow users to filter and explore products dynamically.

---

## 📊 Dataset

The project uses a dataset containing **100 e-commerce products**.

### Dataset Columns

| Column        | Description                        |
| ------------- | ---------------------------------- |
| `ProductID`   | Unique identifier for each product |
| `ProductName` | Name of the product                |
| `Category`    | Product category                   |
| `Price`       | Product price in Indian Rupees     |
| `Rating`      | Customer/product rating            |
| `Stock`       | Available quantity                 |

### Example

| ProductID | ProductName | Category    | Price | Rating | Stock |
| --------- | ----------- | ----------- | ----: | -----: | ----: |
| P001      | Laptop      | Electronics | 55000 |    4.5 |    25 |
| P002      | Headphones  | Electronics |  2500 |    4.2 |    50 |
| P003      | T-Shirt     | Fashion     |   799 |    4.0 |   100 |

---

## 🖥️ Dashboard Features

### 📈 1. Dashboard Overview

The main dashboard provides important summary statistics through KPI cards:

* Total Products
* Total Categories
* Average Price
* Average Rating

It also contains interactive charts for:

* Products by Category
* Price Distribution
* Average Price by Category
* Average Rating by Category

---

### 📊 2. Product Analysis

The Product Analysis section provides:

* Price vs Rating analysis
* Stock analysis by category
* Top 10 products by rating

Charts are interactive and provide additional information when the user hovers over data points.

---

### 📋 3. Product Data

The Product Data section provides an interactive table containing the complete dataset.

Users can:

* Search products
* Filter columns
* Sort data
* Navigate between pages
* View the complete product dataset

---

### 🎛️ 4. Interactive Filters

The dashboard provides filters for:

* **Product Category**
* **Price Range**
* **Minimum Rating**

The charts and KPI values automatically update according to the selected filters.

---

## 🧪 R Concepts Demonstrated

This project demonstrates the following R programming concepts:

### CSV Data Import

```r
products <- read_csv("ecommerce_products_100.csv")
```

### Data Frames

The CSV data is loaded and processed as an R data frame.

### Frequency Tables

Product categories can be analyzed using:

```r
table(products$Category)
```

### Factors

The category column is converted into a factor:

```r
products$Category <- factor(products$Category)
```

### Mathematical Operations

The dataset can be analyzed using mathematical functions such as:

```r
log(products$Price)
sqrt(products$Price)
ceiling(products$Price)
floor(products$Price)
round(products$Price)
```

### Data Filtering

The dashboard dynamically filters the dataset based on user selections.

---

## 🛠️ Technologies Used

| Technology         | Purpose                       |
| ------------------ | ----------------------------- |
| **R**              | Data analysis and programming |
| **Shiny**          | Interactive web application   |
| **shinydashboard** | Dashboard interface           |
| **Plotly**         | Interactive visualizations    |
| **DT**             | Interactive data tables       |
| **dplyr**          | Data manipulation             |
| **ggplot2**        | Data visualization            |
| **readr**          | CSV data importing            |

---

## 📁 Project Structure

```text
E-Commerce-Product-Analysis/
│
├── app.R
│
├── ecommerce_products_100.csv
│
└── README.md
```

### File Description

**`app.R`**

Contains the complete R Shiny dashboard application, including:

* User interface
* Server logic
* Data processing
* Filters
* KPI cards
* Interactive charts
* Data table

**`ecommerce_products_100.csv`**

Contains the 100-product e-commerce dataset used by the dashboard.

**`README.md`**

Project documentation and instructions.

---

## ⚙️ Installation

### Step 1 — Install R

Download and install R from:

https://cran.r-project.org/

### Step 2 — Install RStudio

RStudio is recommended for developing and running the project.

https://posit.co/download/rstudio-desktop/

### Step 3 — Install Required Packages

Open RStudio and run:

```r
install.packages(c(
  "shiny",
  "shinydashboard",
  "plotly",
  "DT",
  "dplyr",
  "ggplot2",
  "readr"
))
```

---

## ▶️ How to Run

Clone or download this repository.

Make sure the following files are located in the same directory:

```text
app.R
ecommerce_products_100.csv
```

Open `app.R` in RStudio.

Then click:

```text
Run App
```

Alternatively, run:

```r
shiny::runApp()
```

The interactive dashboard will open in your browser.

---

## 📌 Dashboard Workflow

```text
             CSV Dataset
                  │
                  ▼
           Read Data in R
                  │
                  ▼
            Data Frame
                  │
        ┌─────────┼─────────┐
        ▼         ▼         ▼
    Category    Price     Rating
    Analysis   Analysis   Analysis
        │         │         │
        └─────────┼─────────┘
                  ▼
          Interactive Filters
                  │
                  ▼
          Interactive Charts
                  │
                  ▼
            Final Dashboard
```

---

## 📊 Visualizations

The dashboard includes:

* 📊 Category frequency chart
* 📈 Price distribution histogram
* 💰 Average price by category
* ⭐ Average rating by category
* 🔵 Price vs Rating scatter plot
* 📦 Stock analysis
* 🏆 Top 10 products by rating

---

## 🔍 Example Analysis

The dashboard allows users to answer questions such as:

* How many products are available in each category?
* Which category has the highest average price?
* What is the average product rating?
* How is product price distributed?
* Which products have the highest ratings?
* Which categories have the highest stock?
* How does price relate to product rating?

---

## 🎓 Academic Relevance

This project is suitable as an **R programming / Data Analysis mini-project** because it combines basic R programming concepts with a practical real-world application.

It demonstrates:

* Data import
* Data frames
* Categorical data
* Factors
* Frequency analysis
* Mathematical operations
* Data manipulation
* Interactive visualization

---

## 🚀 Future Enhancements

Possible future improvements include:

* Adding product sales data
* Adding monthly sales analysis
* Adding customer information
* Adding sales prediction
* Adding category-wise revenue analysis
* Adding downloadable reports
* Adding login/authentication
* Connecting the dashboard to a live database
* Adding machine-learning based product recommendations

---

## 👩‍💻 Author

**Tejaswini B**

R Programming & Data Analysis Project

---

## ⭐ Acknowledgement

This project was developed as an academic project to demonstrate the use of **R programming and interactive data visualization** for e-commerce data analysis.

---

## 📜 License

This project is intended for **educational and academic purposes**.
