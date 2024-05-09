import React, { useState, useEffect } from 'react'
import { useNavigate, useSearchParams } from 'react-router-dom'

const Search = () => {
    const [searchParams] = useSearchParams();
    const navigate = useNavigate()
    const query = Array.from(searchParams.values()).toString();
    // use searchParams.get() to get a specific search parameter values and pass it to get req

    const textStyle = {
        color: 'white',
        marginTop: '100px',
    };

    const [cards, setCards] = useState([])

    const getCards = async () => {
        const res = await fetch(`http://localhost:3001/search?${searchParams.toString()}`, { method: 'get', });
        const data = res.json()
        setCards(data)
    }

    // const getAllCards = async () => {
    //     const res = await fetch(``)
    // }

    useEffect(() => {
        const fetchData = async () => {
            try {
                if (searchParams.get("q")) {
                    const res = await fetch('http://localhost:3001/search?' + searchParams.toString(), { method: 'get', });
                    setCards(await res.json())
                }
                else if (searchParams.size >= 1) {
                    const res = await fetch('http://localhost:3001/search?' + searchParams.toString(), { method: 'get', });
                    setCards(await res.json())
                }
                else {
                    // if somehow we route to a page with no search params, we return a default value
                    searchParams.set("order", "id")
                    navigate(`/search?${searchParams.toString()}`);
                }
            }
            catch (error) {
                console.error('Error occured on data request', error)
            }
        }

        fetchData();
    }, [searchParams])


    // atm only displays the search query
    return (
        <div className="min-h-screen bg-gradient-to-b from-gray-600 to-indigo-900 flex flex-col items-center">
            <span style={textStyle}>{query}</span>
            <span style={textStyle}>
                {cards.map((card) =>
                    <p>
                        {card.setID}
                        {card.cardName}
                        {card.color}
                        {card.keywords}
                    </p>
                )}
            </span>
        </div>
    )
}

export default Search;
