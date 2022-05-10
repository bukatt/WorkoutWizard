import Card from '@mui/material/Card';
import * as React from 'react';
import CardContent from '@mui/material/CardContent';
import Grid from '@mui/material/Grid'
import './WorkoutCard.css';
function WorkoutCard(props) {
    return (
        <Card className="workout-card__container"
        sx={{
            width: {
              xs: 300, // theme.breakpoints.up('xs')
              sm: 500, // theme.breakpoints.up('sm')
              md: 700, // theme.breakpoints.up('md')
              lg: 900, // theme.breakpoints.up('lg')
              xl: 1100, // theme.breakpoints.up('xl')
            },
          }}>
        <CardContent>
            <Grid container>
                <Grid item xs={12}>
            <div className="left">
                <span>{props.workout.name}</span>
            </div>
            </Grid>
            <Grid item xs={12}>
                <h3>{props.workout.title}</h3>
            </Grid>
            <Grid item xs={12}>
                <p>{props.workout.workout}</p>
            </Grid>
            </Grid>
        </CardContent>
        </Card>
    );
  }
  
  export default WorkoutCard;
  