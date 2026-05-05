```html
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Шпион: Машины и Категории</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@700;900&family=Inter:wght@400;600&display=swap');
        
        body {
            font-family: 'Inter', sans-serif;
            background-color: #0f172a;
            color: #ffffff;
            overflow-x: hidden;
            touch-action: manipulation;
        }

        h1, h2 { font-family: 'Montserrat', sans-serif; }

        .card-container {
            perspective: 1000px;
            width: 300px;
            height: 420px;
        }

        .card-inner {
            position: relative;
            width: 100%;
            height: 100%;
            transition: transform 0.6s cubic-bezier(0.34, 1.56, 0.64, 1);
            transform-style: preserve-3d;
        }

        .card-inner.is-flipped {
            transform: rotateY(180deg);
        }

        .card-face {
            position: absolute;
            width: 100%;
            height: 100%;
            backface-visibility: hidden;
            border-radius: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 24px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.5);
            overflow: hidden; /* Защита от вылета текста */
        }

        .card-front {
            background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
            border: 5px solid #3b82f6;
        }

        .card-back {
            background: #ffffff;
            color: #1a1a2e;
            transform: rotateY(180deg);
        }

        /* Адаптивный текст для длинных слов */
        #role-value {
            word-wrap: break-word;
            word-break: break-word;
            hyphens: auto;
            max-width: 100%;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
            line-height: 1.1;
        }

        .category-btn {
            transition: all 0.2s;
            border: 2px solid #334155;
        }

        .category-btn.active {
            border-color: #3b82f6;
            background-color: rgba(59, 130, 246, 0.2);
            transform: scale(1.02);
        }

        .custom-range::-webkit-slider-thumb {
            -webkit-appearance: none;
            appearance: none;
            width: 24px;
            height: 24px;
            background: #3b82f6;
            cursor: pointer;
            border-radius: 50%;
        }
    </style>
</head>
<body class="min-h-screen flex flex-col items-center justify-start p-4">

    <!-- Экран настроек -->
    <div id="setup-screen" class="w-full max-w-md space-y-6">
        <div class="text-center py-6">
            <h1 class="text-5xl font-black text-white tracking-tighter uppercase italic">Шпион</h1>
            <p class="text-blue-500 font-bold text-xs tracking-widest mt-1">ВЫБЕРИТЕ КАТЕГОРИЮ</p>
        </div>

        <div class="grid grid-cols-3 gap-2">
            <button onclick="selectCategory('home', this)" class="category-btn active bg-slate-800 p-3 rounded-xl flex flex-col items-center">
                <span class="text-2xl mb-1">🏠</span>
                <span class="text-[10px] font-bold uppercase">Дом</span>
            </button>
            <button onclick="selectCategory('brawl', this)" class="category-btn bg-slate-800 p-3 rounded-xl flex flex-col items-center">
                <span class="text-2xl mb-1">🌵</span>
                <span class="text-[10px] font-bold uppercase tracking-tighter">Brawl Stars</span>
            </button>
            <button onclick="selectCategory('cars', this)" class="category-btn bg-slate-800 p-3 rounded-xl flex flex-col items-center">
                <span class="text-2xl mb-1">🏎️</span>
                <span class="text-[10px] font-bold uppercase">Машины</span>
            </button>
        </div>

        <div class="bg-slate-800/80 p-6 rounded-3xl space-y-6 border border-slate-700 shadow-2xl">
            <div>
                <div class="flex justify-between mb-2">
                    <span class="font-bold text-sm">Игроков:</span>
                    <span id="p-count-val" class="text-blue-400 font-black">3</span>
                </div>
                <input type="range" id="p-count" min="3" max="15" value="3" class="w-full h-2 bg-slate-700 rounded-lg appearance-none custom-range">
            </div>

            <div>
                <div class="flex justify-between mb-2">
                    <span class="font-bold text-sm">Шпионов:</span>
                    <span id="s-count-val" class="text-red-400 font-black">1</span>
                </div>
                <input type="range" id="s-count" min="1" max="3" value="1" class="w-full h-2 bg-slate-700 rounded-lg appearance-none custom-range">
            </div>

            <button onclick="initGame()" class="w-full bg-blue-600 hover:bg-blue-500 py-4 rounded-2xl font-black text-xl transition-all shadow-lg">
                ИГРАТЬ
            </button>
        </div>
    </div>

    <!-- Экран карточки -->
    <div id="reveal-screen" class="hidden w-full flex flex-col items-center mt-10">
        <div class="text-center mb-6">
            <h2 class="text-2xl font-black">Игрок #<span id="current-player">1</span></h2>
            <p id="hint-text" class="text-blue-400 font-bold text-xs uppercase mt-1 animate-pulse">Нажми, чтобы увидеть</p>
        </div>

        <div class="card-container" onclick="toggleCard()">
            <div id="card-inner" class="card-inner">
                <div class="card-face card-front">
                    <div class="text-8xl mb-4">🕵️‍♂️</div>
                    <p class="font-black text-xl tracking-widest text-blue-400">КТО ТЫ?</p>
                </div>
                <div class="card-face card-back">
                    <p id="role-label" class="text-slate-400 uppercase font-bold text-xs mb-3">Ваше слово:</p>
                    <h3 id="role-value" class="text-3xl font-black text-center px-2">---</h3>
                    <div id="category-badge" class="mt-8 px-4 py-1 bg-slate-100 rounded-full text-[10px] font-bold uppercase text-slate-500">КАТЕГОРИЯ</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Экран самой игры -->
    <div id="game-screen" class="hidden w-full max-w-sm text-center mt-10">
        <h2 class="text-4xl font-black mb-6">ИГРАЕМ!</h2>
        
        <div class="bg-blue-900/20 p-8 rounded-3xl backdrop-blur-md border border-blue-500/20 mb-6">
            <p class="text-slate-300 mb-2">Все узнали свои роли.</p>
            <p class="text-blue-400 font-bold uppercase text-sm">Время задавать вопросы!</p>
        </div>

        <button id="reveal-spy-btn" onclick="showResults()" class="w-full bg-slate-800 hover:bg-slate-700 border border-slate-600 py-4 rounded-2xl font-bold text-sm shadow-lg mb-4 transition-all">
            УЗНАТЬ, КТО ШПИОН
        </button>

        <div id="results-area" class="hidden space-y-4 text-left">
            <div class="bg-slate-900 p-6 rounded-3xl border border-blue-500/50">
                <p class="text-slate-500 text-[10px] uppercase font-bold mb-1">Секретное слово:</p>
                <p id="final-word" class="text-2xl font-black text-blue-400"></p>
                <hr class="my-4 border-slate-800">
                <p class="text-slate-500 text-[10px] uppercase font-bold mb-2">Шпионы:</p>
                <div id="spy-list" class="flex flex-wrap gap-2"></div>
            </div>
        </div>

        <button onclick="location.reload()" class="mt-10 text-slate-500 text-sm font-bold underline">ВЕРНУТЬСЯ В МЕНЮ</button>
    </div>

    <script>
        const CATEGORIES = {
            home: {
                name: "Дом",
                words: ["Холодильник", "Микроволновка", "Телевизор", "Стиральная машина", "Посудомойка", "Диван", "Обеденный стол", "Зеркало", "Шкаф-купе", "Пылесос", "Чайник", "Тостер", "Кондиционер", "Кофемашина", "Люстра", "Ванна", "Душевая кабина", "Ковёр", "Шторы", "Балкон", "Кладовка", "Кухонная плита", "Вытяжка"]
            },
            brawl: {
                name: "Brawl Stars",
                words: ["Шелли", "Кольт", "Эль Примо", "Поко", "Роза", "Брок", "Динамайк", "Тик", "Рико", "Дэррил", "Пенни", "Карл", "Пайпер", "Фрэнк", "Биби", "Мортис", "Тара", "Джин", "Спайк", "Ворон", "Леон", "Сэнди", "Амбер", "Эдгар", "Базз", "Гас", "Честер"]
            },
            cars: {
                name: "Марки машин",
                words: ["Мерседес", "БМВ", "Ауди", "Тойота", "Лексус", "Порше", "Феррари", "Ламборгини", "Тесла", "Хендай", "Киа", "Фольксваген", "Шевроле", "Форд", "Ниссан", "Мицубиси", "Субару", "Мазда", "Хонда", "Вольво", "Ягуар", "Бентли", "Роллс-Ройс"]
            }
        };

        let state = {
            category: 'home',
            players: 3,
            spies: 1,
            secretWord: '',
            roles: [],
            currentIdx: 0,
            isRevealed: false
        };

        // Логика ползунков
        const pInput = document.getElementById('p-count');
        const sInput = document.getElementById('s-count');
        
        pInput.oninput = function() {
            state.players = parseInt(this.value);
            document.getElementById('p-count-val').innerText = state.players;
            let maxSpies = Math.max(1, Math.floor(state.players / 2));
            sInput.max = maxSpies;
            if(parseInt(sInput.value) > maxSpies) {
                sInput.value = maxSpies;
                document.getElementById('s-count-val').innerText = maxSpies;
            }
        };

        sInput.oninput = function() {
            state.spies = parseInt(this.value);
            document.getElementById('s-count-val').innerText = state.spies;
        };

        function selectCategory(cat, btn) {
            state.category = cat;
            document.querySelectorAll('.category-btn').forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
        }

        function initGame() {
            state.players = parseInt(pInput.value);
            state.spies = parseInt(sInput.value);
            
            const list = CATEGORIES[state.category].words;
            state.secretWord = list[Math.floor(Math.random() * list.length)];
            
            // Распределение ролей
            state.roles = new Array(state.players).fill('normal');
            let sCount = 0;
            while(sCount < state.spies) {
                let r = Math.floor(Math.random() * state.players);
                if(state.roles[r] === 'normal') {
                    state.roles[r] = 'spy';
                    sCount++;
                }
            }

            document.getElementById('setup-screen').classList.add('hidden');
            document.getElementById('reveal-screen').classList.remove('hidden');
            updateUI();
        }

        function toggleCard() {
            const inner = document.getElementById('card-inner');
            const hint = document.getElementById('hint-text');

            if(!state.isRevealed) {
                inner.classList.add('is-flipped');
                state.isRevealed = true;
                hint.innerText = "Нажми, чтобы скрыть карту";
            } else {
                inner.classList.remove('is-flipped');
                state.isRevealed = false;
                
                setTimeout(() => {
                    state.currentIdx++;
                    if(state.currentIdx < state.players) {
                        updateUI();
                        hint.innerText = "Нажми, чтобы увидеть";
                    } else {
                        showGame();
                    }
                }, 300);
            }
        }

        function updateUI() {
            document.getElementById('current-player').innerText = state.currentIdx + 1;
            const label = document.getElementById('role-label');
            const val = document.getElementById('role-value');
            const badge = document.getElementById('category-badge');

            badge.innerText = CATEGORIES[state.category].name;

            if(state.roles[state.currentIdx] === 'spy') {
                label.innerText = "Твоя секретная роль:";
                val.innerText = "ШПИОН 🕵️‍♂️";
                val.style.color = "#ef4444";
                val.classList.remove('text-3xl');
                val.classList.add('text-4xl');
            } else {
                label.innerText = "Твое слово:";
                val.innerText = state.secretWord;
                val.style.color = "#1e293b";
                val.classList.remove('text-4xl');
                val.classList.add('text-3xl');
            }
            
            // Динамическая подстройка шрифта для длинных слов
            if (val.innerText.length > 12) {
                val.style.fontSize = '1.5rem';
            } else {
                val.style.fontSize = '';
            }
        }

        function showGame() {
            document.getElementById('reveal-screen').classList.add('hidden');
            document.getElementById('game-screen').classList.remove('hidden');
        }

        function showResults() {
            const results = document.getElementById('results-area');
            const btn = document.getElementById('reveal-spy-btn');
            const spyList = document.getElementById('spy-list');
            const finalWord = document.getElementById('final-word');

            finalWord.innerText = state.secretWord;
            spyList.innerHTML = '';
            
            state.roles.forEach((role, idx) => {
                if(role === 'spy') {
                    const span = document.createElement('span');
                    span.className = "bg-red-500/10 text-red-500 border border-red-500/20 px-3 py-1 rounded-lg font-bold text-xs";
                    span.innerText = `Игрок ${idx + 1}`;
                    spyList.appendChild(span);
                }
            });

            results.classList.remove('hidden');
            btn.classList.add('hidden');
        }
    </script>
</body>
</html>

```
