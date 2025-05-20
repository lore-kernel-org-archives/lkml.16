Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF3025D8E2;
	Tue, 20 May 2025 08:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747730898; cv=none; b=LJkEPwl+ICX7JLBKt8CkLfagwTI9L2cWsbVhc4dmTVFHxJ1rnAkpPhX/GkNHfFOabD5NBO8yoyLchh+2Kd4aaLDZpIzrXy3DFl3svkwttV4uxyt2dVHADnRvrH8gPEQKCRXq1LtTZvI5BPCWWR8Z9K5hUt9N14eQ6z/s6CcaROY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747730898; c=relaxed/simple;
	bh=Nvx6Aq+SBJqdlffn+UwWMGGi9i089aEYk067EZNhwWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sdfv8zQ909Y19nNYdwJ17F1pezo2Mp1eRiTBkelnohzaWHbju/Egv/MT2Rpqv1XmW9kt1iQ4RjksQSIz2/JPXr6z3dt0ghSyD98rWtVuFGAoRHLzZVSeIHn9bb5lAjHkEdeVAa33qpXR+Bzc+UXruws25PVwmZTQKNB38ZHbAgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gugs7sNN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gugs7sNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747730897; x=1779266897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nvx6Aq+SBJqdlffn+UwWMGGi9i089aEYk067EZNhwWU=;
  b=gugs7sNN65vvv84svopu5PIh8NVGOgrFqxaQhvobTN4llwWZ5qiL5HX6
   GH8vKrCPu/cJNCP0+r67+32xL93jIbkWIxeVE344r9MffCsYpAAVNN249
   k8Y/tP6pO3RRp5Qaz+nkzE/mvHEar8T9pnL78i1cVa7oW7Px2bfibxL15
   lrvSPUALJw8f7PDNNSPI5U4t5dY2aAv/6tP1WOLes6qOOIyz6MUKHBm8v
   SCf2wCnNIg1ic0RK1ZzEFaqKdD9HUbGvWWrMArvCNZSTS9DPQAWVlyU3C
   agVyNQ4zSOHe5AgXHXgwtVxXSr+3fwNu/gPFCCpBkV4peXF1Npks0Lvc3
   Q==;
X-CSE-ConnectionGUID: 6dv1zwC9SEmDapnb4bFLEw==
X-CSE-MsgGUID: 6PPXbeEnRqmQtErZ6vAPRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="61047115"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="61047115"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 01:48:16 -0700
X-CSE-ConnectionGUID: 6+YtTFaVSKOaoy72gA7D6w==
X-CSE-MsgGUID: xbJeOMHdSIaobOMTRaVbvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144482702"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 May 2025 01:48:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHIds-000MLc-0r;
	Tue, 20 May 2025 08:48:08 +0000
Date: Tue, 20 May 2025 16:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usamaarif642@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, david@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
	ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
	npache@redhat.com, ryan.roberts@arm.com, vbabka@suse.cz,
	jannh@google.com, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kernel-team@meta.com, Usama Arif <usamaarif642@gmail.com>
Subject: Re: [PATCH v3 2/7] prctl: introduce PR_DEFAULT_MADV_HUGEPAGE for the
 process
Message-ID: <202505201614.N4SXnAln-lkp@intel.com>
References: <20250519223307.3601786-3-usamaarif642@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519223307.3601786-3-usamaarif642@gmail.com>

Hi Usama,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on perf-tools-next/perf-tools-next tip/perf/core perf-tools/perf-tools linus/master v6.15-rc7]
[cannot apply to acme/perf/core next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Usama-Arif/mm-khugepaged-extract-vm-flag-setting-outside-of-hugepage_madvise/20250520-063452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250519223307.3601786-3-usamaarif642%40gmail.com
patch subject: [PATCH v3 2/7] prctl: introduce PR_DEFAULT_MADV_HUGEPAGE for the process
config: s390-randconfig-001-20250520 (https://download.01.org/0day-ci/archive/20250520/202505201614.N4SXnAln-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505201614.N4SXnAln-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201614.N4SXnAln-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sys.c:2678:9: error: call to undeclared function 'hugepage_global_enabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2678 |                         if (!hugepage_global_enabled())
         |                              ^
>> kernel/sys.c:2680:12: error: call to undeclared function 'hugepage_set_vmflags'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2680 |                         error = hugepage_set_vmflags(&mm->def_flags, MADV_HUGEPAGE);
         |                                 ^
>> kernel/sys.c:2682:5: error: call to undeclared function 'process_default_madv_hugepage'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2682 |                                 process_default_madv_hugepage(mm, MADV_HUGEPAGE);
         |                                 ^
   3 errors generated.


vim +/hugepage_global_enabled +2678 kernel/sys.c

  2472	
  2473	SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
  2474			unsigned long, arg4, unsigned long, arg5)
  2475	{
  2476		struct task_struct *me = current;
  2477		struct mm_struct *mm = me->mm;
  2478		unsigned char comm[sizeof(me->comm)];
  2479		long error;
  2480	
  2481		error = security_task_prctl(option, arg2, arg3, arg4, arg5);
  2482		if (error != -ENOSYS)
  2483			return error;
  2484	
  2485		error = 0;
  2486		switch (option) {
  2487		case PR_SET_PDEATHSIG:
  2488			if (!valid_signal(arg2)) {
  2489				error = -EINVAL;
  2490				break;
  2491			}
  2492			me->pdeath_signal = arg2;
  2493			break;
  2494		case PR_GET_PDEATHSIG:
  2495			error = put_user(me->pdeath_signal, (int __user *)arg2);
  2496			break;
  2497		case PR_GET_DUMPABLE:
  2498			error = get_dumpable(me->mm);
  2499			break;
  2500		case PR_SET_DUMPABLE:
  2501			if (arg2 != SUID_DUMP_DISABLE && arg2 != SUID_DUMP_USER) {
  2502				error = -EINVAL;
  2503				break;
  2504			}
  2505			set_dumpable(me->mm, arg2);
  2506			break;
  2507	
  2508		case PR_SET_UNALIGN:
  2509			error = SET_UNALIGN_CTL(me, arg2);
  2510			break;
  2511		case PR_GET_UNALIGN:
  2512			error = GET_UNALIGN_CTL(me, arg2);
  2513			break;
  2514		case PR_SET_FPEMU:
  2515			error = SET_FPEMU_CTL(me, arg2);
  2516			break;
  2517		case PR_GET_FPEMU:
  2518			error = GET_FPEMU_CTL(me, arg2);
  2519			break;
  2520		case PR_SET_FPEXC:
  2521			error = SET_FPEXC_CTL(me, arg2);
  2522			break;
  2523		case PR_GET_FPEXC:
  2524			error = GET_FPEXC_CTL(me, arg2);
  2525			break;
  2526		case PR_GET_TIMING:
  2527			error = PR_TIMING_STATISTICAL;
  2528			break;
  2529		case PR_SET_TIMING:
  2530			if (arg2 != PR_TIMING_STATISTICAL)
  2531				error = -EINVAL;
  2532			break;
  2533		case PR_SET_NAME:
  2534			comm[sizeof(me->comm) - 1] = 0;
  2535			if (strncpy_from_user(comm, (char __user *)arg2,
  2536					      sizeof(me->comm) - 1) < 0)
  2537				return -EFAULT;
  2538			set_task_comm(me, comm);
  2539			proc_comm_connector(me);
  2540			break;
  2541		case PR_GET_NAME:
  2542			get_task_comm(comm, me);
  2543			if (copy_to_user((char __user *)arg2, comm, sizeof(comm)))
  2544				return -EFAULT;
  2545			break;
  2546		case PR_GET_ENDIAN:
  2547			error = GET_ENDIAN(me, arg2);
  2548			break;
  2549		case PR_SET_ENDIAN:
  2550			error = SET_ENDIAN(me, arg2);
  2551			break;
  2552		case PR_GET_SECCOMP:
  2553			error = prctl_get_seccomp();
  2554			break;
  2555		case PR_SET_SECCOMP:
  2556			error = prctl_set_seccomp(arg2, (char __user *)arg3);
  2557			break;
  2558		case PR_GET_TSC:
  2559			error = GET_TSC_CTL(arg2);
  2560			break;
  2561		case PR_SET_TSC:
  2562			error = SET_TSC_CTL(arg2);
  2563			break;
  2564		case PR_TASK_PERF_EVENTS_DISABLE:
  2565			error = perf_event_task_disable();
  2566			break;
  2567		case PR_TASK_PERF_EVENTS_ENABLE:
  2568			error = perf_event_task_enable();
  2569			break;
  2570		case PR_GET_TIMERSLACK:
  2571			if (current->timer_slack_ns > ULONG_MAX)
  2572				error = ULONG_MAX;
  2573			else
  2574				error = current->timer_slack_ns;
  2575			break;
  2576		case PR_SET_TIMERSLACK:
  2577			if (rt_or_dl_task_policy(current))
  2578				break;
  2579			if (arg2 <= 0)
  2580				current->timer_slack_ns =
  2581						current->default_timer_slack_ns;
  2582			else
  2583				current->timer_slack_ns = arg2;
  2584			break;
  2585		case PR_MCE_KILL:
  2586			if (arg4 | arg5)
  2587				return -EINVAL;
  2588			switch (arg2) {
  2589			case PR_MCE_KILL_CLEAR:
  2590				if (arg3 != 0)
  2591					return -EINVAL;
  2592				current->flags &= ~PF_MCE_PROCESS;
  2593				break;
  2594			case PR_MCE_KILL_SET:
  2595				current->flags |= PF_MCE_PROCESS;
  2596				if (arg3 == PR_MCE_KILL_EARLY)
  2597					current->flags |= PF_MCE_EARLY;
  2598				else if (arg3 == PR_MCE_KILL_LATE)
  2599					current->flags &= ~PF_MCE_EARLY;
  2600				else if (arg3 == PR_MCE_KILL_DEFAULT)
  2601					current->flags &=
  2602							~(PF_MCE_EARLY|PF_MCE_PROCESS);
  2603				else
  2604					return -EINVAL;
  2605				break;
  2606			default:
  2607				return -EINVAL;
  2608			}
  2609			break;
  2610		case PR_MCE_KILL_GET:
  2611			if (arg2 | arg3 | arg4 | arg5)
  2612				return -EINVAL;
  2613			if (current->flags & PF_MCE_PROCESS)
  2614				error = (current->flags & PF_MCE_EARLY) ?
  2615					PR_MCE_KILL_EARLY : PR_MCE_KILL_LATE;
  2616			else
  2617				error = PR_MCE_KILL_DEFAULT;
  2618			break;
  2619		case PR_SET_MM:
  2620			error = prctl_set_mm(arg2, arg3, arg4, arg5);
  2621			break;
  2622		case PR_GET_TID_ADDRESS:
  2623			error = prctl_get_tid_address(me, (int __user * __user *)arg2);
  2624			break;
  2625		case PR_SET_CHILD_SUBREAPER:
  2626			me->signal->is_child_subreaper = !!arg2;
  2627			if (!arg2)
  2628				break;
  2629	
  2630			walk_process_tree(me, propagate_has_child_subreaper, NULL);
  2631			break;
  2632		case PR_GET_CHILD_SUBREAPER:
  2633			error = put_user(me->signal->is_child_subreaper,
  2634					 (int __user *)arg2);
  2635			break;
  2636		case PR_SET_NO_NEW_PRIVS:
  2637			if (arg2 != 1 || arg3 || arg4 || arg5)
  2638				return -EINVAL;
  2639	
  2640			task_set_no_new_privs(current);
  2641			break;
  2642		case PR_GET_NO_NEW_PRIVS:
  2643			if (arg2 || arg3 || arg4 || arg5)
  2644				return -EINVAL;
  2645			return task_no_new_privs(current) ? 1 : 0;
  2646		case PR_GET_THP_DISABLE:
  2647			if (arg2 || arg3 || arg4 || arg5)
  2648				return -EINVAL;
  2649			error = !!test_bit(MMF_DISABLE_THP, &me->mm->flags);
  2650			break;
  2651		case PR_SET_THP_DISABLE:
  2652			if (arg3 || arg4 || arg5)
  2653				return -EINVAL;
  2654			if (mmap_write_lock_killable(me->mm))
  2655				return -EINTR;
  2656			if (arg2)
  2657				set_bit(MMF_DISABLE_THP, &me->mm->flags);
  2658			else
  2659				clear_bit(MMF_DISABLE_THP, &me->mm->flags);
  2660			mmap_write_unlock(me->mm);
  2661			break;
  2662		case PR_GET_THP_POLICY:
  2663			if (arg2 || arg3 || arg4 || arg5)
  2664				return -EINVAL;
  2665			if (mmap_write_lock_killable(mm))
  2666				return -EINTR;
  2667			if (mm->def_flags & VM_HUGEPAGE)
  2668				error = PR_DEFAULT_MADV_HUGEPAGE;
  2669			mmap_write_unlock(mm);
  2670			break;
  2671		case PR_SET_THP_POLICY:
  2672			if (arg3 || arg4 || arg5)
  2673				return -EINVAL;
  2674			if (mmap_write_lock_killable(mm))
  2675				return -EINTR;
  2676			switch (arg2) {
  2677			case PR_DEFAULT_MADV_HUGEPAGE:
> 2678				if (!hugepage_global_enabled())
  2679					error = -EPERM;
> 2680				error = hugepage_set_vmflags(&mm->def_flags, MADV_HUGEPAGE);
  2681				if (!error)
> 2682					process_default_madv_hugepage(mm, MADV_HUGEPAGE);
  2683				break;
  2684			default:
  2685				error = -EINVAL;
  2686				break;
  2687			}
  2688			mmap_write_unlock(mm);
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
