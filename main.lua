-- Function to fetch search results from the API
function fetchResults(query)
    local url = "https://roasted-rightful-sandal.glitch.me/search?query=" .. query
    local response = fetch({
        url = url,
        method = "GET"
    })
    print("Fetched results: " .. response)
    return response
end

-- Function to display search results on the webpage
function displayResults(results)
    local resultsList = get("ul")
    resultsList.clear() -- Clear existing results

    -- Split results by newline character
    local urls = string.split(results, "\n")

    -- Iterate over each URL and add it to the results list
    for _, url in ipairs(urls) do
        local listItem = create("li")
        listItem.set_content(url)
        resultsList.append(listItem)
    end

    -- Show the results container
    local resultsContainer = get("div", true)[2]
    resultsContainer.style.display = "block"
end

-- Event listener for search button click
get("button").on_click(function()
    local query = get("input").get_value()
    local results = fetchResults(query)
    displayResults(results)
end)
