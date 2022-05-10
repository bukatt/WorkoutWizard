import 'dotenv/config'
import express from 'express'

const WOWEndpoints = {
    user: process.env.REACT_APP_WOW_BASEURL + "/user",
    login: process.env.REACT_APP_WOW_BASEURL + "/token"
}

export default WOWEndpoints