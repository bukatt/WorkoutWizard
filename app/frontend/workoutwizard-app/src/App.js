import logo from './logo.svg';
import './App.css';
import NavBar from './Components/NavBar/NavBar'
import CreateWorkoutPage from './Pages/CreateWorkoutPage/CreateWorkoutPage';
import Workouts from './Pages/WorkoutsPage/Workouts';
import { Route, Routes } from 'react-router-dom';
import SignInPage from './Pages/SignInPage/SignInPage';
import 'bootstrap/dist/css/bootstrap.min.css';
import 'dotenv/config'

function App() {
  const workouts = [
    {id: 1, name: "Phillip Stenger", title: "Burpees", workout: "Do a lot of them."},
    {id: 2, name: "Becca Smith", title: "Walk", workout: "Tiktok and walk on treadmill"}
  ]

  return (
    <div className="App">
      <header className="App-header">
      <meta name="viewport" content="initial-scale=1, width=device-width" />
      <link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
  crossOrigin="anonymous"
/>
      <NavBar> </NavBar>
      <div className="page-container">
      <Routes>
      <Route exact path="/" element={<CreateWorkoutPage />}/>
      <Route exact path="/create" element={<CreateWorkoutPage />}/>
      <Route exact path="/feed" element={<Workouts />}/>
      <Route exact path="/sign-in" element={<SignInPage />}/>
      </Routes>
      </div>
      </header>
    </div>
  );
}

export default App;
