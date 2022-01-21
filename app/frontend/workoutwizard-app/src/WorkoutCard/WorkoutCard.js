import Card from '@mui/material/Card';
import * as React from 'react';
import CardContent from '@mui/material/CardContent';

function WorkoutCard() {
    return (
        <Card sx={{minWidth: 250}}>
        <CardContent>
            <div className="left">
                <span>Phil Stenger</span>
            </div>
            <h3>Title</h3>
            <p>Workout</p>
        </CardContent>
        </Card>
    );
  }
  
  export default WorkoutCard;
  