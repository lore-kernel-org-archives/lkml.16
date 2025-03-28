Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40C7DDC5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743178403; cv=none; b=QLeYWY5ndZWwqhY7cyOqJ27yWjFZSdPF55S7UcsOe9ev7s8FqsGnKj/j2q1qNtCUnPmHebUvsVzrG5nnsxAlf84b2kv3ATBLsjthx+ezNihHP4Cf7vGn8Hcp2mqCZWS5xV/RaPT9EfwJOAkbotUhwcvfbfIjZe08/7Kp9NwF1pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743178403; c=relaxed/simple;
	bh=GRicAJpidKUYihjNHdzMImyqtzxIxXeXDgpM8M4fQMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C73NoI7NpVkQ8dpjAzgfGXOrrF87rwc/7F0VPt3EpzQb3q3JftFuI9tsokhsO3jlp8pmf1C7RPci0rFaQCxD2cUZreLiIgNh161CHxNaTjwyqCs9LJ8qwyYeMP0ZuUrUAWGOhpv4gZ0URy0pAjNAvWv65+jVpJUjEmWi3uP3zz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqel2m81; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqel2m81"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743178402; x=1774714402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GRicAJpidKUYihjNHdzMImyqtzxIxXeXDgpM8M4fQMI=;
  b=fqel2m81gVprtbwSxuoPxu/5GMJdiSEv9U1gKVx8dNk+aPMOKlvQL0RY
   AhUt1uLVs25DjEMe1FkpKAZ7ICSWCEleAzioCE/Sd/QtcYjomfhRdrVAY
   sWXMEWtxtuRooDDYfkux3nOIoy6AL0UmlLZpxnii1U+Hzf3+n8zqUcYt7
   f+R1psy3mEFjgN/cnN2ZPiJcCFt9XsiufXMdk3poC/GBV3UWNYZwhfWTL
   auT6zbRjUPZjqac1HMhIYA3IeJ3GKJg15NrWMXB3ab/9z5YrI8ydMBHji
   ts22dzs4d5JjIETc6Y5xcPMuLCdm4oUyMdEYGhs5/Yx5hGT44+lWIXqK6
   A==;
X-CSE-ConnectionGUID: rNPuqu9uQb6lHzMWStZqrA==
X-CSE-MsgGUID: j4bXdOQSRTqWhlxQedRsZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55921652"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="55921652"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 09:13:21 -0700
X-CSE-ConnectionGUID: fEjWef1OTXKBl2l/1Y04Fw==
X-CSE-MsgGUID: R56XQfUvS5OAxp/p6RiOxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125998131"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 Mar 2025 09:13:19 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyCKa-0007ZM-2F;
	Fri, 28 Mar 2025 16:13:16 +0000
Date: Sat, 29 Mar 2025 00:13:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [tip:WIP.x86/alternatives 33/51] arch/x86/kernel/alternative.c:2614:
 warning: Excess function parameter 'text_poke_array.vec' description in
 'smp_text_poke_batch_process'
Message-ID: <202503290002.FY3SEEJB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/alternatives
head:   5c21e894a3e5752ac672af6e542775b3914c6668
commit: 27b765aaed0f436da5462abd28b88bbab253820f [33/51] x86/alternatives: Simplify smp_text_poke_batch_process()
config: i386-buildonly-randconfig-001-20250328 (https://download.01.org/0day-ci/archive/20250329/202503290002.FY3SEEJB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290002.FY3SEEJB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290002.FY3SEEJB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/alternative.c:2614: warning: Excess function parameter 'text_poke_array.vec' description in 'smp_text_poke_batch_process'
>> arch/x86/kernel/alternative.c:2614: warning: Excess function parameter 'text_poke_array.nr_entries' description in 'smp_text_poke_batch_process'


vim +2614 arch/x86/kernel/alternative.c

17f41571bb2c4a Jiri Kosina                2013-07-23  2591  
fd4363fff3d967 Jiri Kosina                2013-07-12  2592  /**
b5cbc1f86f9e4d Ingo Molnar                2025-03-27  2593   * smp_text_poke_batch_process() -- update instructions on live kernel on SMP
27b765aaed0f43 Ingo Molnar                2025-03-27  2594   * @text_poke_array.vec:		vector of instructions to patch
27b765aaed0f43 Ingo Molnar                2025-03-27  2595   * @text_poke_array.nr_entries:	number of entries in the vector
fd4363fff3d967 Jiri Kosina                2013-07-12  2596   *
fd4363fff3d967 Jiri Kosina                2013-07-12  2597   * Modify multi-byte instruction by using int3 breakpoint on SMP.
ea8596bb2d8d37 Masami Hiramatsu           2013-07-18  2598   * We completely avoid stop_machine() here, and achieve the
ea8596bb2d8d37 Masami Hiramatsu           2013-07-18  2599   * synchronization using int3 breakpoint.
fd4363fff3d967 Jiri Kosina                2013-07-12  2600   *
fd4363fff3d967 Jiri Kosina                2013-07-12  2601   * The way it is done:
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2602   *	- For each entry in the vector:
fd4363fff3d967 Jiri Kosina                2013-07-12  2603   *		- add a int3 trap to the address that will be patched
fd4363fff3d967 Jiri Kosina                2013-07-12  2604   *	- sync cores
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2605   *	- For each entry in the vector:
fd4363fff3d967 Jiri Kosina                2013-07-12  2606   *		- update all but the first byte of the patched range
fd4363fff3d967 Jiri Kosina                2013-07-12  2607   *	- sync cores
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2608   *	- For each entry in the vector:
fd4363fff3d967 Jiri Kosina                2013-07-12  2609   *		- replace the first byte (int3) by the first byte of
fd4363fff3d967 Jiri Kosina                2013-07-12  2610   *		  replacing opcode
fd4363fff3d967 Jiri Kosina                2013-07-12  2611   *	- sync cores
fd4363fff3d967 Jiri Kosina                2013-07-12  2612   */
27b765aaed0f43 Ingo Molnar                2025-03-27  2613  static void smp_text_poke_batch_process(void)
fd4363fff3d967 Jiri Kosina                2013-07-12 @2614  {
c3d6324f841bab Peter Zijlstra             2019-06-05  2615  	unsigned char int3 = INT3_INSN_OPCODE;
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2616  	unsigned int i;
c3d6324f841bab Peter Zijlstra             2019-06-05  2617  	int do_sync;
9222f606506c5f Jiri Kosina                2018-08-28  2618  
9222f606506c5f Jiri Kosina                2018-08-28  2619  	lockdep_assert_held(&text_mutex);
9222f606506c5f Jiri Kosina                2018-08-28  2620  
efd608fa7403ba Nadav Amit                 2022-09-21  2621  	/*
f2ad1300a8a6d9 Ingo Molnar                2025-03-27  2622  	 * Corresponds to the implicit memory barrier in try_get_text_poke_array() to
4dd08bc50f7681 Ingo Molnar                2025-03-27  2623  	 * ensure reading a non-zero refcount provides up to date text_poke_array data.
efd608fa7403ba Nadav Amit                 2022-09-21  2624  	 */
41e4ceece5913b Eric Dumazet               2025-03-25  2625  	for_each_possible_cpu(i)
7cb90cbd1a9fa0 Ingo Molnar                2025-03-27  2626  		atomic_set_release(per_cpu_ptr(&int3_refs, i), 1);
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2627  
9350a629e839ca Steven Rostedt (Google     2023-05-31  2628) 	/*
9350a629e839ca Steven Rostedt (Google     2023-05-31  2629) 	 * Function tracing can enable thousands of places that need to be
9350a629e839ca Steven Rostedt (Google     2023-05-31  2630) 	 * updated. This can take quite some time, and with full kernel debugging
9350a629e839ca Steven Rostedt (Google     2023-05-31  2631) 	 * enabled, this could cause the softlockup watchdog to trigger.
9350a629e839ca Steven Rostedt (Google     2023-05-31  2632) 	 * This function gets called every 256 entries added to be patched.
9350a629e839ca Steven Rostedt (Google     2023-05-31  2633) 	 * Call cond_resched() here to make sure that other tasks can get scheduled
9350a629e839ca Steven Rostedt (Google     2023-05-31  2634) 	 * while processing all the functions being patched.
9350a629e839ca Steven Rostedt (Google     2023-05-31  2635) 	 */
9350a629e839ca Steven Rostedt (Google     2023-05-31  2636) 	cond_resched();
9350a629e839ca Steven Rostedt (Google     2023-05-31  2637) 
fd4363fff3d967 Jiri Kosina                2013-07-12  2638  	/*
01651324edad9d Peter Zijlstra             2017-07-31  2639  	 * Corresponding read barrier in int3 notifier for making sure the
27b765aaed0f43 Ingo Molnar                2025-03-27  2640  	 * text_poke_array.nr_entries and handler are correctly ordered wrt. patching.
fd4363fff3d967 Jiri Kosina                2013-07-12  2641  	 */
fd4363fff3d967 Jiri Kosina                2013-07-12  2642  	smp_wmb();
fd4363fff3d967 Jiri Kosina                2013-07-12  2643  
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2644  	/*
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2645  	 * First step: add a int3 trap to the address that will be patched.
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2646  	 */
27b765aaed0f43 Ingo Molnar                2025-03-27  2647  	for (i = 0; i < text_poke_array.nr_entries; i++) {
27b765aaed0f43 Ingo Molnar                2025-03-27  2648  		text_poke_array.vec[i].old = *(u8 *)text_poke_addr(&text_poke_array.vec[i]);
27b765aaed0f43 Ingo Molnar                2025-03-27  2649  		text_poke(text_poke_addr(&text_poke_array.vec[i]), &int3, INT3_INSN_SIZE);
d769811ca93303 Adrian Hunter              2020-05-12  2650  	}
fd4363fff3d967 Jiri Kosina                2013-07-12  2651  
5c02ece81848db Peter Zijlstra             2019-10-09  2652  	text_poke_sync();
fd4363fff3d967 Jiri Kosina                2013-07-12  2653  
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2654  	/*
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2655  	 * Second step: update all but the first byte of the patched range.
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2656  	 */
27b765aaed0f43 Ingo Molnar                2025-03-27  2657  	for (do_sync = 0, i = 0; i < text_poke_array.nr_entries; i++) {
27b765aaed0f43 Ingo Molnar                2025-03-27  2658  		u8 old[POKE_MAX_OPCODE_SIZE+1] = { text_poke_array.vec[i].old, };
ac0ee0a9560c97 Peter Zijlstra             2023-01-23  2659  		u8 _new[POKE_MAX_OPCODE_SIZE+1];
27b765aaed0f43 Ingo Molnar                2025-03-27  2660  		const u8 *new = text_poke_array.vec[i].text;
27b765aaed0f43 Ingo Molnar                2025-03-27  2661  		int len = text_poke_array.vec[i].len;
97e6c977ccf128 Peter Zijlstra             2019-10-09  2662  
76ffa7204b1ad7 Peter Zijlstra             2019-11-11  2663  		if (len - INT3_INSN_SIZE > 0) {
d769811ca93303 Adrian Hunter              2020-05-12  2664  			memcpy(old + INT3_INSN_SIZE,
27b765aaed0f43 Ingo Molnar                2025-03-27  2665  			       text_poke_addr(&text_poke_array.vec[i]) + INT3_INSN_SIZE,
d769811ca93303 Adrian Hunter              2020-05-12  2666  			       len - INT3_INSN_SIZE);
ac0ee0a9560c97 Peter Zijlstra             2023-01-23  2667  
ac0ee0a9560c97 Peter Zijlstra             2023-01-23  2668  			if (len == 6) {
ac0ee0a9560c97 Peter Zijlstra             2023-01-23  2669  				_new[0] = 0x0f;
ac0ee0a9560c97 Peter Zijlstra             2023-01-23  2670  				memcpy(_new + 1, new, 5);
ac0ee0a9560c97 Peter Zijlstra             2023-01-23  2671  				new = _new;
ac0ee0a9560c97 Peter Zijlstra             2023-01-23  2672  			}
ac0ee0a9560c97 Peter Zijlstra             2023-01-23  2673  
27b765aaed0f43 Ingo Molnar                2025-03-27  2674  			text_poke(text_poke_addr(&text_poke_array.vec[i]) + INT3_INSN_SIZE,
ac0ee0a9560c97 Peter Zijlstra             2023-01-23  2675  				  new + INT3_INSN_SIZE,
76ffa7204b1ad7 Peter Zijlstra             2019-11-11  2676  				  len - INT3_INSN_SIZE);
ac0ee0a9560c97 Peter Zijlstra             2023-01-23  2677  
c3d6324f841bab Peter Zijlstra             2019-06-05  2678  			do_sync++;
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2679  		}
d769811ca93303 Adrian Hunter              2020-05-12  2680  
d769811ca93303 Adrian Hunter              2020-05-12  2681  		/*
d769811ca93303 Adrian Hunter              2020-05-12  2682  		 * Emit a perf event to record the text poke, primarily to
d769811ca93303 Adrian Hunter              2020-05-12  2683  		 * support Intel PT decoding which must walk the executable code
d769811ca93303 Adrian Hunter              2020-05-12  2684  		 * to reconstruct the trace. The flow up to here is:
d769811ca93303 Adrian Hunter              2020-05-12  2685  		 *   - write INT3 byte
d769811ca93303 Adrian Hunter              2020-05-12  2686  		 *   - IPI-SYNC
d769811ca93303 Adrian Hunter              2020-05-12  2687  		 *   - write instruction tail
d769811ca93303 Adrian Hunter              2020-05-12  2688  		 * At this point the actual control flow will be through the
d769811ca93303 Adrian Hunter              2020-05-12  2689  		 * INT3 and handler and not hit the old or new instruction.
d769811ca93303 Adrian Hunter              2020-05-12  2690  		 * Intel PT outputs FUP/TIP packets for the INT3, so the flow
d769811ca93303 Adrian Hunter              2020-05-12  2691  		 * can still be decoded. Subsequently:
d769811ca93303 Adrian Hunter              2020-05-12  2692  		 *   - emit RECORD_TEXT_POKE with the new instruction
d769811ca93303 Adrian Hunter              2020-05-12  2693  		 *   - IPI-SYNC
d769811ca93303 Adrian Hunter              2020-05-12  2694  		 *   - write first byte
d769811ca93303 Adrian Hunter              2020-05-12  2695  		 *   - IPI-SYNC
d769811ca93303 Adrian Hunter              2020-05-12  2696  		 * So before the text poke event timestamp, the decoder will see
d769811ca93303 Adrian Hunter              2020-05-12  2697  		 * either the old instruction flow or FUP/TIP of INT3. After the
d769811ca93303 Adrian Hunter              2020-05-12  2698  		 * text poke event timestamp, the decoder will see either the
d769811ca93303 Adrian Hunter              2020-05-12  2699  		 * new instruction flow or FUP/TIP of INT3. Thus decoders can
d769811ca93303 Adrian Hunter              2020-05-12  2700  		 * use the timestamp as the point at which to modify the
d769811ca93303 Adrian Hunter              2020-05-12  2701  		 * executable code.
d769811ca93303 Adrian Hunter              2020-05-12  2702  		 * The old instruction is recorded so that the event can be
d769811ca93303 Adrian Hunter              2020-05-12  2703  		 * processed forwards or backwards.
d769811ca93303 Adrian Hunter              2020-05-12  2704  		 */
27b765aaed0f43 Ingo Molnar                2025-03-27  2705  		perf_event_text_poke(text_poke_addr(&text_poke_array.vec[i]), old, len, new, len);
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2706  	}
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2707  
c3d6324f841bab Peter Zijlstra             2019-06-05  2708  	if (do_sync) {
fd4363fff3d967 Jiri Kosina                2013-07-12  2709  		/*
fd4363fff3d967 Jiri Kosina                2013-07-12  2710  		 * According to Intel, this core syncing is very likely
fd4363fff3d967 Jiri Kosina                2013-07-12  2711  		 * not necessary and we'd be safe even without it. But
fd4363fff3d967 Jiri Kosina                2013-07-12  2712  		 * better safe than sorry (plus there's not only Intel).
fd4363fff3d967 Jiri Kosina                2013-07-12  2713  		 */
5c02ece81848db Peter Zijlstra             2019-10-09  2714  		text_poke_sync();
fd4363fff3d967 Jiri Kosina                2013-07-12  2715  	}
fd4363fff3d967 Jiri Kosina                2013-07-12  2716  
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2717  	/*
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2718  	 * Third step: replace the first byte (int3) by the first byte of
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2719  	 * replacing opcode.
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2720  	 */
27b765aaed0f43 Ingo Molnar                2025-03-27  2721  	for (do_sync = 0, i = 0; i < text_poke_array.nr_entries; i++) {
27b765aaed0f43 Ingo Molnar                2025-03-27  2722  		u8 byte = text_poke_array.vec[i].text[0];
ac0ee0a9560c97 Peter Zijlstra             2023-01-23  2723  
27b765aaed0f43 Ingo Molnar                2025-03-27  2724  		if (text_poke_array.vec[i].len == 6)
ac0ee0a9560c97 Peter Zijlstra             2023-01-23  2725  			byte = 0x0f;
ac0ee0a9560c97 Peter Zijlstra             2023-01-23  2726  
ac0ee0a9560c97 Peter Zijlstra             2023-01-23  2727  		if (byte == INT3_INSN_OPCODE)
c3d6324f841bab Peter Zijlstra             2019-06-05  2728  			continue;
fd4363fff3d967 Jiri Kosina                2013-07-12  2729  
27b765aaed0f43 Ingo Molnar                2025-03-27  2730  		text_poke(text_poke_addr(&text_poke_array.vec[i]), &byte, INT3_INSN_SIZE);
c3d6324f841bab Peter Zijlstra             2019-06-05  2731  		do_sync++;
c3d6324f841bab Peter Zijlstra             2019-06-05  2732  	}
c3d6324f841bab Peter Zijlstra             2019-06-05  2733  
c3d6324f841bab Peter Zijlstra             2019-06-05  2734  	if (do_sync)
5c02ece81848db Peter Zijlstra             2019-10-09  2735  		text_poke_sync();
c3d6324f841bab Peter Zijlstra             2019-06-05  2736  
01651324edad9d Peter Zijlstra             2017-07-31  2737  	/*
efd608fa7403ba Nadav Amit                 2022-09-21  2738  	 * Remove and wait for refs to be zero.
451283cd40bcec Peter Zijlstra             2025-03-25  2739  	 *
451283cd40bcec Peter Zijlstra             2025-03-25  2740  	 * Notably, if after step-3 above the INT3 got removed, then the
451283cd40bcec Peter Zijlstra             2025-03-25  2741  	 * text_poke_sync() will have serialized against any running INT3
451283cd40bcec Peter Zijlstra             2025-03-25  2742  	 * handlers and the below spin-wait will not happen.
451283cd40bcec Peter Zijlstra             2025-03-25  2743  	 *
451283cd40bcec Peter Zijlstra             2025-03-25  2744  	 * IOW. unless the replacement instruction is INT3, this case goes
451283cd40bcec Peter Zijlstra             2025-03-25  2745  	 * unused.
01651324edad9d Peter Zijlstra             2017-07-31  2746  	 */
41e4ceece5913b Eric Dumazet               2025-03-25  2747  	for_each_possible_cpu(i) {
7cb90cbd1a9fa0 Ingo Molnar                2025-03-27  2748  		atomic_t *refs = per_cpu_ptr(&int3_refs, i);
41e4ceece5913b Eric Dumazet               2025-03-25  2749  
41e4ceece5913b Eric Dumazet               2025-03-25  2750  		if (unlikely(!atomic_dec_and_test(refs)))
41e4ceece5913b Eric Dumazet               2025-03-25  2751  			atomic_cond_read_acquire(refs, !VAL);
41e4ceece5913b Eric Dumazet               2025-03-25  2752  	}
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2753  }
c0213b0ac03cf6 Daniel Bristot de Oliveira 2019-06-12  2754  

:::::: The code at line 2614 was first introduced by commit
:::::: fd4363fff3d96795d3feb1b3fb48ce590f186bdd x86: Introduce int3 (breakpoint)-based instruction patching

:::::: TO: Jiri Kosina <jkosina@suse.cz>
:::::: CC: H. Peter Anvin <hpa@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
