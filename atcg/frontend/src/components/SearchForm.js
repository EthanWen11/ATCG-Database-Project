import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { Logo } from './Logo';


const SearchForm = () => {
  const [query, setQuery] = useState('');
  const navigate = useNavigate();

  const handleLogoClick = () => {
    setQuery('');
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    const params = new URLSearchParams({"order": "id"})
    if(query !== '') params.set("q", query);
    navigate(`/search?${params.toString()}`);
  };

  return (
    <div className='p-0 flex flex-col flex-nowrap'>
      <form className='mt-[30] mx-auto max-w-lg relative w-full' action="/search" acceptCharset='UTF-8' method='get' onSubmit={handleSubmit}>
        <a className='block absolute z-[500] w-20 left-4 top-4' >
          <span className='border-0 h-1 -m-1 overflow-hidden p-0 absolute w-1'>TCG name</span>
          {/* placeholder svg */}
          <Link to="/" onClick={handleLogoClick}>
            <Logo className='text-indigo-500' width='48px' height='48px' />
          </Link>
        </a>
        <input
          className='border-solid border-2 border-gray-400 bg-slate-700 text-white py-6 pr-28 pl-28 text-base rounded-md shadow-sm m-0 w-full'
          type="text"
          name='query'
          id='query'
          autoCapitalize='none'
          autoCorrect='off'
          spellCheck='false'
          maxLength='1024'
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Healing potion"
        />
        <button type='submit' className='hidden border-0'>
          Search Cards
        </button>
      </form>
    </div>
  );
};
export default SearchForm;
