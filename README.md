# 📈 New Franc Simulator – Haskell Project

This Haskell program simulates the impact of war, economic growth, and public trust on a fictional currency called the **"New Franc"** over several years.

---

## ⚙️ How to Set Up Haskell on Windows 11

To run this project, you'll need to install the Haskell toolchain.

### 1. Install Haskell via GHCup (Recommended)

**GHCup** is the easiest way to install Haskell on Windows.

🔗 [https://www.haskell.org/ghcup/](https://www.haskell.org/ghcup/)

#### Steps:
1. Download and run the GHCup installer for Windows.
2. During installation, select:
   - GHC (the compiler)
   - Cabal (build tool)
   - HLS (optional: Haskell Language Server)
3. After installation, verify it worked:
   ```bash
   ghc --version
   cabal --version



🚀 How to Run the Program
Open a terminal or PowerShell

- Navigate to your project directory:

   1. cd path\to\NewFrancSimulator

- Compile the program:

   1. ghc Main.hs
- Run the generated executable:

   1. ./Main.exe     





📜 Explanation of the Code
🔹 Data Model

data YearStats = YearStats
  { yr :: Int        
  , warImpact :: Double   
  , economyGrowth :: Double 
  , trustLevel :: Double  
  }
Each YearStats value represents data for a single year: war impact, economic growth, and public trust level.

🔹 Simulation Logic
calculateNewFranc takes the stats for a year and the current currency value.

It calculates the next year's currency based on:

  -War penalty: war * 0.3

Economic bonus: economyGrowth * 0.2

Trust boost: trustLevel * 0.5

Formula:

  -newValue = oldValue * (1 + bonus + boost - penalty)

🔹 Recursive Simulation

simulateAllYears :: Double -> [YearStats] -> IO ()
This function prints the value of the currency for each year.

It uses recursion to step through each YearStats entry.

Currency changes are printed year-by-year.

🔹 Entry Point

   main :: IO ()
   main = do
   let startFranc = 100.0
   simulateAllYears startFranc yearStatsList

  
- Starts with a New Franc value of 100.0 in 1954.
- Simulates until 1962 using historical-like stats.
