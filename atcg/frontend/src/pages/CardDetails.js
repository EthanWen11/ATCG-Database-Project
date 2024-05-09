import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';

const CardDetails = () => {
  const { id } = useParams();
  const [card, setCard] = useState(null);

  useEffect(() => {
    const fetchCard = async () => {
      try {
        const response = await fetch(`http://localhost:3001/cards/${id}`);
        if (response.ok) {
          const data = await response.json();
          setCard(data);
        } else {
          throw new Error('Failed to fetch card');
        }
      } catch (error) {
        console.error('Error fetching card:', error);
      }
    };

    fetchCard();
  }, [id]);

  return (
    <div className="min-h-screen relative bg-gradient-to-b from-gray-600 to-indigo-900 flex flex-col items-center overflow-hidden">
      <div className="px-60 py-6 w-full">
        {card ? (
          <div className="mt-20 text-white flex justify-center">
            <div className="w-1/2 pr-8">
              <img src={`/images/${card.imageID}.png`} alt={card.cardName} />
            </div>
            <div className="w-1/2">
              <h2 className="text-4xl mb-6">Card Name:  {card.cardName}</h2>
              <p className="text-2xl mb-4">Card ID:  {card.cardID}</p>
              <p className="text-2xl mb-4">Set ID:  {card.setID}</p>
              <p className="text-2xl mb-4">Card Type:  {card.cardType}</p>
              <p className="text-2xl mb-4">Description:  {card.cardtext}</p>
            </div>
          </div>
        ) : (
          <p>Loading...</p>
        )}
      </div>

      <div className="mt-auto mb-4"> 
        <p className="text-white text-sm">
          Visit our GitHub repository: {' '}
          <a href="https://github.com/EthanWen11/ATCG-Database-Project" target="_blank" rel="noopener noreferrer" className="text-indigo-400 hover:underline">GitHub Repo</a>
        </p>
      </div>
    </div>
  );
};

export default CardDetails;
