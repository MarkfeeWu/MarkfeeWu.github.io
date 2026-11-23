---
layout: page
title: Selected Publications
icon: fas fa-stream
order: 1
permalink: /publications/
---

<style>
  /* These rules affect only this numbered publication list. */
  .paper-list-module { --paper-accent: var(--link-color, #2469a5); margin-top: 2rem; }
  .paper-list-module .paper-list { padding-left: 1.6rem; }
  .paper-list-module .paper-list > li { margin-bottom: 1.4rem; line-height: 1.75; overflow-wrap: anywhere; }
  .paper-list-module [hidden] { display: none !important; }
  .paper-list-module .paper-filters,
  .paper-list-module .paper-tags { display: flex; flex-wrap: wrap; gap: .4rem; }
  .paper-list-module .paper-tags { margin-top: .4rem; }
  .paper-list-module button {
    max-width: 100%;
    min-height: 1.9rem;
    padding: .18rem .65rem;
    border: 1px solid var(--paper-accent);
    border-radius: .3rem;
    background: transparent;
    color: var(--paper-accent);
    font: inherit;
    font-size: .8rem;
    line-height: 1.4;
    text-align: left;
    overflow-wrap: anywhere;
    cursor: pointer;
  }
  .paper-list-module button:hover { background: rgba(36, 105, 165, .08); }
  .paper-list-module button[aria-pressed="true"] { border-color: #245f9e; background: #245f9e; color: #fff; }
  .paper-list-module button:focus-visible { outline: 2px solid var(--paper-accent); outline-offset: 3px; }
  .paper-list-module .paper-status { margin: .5rem 0 .8rem; color: var(--text-muted-color, #6c757d); font-size: .85rem; }
  .paper-list-module .paper-rank { display: inline-block; padding: .05rem .2rem; background: #ff0000; color: #000; white-space: nowrap; }
</style>
<section class="paper-list-module" aria-labelledby="publications-title">

  <!-- The script generates these filter buttons from the tags on each li. -->
  <div class="paper-filter-tools" hidden>
    <div class="paper-filters" role="group" aria-label="Select paper by topic"></div>
    <p class="paper-status" role="status" aria-live="polite" aria-atomic="true"></p>
  </div>
  <p class="paper-empty" hidden>No paper under this topic。</p>

  <ol class="paper-list">
    <!-- Add tags to each li, separated by commas. Chinese tag names also work. -->
    <!-- Add another li inside this ol for each additional paper. -->
    <li data-tags="CCF Rank-A,Journal paper">
      Changsong Jiang, Xiaosong Zhang, Guomin Yang, Zhongming Wang, Meng Hao,
      <strong><u>Pengfei Wu</u></strong>.
      STEAD: Subversion-Resistant Portable Encrypted Data Deduplication with File Sharing.
      In <em>IEEE Transactions on Information Forensics and Security (TIFS)</em>, 2026.
      <!-- Tags are generated here automatically. -->
      <div class="paper-tags" role="group" aria-label="paper-label"></div>
    </li>
    <li data-tags="CCF Rank-A,Journal paper">
      Jianting Ning, <strong><u>Pengfei Wu</u></strong>, Lisha Yao, Wu Luo, Guomin Yang, Feng Li, Yuxian Li, Xinyi Huang, and Robert H. Deng.
      Noisy Functional Encryption Revisited: New Constructions from LWE for Differential Privacy. 
      In <em>IEEE Transactions on Dependable and Secure Computing (TDSC)</em>, 2026.
      <div class="paper-tags" role="group" aria-label="paper-label"></div>
    </li>
    <li data-tags="CCF Rank-B,Conference paper">
      <strong><u>Pengfei Wu</u></strong>, Lisha Yao, Guomin Yang, Yang Yang, Meng Hao, Haiyang Xue, and Robert H. Deng.
      KyberBridge: Enabling One-to-Many Data Sharing with Kyber Cryptosystem.
      In <em>European Symposium on Research in Computer Security (ESORICS)</em>, pp. 460-481, 2026.
      <div class="paper-tags" role="group" aria-label="paper-label"></div>
    </li>
  </ol>
</section>

<script>
  document.querySelectorAll('.paper-list-module').forEach(function (section) {
    if (section.dataset.paperReady) return;
    section.dataset.paperReady = 'true';

    var papers = Array.from(section.querySelectorAll('.paper-list > li'));
    var filters = section.querySelector('.paper-filters');
    var tools = section.querySelector('.paper-filter-tools');
    var status = section.querySelector('.paper-status');
    var empty = section.querySelector('.paper-empty');
    if (!filters || !tools || !status || !empty) return;

    var counts = new Map();
    var paperTags = new Map();
    filters.replaceChildren();

    function makeButton(tag, count) {
      var button = document.createElement('button');
      button.type = 'button';
      button.dataset.paperTag = tag;
      button.setAttribute('aria-pressed', 'false');
      button.textContent = (tag || 'All') + (count === undefined ? '' : ' (' + count + ')');
      return button;
    }

    papers.forEach(function (paper) {
      var tags = Array.from(new Set((paper.dataset.tags || '')
        .split(/[,，]/).map(function (tag) { return tag.trim(); }).filter(Boolean)));
      paperTags.set(paper, tags);
      var chips = paper.querySelector('.paper-tags');
      if (!chips) {
        chips = document.createElement('div');
        chips.className = 'paper-tags';
        chips.setAttribute('role', 'group');
        chips.setAttribute('aria-label', 'paper-label');
        paper.append(chips);
      }
      chips.replaceChildren();
      tags.forEach(function (tag) {
        counts.set(tag, (counts.get(tag) || 0) + 1);
        chips.append(makeButton(tag));
      });
    });

    filters.append(makeButton('', papers.length));
    counts.forEach(function (count, tag) { filters.append(makeButton(tag, count)); });

    function applyFilter(tag) {
      var visible = 0;
      papers.forEach(function (paper) {
        var matches = !tag || paperTags.get(paper).includes(tag);
        paper.hidden = !matches;
        if (matches) visible += 1;
      });
      section.querySelectorAll('[data-paper-tag]').forEach(function (button) {
        button.setAttribute('aria-pressed', String(button.dataset.paperTag === tag));
      });
      status.textContent = 'Show ' + visible + ' / ' + papers.length + ' papers' + (tag ? ' · ' + tag : '');
      empty.hidden = visible !== 0;
    }

    section.addEventListener('click', function (event) {
      var button = event.target.closest('button[data-paper-tag]');
      if (button && section.contains(button)) applyFilter(button.dataset.paperTag);
    });
    tools.hidden = false;
    applyFilter('');
  });
</script>

