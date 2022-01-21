import logo from './logo.svg';
import './App.css';
import WorkoutCard from './WorkoutCard/WorkoutCard';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <WorkoutCard></WorkoutCard>
      </header>
    </div>
  );
}

export default App;
