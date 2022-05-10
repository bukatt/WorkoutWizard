import Card from '@mui/material/Card';
import * as React from 'react';
import CardContent from '@mui/material/CardContent';
import TextField from '@mui/material/TextField'
import WorkoutCard from '../../Components/WorkoutCard/WorkoutCard'

function Workouts(props) {
    const workouts = [
        {id: 1, name: "Phillip Stenger", title: "Burpees", workout: "Do a lot of them."},
        {id: 2, name: "Becca Smith", title: "Walk", workout: "Tiktok and walk on treadmill"}
      ]
    return (
        <div>
        {workouts.map((workout) =>
            <WorkoutCard key={workout.id} workout={workout}></WorkoutCard>
        )}
        </div>
    );
  }
  
  export default Workouts;