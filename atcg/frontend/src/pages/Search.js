import React from 'react'
import { useSearchParams } from 'react-router-dom'

const Search = () => {
    const [searchParams] = useSearchParams();
    const query = searchParams.get('query');

    
    const textStyle = {
        color: 'white',
        marginTop: '100px', 
    };

    // atm only displays the search query
    return (
        <div className="min-h-screen bg-gradient-to-b from-gray-600 to-indigo-900 flex flex-col items-center">
            <span style={textStyle}>{query}</span>
        </div>
    )
}

export default Search
