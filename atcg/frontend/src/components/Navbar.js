import React from 'react'
import { Link, useLocation } from 'react-router-dom'
import NavSearchForm from './NavSearchForm'

const Navbar = () => {
    const location = useLocation();

if(location.pathname === "/") {
    return null;
}
  return (

    <div className="w-full bg-slate-800 px-8 min ">
        <div className='h-16 w-full flex items-center flex-row flex-nowrap justify-between'>
            <div className='flex space-x-2 w-full'>
                <Link to="/" className='w-12 h-12'>
                    <img src="/Nexus.png" alt="Nexus Logo" className="w-12 h-12 mx-auto" />
                </Link>
                <NavSearchForm/>
            </div>

            <div className='flex space-x-3'>
                <Link to="/advanced">
                    <span className='flex items-center hover:brightness-150'>
                        {/* replace this with some other icon */}
                        <svg width={16} height={16} viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="#a8a29e">
                            <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                            <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                            <g id="SVGRepo_iconCarrier"> 
                                <path fill="none" stroke="#a8a29e" stroke-width="2" d="M15,16 L21,22 L15,16 Z M10,18 C13.8659932,18 17,14.8659932 17,11 C17,7.13400675 13.8659932,4 10,4 C6.13400675,4 3,7.13400675 3,11 C3,14.8659932 6.13400675,18 10,18 Z M20,1 L20,7 M17,4 L23,4" /> 
                            </g>
                        </svg>
                        <button className='text-stone-200 font-thin pl-2 hover:underline'>Advanced</button>
                    </span>
                </Link>
                <Link to="/advanced">
                    <span className='flex items-center hover:brightness-150'>
                        <button className='text-stone-200 font-thin pl-2 hover:underline'>Deck</button>
                    </span>
                </Link>
            </div>
        </div>
    </div>
  )
}

export default Navbar