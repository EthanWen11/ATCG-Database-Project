import React from 'react'
import { Logo } from './Logo'
// Home Page Search Form
const SearchForm = ({ onSubmit }) => {
  const handleFormSubmission = (e) => {
    e.preventDefault();
    const formData = new FormData(e.target);
    const queryParams = new URLSearchParams(formData);
    onSubmit(queryParams);
  }

  // add attribute after main page is sorted out onSubmit={handleFormSubmission}
  return (
    <form className='mt-[30] mx-auto max-w-lg relative w-full' acceptCharset='UTF-8' method='get' action='' >
      <a className='block absolute z-[500] w-20  left-4 top-1/4' >
        <span className='border-0 h-1 -m-1 overflow-hidden p-0 absolute w-1'>TCG name</span>
        {/* placeholder svg */}
        <Logo className='text-purple-700' width='48px' height='48px' />
      </a>
      <input className='border-solid border-2 border-white bg-slate-700 text-white py-8 pr-14 pl-20 text-base rounded-md shadow-sm m-0 w-full' type="text" name='query' id='query' autoCapitalize='none' autoCorrect='off' spellCheck='false' maxLength='1024' />
      <button type='submit' className='hidden border-0'>
        Search Cards
      </button>
    </form>
  )
}

export default SearchForm