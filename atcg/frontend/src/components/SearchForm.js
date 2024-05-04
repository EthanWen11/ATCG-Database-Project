import React from 'react'
import { Logo } from './Logo'

// Home Page Search Form
const SearchForm = () => {
  return (
    <>
      <div className='p-0 flex flex-col flex-nowrap'>
        <form className='mt-[30] mx-auto max-w-lg relative w-full' action="" acceptCharset='UTF-8' method='get'>
          <a className='block absolute z-[500] w-20 h-full p-4 left-0' >
            <span className='border-0 h-1 -m-1 overflow-hidden p-0 absolute w-1'>TCG name</span>
            <Logo className='text-purple-700' width='48px' height='48px' />
          </a>
          <input className='border-solid border-2 border-white bg-slate-700 text-white py-8 pr-14 pl-20 text-base rounded-md shadow-sm m-0 w-full' type="text" name='query' id='query' autoCapitalize='none' autoCorrect='off' spellCheck='false' maxLength='1024' />
          <button type='submit' className='hidden border-0'>
            Search Cards
          </button>
        </form>
      </div>

    </>
  )
}

export default SearchForm