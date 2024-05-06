import { Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import Search from "./pages/Search";
import AdvancedSearch from "./pages/AdvancedSearch"; // Import AdvancedSearch component

function App() {
  return (
    <div>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/search" element={<Search />} />
        <Route path="/Advanced" element={<AdvancedSearch />} /> {/* Add this route */}
      </Routes>
    </div>
  );
}

export default App;
