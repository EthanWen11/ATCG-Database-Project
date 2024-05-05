import React from 'react';
import { Link } from 'react-router-dom';
import SearchForm from '../components/SearchForm';

const Home = () => {
  return (
    <div className="min-h-screen relative bg-gradient-to-b from-gray-600 to-indigo-900 flex flex-col items-center overflow-hidden">
      <div className="mt-40">
        <img src="/Nexus.png" alt="Nexus Logo" className="w-36 h-36 mb-8 mx-auto" />
        <h1 className="text-white text-4xl font-bold mb-2 text-center">ATCG Database</h1>
        <p className="text-white text-lg mb-8 text-center">Search and explore cards from the Apostleland Trading Card Game.</p>
        <SearchForm />
        <div className="flex justify-center mt-4">
          <Link to="/Home.js">
            <button className="mr-4 px-4 py-1 border border-gray-500 bg-gray-600 text-white rounded-md hover:bg-gray-500 focus:outline-none">Advanced Search</button>
          </Link>
          <Link to="/Home.js">
            <button className="mx-4 px-4 py-1 border border-gray-500 bg-gray-600 text-white rounded-md hover:bg-gray-500 focus:outline-none">All Card Sets</button>
          </Link>
          <Link to="/Home.js">
            <button className="ml-4 px-4 py-1 border border-gray-500 bg-gray-600 text-white rounded-md hover:bg-gray-500 focus:outline-none">Random Card Generator</button>
          </Link>
        </div>
      </div>
      <div className="absolute bottom-7 right-0 transform -rotate-45 translate-x-10 translate-y-10 hover:translate-x-5 hover:translate-y-2 transition duration-500 cursor-pointer">
        <img src="/cardEx.png" alt="Example Card1" className="h-auto w-40" />
      </div>
      <div className="absolute bottom-0 right-12 transform -rotate-45 translate-x-10 translate-y-10 hover:translate-x-5 hover:translate-y-2 transition duration-500 cursor-pointer">
        <img src="/cardEx.png" alt="Example Card1" className="h-auto w-40" />
      </div>
      <div className="absolute bottom-7 left-0 transform rotate-45 -translate-x-10 translate-y-10 hover:-translate-x-5 hover:translate-y-2 transition duration-500 cursor-pointer">
        <img src="/cardEx.png" alt="Example Card2" className="h-auto w-40" />
      </div>
      <div className="absolute bottom-0 left-12 transform rotate-45 -translate-x-10 translate-y-10 hover:-translate-x-5 hover:translate-y-2 transition duration-500 cursor-pointer">
        <img src="/cardEx.png" alt="Example Card2" className="h-auto w-40" />
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
