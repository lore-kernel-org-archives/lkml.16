Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB942459EC
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944676; cv=none; b=UXUPQYhyjb8/MiyquPnoXBS3fYksAcJQ6DsCm2cFfMhoycAH/dHxRo10dN/Afe87WL5wYk90Y14clvubDTOcZeV/8scWsChJHiUxzuwsuL9r/oB4aLfnHaiqictuQBMfZjAn3g2Hz5t7KxR++lwpF8JNDrEmLJ3XjMiVG7WQ0ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944676; c=relaxed/simple;
	bh=VLHDyQ3gv+d0/xCunQosPm0u0ghgi9MXHQslBr37jyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LNqA1c/ttn18+mdL7/LTzH56tcqCB4mF7ocPpO9lurpM4eIyGH5o9Q0y823IWdgTUOiBfo8wV65d4K/1kW0y2VLg3q56DL2FxDeo5RkXdBA0fVeoAYNgvj7neIaH6O8BoiR4JgCCisgNvxHWMADmM2y6Qt6nkP1HyJQe8i9ICBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R3UdSLzb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R3UdSLzb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745944673; x=1777480673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VLHDyQ3gv+d0/xCunQosPm0u0ghgi9MXHQslBr37jyA=;
  b=R3UdSLzb263oAlXrNcrtiwgBsVKtkEts9iDmE6EsiO3lR8PIq0/WJRL/
   2zkOAe8mF4O39G9o4EgEKGWezEy+nFRh3uXt4XVI8AXGJzurZuT31fimN
   VH76/YKVGgFJ/J+Uh2mLfSyl9AXdCRzrTCEj0oydweYDEYA8rvBgSpLK+
   BYTllGZDKKXPogHI9Kryp6Ie158ipGOYemTdSIiVHMhJkPaEfBYQEftS1
   tlw81L2HUbKUoJ47eKveARgUrAw7JvsJ/e1hgFkPBghyRo2GOCzZybZVJ
   6eiMrrNL+r/H1cMl3uGTucL+f2a6fDamLd3HMuJOxG86JUu1MbdIt1o0e
   Q==;
X-CSE-ConnectionGUID: yXjCyqDcRTezxEA78T+4Cg==
X-CSE-MsgGUID: nl6i/q6oRgqIcvyMZhCbfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58215010"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="58215010"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 09:37:53 -0700
X-CSE-ConnectionGUID: TGvhxFDySBa9YR8V/Yeb2g==
X-CSE-MsgGUID: qYG2wNeAR8it1V++ON/tcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="133771195"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Apr 2025 09:37:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9nxq-0000vH-2S;
	Tue, 29 Apr 2025 16:37:46 +0000
Date: Wed, 30 Apr 2025 00:37:33 +0800
From: kernel test robot <lkp@intel.com>
To: Donet Tom <donettom@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
	Donet Tom <donettom@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] driver/base: Optimize memory block registration
 to reduce boot time
Message-ID: <202504300020.lYdm2Yud-lkp@intel.com>
References: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com>

Hi Donet,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.15-rc4 next-20250429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Donet-Tom/driver-base-Remove-unused-functions/20250429-010442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom%40linux.ibm.com
patch subject: [PATCH v2 1/2] driver/base: Optimize memory block registration to reduce boot time
config: s390-randconfig-001-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300020.lYdm2Yud-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300020.lYdm2Yud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300020.lYdm2Yud-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/attr.c:18:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:30:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
>> include/linux/node.h:124:6: warning: no previous prototype for function 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^
   include/linux/node.h:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     124 | void register_memory_blocks_under_node_early(int nid)
         | ^
         | static 
   1 warning generated.
--
   In file included from mm/slub.c:14:
   In file included from include/linux/swap.h:11:
>> include/linux/node.h:124:6: warning: no previous prototype for function 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^
   include/linux/node.h:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     124 | void register_memory_blocks_under_node_early(int nid)
         | ^
         | static 
   mm/slub.c:414:6: warning: unused function 'stat_add' [-Wunused-function]
     414 | void stat_add(const struct kmem_cache *s, enum stat_item si, int v)
         |      ^~~~~~~~
   mm/slub.c:527:21: warning: unused function 'get_freepointer_safe' [-Wunused-function]
     527 | static inline void *get_freepointer_safe(struct kmem_cache *s, void *object)
         |                     ^~~~~~~~~~~~~~~~~~~~
   mm/slub.c:627:1: warning: unused function 'slub_set_cpu_partial' [-Wunused-function]
     627 | slub_set_cpu_partial(struct kmem_cache *s, unsigned int nr_objects)
         | ^~~~~~~~~~~~~~~~~~~~
   mm/slub.c:691:20: warning: unused function '__slab_update_freelist' [-Wunused-function]
     691 | static inline bool __slab_update_freelist(struct kmem_cache *s, struct slab *slab,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:1889:20: warning: unused function 'set_track' [-Wunused-function]
    1889 | static inline void set_track(struct kmem_cache *s, void *object,
         |                    ^~~~~~~~~
   mm/slub.c:3429:19: warning: unused function 'node_match' [-Wunused-function]
    3429 | static inline int node_match(struct slab *slab, int node)
         |                   ^~~~~~~~~~
   7 warnings generated.
--
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm_inline.h:8:
   In file included from include/linux/swap.h:11:
>> include/linux/node.h:124:6: warning: no previous prototype for function 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^
   include/linux/node.h:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     124 | void register_memory_blocks_under_node_early(int nid)
         | ^
         | static 
   mm/mremap.c:288:20: warning: unused function 'arch_supports_page_table_move' [-Wunused-function]
     288 | static inline bool arch_supports_page_table_move(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mremap.c:287:39: note: expanded from macro 'arch_supports_page_table_move'
     287 | #define arch_supports_page_table_move arch_supports_page_table_move
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from kernel/jump_label.c:9:
   In file included from include/linux/memory.h:19:
>> include/linux/node.h:124:6: warning: no previous prototype for function 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^
   include/linux/node.h:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     124 | void register_memory_blocks_under_node_early(int nid)
         | ^
         | static 
   kernel/jump_label.c:415:20: warning: unused function 'static_key_type' [-Wunused-function]
     415 | static inline bool static_key_type(struct static_key *key)
         |                    ^~~~~~~~~~~~~~~
   kernel/jump_label.c:420:20: warning: unused function 'static_key_linked' [-Wunused-function]
     420 | static inline bool static_key_linked(struct static_key *key)
         |                    ^~~~~~~~~~~~~~~~~
   kernel/jump_label.c:425:20: warning: unused function 'static_key_clear_linked' [-Wunused-function]
     425 | static inline void static_key_clear_linked(struct static_key *key)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/jump_label.c:430:20: warning: unused function 'static_key_set_linked' [-Wunused-function]
     430 | static inline void static_key_set_linked(struct static_key *key)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.
--
   In file included from io_uring/uring_cmd.c:7:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:30:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
>> include/linux/node.h:124:6: warning: no previous prototype for function 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^
   include/linux/node.h:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     124 | void register_memory_blocks_under_node_early(int nid)
         | ^
         | static 
   io_uring/uring_cmd.c:306:19: warning: unused function 'io_uring_cmd_getsockopt' [-Wunused-function]
     306 | static inline int io_uring_cmd_getsockopt(struct socket *sock,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   io_uring/uring_cmd.c:333:19: warning: unused function 'io_uring_cmd_setsockopt' [-Wunused-function]
     333 | static inline int io_uring_cmd_setsockopt(struct socket *sock,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
   In file included from kernel/trace/ftrace.c:17:
   In file included from include/linux/stop_machine.h:5:
   In file included from include/linux/cpu.h:17:
>> include/linux/node.h:124:6: warning: no previous prototype for function 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^
   include/linux/node.h:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     124 | void register_memory_blocks_under_node_early(int nid)
         | ^
         | static 
   kernel/trace/ftrace.c:4354:19: warning: unused function 'test_for_valid_rec' [-Wunused-function]
    4354 | static inline int test_for_valid_rec(struct dyn_ftrace *rec)
         |                   ^~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from kernel/sched/fair.c:57:
   In file included from kernel/sched/sched.h:31:
   In file included from include/linux/cpufreq.h:12:
   In file included from include/linux/cpu.h:17:
>> include/linux/node.h:124:6: warning: no previous prototype for function 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^
   include/linux/node.h:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     124 | void register_memory_blocks_under_node_early(int nid)
         | ^
         | static 
   kernel/sched/fair.c:484:20: warning: unused function 'list_del_leaf_cfs_rq' [-Wunused-function]
     484 | static inline void list_del_leaf_cfs_rq(struct cfs_rq *cfs_rq)
         |                    ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:505:19: warning: unused function 'tg_is_idle' [-Wunused-function]
     505 | static inline int tg_is_idle(struct task_group *tg)
         |                   ^~~~~~~~~~
   kernel/sched/fair.c:6747:20: warning: unused function 'sync_throttle' [-Wunused-function]
    6747 | static inline void sync_throttle(struct task_group *tg, int cpu) {}
         |                    ^~~~~~~~~~~~~
   kernel/sched/fair.c:6771:37: warning: unused function 'tg_cfs_bandwidth' [-Wunused-function]
    6771 | static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
         |                                     ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c:6775:20: warning: unused function 'destroy_cfs_bandwidth' [-Wunused-function]
    6775 | static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~
   6 warnings generated.
--
   In file included from kernel/sched/core.c:14:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:5:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
>> include/linux/node.h:124:6: warning: no previous prototype for function 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^
   include/linux/node.h:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     124 | void register_memory_blocks_under_node_early(int nid)
         | ^
         | static 
   kernel/sched/core.c:6444:1: warning: unused function 'class_core_lock_lock_ptr' [-Wunused-function]
    6444 | DEFINE_LOCK_GUARD_1(core_lock, int,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6445 |                     sched_core_lock(*_T->lock, &_T->flags),
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6446 |                     sched_core_unlock(*_T->lock, &_T->flags),
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6447 |                     unsigned long flags)
         |                     ~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:408:49: note: expanded from macro 'DEFINE_LOCK_GUARD_1'
     408 | __DEFINE_CLASS_IS_CONDITIONAL(_name, false);                            \
         |                                                                         ^
     409 | __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)               \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:387:10: note: expanded from macro '\
   __DEFINE_UNLOCK_GUARD'
     387 |                                                                         \
         |                                                                         ^
     388 | __DEFINE_GUARD_LOCK_PTR(_name, &_T->lock)
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/cleanup.h:295:23: note: expanded from macro '\
   __DEFINE_GUARD_LOCK_PTR'
     295 |         static inline void * class_##_name##_lock_ptr(class_##_name##_t *_T) \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:36:1: note: expanded from here
      36 | class_core_lock_lock_ptr
         | ^~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from kernel/trace/rv/monitors/snep/snep.c:3:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
>> include/linux/node.h:124:6: warning: no previous prototype for function 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^
   include/linux/node.h:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     124 | void register_memory_blocks_under_node_early(int nid)
         | ^
         | static 
   kernel/trace/rv/monitors/snep/snep.c:21:1: warning: unused function 'da_handle_start_run_event_snep' [-Wunused-function]
      21 | DECLARE_DA_MON_PER_CPU(snep, unsigned char);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/rv/da_monitor.h:536:48: note: expanded from macro 'DECLARE_DA_MON_PER_CPU'
     536 | DECLARE_DA_MON_INIT_PER_CPU(name, type)                                                         \
         |                                                                                                 ^
     537 | DECLARE_DA_MON_MONITOR_HANDLER_IMPLICIT(name, type)
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/rv/da_monitor.h:438:20: note: expanded from macro '\
   DECLARE_DA_MON_MONITOR_HANDLER_IMPLICIT'
     438 | static inline bool da_handle_start_run_event_##name(enum events_##name event)                   \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:2:1: note: expanded from here
       2 | da_handle_start_run_event_snep
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from kernel/trace/rv/monitors/scpd/scpd.c:3:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
>> include/linux/node.h:124:6: warning: no previous prototype for function 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^
   include/linux/node.h:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     124 | void register_memory_blocks_under_node_early(int nid)
         | ^
         | static 
   kernel/trace/rv/monitors/scpd/scpd.c:21:1: warning: unused function 'da_handle_start_run_event_scpd' [-Wunused-function]
      21 | DECLARE_DA_MON_PER_CPU(scpd, unsigned char);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/rv/da_monitor.h:536:48: note: expanded from macro 'DECLARE_DA_MON_PER_CPU'
     536 | DECLARE_DA_MON_INIT_PER_CPU(name, type)                                                         \
         |                                                                                                 ^
     537 | DECLARE_DA_MON_MONITOR_HANDLER_IMPLICIT(name, type)
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/rv/da_monitor.h:438:20: note: expanded from macro '\
   DECLARE_DA_MON_MONITOR_HANDLER_IMPLICIT'
     438 | static inline bool da_handle_start_run_event_##name(enum events_##name event)                   \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:2:1: note: expanded from here
       2 | da_handle_start_run_event_scpd
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
--
   In file included from kernel/trace/rv/monitors/wip/wip.c:3:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
>> include/linux/node.h:124:6: warning: no previous prototype for function 'register_memory_blocks_under_node_early' [-Wmissing-prototypes]
     124 | void register_memory_blocks_under_node_early(int nid)
         |      ^
   include/linux/node.h:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     124 | void register_memory_blocks_under_node_early(int nid)
         | ^
         | static 
   kernel/trace/rv/monitors/wip/wip.c:20:1: warning: unused function 'da_handle_start_run_event_wip' [-Wunused-function]
      20 | DECLARE_DA_MON_PER_CPU(wip, unsigned char);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/rv/da_monitor.h:536:48: note: expanded from macro 'DECLARE_DA_MON_PER_CPU'
     536 | DECLARE_DA_MON_INIT_PER_CPU(name, type)                                                         \
         |                                                                                                 ^
     537 | DECLARE_DA_MON_MONITOR_HANDLER_IMPLICIT(name, type)
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/rv/da_monitor.h:438:20: note: expanded from macro '\
   DECLARE_DA_MON_MONITOR_HANDLER_IMPLICIT'
     438 | static inline bool da_handle_start_run_event_##name(enum events_##name event)                   \
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   <scratch space>:172:1: note: expanded from here
     172 | da_handle_start_run_event_wip
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
