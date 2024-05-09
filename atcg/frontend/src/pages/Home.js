import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import SearchForm from '../components/SearchForm';

const Home = () => {
  const [randomCard, setRandomCard] = useState(null);

  useEffect(() => {
    const fetchRandomCard = async () => {
      try {
        const response = await fetch('http://localhost:3001/cards/random');
        if (response.ok) {
          const data = await response.json();
          setRandomCard(data);
        } else {
          throw new Error('Failed to fetch random card');
        }
      } catch (error) {
        console.error('Error fetching random card:', error);
      }
    };

    fetchRandomCard();
  }, []);

  return (
    <div className="min-h-screen relative bg-gradient-to-b from-gray-600 to-indigo-900 flex flex-col items-center overflow-hidden">
      <div className="mt-10">
        <img src="/Nexus.png" alt="Nexus Logo" className="w-36 h-36 mb-6 mt-20 mx-auto" />
        <h1 className="text-white text-4xl font-bold mb-2 text-center">ATCG Database</h1>
        <p className="text-white text-lg mb-8 text-center">Search and explore cards from the Apostleland Trading Card Game.</p>
        <SearchForm />
        <div className="flex justify-center mt-4">
          <Link to="/advanced">
            <button className="mr-4 px-4 py-1 border border-gray-500 bg-gray-600 text-white rounded-md hover:bg-gray-500 focus:outline-none">Advanced Search</button>
          </Link>
          <Link to="/card/068">
            <button className="mx-4 px-4 py-1 border border-gray-500 bg-gray-600 text-white rounded-md hover:bg-gray-500 focus:outline-none">All Card Sets</button>
          </Link>
          <Link to={`/card/${randomCard?.setID}/${randomCard?.cardID}`}>
            <button className="ml-4 px-4 py-1 border border-gray-500 bg-gray-600 text-white rounded-md hover:bg-gray-500 focus:outline-none">Random Card Generator</button>
          </Link>
        </div>
      </div>
      <div className="absolute bottom-7 right-0 transform -rotate-45 translate-x-10 translate-y-2 hover:translate-x-1 hover:-translate-y-12 transition duration-500 cursor-pointer">
        <Link to="/card/CLA/068">
          <img src="/images/10115.png" alt="Example Card1" className="h-auto w-60" />
        </Link>
      </div>
      <div className="absolute bottom-0 right-12 transform -rotate-45 translate-x-10 translate-y-20 hover:translate-x-5 hover:translate-y-10 transition duration-500 cursor-pointer">
      <Link to="/card/CLA/065"> 
        <img src="/images/10112.png" alt="Example Card2" className="h-auto w-60" />
      </Link>
      </div>
      <div className="absolute bottom-7 left-0 transform rotate-45 -translate-x-10 translate-y-2 hover:-translate-x-1 hover:-translate-y-12 transition duration-500 cursor-pointer">
      <Link to="/card/CLA/069"> 
        <img src="/images/10116.png" alt="Example Card3" className="h-auto w-60" />
      </Link>
      </div>
      <div className="absolute bottom-0 left-12 transform rotate-45 -translate-x-10 translate-y-20 hover:-translate-x-5 hover:translate-y-10 transition duration-500 cursor-pointer">
      <Link to="/card/CLA/070"> 
        <img src="/images/10117.png" alt="Example Card4" className="h-auto w-60" />
      </Link>
      </div>
      <div className="mt-auto mb-4"> {/* Position at the bottom */}
        <p className="text-white text-sm">
          Visit our GitHub repository: {' '}
          <a href="https://github.com/EthanWen11/ATCG-Database-Project" target="_blank" rel="noopener noreferrer" className="text-indigo-400 hover:underline">GitHub Repo</a>
        </p>
      </div>
    </div>
  );
};

export default Home;
