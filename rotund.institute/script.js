let key = '';

async function grabData(key) {
  const response = await fetch(`/store.lua?key=${key}`);

  if (response.status !== 200) {
    return;
  }

  localStorage.setItem('key', key);

  document.getElementById('auth').style.display = 'none';
  document.getElementById('video').style.display = 'flex';

  const {series} = await response.json();
  for (const show in series) {
    const showDiv = document.createElement("div");

    const showNameP = document.createElement("p")
    const showNameContent = document.createTextNode(show);
    showNameP.appendChild(showNameContent);
    showDiv.appendChild(showNameP);

    for (const episode of series[show]) {
      const episodeButton = document.createElement("button")
      const episodeButtonContent = document.createTextNode(`${episode}`);
      episodeButton.setAttribute("onclick", `document.getElementById('player').src = '/?series=${show}&episode=${episode}&key=${key}'`);
      episodeButton.appendChild(episodeButtonContent);
      showDiv.appendChild(episodeButton);
    }

    document.getElementById("select").appendChild(showDiv);
  }
}

(async () => {
  const storedKey = localStorage.getItem("key");

  if (storedKey !== null) {
    grabData(storedKey);
  }

  document.querySelector("button").onclick = (event) => {
    grabData(document.getElementById('key').value);
  };
})();
