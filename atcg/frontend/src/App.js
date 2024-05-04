import { Routes, Route } from "react-router-dom"
import Home from "./pages/Home";
import Search from "./pages/Search";

// root page for navigation
function App() {
  return (
    <div>
      <Routes>
        {/* define your routes here */}
        <Route path="/" element={<Home />} />
        <Route path="search" element={<Search />} />
      </Routes>
    </div>
  );
}

export default App;
