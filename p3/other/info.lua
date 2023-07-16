local node_name = os.getenv("NODE_NAME") or "Empty_env"
local node_ip = os.getenv("NODE_IP") or "Empty_env"
local pod_name = os.getenv("POD_NAME") or "Empty_env"
local pod_ip = os.getenv("POD_IP") or "Empty_env"

local html = [[
    <html>
        <head>
                <title>Page Title</title>

            </head>
            <body>
                <div class="glitch-wrapper">
                    <div class="glitch" data-glitch="Iot - SSH">Iot - SSH - v2</div>
                </div>
                <p class="button-89" role="button">Hello from ]] .. ngx.var.host .. [[</p>
                <p>Node: ]] .. node_name .. [[ -> Ip: ]] .. node_ip .. [[</p>
                <p>Pod: ]] .. pod_name .. [[ -> Ip: ]] .. pod_ip .. [[</p>

            <style>
                body {
                color: #fff;
                background: #141E30;  /* fallback for old browsers */
                background: -webkit-linear-gradient(to left, #243B55, #141E30);  /* Chrome 10-25, Safari 5.1-6 */
                background: linear-gradient(to left, #243B55, #141E30); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                text-align: center;
                }
                .glitch-wrapper {
                width: 100%;
                height: 40%;
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
                #background-color: #222;
                }
                .glitch {
                position: relative;
                font-size: 80px;
                font-weight: 700;
                line-height: 1.2;
                color: #fff;
                letter-spacing: 5px;
                z-index: 1;
                }
                .glitch:before,
                .glitch:after {
                display: block;
                content: attr(data-glitch);
                position: absolute;
                top: 0;
                left: 0;
                opacity: 0.8;
                }
                .glitch:before {
                animation: glitch-color 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94) both infinite;
                color: #0ff;
                z-index: -1;
                }
                .glitch:after {
                animation: glitch-color 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94) reverse both infinite;
                color: #ff00ff;
                z-index: -2;
                }
                @keyframes glitch-color {
                0% {
                    transform: translate(0);
                }
                20% {
                    transform: translate(-3px, 3px);
                }
                40% {
                    transform: translate(-3px, -3px);
                }
                60% {
                    transform: translate(3px, 3px);
                }
                80% {
                    transform: translate(3px, -3px);
                }
                to {
                    transform: translate(0);
                }
                }
                .button-89 {
                    margin: auto;
                    width: 50%;
                    text-align: center;
                    --b: 3px;   /* border thickness */
                    --s: .45em; /* size of the corner */
                    --color: #fff;
                    
                    padding: calc(.5em + var(--s)) calc(.9em + var(--s));
                    color: var(--color);
                    --_p: var(--s);
                    background:
                        conic-gradient(from 90deg at var(--b) var(--b),#0000 90deg,var(--color) 0)
                        var(--_p) var(--_p)/calc(100% - var(--b) - 2*var(--_p)) calc(100% - var(--b) - 2*var(--_p));
                    transition: .3s linear, color 0s, background-color 0s;
                    outline: var(--b) solid #0000;
                    outline-offset: .6em;
                    font-size: 16px;

                    border: 0;

                    user-select: none;
                    -webkit-user-select: none;
                    touch-action: manipulation;
                }

                .button-89:hover,
                .button-89:focus-visible{
                    --_p: 0px;
                    outline-color: var(--color);
                    outline-offset: .05em;
                }

                .button-89:active {
                    background: var(--color);
                    color: #fff;
                }
            </style>

        </body>
    </html>
]]

ngx.say(html)