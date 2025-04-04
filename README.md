# ZyptoPulse

A mobile cryptocurrency application that allows users to view live crypto prices, save favorites, and manage their cryptocurrency portfolio.

## Project Information

- **Name**: ZyptoPulse
- **Version**: 1.0.0+1
- **SDK Environment**: ^3.6.0
- **Description**: A Flutter mobile application for cryptocurrency tracking and management

## Setup Instructions

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code
- Android Emulator / iOS Simulator

### Installation
1. Clone the repository
   ```
   git clone https://github.com/utkarshgupta2009/zyptopulse.git
   ```

2. Navigate to the project directory
   ```
   cd zyptopulse
   ```

3. Install dependencies
   ```
   flutter pub get
   ```

4. Run the application
   ```
   flutter run
   ```

## API Details

### API Overview
The application uses two main API services:

1. **Public Cryptocurrency API**
   - Used to fetch live cryptocurrency market data
   - Provides cryptocurrency details including id, symbol, name, current price, market cap, etc.
   - No authentication required

2. **Backend Authentication and Storage API**
   - Directus-based backend for user management and data storage
   - API details and endpoints are implemented but not disclosed in this README for security reasons
   - The API handles:
     - User authentication (signup/login)
     - JWT token generation and validation
     - Storing and retrieving user's favorite cryptocurrencies

### Environment Variables
For security, all API endpoints and keys are stored using environment variables:

1. Create a `.env` file in the root directory of the project
2. Add the following variables (replace with your actual values):
   ```
   CRYPTO_DATA_URL=your_crypto_api_url
   DIRECTUS_API_URL=your_directus_api_url
   ```
3. The application uses the `flutter_dotenv` package to securely access these variables
4. **Important**: Never commit the `.env` file to version control. It's already added to `.gitignore`

*Note: Specific API endpoints, URLs, and authentication details are kept private and are only accessible through environment variables.*

## JWT/Token Flow

1. **Authentication Process**:
   - User signs up or logs in using credentials
   - Directus API validates the credentials and returns JWT access token and refresh token
   - The application stores the JWT token securely using `flutter_secure_storage`
   
2. **Token Usage**:
   - The JWT token is included in the Authorization header for all authenticated API requests
   - Format: `Authorization: Bearer <JWT>`
   
3. **Token Storage**:
   - Tokens are stored securely using `flutter_secure_storage` to prevent unauthorized access
   - The tokens are encrypted on the device storage
   
4. **Token Validation**:
   - Each protected API request validates the token
   - If token is expired or invalid, user is redirected to login

## How Favorites are Stored

1. **Data Structure**:
   - Favorites are stored in a custom Directus collection called `crypto_favorites`
   - Each favorite entry contains:
     - Cryptocurrency name
     - Symbol
     - Current price
     - Market cap rank
     - Price change percentage (24h)
     - Image URL
   
2. **User-Specific Storage**:
   - Each favorite is associated with the user's account
   - This ensures that users only see their own favorites
   
3. **Synchronization**:
   - When a user adds a favorite:
     - The item is immediately displayed in the UI
     - Data is sent to Directus API to be stored
     - User receives visual confirmation of successful save
   
   - When a user removes a favorite:
     - The item is immediately removed from the UI
     - DELETE request is sent to Directus API
     - User receives visual confirmation of successful deletion

4. **Offline Support**:
   - Favorites are cached locally for offline viewing
   - Changes made offline are synchronized when connection is restored

## Features

1. **Authentication**:
   - User signup with name, email, and password
   - User login with email and password
   - Secure token storage

2. **Market Screen**:
   - Live cryptocurrency prices
   - Ability to add favorites using intuitive sliding card gestures
   - Clean, minimalist UI with swipeable cards for better user experience
   - Detailed information about each cryptocurrency

3. **Favorites Screen**:
   - List of user's favorite cryptocurrencies
   - Ability to remove favorites using intuitive sliding card gestures
   - Clean, minimalist UI with swipeable cards for better user experience
   - Real-time price updates

4. **Theme Switching**:
   - Toggle between light and dark mode
   - Theme preference persists between app launches using SharedPreferences
   - Implementation through Riverpod state management

5. **State Management**:
   - Implemented using Riverpod
   - Efficient data flow through providers

## Architecture

The application follows a clean architecture approach with:

- **Models**: Data structures for cryptocurrencies, users, and favorites
- **Services**: API communication and data processing
- **Providers**: State management with Riverpod
- **Screens**: UI components for different parts of the application
- **Widgets**: Reusable UI components
- **Theme**: Application styling and theming

## User Interface

The application features a clean, minimalist UI designed for optimal user experience:

- **Cryptocurrency Cards**:
  - Swipeable cards for adding/removing favorites
  - Sliding gesture support using `flutter_slidable` for intuitive interactions
  - Animated transitions between states for smooth user experience

- **Design Philosophy**:
  - Minimalist approach with focus on content
  - High contrast for readability
  - Consistent spacing and typography
  - Subtle animations for feedback
  - Adaptive theme (light/dark) with consistent visual hierarchy

- **Interaction Design**:
  - Intuitive swiping gestures for common actions
  - Haptic feedback for important actions
  - Smooth transitions between screens
  - Responsive layouts that adapt to different screen sizes

## Asset Management

This project uses `flutter_gen` for asset management, which provides:

- Type-safe asset references
- Automatic code generation for assets
- Prevention of typos and runtime errors related to asset paths

After adding new assets to the project:

1. Run the following command to generate asset classes:
   ```
   flutter pub run build_runner build
   ```

2. Access assets using the generated classes, for example:
   ```dart
   // Images
   Assets.images.logo.image()
   
   // SVGs
   Assets.icons.home.svg()
   ```

This approach improves maintainability and provides better IDE support compared to using string paths.

## Dependencies

### Main Dependencies
- `flutter_riverpod`: ^2.4.0 - State management
- `riverpod_annotation`: ^2.1.1 - Annotations for Riverpod
- `go_router`: ^10.1.0 - Route management
- `flutter_secure_storage`: ^8.0.0 - Secure storage for tokens
- `shared_preferences`: ^2.2.0 - Local storage for preferences
- `http`: ^1.1.0 - HTTP client for API communication
- `flutter_svg`: ^2.0.7 - SVG rendering
- `flutter_slidable` - Slidable list items
- `flutter_dotenv`: ^5.2.1 - Environment variable management

### Dev Dependencies
- `flutter_lints`: ^2.0.0 - Linting rules
- `build_runner`: ^2.4.6 - Code generation
- `riverpod_generator`: ^2.2.3 - Code generation for Riverpod
- `flutter_gen_runner`: ^5.3.1 - Asset code generation

### Flutter Configuration
```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/icons/

flutter_gen:
  output: lib/gen/
  line_length: 80
  integrations:
    flutter_svg: true

scripts:
  build_runner: flutter pub run build_runner build --delete-conflicting-outputs
```
