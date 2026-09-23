# ============================================================
# E-COMMERCE PRODUCT DATA ANALYSIS DASHBOARD
# Interactive R Shiny Dashboard
# ============================================================

# -----------------------------
# 1. LOAD REQUIRED LIBRARIES
# -----------------------------

library(shiny)
library(shinydashboard)
library(plotly)
library(DT)
library(dplyr)
library(ggplot2)
library(readr)

# -----------------------------
# 2. READ CSV DATA
# -----------------------------

products <- read_csv(
  "ecommerce_products_100.csv",
  show_col_types = FALSE
)

# Convert Category into a factor
products$Category <- factor(products$Category)

# -----------------------------
# 3. USER INTERFACE
# -----------------------------

ui <- dashboardPage(
  
  # ==========================
  # DASHBOARD HEADER
  # ==========================
  
  dashboardHeader(
    title = "E-Commerce Analytics"
  ),
  
  # ==========================
  # SIDEBAR
  # ==========================
  
  dashboardSidebar(
    
    sidebarMenu(
      
      menuItem(
        "Dashboard",
        tabName = "dashboard",
        icon = icon("dashboard")
      ),
      
      menuItem(
        "Product Analysis",
        tabName = "analysis",
        icon = icon("chart-bar")
      ),
      
      menuItem(
        "Product Data",
        tabName = "data",
        icon = icon("table")
      ),
      
      menuItem(
        "About Project",
        tabName = "about",
        icon = icon("info-circle")
      )
    ),
    
    br(),
    
    # CATEGORY FILTER
    
    selectInput(
      inputId = "category",
      label = "Select Category:",
      choices = c(
        "All Categories",
        sort(unique(as.character(products$Category)))
      ),
      selected = "All Categories"
    ),
    
    # PRICE FILTER
    
    sliderInput(
      inputId = "price",
      label = "Price Range:",
      min = min(products$Price),
      max = max(products$Price),
      value = c(
        min(products$Price),
        max(products$Price)
      ),
      step = 500
    ),
    
    # RATING FILTER
    
    sliderInput(
      inputId = "rating",
      label = "Minimum Rating:",
      min = min(products$Rating),
      max = max(products$Rating),
      value = min(products$Rating),
      step = 0.1
    )
  ),
  
  # ==========================
  # MAIN BODY
  # ==========================
  
  dashboardBody(
    
    # Custom CSS
    
    tags$head(
      
      tags$style(HTML("

        .skin-blue .main-header .logo {
          font-weight: bold;
          font-size: 20px;
        }

        .small-box h3 {
          font-size: 30px;
          font-weight: bold;
        }

        .box {
          border-radius: 12px;
        }

        .content-wrapper {
          background-color: #f5f7fa;
        }

        .main-sidebar {
          background-color: #202b3c;
        }

        .sidebar-menu > li.active > a {
          background-color: #1abc9c;
        }

      "))
    ),
    
    # ==========================
    # DASHBOARD TAB
    # ==========================
    
    tabItems(
      
      tabItem(
        
        tabName = "dashboard",
        
        h2(
          "🛒 E-Commerce Product Data Analysis Using R",
          style = "font-weight:bold;"
        ),
        
        br(),
        
        # ----------------------
        # KPI CARDS
        # ----------------------
        
        fluidRow(
          
          valueBoxOutput(
            "totalProducts",
            width = 3
          ),
          
          valueBoxOutput(
            "totalCategories",
            width = 3
          ),
          
          valueBoxOutput(
            "averagePrice",
            width = 3
          ),
          
          valueBoxOutput(
            "averageRating",
            width = 3
          )
        ),
        
        fluidRow(
          
          box(
            title = "Products by Category",
            status = "primary",
            solidHeader = TRUE,
            width = 6,
            plotlyOutput(
              "categoryChart",
              height = "350px"
            )
          ),
          
          box(
            title = "Price Distribution",
            status = "success",
            solidHeader = TRUE,
            width = 6,
            plotlyOutput(
              "priceChart",
              height = "350px"
            )
          )
        ),
        
        fluidRow(
          
          box(
            title = "Average Price by Category",
            status = "warning",
            solidHeader = TRUE,
            width = 6,
            plotlyOutput(
              "avgPriceChart",
              height = "350px"
            )
          ),
          
          box(
            title = "Average Rating by Category",
            status = "info",
            solidHeader = TRUE,
            width = 6,
            plotlyOutput(
              "ratingChart",
              height = "350px"
            )
          )
        )
      ),
      
      # =====================================================
      # PRODUCT ANALYSIS TAB
      # =====================================================
      
      tabItem(
        
        tabName = "analysis",
        
        h2(
          "Detailed Product Analysis",
          style = "font-weight:bold;"
        ),
        
        fluidRow(
          
          box(
            title = "Price vs Rating",
            status = "primary",
            solidHeader = TRUE,
            width = 7,
            
            plotlyOutput(
              "scatterChart",
              height = "450px"
            )
          ),
          
          box(
            title = "Stock Analysis",
            status = "danger",
            solidHeader = TRUE,
            width = 5,
            
            plotlyOutput(
              "stockChart",
              height = "450px"
            )
          )
        ),
        
        fluidRow(
          
          box(
            title = "Top 10 Products by Rating",
            status = "success",
            solidHeader = TRUE,
            width = 12,
            
            plotlyOutput(
              "topProducts",
              height = "450px"
            )
          )
        )
      ),
      
      # =====================================================
      # DATA TAB
      # =====================================================
      
      tabItem(
        
        tabName = "data",
        
        h2(
          "Product Data",
          style = "font-weight:bold;"
        ),
        
        box(
          title = "Filtered Product Dataset",
          status = "primary",
          solidHeader = TRUE,
          width = 12,
          
          DTOutput("productTable")
        )
      ),
      
      # =====================================================
      # ABOUT TAB
      # =====================================================
      
      tabItem(
        
        tabName = "about",
        
        h2(
          "About the Project",
          style = "font-weight:bold;"
        ),
        
        box(
          
          title = "E-Commerce Product Data Analysis Using R",
          status = "primary",
          solidHeader = TRUE,
          width = 12,
          
          h3("Project Objective"),
          
          p(
            "This project analyzes e-commerce product information ",
            "using R programming and provides an interactive dashboard ",
            "for exploring product categories, prices, ratings and stock."
          ),
          
          h3("Technologies Used"),
          
          tags$ul(
            
            tags$li("R Programming"),
            
            tags$li("R Shiny"),
            
            tags$li("shinydashboard"),
            
            tags$li("Plotly"),
            
            tags$li("DataTables"),
            
            tags$li("CSV Data")
          ),
          
          h3("Data Operations"),
          
          tags$ul(
            
            tags$li(
              "Reading CSV data and creating a data frame"
            ),
            
            tags$li(
              "Creating frequency tables"
            ),
            
            tags$li(
              "Converting categorical columns into factors"
            ),
            
            tags$li(
              "Performing mathematical operations"
            ),
            
            tags$li(
              "Filtering and managing rows and columns"
            )
          ),
          
          h3("Project Dataset"),
          
          p(
            "The dashboard uses the 100-product e-commerce dataset."
          )
        )
      )
    )
  )
)


# ============================================================
# 4. SERVER
# ============================================================

server <- function(input, output, session) {
  
  # ----------------------------------------------------------
  # FILTER DATA
  # ----------------------------------------------------------
  
  filteredData <- reactive({
    
    data <- products
    
    # Category filter
    
    if (input$category != "All Categories") {
      
      data <- data %>%
        filter(
          Category == input$category
        )
    }
    
    # Price filter
    
    data <- data %>%
      filter(
        Price >= input$price[1],
        Price <= input$price[2]
      )
    
    # Rating filter
    
    data <- data %>%
      filter(
        Rating >= input$rating
      )
    
    data
  })
  
  
  # ==========================================================
  # KPI 1 - TOTAL PRODUCTS
  # ==========================================================
  
  output$totalProducts <- renderValueBox({
    
    valueBox(
      
      value = nrow(filteredData()),
      
      subtitle = "Products",
      
      icon = icon("shopping-cart"),
      
      color = "blue"
    )
  })
  
  
  # ==========================================================
  # KPI 2 - TOTAL CATEGORIES
  # ==========================================================
  
  output$totalCategories <- renderValueBox({
    
    valueBox(
      
      value = n_distinct(
        filteredData()$Category
      ),
      
      subtitle = "Categories",
      
      icon = icon("tags"),
      
      color = "green"
    )
  })
  
  
  # ==========================================================
  # KPI 3 - AVERAGE PRICE
  # ==========================================================
  
  output$averagePrice <- renderValueBox({
    
    data <- filteredData()
    
    avgPrice <- if (nrow(data) == 0) {
      0
    } else {
      mean(data$Price)
    }
    
    valueBox(
      
      value = paste0(
        "₹",
        format(
          round(avgPrice, 0),
          big.mark = ","
        )
      ),
      
      subtitle = "Average Price",
      
      icon = icon("rupee-sign"),
      
      color = "yellow"
    )
  })
  
  
  # ==========================================================
  # KPI 4 - AVERAGE RATING
  # ==========================================================
  
  output$averageRating <- renderValueBox({
    
    data <- filteredData()
    
    avgRating <- if (nrow(data) == 0) {
      0
    } else {
      mean(data$Rating)
    }
    
    valueBox(
      
      value = round(
        avgRating,
        2
      ),
      
      subtitle = "Average Rating",
      
      icon = icon("star"),
      
      color = "purple"
    )
  })
  
  
  # ==========================================================
  # CATEGORY FREQUENCY CHART
  # ==========================================================
  
  output$categoryChart <- renderPlotly({
    
    data <- filteredData()
    
    categoryData <- data %>%
      
      count(Category) %>%
      
      arrange(
        desc(n)
      )
    
    p <- ggplot(
      categoryData,
      aes(
        x = reorder(Category, n),
        y = n,
        text = paste(
          "Category:",
          Category,
          "<br>Products:",
          n
        )
      )
    ) +
      
      geom_col(
        fill = "#3498db"
      ) +
      
      coord_flip() +
      
      labs(
        x = NULL,
        y = "Number of Products"
      ) +
      
      theme_minimal()
    
    ggplotly(
      p,
      tooltip = "text"
    )
  })
  
  
  # ==========================================================
  # PRICE DISTRIBUTION
  # ==========================================================
  
  output$priceChart <- renderPlotly({
    
    data <- filteredData()
    
    p <- ggplot(
      data,
      aes(
        x = Price
      )
    ) +
      
      geom_histogram(
        bins = 20,
        fill = "#2ecc71",
        color = "white"
      ) +
      
      labs(
        x = "Price (₹)",
        y = "Number of Products"
      ) +
      
      theme_minimal()
    
    ggplotly(p)
  })
  
  
  # ==========================================================
  # AVERAGE PRICE BY CATEGORY
  # ==========================================================
  
  output$avgPriceChart <- renderPlotly({
    
    data <- filteredData()
    
    avgData <- data %>%
      
      group_by(Category) %>%
      
      summarise(
        AveragePrice = mean(Price),
        .groups = "drop"
      )
    
    p <- ggplot(
      avgData,
      aes(
        x = reorder(Category, AveragePrice),
        y = AveragePrice,
        text = paste(
          "Category:",
          Category,
          "<br>Average Price: ₹",
          round(AveragePrice, 0)
        )
      )
    ) +
      
      geom_col(
        fill = "#f39c12"
      ) +
      
      coord_flip() +
      
      labs(
        x = NULL,
        y = "Average Price (₹)"
      ) +
      
      theme_minimal()
    
    ggplotly(
      p,
      tooltip = "text"
    )
  })
  
  
  # ==========================================================
  # AVERAGE RATING BY CATEGORY
  # ==========================================================
  
  output$ratingChart <- renderPlotly({
    
    data <- filteredData()
    
    ratingData <- data %>%
      
      group_by(Category) %>%
      
      summarise(
        AverageRating = mean(Rating),
        .groups = "drop"
      )
    
    p <- ggplot(
      ratingData,
      aes(
        x = reorder(Category, AverageRating),
        y = AverageRating,
        text = paste(
          "Category:",
          Category,
          "<br>Average Rating:",
          round(AverageRating, 2)
        )
      )
    ) +
      
      geom_col(
        fill = "#9b59b6"
      ) +
      
      coord_flip() +
      
      labs(
        x = NULL,
        y = "Average Rating"
      ) +
      
      theme_minimal()
    
    ggplotly(
      p,
      tooltip = "text"
    )
  })
  
  
  # ==========================================================
  # PRICE VS RATING SCATTER PLOT
  # ==========================================================
  
  output$scatterChart <- renderPlotly({
    
    data <- filteredData()
    
    p <- ggplot(
      data,
      aes(
        x = Price,
        y = Rating,
        text = paste(
          "Product:",
          ProductName,
          "<br>Category:",
          Category,
          "<br>Price: ₹",
          format(Price, big.mark = ","),
          "<br>Rating:",
          Rating,
          "<br>Stock:",
          Stock
        )
      )
    ) +
      
      geom_point(
        size = 4,
        alpha = 0.8,
        color = "#3498db"
      ) +
      
      labs(
        x = "Price (₹)",
        y = "Rating"
      ) +
      
      theme_minimal()
    
    ggplotly(
      p,
      tooltip = "text"
    )
  })
  
  
  # ==========================================================
  # STOCK ANALYSIS
  # ==========================================================
  
  output$stockChart <- renderPlotly({
    
    data <- filteredData()
    
    stockData <- data %>%
      
      group_by(Category) %>%
      
      summarise(
        TotalStock = sum(Stock),
        .groups = "drop"
      )
    
    p <- ggplot(
      stockData,
      aes(
        x = reorder(Category, TotalStock),
        y = TotalStock,
        text = paste(
          "Category:",
          Category,
          "<br>Total Stock:",
          TotalStock
        )
      )
    ) +
      
      geom_col(
        fill = "#e74c3c"
      ) +
      
      coord_flip() +
      
      labs(
        x = NULL,
        y = "Total Stock"
      ) +
      
      theme_minimal()
    
    ggplotly(
      p,
      tooltip = "text"
    )
  })
  
  
  # ==========================================================
  # TOP 10 PRODUCTS
  # ==========================================================
  
  output$topProducts <- renderPlotly({
    
    data <- filteredData() %>%
      
      arrange(
        desc(Rating)
      ) %>%
      
      head(10)
    
    p <- ggplot(
      data,
      aes(
        x = reorder(ProductName, Rating),
        y = Rating,
        text = paste(
          "Product:",
          ProductName,
          "<br>Rating:",
          Rating,
          "<br>Price: ₹",
          format(Price, big.mark = ",")
        )
      )
    ) +
      
      geom_col(
        fill = "#1abc9c"
      ) +
      
      coord_flip() +
      
      labs(
        x = NULL,
        y = "Rating"
      ) +
      
      theme_minimal()
    
    ggplotly(
      p,
      tooltip = "text"
    )
  })
  
  
  # ==========================================================
  # INTERACTIVE DATA TABLE
  # ==========================================================
  
  output$productTable <- renderDT({
    
    datatable(
      
      filteredData(),
      
      rownames = FALSE,
      
      options = list(
        
        pageLength = 10,
        
        lengthMenu = c(
          10,
          25,
          50,
          100
        ),
        
        scrollX = TRUE,
        
        autoWidth = TRUE
      ),
      
      filter = "top"
    )
  })
}


# ============================================================
# 5. RUN APPLICATION
# ============================================================

shinyApp(
  ui = ui,
  server = server
)