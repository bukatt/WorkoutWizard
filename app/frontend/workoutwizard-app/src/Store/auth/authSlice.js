import { createAsyncThunk, createSlice } from '@reduxjs/toolkit';
import { loginAPI } from '../../Services/user.service';

export const userLogin = createAsyncThunk(
  'login',
  async (userLoginInfo, thunkAPI) => {
    const response = await loginAPI(userLoginInfo)
    return response.data
  }
)

const initialState = {
    user: {
      userName: "",
      email: "",
      firstName: "",
      lastName: "",
      token: ""
    },
    loginState: "loggedOut"
}

export const authSlice = createSlice({
  name: 'auth',
  initialState: {
      value: JSON.parse(localStorage.get("auth")) || initialState
  },
  reducers: {
    logout: (state) => {
        state.value = initialState
    }
  },
  extraReducers: (builder) => {
    builder.addCase(userLogin.fulfilled, (state, action) => {
      state.value = action.payload
    }),

    builder.addCase(userLogin.pending, (state, action) => {
      state.value.loginState = "logginIn"
    }),

    builder.addCase(userLogin.rejected, (state, action) => {
      state.value.loginState = initialState
    })
  },
})

export const { logout } = authSlice.actions

export default authSlice.reducer