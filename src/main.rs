use std::io;
use tui::Terminal;
use tui::backend::CrosstermBackend;
use curl::easy::Easy;

fn main() -> Result<(), io::Error> {
    let stdout = io::stdout();
    let backend = CrosstermBackend::new(stdout);
    let mut terminal = Terminal::new(backend)?;
    Ok(());
    let mut woltest = Easy::new();
    woltest.url("https://scrap.madiator.com/api/is_online?v=2").unwrap();
    let mut woltest_trans = woltest.transfer();
    woltest_trans.
    
    
}
