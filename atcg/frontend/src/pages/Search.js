import React from 'react'
import { useSearchParams } from 'react-router-dom'

const Search = () => {
    const [searchParams] = useSearchParams();
    const query = searchParams.get('query');

    // atm only displays the search query
    return (
        <div>
            {query}
        </div>
    )
}

export default Search