import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';


const NavSearchForm = () => {
    const [query, setQuery] = useState('');
    const navigate = useNavigate();
  
    const handleLogoClick = () => {
      setQuery('');
    };
  
    const handleSubmit = (e) => {
      e.preventDefault();
      const params = new URLSearchParams({"q": query})
      navigate(`/search?${params.toString()}`);
    };
    
  return (
    <div className='flex flex-nowrap w-full max-w-lg'>
        <form className='w-full' action="/search" acceptCharset='UTF-8' method='get' onSubmit={handleSubmit}>
            <div className='flex h-full'>
                <svg width={16} height={16} viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="#a8a29e">
                    <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                    <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                    <g id="SVGRepo_iconCarrier"> 
                        <path fill="none" stroke="#a8a29e" stroke-width="2" d="M15,16 L21,22 L15,16 Z M10,18 C13.8659932,18 17,14.8659932 17,11 C17,7.13400675 13.8659932,4 10,4 C6.13400675,4 3,7.13400675 3,11 C3,14.8659932 6.13400675,18 10,18 Z M20,1 L20,7 M17,4 L23,4" /> 
                    </g>
                </svg>
                <input
                    className='border-solid border-2 border-gray-400 bg-slate-700 text-white py-0.5 text-base rounded-md shadow-sm m-0 w-full'
                    type="text"
                    name='query'
                    id='query'
                    autoCapitalize='none'
                    autoCorrect='off'
                    spellCheck='false'
                    maxLength='1024'
                    value={query}
                    onChange={(e) => setQuery(e.target.value)}
                    placeholder="Search for Cards ..."
                />
            </div>
            <button type='submit' className='hidden border-0'>
                Search Cards
            </button>
        </form>
    </div>

  )
}

export default NavSearchForm