import * as React from 'react';
import Form from 'react-bootstrap/Form';
import Button from 'react-bootstrap/Button';
import Card from 'react-bootstrap/Card';
import { useDispatch } from 'react-redux'

function SignInPage(props) {
    const [formValues, setFormValues] = useState({password: '', userName: ''})
    const dispatch = useDispatch()

    const handleChange = (event) => {
        const name = event.target.name;
        const value = event.target.value;
        setFormValues(values => ({...values, [name]: value}))
    }

    const handleSubmit = event => {
        event.preventDefault();
        dispatch(userLogin({userName: formValues.userName, password: formValues.password}));
    };

    return (
        <div className="display-flex" style={{ justifyContent: 'center'}}>
        <Card style={{ width: '20rem' }}>
            <Card.Body>
                <Form onSubmit={handleSubmit(onSubmit)}>
                    <Form.Group className="mb-3" controlId="signInEmailControl">
                        <Form.Label>Email address/Username</Form.Label>
                        <Form.Control type="text" name="userName" placeholder="Enter email" value={userName} onChange={handleChange} />
                        <Form.Text className="text-muted">
                            We'll never share your email with anyone else.
                        </Form.Text>
                    </Form.Group>

                    <Form.Group className="mb-3" controlId="passwordControl">
                        <Form.Label>Password</Form.Label>
                        <Form.Control type="password" name="password" placeholder="Password" value={password} onChange={handleChange} />
                    </Form.Group>

                    <Button variant="primary" type="submit">
                        Submit
                    </Button>
                </Form>
                <a>Don't have an account? Click here to Sign Up</a>
            </Card.Body>
        </Card>
        </div>
    );
}

export default SignInPage;