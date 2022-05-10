import * as React from 'react';
import { Button, TextField, CardContent, Card} from '@mui/material';
import { Box } from '@mui/system';

function CreateWorkoutPage(props) {
    return (
        <Box component="form"
        sx={{
          '& .MuiTextField-root': { m: 1},
          '& .MuiButton-root': { m: 1},
        }}
        noValidate
        autoComplete="off">
        <TextField className="form-element"
          id="outlined-textarea"
          label="Workout"
          placeholder="Type Workout"
          multiline
          fullWidth
          rows={4}
        />
        <Button className="form-element" variant="contained">Create Workout</Button>
        </Box>
    );
  }
  
  export default CreateWorkoutPage;
  