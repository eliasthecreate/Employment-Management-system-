<?php 
require_once 'header.php'; 
require_role(['Admin', 'Manager']);
?>
<h2 class="text-2xl font-semibold mb-4">Payroll (Kwacha)</h2>
<p class="text-sm text-slate-300 mb-4">Review payroll totals in Kwacha for your workforce.</p>
<div class="grid md:grid-cols-3 gap-4 mb-6 text-sm">
  <div class="rounded-2xl border border-slate-800/80 bg-slate-900/80 p-4">
    <p class="text-xs text-slate-400">This month total</p>
    <p class="mt-2 text-2xl font-semibold text-emerald-300">K 250,000.00</p>
  </div>
  <div class="rounded-2xl border border-slate-800/80 bg-slate-900/80 p-4">
    <p class="text-xs text-slate-400">Average per employee</p>
    <p class="mt-2 text-2xl font-semibold text-cyan-300">K 8,200.00</p>
  </div>
  <div class="rounded-2xl border border-slate-800/80 bg-slate-900/80 p-4">
    <p class="text-xs text-slate-400">Bonuses</p>
    <p class="mt-2 text-2xl font-semibold text-blue-300">K 35,000.00</p>
  </div>
</div>
<div class="rounded-2xl border border-slate-800/80 bg-slate-900/80 p-4 text-sm text-slate-300">
  <p>This page displays the initial amount each individual earns within the company to the amount being made by the company itself </p>
</div>
<?php require_once 'footer.php'; ?>
