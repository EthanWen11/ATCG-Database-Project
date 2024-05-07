import { Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import Search from "./pages/Search";
import AdvancedSearch from "./pages/AdvancedSearch"; // Import AdvancedSearch component
import Test from "./pages/Test";
import Navbar from "./components/Navbar";

function App() {
  return (
    <div>
      <Navbar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/search" element={<Search />} />
        <Route path="/advanced" element={<AdvancedSearch />} /> {/* Add this route */}
        <Route path="/test" element={<Test />}/>
      </Routes>
    </div>
  );
}

export default App;
