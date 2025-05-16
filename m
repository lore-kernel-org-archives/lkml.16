Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D9E282E1;
	Fri, 16 May 2025 08:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383625; cv=none; b=YcUgJUoYGdqqT+Xiq5I0oAvZ4tQqJXvXQyBvQvll6qQQRG+wVyiQVAsJUOwMXBlGuR/8Ta5U0EEbJzgjiRqXe1xrFszhYiyQaeWAHef9J/Wk3O3mW1t2lz35HKUySgQC101Tnf2yn15u3TgBKN4sRvdMKUlsOgxWKZZOZ+e//z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383625; c=relaxed/simple;
	bh=rJCfkpAiwH1Oqjh4q9QJR86Cbsal99PZdsnA/aKfzJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOFuF4M2Eb6/cWMRMl9AeJqGRCNd+dCbHxEgbeZUQW06LcuCk3hqwCCKCbrH4OCWMxJJxIKzCQPdUy5D8othjGbUC23+6b8BZiQqLPwcLvi5iJa9qd5jff/ChAJm0rzEETrRmS4OKWt7vr8MvA8mRFduEAiERXW6IFoONNa19J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFPljMLm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFPljMLm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747383624; x=1778919624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rJCfkpAiwH1Oqjh4q9QJR86Cbsal99PZdsnA/aKfzJA=;
  b=kFPljMLmZvoNHFu3ASHoPHMYXYEoInLqEGOOi1dOOeUufLmniQgkGcLO
   BRX8tLP1HYMo4HoPoBF5RReIy9ft0ICIUaZ/4PqwUHxNAG1O2mS+baude
   08J8wXkVXeFKSpIVuR769OLuX3qeoDpFXzJBJG5fwI7vKF8ufbvROvnuo
   cy8VquJBgKk5aKyDr6D4qDRhOptGAsrPhbhCQ+pCYIDIcpolEasdJMCdN
   LzYAokyUtej/YuwMqtN2rKlleb7mNSw3wyehNkXffk4LgDLwZoM8VPjm4
   edgFa7iPBVzFWpYVFSmTmgLSsEy0gUkbk5XW/tBD59dMSf0R4ooD8iXpB
   Q==;
X-CSE-ConnectionGUID: BFsYJDzBRbWKg5cXrwsaCQ==
X-CSE-MsgGUID: 4kVtMwCfToeAa4FHM5oTwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49042024"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="49042024"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 01:20:23 -0700
X-CSE-ConnectionGUID: R0BSzaZ8RlK9HFjap/JB/g==
X-CSE-MsgGUID: RmjeCCAXQgO9d0FDRnc8FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="169683467"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 01:20:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFqIh-000J8B-26;
	Fri, 16 May 2025 08:20:15 +0000
Date: Fri, 16 May 2025 16:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usamaarif642@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, david@redhat.com
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
	ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kernel-team@meta.com, Usama Arif <usamaarif642@gmail.com>
Subject: Re: [PATCH 2/6] prctl: introduce PR_THP_POLICY_DEFAULT_NOHUGE for
 the process
Message-ID: <202505161626.4OeUVh4j-lkp@intel.com>
References: <20250515133519.2779639-3-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515133519.2779639-3-usamaarif642@gmail.com>

Hi Usama,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools linus/master v6.15-rc6]
[cannot apply to acme/perf/core next-20250515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/prctl-introduce-PR_THP_POLICY_DEFAULT_HUGE-for-the-process/20250515-213850
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250515133519.2779639-3-usamaarif642%40gmail.com
patch subject: [PATCH 2/6] prctl: introduce PR_THP_POLICY_DEFAULT_NOHUGE for the process
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250516/202505161626.4OeUVh4j-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161626.4OeUVh4j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161626.4OeUVh4j-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sys.c: In function '__do_sys_prctl':
   kernel/sys.c:2678:25: error: implicit declaration of function 'process_vmas_thp_default_huge' [-Wimplicit-function-declaration]
    2678 |                         process_vmas_thp_default_huge(me->mm);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sys.c:2683:25: error: implicit declaration of function 'process_vmas_thp_default_nohuge' [-Wimplicit-function-declaration]
    2683 |                         process_vmas_thp_default_nohuge(me->mm);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/process_vmas_thp_default_nohuge +2683 kernel/sys.c

  2472	
  2473	SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
  2474			unsigned long, arg4, unsigned long, arg5)
  2475	{
  2476		struct task_struct *me = current;
  2477		unsigned char comm[sizeof(me->comm)];
  2478		long error;
  2479	
  2480		error = security_task_prctl(option, arg2, arg3, arg4, arg5);
  2481		if (error != -ENOSYS)
  2482			return error;
  2483	
  2484		error = 0;
  2485		switch (option) {
  2486		case PR_SET_PDEATHSIG:
  2487			if (!valid_signal(arg2)) {
  2488				error = -EINVAL;
  2489				break;
  2490			}
  2491			me->pdeath_signal = arg2;
  2492			break;
  2493		case PR_GET_PDEATHSIG:
  2494			error = put_user(me->pdeath_signal, (int __user *)arg2);
  2495			break;
  2496		case PR_GET_DUMPABLE:
  2497			error = get_dumpable(me->mm);
  2498			break;
  2499		case PR_SET_DUMPABLE:
  2500			if (arg2 != SUID_DUMP_DISABLE && arg2 != SUID_DUMP_USER) {
  2501				error = -EINVAL;
  2502				break;
  2503			}
  2504			set_dumpable(me->mm, arg2);
  2505			break;
  2506	
  2507		case PR_SET_UNALIGN:
  2508			error = SET_UNALIGN_CTL(me, arg2);
  2509			break;
  2510		case PR_GET_UNALIGN:
  2511			error = GET_UNALIGN_CTL(me, arg2);
  2512			break;
  2513		case PR_SET_FPEMU:
  2514			error = SET_FPEMU_CTL(me, arg2);
  2515			break;
  2516		case PR_GET_FPEMU:
  2517			error = GET_FPEMU_CTL(me, arg2);
  2518			break;
  2519		case PR_SET_FPEXC:
  2520			error = SET_FPEXC_CTL(me, arg2);
  2521			break;
  2522		case PR_GET_FPEXC:
  2523			error = GET_FPEXC_CTL(me, arg2);
  2524			break;
  2525		case PR_GET_TIMING:
  2526			error = PR_TIMING_STATISTICAL;
  2527			break;
  2528		case PR_SET_TIMING:
  2529			if (arg2 != PR_TIMING_STATISTICAL)
  2530				error = -EINVAL;
  2531			break;
  2532		case PR_SET_NAME:
  2533			comm[sizeof(me->comm) - 1] = 0;
  2534			if (strncpy_from_user(comm, (char __user *)arg2,
  2535					      sizeof(me->comm) - 1) < 0)
  2536				return -EFAULT;
  2537			set_task_comm(me, comm);
  2538			proc_comm_connector(me);
  2539			break;
  2540		case PR_GET_NAME:
  2541			get_task_comm(comm, me);
  2542			if (copy_to_user((char __user *)arg2, comm, sizeof(comm)))
  2543				return -EFAULT;
  2544			break;
  2545		case PR_GET_ENDIAN:
  2546			error = GET_ENDIAN(me, arg2);
  2547			break;
  2548		case PR_SET_ENDIAN:
  2549			error = SET_ENDIAN(me, arg2);
  2550			break;
  2551		case PR_GET_SECCOMP:
  2552			error = prctl_get_seccomp();
  2553			break;
  2554		case PR_SET_SECCOMP:
  2555			error = prctl_set_seccomp(arg2, (char __user *)arg3);
  2556			break;
  2557		case PR_GET_TSC:
  2558			error = GET_TSC_CTL(arg2);
  2559			break;
  2560		case PR_SET_TSC:
  2561			error = SET_TSC_CTL(arg2);
  2562			break;
  2563		case PR_TASK_PERF_EVENTS_DISABLE:
  2564			error = perf_event_task_disable();
  2565			break;
  2566		case PR_TASK_PERF_EVENTS_ENABLE:
  2567			error = perf_event_task_enable();
  2568			break;
  2569		case PR_GET_TIMERSLACK:
  2570			if (current->timer_slack_ns > ULONG_MAX)
  2571				error = ULONG_MAX;
  2572			else
  2573				error = current->timer_slack_ns;
  2574			break;
  2575		case PR_SET_TIMERSLACK:
  2576			if (rt_or_dl_task_policy(current))
  2577				break;
  2578			if (arg2 <= 0)
  2579				current->timer_slack_ns =
  2580						current->default_timer_slack_ns;
  2581			else
  2582				current->timer_slack_ns = arg2;
  2583			break;
  2584		case PR_MCE_KILL:
  2585			if (arg4 | arg5)
  2586				return -EINVAL;
  2587			switch (arg2) {
  2588			case PR_MCE_KILL_CLEAR:
  2589				if (arg3 != 0)
  2590					return -EINVAL;
  2591				current->flags &= ~PF_MCE_PROCESS;
  2592				break;
  2593			case PR_MCE_KILL_SET:
  2594				current->flags |= PF_MCE_PROCESS;
  2595				if (arg3 == PR_MCE_KILL_EARLY)
  2596					current->flags |= PF_MCE_EARLY;
  2597				else if (arg3 == PR_MCE_KILL_LATE)
  2598					current->flags &= ~PF_MCE_EARLY;
  2599				else if (arg3 == PR_MCE_KILL_DEFAULT)
  2600					current->flags &=
  2601							~(PF_MCE_EARLY|PF_MCE_PROCESS);
  2602				else
  2603					return -EINVAL;
  2604				break;
  2605			default:
  2606				return -EINVAL;
  2607			}
  2608			break;
  2609		case PR_MCE_KILL_GET:
  2610			if (arg2 | arg3 | arg4 | arg5)
  2611				return -EINVAL;
  2612			if (current->flags & PF_MCE_PROCESS)
  2613				error = (current->flags & PF_MCE_EARLY) ?
  2614					PR_MCE_KILL_EARLY : PR_MCE_KILL_LATE;
  2615			else
  2616				error = PR_MCE_KILL_DEFAULT;
  2617			break;
  2618		case PR_SET_MM:
  2619			error = prctl_set_mm(arg2, arg3, arg4, arg5);
  2620			break;
  2621		case PR_GET_TID_ADDRESS:
  2622			error = prctl_get_tid_address(me, (int __user * __user *)arg2);
  2623			break;
  2624		case PR_SET_CHILD_SUBREAPER:
  2625			me->signal->is_child_subreaper = !!arg2;
  2626			if (!arg2)
  2627				break;
  2628	
  2629			walk_process_tree(me, propagate_has_child_subreaper, NULL);
  2630			break;
  2631		case PR_GET_CHILD_SUBREAPER:
  2632			error = put_user(me->signal->is_child_subreaper,
  2633					 (int __user *)arg2);
  2634			break;
  2635		case PR_SET_NO_NEW_PRIVS:
  2636			if (arg2 != 1 || arg3 || arg4 || arg5)
  2637				return -EINVAL;
  2638	
  2639			task_set_no_new_privs(current);
  2640			break;
  2641		case PR_GET_NO_NEW_PRIVS:
  2642			if (arg2 || arg3 || arg4 || arg5)
  2643				return -EINVAL;
  2644			return task_no_new_privs(current) ? 1 : 0;
  2645		case PR_GET_THP_DISABLE:
  2646			if (arg2 || arg3 || arg4 || arg5)
  2647				return -EINVAL;
  2648			error = !!test_bit(MMF_DISABLE_THP, &me->mm->flags);
  2649			break;
  2650		case PR_SET_THP_DISABLE:
  2651			if (arg3 || arg4 || arg5)
  2652				return -EINVAL;
  2653			if (mmap_write_lock_killable(me->mm))
  2654				return -EINTR;
  2655			if (arg2)
  2656				set_bit(MMF_DISABLE_THP, &me->mm->flags);
  2657			else
  2658				clear_bit(MMF_DISABLE_THP, &me->mm->flags);
  2659			mmap_write_unlock(me->mm);
  2660			break;
  2661		case PR_GET_THP_POLICY:
  2662			if (arg2 || arg3 || arg4 || arg5)
  2663				return -EINVAL;
  2664			if (!!test_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2))
  2665				error = PR_THP_POLICY_DEFAULT_HUGE;
  2666			else if (!!test_bit(MMF2_THP_VMA_DEFAULT_NOHUGE, &me->mm->flags2))
  2667				error = PR_THP_POLICY_DEFAULT_NOHUGE;
  2668			break;
  2669		case PR_SET_THP_POLICY:
  2670			if (arg3 || arg4 || arg5)
  2671				return -EINVAL;
  2672			if (mmap_write_lock_killable(me->mm))
  2673				return -EINTR;
  2674			switch (arg2) {
  2675			case PR_THP_POLICY_DEFAULT_HUGE:
  2676				set_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2);
  2677				clear_bit(MMF2_THP_VMA_DEFAULT_NOHUGE, &me->mm->flags2);
  2678				process_vmas_thp_default_huge(me->mm);
  2679				break;
  2680			case PR_THP_POLICY_DEFAULT_NOHUGE:
  2681				clear_bit(MMF2_THP_VMA_DEFAULT_HUGE, &me->mm->flags2);
  2682				set_bit(MMF2_THP_VMA_DEFAULT_NOHUGE, &me->mm->flags2);
> 2683				process_vmas_thp_default_nohuge(me->mm);
  2684				break;
  2685			default:
  2686				return -EINVAL;
  2687			}
  2688			mmap_write_unlock(me->mm);
  2689			break;
  2690		case PR_MPX_ENABLE_MANAGEMENT:
  2691		case PR_MPX_DISABLE_MANAGEMENT:
  2692			/* No longer implemented: */
  2693			return -EINVAL;
  2694		case PR_SET_FP_MODE:
  2695			error = SET_FP_MODE(me, arg2);
  2696			break;
  2697		case PR_GET_FP_MODE:
  2698			error = GET_FP_MODE(me);
  2699			break;
  2700		case PR_SVE_SET_VL:
  2701			error = SVE_SET_VL(arg2);
  2702			break;
  2703		case PR_SVE_GET_VL:
  2704			error = SVE_GET_VL();
  2705			break;
  2706		case PR_SME_SET_VL:
  2707			error = SME_SET_VL(arg2);
  2708			break;
  2709		case PR_SME_GET_VL:
  2710			error = SME_GET_VL();
  2711			break;
  2712		case PR_GET_SPECULATION_CTRL:
  2713			if (arg3 || arg4 || arg5)
  2714				return -EINVAL;
  2715			error = arch_prctl_spec_ctrl_get(me, arg2);
  2716			break;
  2717		case PR_SET_SPECULATION_CTRL:
  2718			if (arg4 || arg5)
  2719				return -EINVAL;
  2720			error = arch_prctl_spec_ctrl_set(me, arg2, arg3);
  2721			break;
  2722		case PR_PAC_RESET_KEYS:
  2723			if (arg3 || arg4 || arg5)
  2724				return -EINVAL;
  2725			error = PAC_RESET_KEYS(me, arg2);
  2726			break;
  2727		case PR_PAC_SET_ENABLED_KEYS:
  2728			if (arg4 || arg5)
  2729				return -EINVAL;
  2730			error = PAC_SET_ENABLED_KEYS(me, arg2, arg3);
  2731			break;
  2732		case PR_PAC_GET_ENABLED_KEYS:
  2733			if (arg2 || arg3 || arg4 || arg5)
  2734				return -EINVAL;
  2735			error = PAC_GET_ENABLED_KEYS(me);
  2736			break;
  2737		case PR_SET_TAGGED_ADDR_CTRL:
  2738			if (arg3 || arg4 || arg5)
  2739				return -EINVAL;
  2740			error = SET_TAGGED_ADDR_CTRL(arg2);
  2741			break;
  2742		case PR_GET_TAGGED_ADDR_CTRL:
  2743			if (arg2 || arg3 || arg4 || arg5)
  2744				return -EINVAL;
  2745			error = GET_TAGGED_ADDR_CTRL();
  2746			break;
  2747		case PR_SET_IO_FLUSHER:
  2748			if (!capable(CAP_SYS_RESOURCE))
  2749				return -EPERM;
  2750	
  2751			if (arg3 || arg4 || arg5)
  2752				return -EINVAL;
  2753	
  2754			if (arg2 == 1)
  2755				current->flags |= PR_IO_FLUSHER;
  2756			else if (!arg2)
  2757				current->flags &= ~PR_IO_FLUSHER;
  2758			else
  2759				return -EINVAL;
  2760			break;
  2761		case PR_GET_IO_FLUSHER:
  2762			if (!capable(CAP_SYS_RESOURCE))
  2763				return -EPERM;
  2764	
  2765			if (arg2 || arg3 || arg4 || arg5)
  2766				return -EINVAL;
  2767	
  2768			error = (current->flags & PR_IO_FLUSHER) == PR_IO_FLUSHER;
  2769			break;
  2770		case PR_SET_SYSCALL_USER_DISPATCH:
  2771			error = set_syscall_user_dispatch(arg2, arg3, arg4,
  2772							  (char __user *) arg5);
  2773			break;
  2774	#ifdef CONFIG_SCHED_CORE
  2775		case PR_SCHED_CORE:
  2776			error = sched_core_share_pid(arg2, arg3, arg4, arg5);
  2777			break;
  2778	#endif
  2779		case PR_SET_MDWE:
  2780			error = prctl_set_mdwe(arg2, arg3, arg4, arg5);
  2781			break;
  2782		case PR_GET_MDWE:
  2783			error = prctl_get_mdwe(arg2, arg3, arg4, arg5);
  2784			break;
  2785		case PR_PPC_GET_DEXCR:
  2786			if (arg3 || arg4 || arg5)
  2787				return -EINVAL;
  2788			error = PPC_GET_DEXCR_ASPECT(me, arg2);
  2789			break;
  2790		case PR_PPC_SET_DEXCR:
  2791			if (arg4 || arg5)
  2792				return -EINVAL;
  2793			error = PPC_SET_DEXCR_ASPECT(me, arg2, arg3);
  2794			break;
  2795		case PR_SET_VMA:
  2796			error = prctl_set_vma(arg2, arg3, arg4, arg5);
  2797			break;
  2798		case PR_GET_AUXV:
  2799			if (arg4 || arg5)
  2800				return -EINVAL;
  2801			error = prctl_get_auxv((void __user *)arg2, arg3);
  2802			break;
  2803	#ifdef CONFIG_KSM
  2804		case PR_SET_MEMORY_MERGE:
  2805			if (arg3 || arg4 || arg5)
  2806				return -EINVAL;
  2807			if (mmap_write_lock_killable(me->mm))
  2808				return -EINTR;
  2809	
  2810			if (arg2)
  2811				error = ksm_enable_merge_any(me->mm);
  2812			else
  2813				error = ksm_disable_merge_any(me->mm);
  2814			mmap_write_unlock(me->mm);
  2815			break;
  2816		case PR_GET_MEMORY_MERGE:
  2817			if (arg2 || arg3 || arg4 || arg5)
  2818				return -EINVAL;
  2819	
  2820			error = !!test_bit(MMF_VM_MERGE_ANY, &me->mm->flags);
  2821			break;
  2822	#endif
  2823		case PR_RISCV_V_SET_CONTROL:
  2824			error = RISCV_V_SET_CONTROL(arg2);
  2825			break;
  2826		case PR_RISCV_V_GET_CONTROL:
  2827			error = RISCV_V_GET_CONTROL();
  2828			break;
  2829		case PR_RISCV_SET_ICACHE_FLUSH_CTX:
  2830			error = RISCV_SET_ICACHE_FLUSH_CTX(arg2, arg3);
  2831			break;
  2832		case PR_GET_SHADOW_STACK_STATUS:
  2833			if (arg3 || arg4 || arg5)
  2834				return -EINVAL;
  2835			error = arch_get_shadow_stack_status(me, (unsigned long __user *) arg2);
  2836			break;
  2837		case PR_SET_SHADOW_STACK_STATUS:
  2838			if (arg3 || arg4 || arg5)
  2839				return -EINVAL;
  2840			error = arch_set_shadow_stack_status(me, arg2);
  2841			break;
  2842		case PR_LOCK_SHADOW_STACK_STATUS:
  2843			if (arg3 || arg4 || arg5)
  2844				return -EINVAL;
  2845			error = arch_lock_shadow_stack_status(me, arg2);
  2846			break;
  2847		case PR_TIMER_CREATE_RESTORE_IDS:
  2848			if (arg3 || arg4 || arg5)
  2849				return -EINVAL;
  2850			error = posixtimer_create_prctl(arg2);
  2851			break;
  2852		default:
  2853			trace_task_prctl_unknown(option, arg2, arg3, arg4, arg5);
  2854			error = -EINVAL;
  2855			break;
  2856		}
  2857		return error;
  2858	}
  2859	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
