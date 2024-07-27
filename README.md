# Discover Tunisia

Discover Tunisia is a comprehensive tourist guide app designed to help travelers explore the best attractions, accommodations, and activities in Tunisia. The app features a user-friendly interface that includes essential widgets and functionalities to enhance the user experience. In this version, we introduce several new widgets like `DefaultTabController`, `TabBar`, `Scrollbar`, `ClipOval`, and `SafeArea`. Additionally, we delve into internationalization and integrating Google Maps to provide users with localized content and interactive maps.

## Key Widgets Used

### DefaultTabController & TabBar
- **DefaultTabController**: Manages the state of a `TabBar` and its associated `TabBarView`. It simplifies the creation of tab-based navigation by providing a default configuration for tabs.
- **TabBar**: Displays a horizontal row of tabs, allowing users to switch between different views or sections of the app.
- **Use Case in Discover Tunisia**: The `DefaultTabController` and `TabBar` are used to organize content into tabs, such as "Attractions," "Accommodations," and "Restaurants." This helps users easily navigate between different categories of tourist information.
- **Example Usage**: Implementing a `TabBar` to allow users to switch between different sections of the guide, each with its own set of details and recommendations.

  ```dart
  DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(text: 'Attractions'),
            Tab(text: 'Accommodations'),
            Tab(text: 'Restaurants'),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          AttractionsTab(),
          AccommodationsTab(),
          RestaurantsTab(),
        ],
      ),
    ),
  );
  ```

### Scrollbar
- **Description**: `Scrollbar` provides a visual indication of the scroll position and allows users to easily navigate through scrollable content.
- **Use Case in Discover Tunisia**: A `Scrollbar` enhances the user experience when browsing through long lists of attractions, accommodations, or restaurant recommendations. It helps users quickly find their place and navigate through content.
- **Example Usage**: Wrapping long lists or scrollable views in a `Scrollbar` to provide a clear visual indication of scrolling and improve usability.

  ```dart
  Scrollbar(
    child: ListView(
      children: <Widget>[
        // List items here
      ],
    ),
  );
  ```

### ClipOval
- **Description**: `ClipOval` is a widget that clips its child into a circular or elliptical shape. It is useful for creating circular images or avatars.
- **Use Case in Discover Tunisia**: Use `ClipOval` to display circular images of tourist attractions, profile pictures of tour guides, or icons for different categories. It adds a polished look to images and icons within the app.
- **Example Usage**: Displaying circular images of popular attractions or creating circular profile pictures for tour guides.

  ```dart
  ClipOval(
    child: Image.network(
      'https://example.com/attraction_image.jpg',
      width: 100.0,
      height: 100.0,
      fit: BoxFit.cover,
    ),
  );
  ```

### SafeArea
- **Description**: `SafeArea` ensures that its child is not obscured by system UI elements such as notches, status bars, and navigation bars. It provides padding to ensure content is visible and accessible.
- **Use Case in Discover Tunisia**: Use `SafeArea` to make sure that critical UI elements, such as tab bars and navigation components, are not covered by system UI elements, especially on devices with notches or rounded corners.
- **Example Usage**: Wrapping the main content of the app in `SafeArea` to ensure it is displayed correctly on all devices.

  ```dart
  SafeArea(
    child: Scaffold(
      // App content here
    ),
  );
  ```

## Key Concepts

### Internationalization
- **Description**: Internationalization (i18n) involves adapting the app to support multiple languages and regional settings. It ensures that the app is accessible and usable for users from different linguistic and cultural backgrounds.
- **Importance in Discover Tunisia**: Internationalization allows the app to cater to a diverse audience by providing translations and localized content. This is particularly important for a tourist guide app that serves international travelers.


### Using Google Maps
- **Description**: Google Maps integration allows users to view interactive maps, get directions, and explore locations within the app. It provides valuable location-based information and navigation features.
- **Importance in Discover Tunisia**: Integrating Google Maps helps users find tourist attractions, accommodations, and restaurants easily. It enhances the app’s functionality by providing interactive maps and location details.
