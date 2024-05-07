import React from 'react'
import { Link } from 'react-router-dom'

const Navbar = () => {
  return (
    <div className="w-full bg-slate-800 px-4">
        <Link to="/">
            go back
        </Link>
    </div>
  )
}

export default Navbar