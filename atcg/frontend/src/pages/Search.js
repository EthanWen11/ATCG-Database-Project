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
        fontSize: '24px', 
        fontStyle: 'italic', 
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


    return (
        <div className="min-h-screen bg-gradient-to-b from-gray-600 to-indigo-900 flex flex-col items-center">
            <div className="search-results-container" style={{ padding: '20px' }}>
                <span style={textStyle}>Search Results: </span>
                <div className="cards-container" style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'center' }}>
                    {cards.map((card) => (
                        <a key={card.cardID} href={`/card/${card.setID}/${card.cardID}`} className="card-link">
                            <div className="card" style={{ display: 'flex', alignItems: 'center', margin: '10px', backgroundColor: '#333', borderRadius: '5px', padding: '10px', width: '300px' }}>
                                <img src={card.imageID ? `/images/${card.imageID}.png` : '/cardEx.png'} alt={card.cardName} style={{ maxWidth: '100px', marginRight: '20px' }} />
                                <div className="card-details" style={{ color: 'white' }}>
                                    <p>Card ID: {card.cardID}</p>
                                    <p>Set: {card.setID}</p>
                                    <p>Card Name: {card.cardName}</p>
                                </div>
                            </div>
                        </a>
                    ))}
                </div>
            </div>
        </div>
    );
};

export default Search;