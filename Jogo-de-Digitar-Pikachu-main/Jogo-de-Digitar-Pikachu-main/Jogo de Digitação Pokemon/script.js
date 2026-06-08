// Frases por fase
const phase1Phrases = [
  "Pikachu fugiu!",
  "Corre Pikachu!",
  "A Equipe Rocket errou",
  "Ash está longe",
  "Não olhe para trás",
  "Siga pela floresta",
  "Cuidado com os arbustos",
  "Ouvi um barulho",
  "Use o choque se precisar",
  "A liberdade é logo ali",
  "O céu está claro",
  "Ouça a voz do Ash",
  "Sinta o vento",
  "Coragem Pikachu",
  "Você consegue fugir"
];
const phase2Phrases = [
  "A Equipe Rocket está vindo",
  "Pikachu, corra mais rápido!",
  "Eles não vão te pegar",
  "Use sua velocidade",
  "Ash está cada vez mais perto",
  "Você não pode parar agora",
  "Pikachu sente o perigo",
  "Você consegue escapar",
  "Corra pela montanha",
  "A floresta é o seu caminho"
];

const phase3Phrases = [
  "Equipe Rocket está atacando",
  "Prepare-se para esquivar",
  "Uma Pokebola foi lançada",
  "Pikachu precisa pular agora"
];

const attackPhrases = new Set([
  "Pikachu esquiva dos golpes",
  "Cuidado com o ataque surpresa",
  "Pikachu precisa pular agora",
  "Prepare-se para esquivar",
  "Equipe Rocket está atacando",
  "Jessie planeja um ataque"
]);

// Elementos DOM
const displayPhrase = document.getElementById("displayPhrase");
const wordInput = document.getElementById("wordInput");
const statusText = document.getElementById("status");
const scoreDisplay = document.getElementById("score");
const pichu = document.getElementById("pichu");
const pikachu = document.getElementById("pikachu");
const pokeball = document.getElementById("pokeball");
const pokebolaLanca = document.getElementById("pokebolaLanca");
const equipeRocket = document.getElementById("equipeRocket");
const gameOverImage = document.getElementById("gameOverImage");
const background = document.querySelector(".background");
const chao = document.querySelector(".chao");

// Sons
const somPuloPikachu = new Audio("pokemons/sons/som puloPikachu.mp3");

let currentPhrase = "";
let words = [];
let currentWordIndex = 0;
let score = 0;

let captured = false;
let hadPoints = false;  // o jogador já ganhou pontos pelo menos 1 vez?
let currentPhase = 1;

let pokebolaAnimationFrame = null;
let pokebolaPosX = -100; 
const pokebolaSpeed = 100;
let pulando = false;
let pokebolaAtiva = false;

function getRandomPhrase() {
  if (score < 50) return phase1Phrases[Math.floor(Math.random() * phase1Phrases.length)];
  if (score < 100) return phase2Phrases[Math.floor(Math.random() * phase2Phrases.length)];
  return phase3Phrases[Math.floor(Math.random() * phase3Phrases.length)];
}

function updatePhraseDisplay() {
  displayPhrase.innerHTML = words
    .map((word, i) => {
      if (i < currentWordIndex) return `<span style="color: green;">${word}</span>`;
      if (i === currentWordIndex) return `<span style="color: orange; font-weight: bold;">${word}</span>`;
      return word;
    })
    .join(" ");
}

function updateScoreDisplay() {
  scoreDisplay.textContent = score;
}

function moveCharacter() {
  const leftStart = 120, leftMax = 920;
  const leftPos = leftStart + (score / 150) * (leftMax - leftStart);
  const character = currentPhase >= 2 ? pikachu : pichu;
  character.style.left = `${Math.min(leftPos, leftMax)}px`;
}

function showGameOver() {
  pichu.style.display = "none";
  pikachu.style.display = "none";
  pokeball.style.display = "none";
  equipeRocket.style.display = "none";
  pokebolaLanca.style.display = "none";
  gameOverImage.style.display = "block";
  statusText.textContent = "❌ Game Over! Pikachu foi capturado!";
  statusText.style.color = "red";
  wordInput.disabled = true;
  captured = true;
  cancelAnimationFrame(pokebolaAnimationFrame);
  somGameOver.play();
}

function updateStageVisuals() {
  if (score >= 50) {
    currentPhase = score < 100 ? 2 : 3;
    pichu.style.display = "none";
    pikachu.style.display = "block";
    pokeball.style.display = "none";
    equipeRocket.style.display = "block";
    background.classList.add("fase3");
    chao.classList.add("fase3");
  } else {
    currentPhase = 1;
    pichu.style.display = "block";
    pikachu.style.display = "none";
    pokeball.style.display = "block";
    equipeRocket.style.display = "none";
    background.classList.remove("fase3");
    chao.classList.remove("fase3");
  }
}

function pikachuPula() {
  if (pulando) return;
  pulando = true;
  pikachu.classList.add("pulando");
  somPuloPikachu.play();
  setTimeout(() => {
    pikachu.classList.remove("pulando");
    pulando = false;
  }, 600);
}

function animarPokebola(timestamp) {
  if (!pokebolaLanca.startTime) pokebolaLanca.startTime = timestamp;
  const elapsed = (timestamp - pokebolaLanca.startTime) / 1000;
  pokebolaPosX = -100 + pokebolaSpeed * elapsed;
  pokebolaLanca.style.left = `${pokebolaPosX}px`;
  pokebolaLanca.style.bottom = "150px";

  const bolaRect = pokebolaLanca.getBoundingClientRect();
  const pikaRect = pikachu.getBoundingClientRect();
  const colidiu =
    bolaRect.right > pikaRect.left &&
    bolaRect.left < pikaRect.right &&
    bolaRect.bottom > pikaRect.top &&
    bolaRect.top < pikaRect.bottom;

  if (colidiu && !pulando && !captured && pokebolaAtiva) {
    showGameOver();
    return;
  }

  if (pokebolaPosX > window.innerWidth + 50) {
    pokebolaLanca.style.display = "none";
    pokebolaLanca.startTime = null;
    pokebolaAtiva = false;
    cancelAnimationFrame(pokebolaAnimationFrame);
    return;
  }

  pokebolaAnimationFrame = requestAnimationFrame(animarPokebola);
}

function lancarPokebola() {
  if (captured) return;
  pokebolaAtiva = true;
  pokebolaPosX = -100;
  pokebolaLanca.style.display = "block"; // visivel na tela
  pokebolaLanca.style.left = `${pokebolaPosX}px`;
  pokebolaLanca.style.bottom = "150px";
  pokebolaLanca.startTime = null;
  pokebolaAnimationFrame = requestAnimationFrame(animarPokebola);
}

function startNewPhrase() {
  currentPhrase = getRandomPhrase();
  words = currentPhrase.split(" ");
  currentWordIndex = 0;
  wordInput.value = "";
  wordInput.disabled = false;
  statusText.textContent = "";
  captured = false;
  gameOverImage.style.display = "none";
  updateStageVisuals();
  updatePhraseDisplay();
  moveCharacter();

  if ((currentPhase === 2 || currentPhase === 3) && attackPhrases.has(currentPhrase)) {
    setTimeout(() => {
      if (!captured && !wordInput.disabled && currentPhrase === getCurrentFullPhrase()) {
        lancarPokebola();
      }
    }, 300);
  }
}

function getCurrentFullPhrase() {
  return words.join(" ");
}

function pikachuCorreEdesaparece() {
  let posX = parseInt(window.getComputedStyle(pikachu).left) || 200;
  const finalX = window.innerWidth + 100;
  function correr() {
    if (posX < finalX) {
      posX += 5;
      pikachu.style.left = `${posX}px`;
      requestAnimationFrame(correr);
    } else {
      pikachu.style.display = "none";
      equipeRocket.src = "pokemons/explosao.gif";
      equipeRocket.style.width = "180px";
      equipeRocket.style.height = "auto";
      equipeRocket.style.display = "block";
      statusText.textContent = "🏆 Pikachu reencontrou Ash! Equipe Rocket explodiu!";
      statusText.style.color = "green";
      setTimeout(() => {
        showVictoryCreditsScreen();
      }, 3000);
    }
  }
  correr();
}

function showVictoryCreditsScreen() {
  pichu.style.display = "none";
  pikachu.style.display = "none";
  pokeball.style.display = "none";
  equipeRocket.style.display = "none";
  pokebolaLanca.style.display = "none";
  displayPhrase.style.display = "none";
  wordInput.style.display = "none";
  statusText.style.display = "none";
  scoreDisplay.style.display = "none";
  chao.style.display = "none";

  const creditsScreen = document.createElement("div");
  creditsScreen.id = "creditsScreen";
  creditsScreen.style = `position:fixed;top:0;left:0;width:100%;height:100%;background:#000;background-image:url('https://25.media.tumblr.com/17476fb682e3a7ae467335b718abb8a5/tumblr_mh3f9iuGE71rttekgo1_500.gif');background-size:cover;background-position:center;display:flex;flex-direction:column;align-items:center;justify-content:center;z-index:9999;color:#fff;text-align:center;padding:20px;`;

  creditsScreen.innerHTML = `
    <h1 style="font-size:3em;margin-bottom:20px;">🏆 Parabéns! Você venceu!</h1>
    <p style="font-size:2em;margin-bottom:30px;">Sua pontuação final: ${score}</p>
    <p style="font-size:1.2em;margin-bottom:40px;">
      Obrigado por jogar!
    </p>
    <button style="font-size:1.5em;padding:10px 20px;cursor:pointer;border:none;border-radius:10px;background-color:#d2aa45;color:#fff;" onclick="document.body.removeChild(document.getElementById('creditsScreen')); restartGame();">
      Jogar Novamente
    </button>`;

  document.body.appendChild(creditsScreen);
}

function restartGame() {
  score = 0;
  hadPoints = false;
  captured = false;
  currentPhase = 1;
  wordInput.disabled = false;
  wordInput.value = "";
  scoreDisplay.style.display = "block";
  displayPhrase.style.display = "block";
  wordInput.style.display = "inline-block";
  statusText.style.display = "block";
  chao.style.display = "block";
  pichu.style.display = "block";
  pikachu.style.display = "none";
  pokeball.style.display = "block";
  equipeRocket.src = "pokemons/eguipe_rocked.png";
  equipeRocket.style.width = "130px";
  equipeRocket.style.height = "auto";
  equipeRocket.style.display = "none";
  pokebolaLanca.style.display = "none";
  background.classList.remove("fase3");
  chao.classList.remove("fase3");
  updateScoreDisplay();
  startNewPhrase();
}

function verificaColisaoEquipeRocket() {
  if (score === 0 && currentPhase >= 2) {
    const pikaRect = pikachu.getBoundingClientRect();
    const rocketRect = equipeRocket.getBoundingClientRect();
    const colidiu =
      rocketRect.right > pikaRect.left &&
      rocketRect.left < pikaRect.right &&
      rocketRect.bottom > pikaRect.top &&
      rocketRect.top < pikaRect.bottom;
    if (colidiu && !captured) {
      showGameOver();
    }
  }
}

wordInput.addEventListener("input", () => {
  if (captured) return;
  const typed = wordInput.value.trim();
  const expected = words[currentWordIndex];

  if (typed === expected) {
    currentWordIndex++;
    wordInput.value = "";
    if (currentWordIndex === words.length) {
      if (attackPhrases.has(currentPhrase)) pikachuPula();
      score += 10;
      hadPoints = true;
      updateScoreDisplay();
      moveCharacter();
      verificaColisaoEquipeRocket();
      if (score >= 150) {
        wordInput.disabled = true;
        captured = true;
        cancelAnimationFrame(pokebolaAnimationFrame);
        statusText.textContent = "🎉 Pikachu venceu! Está correndo até Ash...";
        statusText.style.color = "green";
        pokebolaLanca.style.display = "none";
        pokebolaAtiva = false;
        pikachuCorreEdesaparece();
        return;
      }
      statusText.textContent = "✅ Frase completa! Próxima...";
      statusText.style.color = "green";
      setTimeout(startNewPhrase, 1000);
    }
  } else if (typed.length >= expected.length) {
    if (hadPoints) score = Math.max(0, score - 4);
    updateScoreDisplay();
    moveCharacter();
    statusText.textContent = "❌ Palavra incorreta!";
    statusText.style.color = "red";
    verificaColisaoEquipeRocket();
    if (score === 0 && hadPoints) {
      showGameOver();
      return;
    }
    wordInput.value = "";
  }
  updatePhraseDisplay();
});

updateScoreDisplay();
startNewPhrase();
