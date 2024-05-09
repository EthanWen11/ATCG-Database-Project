import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';


const NavSearchForm = () => {
    const [query, setQuery] = useState('');
    const navigate = useNavigate();
  
    const handleSubmit = (e) => {
      e.preventDefault();
      const params = new URLSearchParams({"order": "id"});
      if(query !== '') params.set("q", query);
      navigate(`/search?${params.toString()}`);
    };
    
  return (
    <div className='flex flex-nowrap w-full max-w-lg'>
        <form className='w-full' action="/search" acceptCharset='UTF-8' method='get' onSubmit={handleSubmit}>
            <div className='flex h-full'>
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
                    placeholder="  Search for Cards ..."
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