<script setup lang="ts">
import { ref, onMounted } from 'vue';
import {
  Zap, Shield, Globe, Box, Github,
  Search, Cpu, Layers,
  Terminal, Wifi, Code, Network,
  Server, Gauge // Ícones novos para representar Go/Server e Performance
} from 'lucide-vue-next';

// Imports do framework Vatts (versão Vue)
import { importServer, Link, VattsImage } from "vatts/vue";

// Componentes
import Footer from "./components/Footer.vue";
// Server RPC
const api = importServer<typeof import("../backend/helper")>("../backend/helper");
const { PackageVersion } = api;

// State
const version = ref("1.0.0");
const primaryColor = "#a8a8a8";

// Lifecycle
onMounted(async () => {
  try {
    const v = await PackageVersion();
    if (v !== null) {
      version.value = v;
    }
  } catch (e) {
    console.error("Failed to fetch version", e);
  }
});

// Particles

// Refs para animações
const heroTitle = ref(null);
const heroSubtitle = ref(null);
const heroButtons = ref(null);
const heroCmd = ref(null);
const featHeader = ref(null);
const featGrid = ref(null);
const archHeader = ref(null);
const archGrid = ref(null);

// Dados das Features para o v-for
const featuresList = [
  {
    icon: Layers,
    title: "Pattern Routing",
    desc: "Flexible route matching with regex support. Not just file-system based.",
    color: "text-purple-400",
    bg: "bg-purple-500/10",
    border: "hover:border-purple-500/30"
  },
  {
    icon: Zap,
    title: "Low-Level Optimization",
    desc: "Built-in bytecode optimizer for .js assets. Smaller bundles, faster parsing.",
    color: "text-orange-400",
    bg: "bg-orange-500/10",
    border: "hover:border-orange-500/30"
  },
  {
    icon: Wifi,
    title: "Native HTTP/3 Support",
    desc: "The only framework with native HTTP and built-in HTTP/3 support.",
    color: "text-teal-400",
    bg: "bg-teal-500/10",
    border: "hover:border-teal-500/30"
  },
  {
    icon: Code,
    title: "Native React support",
    desc: "Build fast, scalable, and modern interfaces using the most popular ecosystem.",
    color: "text-cyan-400",
    bg: "bg-cyan-500/10",
    border: "hover:border-cyan-500/30"
  },
  {
    icon: Box,
    title: "Native Vue.js support",
    desc: "Create elegant and highly productive applications with a smooth learning curve.",
    color: "text-emerald-400",
    bg: "bg-emerald-500/10",
    border: "hover:border-emerald-500/30"
  },
  {
    icon: Network,
    title: "Choose your framework",
    desc: "Pick React or Vue and work your way — no lock-in, no headaches.",
    color: "text-violet-400",
    bg: "bg-violet-500/10",
    border: "hover:border-violet-500/30"
  }
];
</script>
<script lang="ts">
import {Metadata} from "vatts/vue";

export function generateMetadata(): Metadata {
  return {
    title: 'Vatts.js | Landing'
  }
}
</script>
<template>
  <div class="min-h-screen bg-black text-slate-300 selection:bg-[#2b2b2a]/30 font-sans selection:text-white relative custom-scrollbar">

    <section class="relative z-10 pt-24 pb-20 px-6 text-left overflow-hidden border-b border-white/10">
      <div class="grid-background"> </div>
      <div class="grid-corner-circle circle-top-left"> </div>
      <div class="grid-corner-circle circle-bottom-right" > </div>

      <!-- Enhanced ambient glow -->
      <div class="absolute top-0 left-1/2 -translate-x-1/2 w-[800px] h-[800px] bg-white/5 rounded-full blur-[120px] pointer-events-none"></div>

      <div class="relative z-10 max-w-5xl mx-auto">
        <div
            class="vatts-reveal vatts-reveal-fade inline-block px-4 py-2 rounded-full border border-white/20 bg-white/10 backdrop-blur-xl text-white text-[10px] font-bold uppercase tracking-[0.2em] mb-8 shadow-lg"
            :style="{ '--d': '0ms' }"
        >
          Framework v{{ version }} {{ version.includes("canary") ? "" : 'Stable' }}
        </div>

        <h1
            ref="heroTitle"
            class="vatts-reveal vatts-reveal-up vatts-stagger text-6xl md:text-[100px] font-black text-white tracking-tighter leading-[0.9] mb-8 drop-shadow-2xl"
            :style="{ '--d': '90ms' }"
        >
          THE FRAMEWORK <br/>
          <span class="text-transparent bg-clip-text bg-gradient-to-r from-white via-gray-300 to-gray-400 drop-shadow-lg">FOR WEB.</span>
        </h1>

        <p
            ref="heroSubtitle"
            class="vatts-reveal vatts-reveal-up vatts-stagger max-w-2xl text-lg md:text-xl text-slate-300 leading-relaxed mb-12 font-medium drop-shadow-md"
            :style="{ '--d': '160ms' }"
        >
          Vatts.js is a high-performance full-stack primitive. It combines Node.js orchestration with a <strong class="text-white">Go-powered HTTP/3 core</strong> for unmatched speed and raw power.
        </p>

        <div
            ref="heroButtons"
            class="vatts-reveal vatts-reveal-up vatts-stagger flex flex-col sm:flex-row items-center gap-5"
            :style="{ '--d': '230ms' }"
        >
          <div :class="`p-[2px] rounded-2xl bg-gradient-to-br from-white/30 via-white/20 to-white/10 hover:from-white/40 hover:to-white/20 transition-all duration-500 vatts-tilt vatts-sheen`">
            <div ref="heroCmd" class="vatts-reveal vatts-reveal-fade vatts-stagger relative max-w-md" :style="{ '--d': '230ms' }">
              <div class="absolute inset-0 bg-white/30 blur-3xl rounded-full" />
              <Link href="/docs" class="text-black relative flex items-center justify-between gap-4 px-8 py-4 bg-gradient-to-br from-gray-100 to-gray-200 rounded-[14px] text-[18px] font-bold shadow-2xl hover:from-white hover:to-gray-100 transition-all">
                Get started
              </Link>
            </div>
          </div>

          <div :class="`p-[2px] rounded-2xl bg-gradient-to-br from-white/20 to-white/5 hover:from-white/30 hover:to-[${primaryColor}]/30 transition-all duration-500 vatts-tilt vatts-sheen`">
            <div ref="heroCmd" class="vatts-reveal vatts-reveal-fade vatts-stagger relative max-w-md" :style="{ '--d': '230ms' }">
              <div :class="`absolute inset-0 bg-[${primaryColor}]/30 blur-3xl rounded-full`" />
              <div class="relative flex items-center justify-between gap-4 px-6 py-4 bg-black/60 backdrop-blur-xl border border-white/20 rounded-[14px] text-sm font-mono shadow-2xl">
                <span :style="{ color: primaryColor }">$</span>
                <span class="text-slate-200 flex-1 text-left font-medium">npx create-vatts-app@latest</span>
                <Terminal :size="16" class="text-slate-500" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <div>
      <div class="pointer-events-none fixed inset-0 z-0">
        <div
            class="absolute inset-0 opacity-0"
            :style="{
            backgroundImage: 'radial-gradient(circle, rgba(255,255,255,0.9) 1px, transparent 1px)',
            backgroundSize: '30px 30px',
            maskImage: `radial-gradient(ellipse 100% 80% at 50% 50%, rgba(0,0,0,1) 45%, rgba(0,0,0,0.6) 70%, rgba(0,0,0,0.2) 85%, transparent 100%)`,
            WebkitMaskImage: `radial-gradient(ellipse 100% 80% at 50% 50%, rgba(0,0,0,1) 45%, rgba(0,0,0,0.6) 70%, rgba(0,0,0,0.2) 85%, transparent 100%)`,
            animation: 'fastReveal 1.5s ease-out forwards'
          }"
        ></div>
      </div>

      <section class="relative z-10 max-w-6xl mx-auto px-6 py-32">
        <div ref="archHeader" class="vatts-reveal vatts-reveal-up flex flex-col items-center mb-20">
          <h2 class="text-4xl font-black text-white text-center drop-shadow-lg">Engineered for Excellence</h2>
          <div class="w-24 h-1.5 mt-6 rounded-full shadow-lg shadow-white/20" :style="{ backgroundColor: primaryColor }" />
        </div>

        <div ref="archGrid" class="vatts-reveal vatts-reveal-up grid grid-cols-1 md:grid-cols-3 gap-6">

          <div class="group relative p-[2px] rounded-2xl bg-gradient-to-br from-yellow-500/30 via-white/15 to-white/5 hover:from-yellow-500/50 hover:via-white/25 transition-all duration-500 vatts-tilt vatts-sheen">
            <div class="relative h-full bg-[#0a0a0c]/90 backdrop-blur-xl rounded-[14px] p-8 overflow-hidden border border-white/10 flex flex-col">
              <div class="flex items-start gap-5 mb-8 relative z-10">
                <div class="shrink-0 p-3 bg-yellow-500/20 rounded-xl border border-yellow-500/30 shadow-lg shadow-yellow-500/10">
                  <VattsImage src="https://rollupjs.org/rollup-logo.svg" width="28px" height="28px" alt="Rollup" />
                </div>
                <div class="flex-1">
                  <div class="flex justify-between items-center mb-1">
                    <h3 class="text-xl font-bold text-white">Rollup</h3>
                  </div>
                  <p class="text-sm text-slate-300">Fast builds and maximum production performance.</p>
                </div>
              </div>

              <div class="mt-auto bg-black/60 backdrop-blur-sm rounded-xl p-4 font-mono text-[11px] text-slate-300 border border-white/5">
                <div class="flex justify-between text-slate-400 mb-3 pb-2">
                  <span>builder.ts</span>
                  <span class="text-yellow-400 text-[10px]">Node API</span>
                </div>
                <div class="space-y-1.5">
                   <div class="flex flex-wrap gap-1">
                    <span class="text-purple-400">import</span>
                    <span>{</span>
                    <span class="text-yellow-300">build</span>
                    <span>}</span>
                    <span class="text-purple-400">from</span>
                    <span class="text-emerald-400">'rollup'</span>
                  </div>
                  <div class="text-slate-500">// Efficient bundling</div>
                </div>
              </div>

              <!-- Ambient glow -->
              <div class="absolute inset-0 bg-gradient-to-br from-yellow-500/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500 rounded-[14px]"></div>
            </div>
          </div>

          <div class="group relative p-[2px] rounded-2xl bg-gradient-to-br from-cyan-500/30 via-white/15 to-white/5 hover:from-cyan-500/50 hover:via-white/25 transition-all duration-500 vatts-tilt vatts-sheen">
            <div class="relative h-full bg-[#0a0a0c]/90 backdrop-blur-xl rounded-[14px] p-8 overflow-hidden border border-white/10 flex flex-col">
              <div class="flex items-start gap-5 mb-8 relative z-10">
                <div class="shrink-0 p-2.5 bg-cyan-500/20 rounded-xl border border-cyan-500/30 text-cyan-400 shadow-lg shadow-cyan-500/10">
                  <svg width="28" height="28" viewBox="-10.5 -9.45 21 18.9" fill="none" xmlns="http://www.w3.org/2000/svg" class="text-sky-400"><circle cx="0" cy="0" r="2" fill="currentColor"></circle><g stroke="currentColor" stroke-width="1" fill="none"><ellipse rx="10" ry="4.5"></ellipse><ellipse rx="10" ry="4.5" transform="rotate(60)"></ellipse><ellipse rx="10" ry="4.5" transform="rotate(120)"></ellipse></g></svg>
                </div>
                <div class="flex-1">
                  <div class="flex justify-between items-center mb-1">
                    <h3 class="text-xl font-bold text-white">React 19</h3>
                    <span class="text-[10px] font-mono text-slate-400">Stable</span>
                  </div>
                  <p class="text-sm text-slate-300">Instant interactions and seamless Suspense.</p>
                </div>
              </div>
               <div class="mt-auto bg-black/60 backdrop-blur-sm rounded-xl p-4 font-mono text-[11px] text-slate-300 border border-white/5">
                <div class="flex justify-between text-slate-400 mb-3 pb-2">
                   <span>counter.tsx</span>
                   <span class="text-cyan-400 text-[10px]">Client</span>
                </div>
                <div class="text-slate-300">
                  <span class="text-purple-400">const</span> [<span class="text-sky-400">s</span>, <span class="text-blue-400">set</span>] = <span class="text-yellow-300">useState</span>(<span class="text-emerald-400">0</span>)
                </div>
               </div>

               <!-- Ambient glow -->
              <div class="absolute inset-0 bg-gradient-to-br from-cyan-500/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500 rounded-[14px]"></div>
            </div>
          </div>

          <div class="group relative p-[2px] rounded-2xl bg-gradient-to-br from-green-500/30 via-white/15 to-white/5 hover:from-green-500/50 hover:via-white/25 transition-all duration-500 vatts-tilt vatts-sheen">
            <div class="relative h-full bg-[#0a0a0c]/90 backdrop-blur-xl rounded-[14px] p-8 overflow-hidden border border-white/10 flex flex-col">
              <div class="flex items-start gap-5 mb-8 relative z-10">
                <div class="shrink-0 p-3 bg-green-500/20 rounded-xl border border-green-500/30 shadow-lg shadow-green-500/10">
                  <svg viewBox="0 0 128 128" width="24" height="24" data-name="Layer 1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"><path d="M78.8,10L64,35.4L49.2,10H0l64,110l64-110C128,10,78.8,10,78.8,10z" fill="#41B883"/><path d="M78.8,10L64,35.4L49.2,10H25.6L64,76l38.4-66H78.8z" fill="#35495E"/></svg>
                </div>
                <div class="flex-1">
                  <div class="flex justify-between items-center mb-1">
                    <h3 class="text-xl font-bold text-white">Vue 3</h3>
                    <span class="text--[10px] font-mono text-slate-400">Stable</span>
                  </div>
                  <p class="text-sm text-slate-300">Instant interactions and seamless async rendering.</p>
                </div>
              </div>
              <div class="mt-auto bg-black/60 backdrop-blur-sm rounded-xl p-4 font-mono text-[11px] text-slate-300 border border-white/5">
                 <div class="flex justify-between text-slate-400 mb-3 pb-2 border-b border-white/5">
                   <span>App.vue</span>
                   <span class="text-emerald-400 text-[10px]">Setup</span>
                 </div>
                 <div class="text-slate-300">
                   <span class="text-purple-400">const</span> <span class="text-sky-400">val</span> = <span class="text-amber-400">ref</span>(<span class="text-pink-400">0</span>)
                 </div>
              </div>

              <!-- Ambient glow -->
              <div class="absolute inset-0 bg-gradient-to-br from-green-500/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500 rounded-[14px]"></div>
            </div>
          </div>

          <div class="group relative p-[2px] rounded-2xl bg-gradient-to-br from-blue-500/30 via-white/15 to-white/5 hover:from-blue-500/50 hover:via-white/25 transition-all duration-500 vatts-tilt vatts-sheen">
            <div class="relative h-full bg-[#0a0a0c]/90 backdrop-blur-xl rounded-[14px] p-8 overflow-hidden border border-white/10 flex flex-col">
              <div class="flex items-start gap-5 mb-8 relative z-10">
                <div class="shrink-0 p-3 bg-blue-500/20 rounded-xl border border-blue-500/30 text-blue-400 shadow-lg shadow-blue-500/10">
                  <Server :size="28" />
                </div>
                <div class="flex-1">
                  <div class="flex justify-between items-center mb-1">
                    <h3 class="text-xl font-bold text-white">Hybrid Runtime</h3>
                  
                  </div>
                  <p class="text-sm text-slate-300 mt-2">
                    We use a dedicated Go system to handle all HTTP traffic, offloading the event loop.
                  </p>
                </div>
              </div>

              <div class="mt-auto bg-black/60 backdrop-blur-sm rounded-xl p-4 font-mono text-[11px] text-slate-300 border border-white/5">
                <div class="flex justify-between text-slate-400 mb-3 pb-2 border-b border-white/5">
                  <span>vatts.config.ts</span>
                  <span class="text-blue-400 text-[10px]">Network Layer</span>
                </div>
                <div class="space-y-1.5">
                  <div class="flex flex-wrap gap-1">
  <span class="text-purple-400">func</span>
  <span class="text-sky-400">StartHttpServer</span><span>()</span>
  <span>{</span><span>}</span>
</div>

                </div>
              </div>

              <!-- Ambient glow -->
              <div class="absolute inset-0 bg-gradient-to-br from-blue-500/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500 rounded-[14px]"></div>
            </div>
          </div>

<div class="group relative p-[2px] rounded-2xl bg-gradient-to-br from-pink-500/30 via-white/15 to-white/5 hover:from-pink-500/50 hover:via-white/25 transition-all duration-500 vatts-tilt vatts-sheen">
            <div class="relative h-full bg-[#0a0a0c]/90 backdrop-blur-xl rounded-[14px] p-8 overflow-hidden border border-white/10 flex flex-col">
              <div class="flex items-start gap-5 mb-8 relative z-10">
                <div class="shrink-0 p-3 bg-pink-500/20 rounded-xl border border-pink-500/30 shadow-lg shadow-pink-500/10">
                  <svg width="28" height="28" viewBox="0 0 32 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path class="fill-pink-500" d="M17.183 0C12.6 0 9.737 2.291 8.59 6.873c1.719-2.29 3.723-3.15 6.014-2.577 1.307.326 2.242 1.274 3.275 2.324 1.685 1.71 3.635 3.689 7.894 3.689 4.582 0 7.445-2.291 8.591-6.872-1.718 2.29-3.723 3.15-6.013 2.576-1.308-.326-2.243-1.274-3.276-2.324C23.39 1.98 21.44 0 17.183 0ZM8.59 10.309C4.01 10.309 1.145 12.6 0 17.182c1.718-2.291 3.723-3.15 6.013-2.577 1.308.326 2.243 1.274 3.276 2.324 1.685 1.71 3.635 3.689 7.894 3.689 4.582 0 7.445-2.29 8.59-6.872-1.718 2.29-3.722 3.15-6.013 2.577-1.307-.327-2.242-1.276-3.276-2.325-1.684-1.71-3.634-3.689-7.893-3.689Z" />
                  </svg>
                </div>
                <div class="flex-1">
                  <div class="flex justify-between items-center mb-1">
                    <h3 class="text-xl font-bold text-white">Tailwind CSS</h3>
                    <span class="text-[10px] font-mono text-slate-400">v4.0</span>
                  </div>
                  <p class="text-sm text-slate-300">Modern utility-first design system built-in.</p>
                </div>
              </div>
               <div class="mt-auto bg-black/60 backdrop-blur-sm rounded-xl p-4 font-mono text-[11px] text-slate-300 border border-white/5">
                <div class="flex justify-between text-slate-400 mb-3 pb-2">
                  <span>styles.css</span>
                  <span class="text-pink-400 text-[10px]">Zero Runtime</span>
                </div>
                <div class="space-y-1.5">
                  <div class="flex flex-wrap gap-1">
                    <span class="text-purple-400">@theme</span>
                    <span>{</span>
                  </div>
                  <div class="pl-4 flex flex-wrap gap-1 text-slate-300">
                    <span class="text-sky-400">--color-primary</span>
                    <span>:</span>
                    <span class="text-pink-400">#ec4899</span>
                    <span>;</span>
                  </div>
                  <div class="pl-4 flex flex-wrap gap-1 text-slate-300">
                    <span class="text-sky-400">--font-sans</span>
                    <span>:</span>
                    <span class="text-emerald-400">'Inter'</span>
                    <span>;</span>
                  </div>
                  <div>}</div>
                </div>
              </div>

              <!-- Ambient glow -->
              <div class="absolute inset-0 bg-gradient-to-br from-pink-500/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500 rounded-[14px]"></div>
            </div>
          </div>

          <div class="group relative p-[2px] rounded-2xl bg-gradient-to-br from-orange-500/30 via-white/15 to-white/5 hover:from-orange-500/50 hover:via-white/25 transition-all duration-500 vatts-tilt vatts-sheen">
            <div class="relative h-full bg-[#0a0a0c]/90 backdrop-blur-xl rounded-[14px] p-8 overflow-hidden border border-white/10 flex flex-col">
              <div class="flex items-start gap-5 mb-8 relative z-10">
                <div class="shrink-0 p-3 bg-orange-500/20 rounded-xl border border-orange-500/30 text-orange-400 shadow-lg shadow-orange-500/10">
                  <Gauge :size="28" />
                </div>
                <div class="flex-1">
                  <div class="flex justify-between items-center mb-1">
                    <h3 class="text-xl font-bold text-white">Native Optimizer</h3>
                  </div>
                  <p class="text-sm text-slate-300 mt-2">
                    Low-level optimizer and compressor for .js files.
                  </p>
                </div>
              </div>


              
              <div class="mt-auto bg-black/60 backdrop-blur-sm rounded-xl p-4 font-mono text-[11px] text-slate-300 border border-white/5">
  <div class="flex justify-between text-slate-400 mb-3 pb-2">
    <span>Terminal</span>
    <span class="text-sky-400 text-[10px]">Optimizer</span>
  </div>

  <div class="space-y-1">
    <div class="flex gap-3">
      <span class="text-slate-500">18:16:20</span>
      <span class="text-sky-400">Optimization summary:</span>
    </div>

    <div class="flex gap-3">
      <span class="text-slate-500">18:16:20</span>
      <span>
        Original&nbsp;:
        <span class="text-emerald-400">427.24 KB</span>
      </span>
    </div>

    <div class="flex gap-3">
      <span class="text-slate-500">18:16:20</span>
      <span>
        Final&nbsp;&nbsp;&nbsp;&nbsp;:
        <span class="text-emerald-400">124.34 KB</span>
      </span>
    </div>

    <div class="flex gap-3">
      <span class="text-slate-500">18:16:20</span>
      <span>
        Saved&nbsp;&nbsp;&nbsp;&nbsp;:
        <span class="text-emerald-400">302.90 KB</span>
        <span class="text-slate-500">(70.90%)</span>
      </span>
    </div>
  </div>
</div>

              <!-- Ambient glow -->
              <div class="absolute inset-0 bg-gradient-to-br from-orange-500/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500 rounded-[14px]"></div>
            </div>
          </div>

          

        </div>
      </section>

      <section class="relative z-10 max-w-7xl mx-auto px-6 py-24">
        <div ref="featHeader" class="vatts-reveal vatts-reveal-up mb-16">
          <h2 class="text-3xl font-bold text-white mb-4 text-center drop-shadow-lg">What's in Vatts.js?</h2>
          <p class="text-slate-300 text-center max-w-2xl mx-auto">Everything you need to build great products on the web, packed into a cohesive framework.</p>
        </div>

        <div ref="featGrid" class="vatts-reveal vatts-reveal-up grid grid-cols-1 md:grid-cols-3 gap-5 z-10">

          <div :class="`md:col-span-2 group relative p-[2px] rounded-2xl bg-gradient-to-br from-cyan-500/30 via-white/15 to-white/5 hover:from-cyan-500/50 hover:via-white/25 transition-all duration-500 vatts-tilt vatts-sheen`">
            <div class="relative h-full bg-[#0a0a0c]/90 backdrop-blur-xl rounded-[14px] p-8 overflow-hidden border border-white/10 flex flex-col justify-between">

              <div class="flex items-start gap-6 mb-8 relative z-10">
                <div class="shrink-0">
                  <div class="p-4 rounded-xl bg-cyan-500/20 text-cyan-400 border border-cyan-500/30 shadow-lg shadow-cyan-500/10">
                    <Globe :size="28" />
                  </div>
                </div>

                <div class="flex-1">
                  <div class="flex justify-between items-center mb-3">
                    <h3 class="text-2xl font-bold text-white">Native RPC System</h3>
                    <div class="text-[10px] font-bold text-cyan-400 uppercase tracking-widest border border-cyan-500/30 px-3 py-1.5 rounded-lg bg-cyan-950/40 backdrop-blur-sm">Core</div>
                  </div>
                  <p class="text-slate-300 max-w-md">Direct server-to-client communication. Expose your backend logic specifically to your frontend with zero boilerplate.</p>
                </div>
              </div>
              
              <div class="mt-auto relative z-10 rounded-xl bg-black/60 backdrop-blur-md p-4 font-mono text-[11px] leading-relaxed text-slate-300 shadow-2xl border border-white/5 transition-all duration-300 group-hover:border-cyan-500/30">
                <div class="mb-3 flex items-center justify-between pb-2 text-slate-400">
                  <span class="text-xs">src/backend/actions.ts</span>
                  <span class="text-xs font-medium text-cyan-400">Server Side</span>
                </div>
                <div class="space-y-1.5">
                    <span class="text-yellow-300">Expose</span>(<span class="text-blue-400">getUser</span>)
                </div>
              </div>

              <!-- Ambient glow -->
              <div class="absolute inset-0 bg-gradient-to-br from-cyan-500/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500 rounded-[14px]"></div>
            </div>
          </div>

          <div :class="`group relative p-[2px] rounded-2xl bg-gradient-to-br from-blue-500/30 via-white/15 to-white/5 hover:from-blue-500/50 hover:via-white/25 transition-all duration-500 vatts-tilt vatts-sheen`">
            <div class="relative h-full bg-[#0a0a0c]/90 backdrop-blur-xl rounded-[14px] p-8 overflow-hidden border border-white/10 transition-all duration-500 flex flex-col">

              <div class="flex items-start gap-6 mb-8 relative z-10">
                <div class="shrink-0">
                  <div class="p-4 rounded-xl bg-blue-500/20 text-blue-400 border border-blue-500/30 shadow-lg shadow-blue-500/10">
                    <Shield :size="28" />
                  </div>
                </div>
                <div>
                  <h3 class="text-2xl font-bold text-white mb-3">Vatts Auth</h3>
                  <p class="text-slate-300">Secure session management built-in. Protect your routes and data effortlessly.</p>
                </div>
              </div>
              
              <div class="mt-auto relative z-10 rounded-xl bg-black/60 backdrop-blur-md p-4 font-mono text-[11px] leading-relaxed text-slate-300 shadow-2xl border border-white/5 transition-all duration-300 group-hover:border-blue-500/30">
                 <div class="space-y-1 text-slate-300">
                   <span class="text-purple-400">const</span> { <span class="text-sky-400">user</span> } = <span class="text-blue-400">useSession</span>()
                 </div>
              </div>

              <!-- Ambient glow -->
              <div class="absolute inset-0 bg-gradient-to-br from-blue-500/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity duration-500 rounded-[14px]"></div>
            </div>
          </div>

          <div v-for="(item, idx) in featuresList" :key="idx" :class="`group relative p-[2px] rounded-2xl bg-gradient-to-br from-white/20 via-white/10 to-white/5 hover:from-white/30 hover:via-white/20 transition-all duration-500 vatts-tilt vatts-sheen ${item.border}`" :style="{ transitionDelay: `${idx * 50}ms` }">
            <div class="relative h-full bg-[#0a0a0c]/90 backdrop-blur-xl rounded-[14px] p-6 overflow-hidden border border-white/10 flex items-start gap-4">
              <div :class="`p-3 rounded-xl ${item.bg} ${item.color} shrink-0 shadow-lg border border-white/10`">
                <component :is="item.icon" :size="24" />
              </div>

              <div>
                <h4 class="text-lg font-bold text-white mb-2">{{ item.title }}</h4>
                <p class="text-sm text-slate-300 leading-relaxed">{{ item.desc }}</p>
              </div>

              <!-- Subtle ambient glow per card color -->
              <div class="absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity duration-500 rounded-[14px] pointer-events-none" :style="{ background: `radial-gradient(circle at center, ${item.color.replace('text-', 'rgb(var(--tw-')}10 0%, transparent 70%)` }"></div>
            </div>
          </div>
        </div>
      </section>

      <section class="relative z-10 max-w-6xl mx-auto px-6 py-24">
        <div class="grid grid-cols-1 lg:grid-cols-5 gap-16 items-center">

          <div class="lg:col-span-2 vatts-reveal vatts-reveal-left">
            <h2 class="text-4xl font-black text-white mb-6 leading-tight drop-shadow-lg">
              Built for <br/>
              <span class="bold text-transparent bg-clip-text bg-gradient-to-r from-white to-gray-400">Modern Devs.</span>
            </h2>
            <p class="text-lg text-slate-300 mb-8 leading-relaxed">
              Built for developers who value speed, control, and clarity, from the first command to production.
            </p>
            <div class="space-y-6">
              <div class="flex gap-4 group">
                <div class="shrink-0 w-12 h-12 rounded-xl bg-white/10 backdrop-blur-sm border border-white/20 flex items-center justify-center text-emerald-400 shadow-lg group-hover:shadow-emerald-400/20 transition-all">
                  <Terminal :size="20" />
                </div>
                <div>
                  <h4 class="text-white font-bold text-lg">Interactive CLI</h4>
                  <p class="text-sm text-slate-400">A guided setup experience with intelligent defaults.</p>
                </div>
              </div>
              <div class="flex gap-4 group">
                <div class="shrink-0 w-12 h-12 rounded-xl bg-white/10 backdrop-blur-sm border border-white/20 flex items-center justify-center text-cyan-400 shadow-lg group-hover:shadow-cyan-400/20 transition-all">
                  <Cpu :size="20" />
                </div>
                <div>
                  <h4 class="text-white font-bold text-lg">Native Environment</h4>
                  <p class="text-sm text-slate-400">Cross-platform by default. Automatically detects your Node.js version.</p>
                </div>
              </div>
            </div>
          </div>

          <div class="lg:col-span-3 vatts-reveal vatts-reveal-right relative p-[2px] rounded-2xl bg-gradient-to-br from-white/30 via-white/15 to-transparent shadow-3xl">
            <div class="bg-[#0a0a0c]/95 backdrop-blur-2xl rounded-[14px] overflow-hidden border border-white/20 font-mono text-[13px] leading-relaxed shadow-2xl">

              <div class="bg-gradient-to-r from-[#1a1a1c] to-[#161618] px-4 py-3 flex items-center justify-between border-b border-white/10">
                <div class="flex gap-2">
                  <div class="w-3 h-3 rounded-full bg-red-500/80 shadow-sm" />
                  <div class="w-3 h-3 rounded-full bg-yellow-500/80 shadow-sm" />
                  <div class="w-3 h-3 rounded-full bg-green-500/80 shadow-sm" />
                </div>
                <span class="text-[10px] text-slate-400 uppercase tracking-widest font-bold">Vatts CLI Session</span>
              </div>

              <div class="p-6 overflow-x-auto custom-scrollbar max-h-[450px] bg-black/40 backdrop-blur-sm">
                <div class="flex gap-3 mb-4">
                  <span class="text-slate-500">PS D:\Vatts&gt;</span>
                  <span class="text-white font-medium">npx create-vatts-app@latest my-app</span>
                </div>

                <div class="space-y-1 mb-6">
                  <div class="flex gap-2">
                    <span class="text-cyan-400">?</span>
                    <span class="text-white">What framework do you want to use?</span>
                    <span class="text-slate-500">(React/Vue)</span>
                    <span class="text-slate-300">(vue)</span>
                  </div>
                  <div class="flex gap-2">
                    <span class="text-cyan-400 font-bold">?</span>
                    <span class="text-white">Would you like to use recommended options?</span>
                    <span class="text-slate-500">(Vue)</span>
                  </div>
                  <div class="pl-4 text-cyan-400 underline underline-offset-4 decoration-2 font-medium">
                    ❯ Yes, use recommended defaults - TypeScript, Tailwind CSS, Module Alias
                  </div>
                  <div class="pl-4 text-slate-600">Maybe, use Path Router defaults</div>
                </div>

                <div class="space-y-0.5 mb-6">
                  <div v-for="(msg, i) in ['Created project directory and package.json', 'Created project structure', 'TypeScript configuration initialized.', 'Tailwind CSS setup complete.']" :key="i" class="flex gap-3 items-center">
                    <span class="text-slate-600 text-[11px]">13:12:54</span>
                    <span class="text-emerald-400 font-bold">✔ SUCCESS</span>
                    <span class="text-slate-200">{{ msg }}</span>
                  </div>
                  <div class="flex gap-3 items-center mt-2">
                    <span class="text-slate-600 text-[11px]">13:12:54</span>
                    <span class="text-cyan-400 animate-spin">○</span>
                    <span class="text-slate-200 font-bold">Installing dependencies...</span>
                  </div>
                </div>

                <div class="pt-4 border-t border-white/10 space-y-4">
                  <div class="flex gap-3 items-center">
                    <span class="text-slate-600 text-[11px]">13:12:59</span>
                    <span class="text-cyan-400 font-bold">Vatts.js</span>
                    <span class="text-slate-400">v{{ version }}</span>
                  </div>

                  <div class="flex gap-3 items-center">
                    <span class="text-slate-600 text-[11px]">13:12:59</span>
                    <span class="text-emerald-400">✔</span>
                    <span class="text-white font-bold">Project my-app created successfully.</span>
                  </div>

                  <div class="grid grid-cols-1 gap-1 pl-10">
                    <div class="text-slate-400 font-bold mb-1">Environment:</div>
                    <div class="text-slate-300 flex gap-2">
                      <span class="text-slate-600">•</span> Runtime: <span class="text-emerald-400 font-medium">Node.js v25.4.0</span>
                    </div>
                    <div class="text-slate-300 flex gap-2">
                      <span class="text-slate-600">•</span> Framework: <span class="text-cyan-400 font-medium">Vatts.js v{{ version }}</span>
                    </div>
                  </div>

                  <div class="pl-10">
                    <div class="text-slate-400 font-bold mb-1">Next steps:</div>
                    <div class="text-cyan-400 font-medium">1. cd my-app</div>
                    <div class="text-cyan-400 font-medium">2. npm run dev</div>
                  </div>

                  <div class="text-[11px] text-slate-600 pt-2 italic">
                    Website: <span class="underline">https://vatts.mfraz.ovh</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section class="relative z-10 max-w-4xl mx-auto px-6 py-32 text-center">
        <div class="absolute inset-0 bg-[radial-gradient(circle_at_center,rgba(255,255,255,0.08)_0%,transparent_70%)] pointer-events-none" />

        <div class="vatts-reveal vatts-reveal-up relative">
          <div class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-white/5 border border-white/10 text-xs font-medium text-slate-300 mb-6">
            <Github :size="14" />
            <span>Open Source</span>
          </div>

          <div class="mb-8">
            <h2 class="text-5xl md:text-6xl font-black text-white mb-6 tracking-tight">
              Ready to build the future?
            </h2>
            <p class="text-xl text-slate-400 mb-10 max-w-2xl mx-auto">
              Join the ecosystem of developers building faster, lighter, and more scalable web applications.
            </p>
          </div>
          <div class="flex flex-col sm:flex-row items-center justify-center gap-4">
            <Link href="/docs" class="w-full sm:w-auto px-8 py-4 bg-white text-black font-bold rounded-xl shadow-[0_0_30px_rgba(255,255,255,0.3)] hover:shadow-[0_0_40px_rgba(255,255,255,0.5)] transition-all flex items-center justify-center gap-2">
              <Search />
              Read the Documentation
            </Link>

            <a href="https://github.com/mfrazlab/vatts.js" target="_blank" rel="noreferrer" class="w-full sm:w-auto px-8 py-4 bg-[#111111] border border-white/10 text-white font-bold rounded-xl hover:bg-white/5 transition-all flex items-center justify-center gap-2">
              <Github :size="18" />
              Star on GitHub
            </a>
          </div>
        </div>
      </section>

    </div>

    <Footer />
  </div>
</template>

<style>
/* CSS do Grid Background e Animações - Enhanced */
.grid-background {
  position: absolute;
  inset: 0;
  z-index: 0;
  opacity: 0;
  background-image:
      linear-gradient(to right, rgba(255, 255, 255, 0.2) 1px, transparent 1px),
      linear-gradient(to bottom, rgba(255, 255, 255, 0.2) 1px, transparent 1px);
  background-size: 60px 60px;
  mask-image: radial-gradient(ellipse at 50% 0%, black 20%, transparent 80%);
  -webkit-mask-image: radial-gradient(ellipse at 50% 0%, black 20%, transparent 80%);
  animation: gridFadeIn 1.2s ease-out forwards;
}

.grid-corner-circle {
  position: absolute;
  width: 400px;
  height: 400px;
  border: 2px dashed rgba(255, 255, 255, 0.2);
  border-radius: 50%;
  z-index: 1;
  opacity: 0;
  mask-image: radial-gradient(circle at center, black 40%, transparent 100%);
  -webkit-mask-image: radial-gradient(circle at center, black 40%, transparent 100%);
  animation: gridFadeIn 1.5s ease-out 0.3s forwards, circleFloat 8s ease-in-out infinite;
}

.circle-top-left {
  top: -150px;
  left: -150px;
}

.circle-bottom-right {
  bottom: -150px;
  right: -150px;
  opacity: 0;
  animation-delay: 0.5s;
}

@keyframes gridFadeIn {
  from {
    opacity: 0;
    transform: scale(0.95);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

@keyframes circleFloat {
  0%, 100% {
    transform: scale(1) rotate(0deg);
  }
  50% {
    transform: scale(1.05) rotate(5deg);
  }
}

@keyframes fastReveal {
  0% {
    opacity: 0;
    transform: scale(0.96);
  }
  100% {
    opacity: 0.3;
    transform: scale(1);
  }
}
</style>