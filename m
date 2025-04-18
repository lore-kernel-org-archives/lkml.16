Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235EB21517E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744999983; cv=none; b=PCtkW0gKTW+c/DaoMGlnnYwToSNbCaWMgisFVSaLzU9W9s8Y8lZz4ckCmly5AIbH9QZosNDdc01eCQcMeLESMT4xKFVowBQYYKODAp2Aj5zARcTVxTeUXr37C4+ZAeEWbnm1WOR08LnJidDieBPs/iBanSR51bqMPHGv1xv3KCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744999983; c=relaxed/simple;
	bh=NYkSSbjUD8JbFtXJYXxn5axv98JTonmElib+omPP6i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDTEmzY6KsbsTiB2r9XYWUzqjbDt/m7GNsw1XAk4nsZ2o+L8HzJLxFL3ANjM+JfR1qOV+qeisYMMHNkXPV3Es6ZVvf2b6O6UoqGeLlYKzC/ftKxotdT3nwX3bWX1CY9nejsQ7hqcVcgl9XIwjbxbTVPQmvdd7xRlukdfW15sb9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LbFQOLJt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LbFQOLJt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744999981; x=1776535981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NYkSSbjUD8JbFtXJYXxn5axv98JTonmElib+omPP6i8=;
  b=LbFQOLJt0HVwxWzlUXlBdD174zlmwRqBJGhe/KyHZxo4tYIRcWI1j3kU
   xXWH35Lueo8FfTjWmhVVOSs6eEZ161dFvSgFpJfxMGHU/lkuj15i1gcQk
   2s8pQUnSPacaBePh+Dx/UI8vk3joLNRSiWa7vsvzGn42YKJsCy/HomPmi
   7LT+p/nBLPVaXpjiCG0EQ33042vXQ9W1e3TtfWPHgRtLlywBzFAiQu1Dx
   TJ4/dYlT8yqgIZW2W370mY4X6/KE63YoFK6IcnWA5hFEjecrhHQbWjaH0
   StEKsK0iN0NRobNp6IgujQ1hb0tAO10lTPJzn9I31XWXF2lKAVUo30+dJ
   w==;
X-CSE-ConnectionGUID: fFHL3cgrQ4GlcaiQJeQZ1w==
X-CSE-MsgGUID: esQlW6cKTsSF0LTvfT3YYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="58007948"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="58007948"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 11:13:00 -0700
X-CSE-ConnectionGUID: Neyex7UqS8OSGuUirfrfOg==
X-CSE-MsgGUID: Ic7ormb2SmuF0zLbmfj62Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="135999702"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Apr 2025 11:12:57 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5qCt-0003Av-0y;
	Fri, 18 Apr 2025 18:12:55 +0000
Date: Sat, 19 Apr 2025 02:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	LKML <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH 1/4] lib/test_vmalloc.c: Replace RWSEM to SRCU for setup
Message-ID: <202504190146.gTBIrktk-lkp@intel.com>
References: <20250417161216.88318-1-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417161216.88318-1-urezki@gmail.com>

Hi Uladzislau,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on linus/master hch-configfs/for-next v6.15-rc2 next-20250417]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uladzislau-Rezki-Sony/lib-test_vmalloc-c-Allow-built-in-execution/20250418-001446
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20250417161216.88318-1-urezki%40gmail.com
patch subject: [PATCH 1/4] lib/test_vmalloc.c: Replace RWSEM to SRCU for setup
config: sparc64-randconfig-001-20250419 (https://download.01.org/0day-ci/archive/20250419/202504190146.gTBIrktk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504190146.gTBIrktk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504190146.gTBIrktk-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:69:8: error: redefinition of 'struct srcu_usage'
    struct srcu_usage {
           ^~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:52:8: note: originally defined here
    struct srcu_usage { };
           ^~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:102:8: error: redefinition of 'struct srcu_struct'
    struct srcu_struct {
           ^~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:16:8: note: originally defined here
    struct srcu_struct {
           ^~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:149: warning: "__SRCU_USAGE_INIT" redefined
    #define __SRCU_USAGE_INIT(name)         \
    
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:53: note: this is the location of the previous definition
    #define __SRCU_USAGE_INIT(name) { }
    
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:167: warning: "__SRCU_STRUCT_INIT" redefined
    #define __SRCU_STRUCT_INIT(name, usage_name, pcpu_name)      \
    
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:34: note: this is the location of the previous definition
    #define __SRCU_STRUCT_INIT(name, __ignored, ___ignored)   \
    
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:207: warning: "DEFINE_SRCU" redefined
    #define DEFINE_SRCU(name)  __DEFINE_SRCU(name, /* not static */)
    
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:46: note: this is the location of the previous definition
    #define DEFINE_SRCU(name) \
    
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:208: warning: "DEFINE_STATIC_SRCU" redefined
    #define DEFINE_STATIC_SRCU(name) __DEFINE_SRCU(name, static)
    
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:48: note: this is the location of the previous definition
    #define DEFINE_STATIC_SRCU(name) \
    
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:210:5: error: conflicting types for '__srcu_read_lock'
    int __srcu_read_lock(struct srcu_struct *ssp) __acquires(ssp);
        ^~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:63:19: note: previous definition of '__srcu_read_lock' was here
    static inline int __srcu_read_lock(struct srcu_struct *ssp)
                      ^~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:211:6: error: conflicting types for 'synchronize_srcu_expedited'
    void synchronize_srcu_expedited(struct srcu_struct *ssp);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:99:20: note: previous definition of 'synchronize_srcu_expedited' was here
    static inline void synchronize_srcu_expedited(struct srcu_struct *ssp)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:212:6: error: conflicting types for 'srcu_barrier'
    void srcu_barrier(struct srcu_struct *ssp);
         ^~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:104:20: note: previous definition of 'srcu_barrier' was here
    static inline void srcu_barrier(struct srcu_struct *ssp)
                       ^~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:213:6: error: conflicting types for 'srcu_torture_stats_print'
    void srcu_torture_stats_print(struct srcu_struct *ssp, char *tt, char *tf);
         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:113:20: note: previous definition of 'srcu_torture_stats_print' was here
    static inline void srcu_torture_stats_print(struct srcu_struct *ssp,
                       ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:217:20: error: conflicting types for '__srcu_ptr_to_ctr'
    static inline bool __srcu_ptr_to_ctr(struct srcu_struct *ssp, struct srcu_ctr __percpu *scpp)
                       ^~~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:76:20: note: previous definition of '__srcu_ptr_to_ctr' was here
    static inline bool __srcu_ptr_to_ctr(struct srcu_struct *ssp, struct srcu_ctr __percpu *scpp)
                       ^~~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:224:41: error: conflicting types for '__srcu_ctr_to_ptr'
    static inline struct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu_struct *ssp, int idx)
                                            ^~~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:81:41: note: previous definition of '__srcu_ctr_to_ptr' was here
    static inline struct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu_struct *ssp, int idx)
                                            ^~~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:243:41: error: conflicting types for '__srcu_read_lock_fast'
    static inline struct srcu_ctr __percpu *__srcu_read_lock_fast(struct srcu_struct *ssp)
                                            ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:86:41: note: previous definition of '__srcu_read_lock_fast' was here
    static inline struct srcu_ctr __percpu *__srcu_read_lock_fast(struct srcu_struct *ssp)
                                            ^~~~~~~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
>> include/linux/srcutree.h:271:20: error: conflicting types for '__srcu_read_unlock_fast'
    static inline void __srcu_read_unlock_fast(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:91:20: note: previous definition of '__srcu_read_unlock_fast' was here
    static inline void __srcu_read_unlock_fast(struct srcu_struct *ssp, struct srcu_ctr __percpu *scp)
                       ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/srcutiny.h:96:31: error: static declaration of '__srcu_read_lock' follows non-static declaration
    #define __srcu_read_lock_lite __srcu_read_lock
                                  ^~~~~~~~~~~~~~~~
   include/linux/srcutree.h:291:19: note: in expansion of macro '__srcu_read_lock_lite'
    static inline int __srcu_read_lock_lite(struct srcu_struct *ssp)
                      ^~~~~~~~~~~~~~~~~~~~~
   In file included from lib/test_vmalloc.c:18:
   include/linux/srcutree.h:210:5: note: previous declaration of '__srcu_read_lock' was here
    int __srcu_read_lock(struct srcu_struct *ssp) __acquires(ssp);
        ^~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
>> include/linux/srcutiny.h:97:33: error: conflicting types for '__srcu_read_unlock'
    #define __srcu_read_unlock_lite __srcu_read_unlock
                                    ^~~~~~~~~~~~~~~~~~
   include/linux/srcutree.h:312:20: note: in expansion of macro '__srcu_read_unlock_lite'
    static inline void __srcu_read_unlock_lite(struct srcu_struct *ssp, int idx)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcu.h:56:6: note: previous declaration of '__srcu_read_unlock' was here
    void __srcu_read_unlock(struct srcu_struct *ssp, int idx) __releases(ssp);
         ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
>> include/linux/srcutiny.h:110:56: error: expected identifier or '(' before 'do'
    #define srcu_check_read_flavor_force(ssp, read_flavor) do { } while (0)
                                                           ^~
   include/linux/srcutree.h:324:20: note: in expansion of macro 'srcu_check_read_flavor_force'
    static inline void srcu_check_read_flavor_force(struct srcu_struct *ssp, int read_flavor)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/srcutiny.h:110:63: error: expected identifier or '(' before 'while'
    #define srcu_check_read_flavor_force(ssp, read_flavor) do { } while (0)
                                                                  ^~~~~
   include/linux/srcutree.h:324:20: note: in expansion of macro 'srcu_check_read_flavor_force'
    static inline void srcu_check_read_flavor_force(struct srcu_struct *ssp, int read_flavor)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/srcutiny.h:109:50: error: expected identifier or '(' before 'do'
    #define srcu_check_read_flavor(ssp, read_flavor) do { } while (0)
                                                     ^~
   include/linux/srcutree.h:336:20: note: in expansion of macro 'srcu_check_read_flavor'
    static inline void srcu_check_read_flavor(struct srcu_struct *ssp, int read_flavor)
                       ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/srcutiny.h:109:57: error: expected identifier or '(' before 'while'
    #define srcu_check_read_flavor(ssp, read_flavor) do { } while (0)
                                                            ^~~~~
   include/linux/srcutree.h:336:20: note: in expansion of macro 'srcu_check_read_flavor'
    static inline void srcu_check_read_flavor(struct srcu_struct *ssp, int read_flavor)
                       ^~~~~~~~~~~~~~~~~~~~~~
   lib/test_vmalloc.c: In function 'test_func':
>> lib/test_vmalloc.c:460:19: error: passing argument 1 of 'synchronize_srcu' from incompatible pointer type [-Werror=incompatible-pointer-types]
     synchronize_srcu(&prepare_for_test_srcu);
                      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/srcu.h:59,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcutiny.h:55:43: note: expected 'struct srcu_struct *' but argument is of type 'struct srcu_struct *'
    void synchronize_srcu(struct srcu_struct *ssp);
                          ~~~~~~~~~~~~~~~~~~~~^~~
   lib/test_vmalloc.c: In function 'do_concurrent_test':
>> lib/test_vmalloc.c:538:23: error: passing argument 1 of 'srcu_read_lock' from incompatible pointer type [-Werror=incompatible-pointer-types]
     idx = srcu_read_lock(&prepare_for_test_srcu);
                          ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcu.h:247:54: note: expected 'struct srcu_struct *' but argument is of type 'struct srcu_struct *'
    static inline int srcu_read_lock(struct srcu_struct *ssp) __acquires(ssp)
                                     ~~~~~~~~~~~~~~~~~~~~^~~
   lib/test_vmalloc.c:555:19: error: passing argument 1 of 'srcu_read_unlock' from incompatible pointer type [-Werror=incompatible-pointer-types]
     srcu_read_unlock(&prepare_for_test_srcu, idx);
                      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:1494,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from lib/test_vmalloc.c:9:
   include/linux/srcu.h:397:57: note: expected 'struct srcu_struct *' but argument is of type 'struct srcu_struct *'
    static inline void srcu_read_unlock(struct srcu_struct *ssp, int idx)
                                        ~~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors
..


vim +69 include/linux/srcutree.h

da915ad5cf25b5 Paul E. McKenney        2017-04-05   65  
da915ad5cf25b5 Paul E. McKenney        2017-04-05   66  /*
95433f7263011e Paul E. McKenney        2023-03-16   67   * Per-SRCU-domain structure, update-side data linked from srcu_struct.
da915ad5cf25b5 Paul E. McKenney        2017-04-05   68   */
95433f7263011e Paul E. McKenney        2023-03-16  @69  struct srcu_usage {
2ec303113d9789 Paul E. McKenney        2022-01-21   70  	struct srcu_node *node;			/* Combining tree. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   71  	struct srcu_node *level[RCU_NUM_LVLS + 1];
da915ad5cf25b5 Paul E. McKenney        2017-04-05   72  						/* First node at each level. */
994f706872e6ce Paul E. McKenney        2022-01-24   73  	int srcu_size_state;			/* Small-to-big transition state. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   74  	struct mutex srcu_cb_mutex;		/* Serialize CB preparation. */
994f706872e6ce Paul E. McKenney        2022-01-24   75  	spinlock_t __private lock;		/* Protect counters and size state. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   76  	struct mutex srcu_gp_mutex;		/* Serialize GP work. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   77  	unsigned long srcu_gp_seq;		/* Grace-period seq #. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   78  	unsigned long srcu_gp_seq_needed;	/* Latest gp_seq needed. */
1e9a038b7fe9a8 Paul E. McKenney        2017-04-24   79  	unsigned long srcu_gp_seq_needed_exp;	/* Furthest future exp GP. */
282d8998e9979c Paul E. McKenney        2022-03-08   80  	unsigned long srcu_gp_start;		/* Last GP start timestamp (jiffies) */
22607d66bbc3e8 Paul E. McKenney        2017-04-25   81  	unsigned long srcu_last_gp_end;		/* Last GP end timestamp (ns) */
9f2e91d94c9155 Paul E. McKenney        2022-01-27   82  	unsigned long srcu_size_jiffies;	/* Current contention-measurement interval. */
9f2e91d94c9155 Paul E. McKenney        2022-01-27   83  	unsigned long srcu_n_lock_retries;	/* Contention events in current interval. */
282d8998e9979c Paul E. McKenney        2022-03-08   84  	unsigned long srcu_n_exp_nodelay;	/* # expedited no-delays in current GP phase. */
46470cf85d2b61 Paul E. McKenney        2022-01-27   85  	bool sda_is_static;			/* May ->sda be passed to free_percpu()? */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   86  	unsigned long srcu_barrier_seq;		/* srcu_barrier seq #. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   87  	struct mutex srcu_barrier_mutex;	/* Serialize barrier ops. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   88  	struct completion srcu_barrier_completion;
da915ad5cf25b5 Paul E. McKenney        2017-04-05   89  						/* Awaken barrier rq at end. */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   90  	atomic_t srcu_barrier_cpu_cnt;		/* # CPUs not yet posting a */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   91  						/*  callback for the barrier */
da915ad5cf25b5 Paul E. McKenney        2017-04-05   92  						/*  operation. */
282d8998e9979c Paul E. McKenney        2022-03-08   93  	unsigned long reschedule_jiffies;
282d8998e9979c Paul E. McKenney        2022-03-08   94  	unsigned long reschedule_count;
d8be81735aa894 Paul E. McKenney        2017-03-25   95  	struct delayed_work work;
fd1b3f8e097b7f Paul E. McKenney        2023-03-17   96  	struct srcu_struct *srcu_ssp;
95433f7263011e Paul E. McKenney        2023-03-16   97  };
95433f7263011e Paul E. McKenney        2023-03-16   98  
da915ad5cf25b5 Paul E. McKenney        2017-04-05   99  /*
da915ad5cf25b5 Paul E. McKenney        2017-04-05  100   * Per-SRCU-domain structure, similar in function to rcu_state.
da915ad5cf25b5 Paul E. McKenney        2017-04-05  101   */
d8be81735aa894 Paul E. McKenney        2017-03-25 @102  struct srcu_struct {
795e7efec6ea7e Paul E. McKenney        2024-12-19  103  	struct srcu_ctr __percpu *srcu_ctrp;
da915ad5cf25b5 Paul E. McKenney        2017-04-05  104  	struct srcu_data __percpu *sda;		/* Per-CPU srcu_data array. */
d8be81735aa894 Paul E. McKenney        2017-03-25  105  	struct lockdep_map dep_map;
95433f7263011e Paul E. McKenney        2023-03-16  106  	struct srcu_usage *srcu_sup;		/* Update-side data. */
d8be81735aa894 Paul E. McKenney        2017-03-25  107  };
d8be81735aa894 Paul E. McKenney        2017-03-25  108  
e15a19306004b3 Pingfan Liu             2023-01-04  109  // Values for size state variable (->srcu_size_state).  Once the state
e15a19306004b3 Pingfan Liu             2023-01-04  110  // has been set to SRCU_SIZE_ALLOC, the grace-period code advances through
e15a19306004b3 Pingfan Liu             2023-01-04  111  // this state machine one step per grace period until the SRCU_SIZE_BIG state
e15a19306004b3 Pingfan Liu             2023-01-04  112  // is reached.  Otherwise, the state machine remains in the SRCU_SIZE_SMALL
e15a19306004b3 Pingfan Liu             2023-01-04  113  // state indefinitely.
e15a19306004b3 Pingfan Liu             2023-01-04  114  #define SRCU_SIZE_SMALL		0	// No srcu_node combining tree, ->node == NULL
e15a19306004b3 Pingfan Liu             2023-01-04  115  #define SRCU_SIZE_ALLOC		1	// An srcu_node tree is being allocated, initialized,
e15a19306004b3 Pingfan Liu             2023-01-04  116  					//  and then referenced by ->node.  It will not be used.
e15a19306004b3 Pingfan Liu             2023-01-04  117  #define SRCU_SIZE_WAIT_BARRIER	2	// The srcu_node tree starts being used by everything
e15a19306004b3 Pingfan Liu             2023-01-04  118  					//  except call_srcu(), especially by srcu_barrier().
e15a19306004b3 Pingfan Liu             2023-01-04  119  					//  By the end of this state, all CPUs and threads
e15a19306004b3 Pingfan Liu             2023-01-04  120  					//  are aware of this tree's existence.
e15a19306004b3 Pingfan Liu             2023-01-04  121  #define SRCU_SIZE_WAIT_CALL	3	// The srcu_node tree starts being used by call_srcu().
e15a19306004b3 Pingfan Liu             2023-01-04  122  					//  By the end of this state, all of the call_srcu()
e15a19306004b3 Pingfan Liu             2023-01-04  123  					//  invocations that were running on a non-boot CPU
e15a19306004b3 Pingfan Liu             2023-01-04  124  					//  and using the boot CPU's callback queue will have
e15a19306004b3 Pingfan Liu             2023-01-04  125  					//  completed.
e15a19306004b3 Pingfan Liu             2023-01-04  126  #define SRCU_SIZE_WAIT_CBS1	4	// Don't trust the ->srcu_have_cbs[] grace-period
e15a19306004b3 Pingfan Liu             2023-01-04  127  #define SRCU_SIZE_WAIT_CBS2	5	//  sequence elements or the ->srcu_data_have_cbs[]
e15a19306004b3 Pingfan Liu             2023-01-04  128  #define SRCU_SIZE_WAIT_CBS3	6	//  CPU-bitmask elements until all four elements of
e15a19306004b3 Pingfan Liu             2023-01-04  129  #define SRCU_SIZE_WAIT_CBS4	7	//  each array have been initialized.
e15a19306004b3 Pingfan Liu             2023-01-04  130  #define SRCU_SIZE_BIG		8	// The srcu_node combining tree is fully initialized
e15a19306004b3 Pingfan Liu             2023-01-04  131  					//  and all aspects of it are being put to use.
994f706872e6ce Paul E. McKenney        2022-01-24  132  
da915ad5cf25b5 Paul E. McKenney        2017-04-05  133  /* Values for state variable (bottom bits of ->srcu_gp_seq). */
d8be81735aa894 Paul E. McKenney        2017-03-25  134  #define SRCU_STATE_IDLE		0
d8be81735aa894 Paul E. McKenney        2017-03-25  135  #define SRCU_STATE_SCAN1	1
d8be81735aa894 Paul E. McKenney        2017-03-25  136  #define SRCU_STATE_SCAN2	2
d8be81735aa894 Paul E. McKenney        2017-03-25  137  
29bc83e4d90546 JP Kobryn               2024-07-15  138  /*
29bc83e4d90546 JP Kobryn               2024-07-15  139   * Values for initializing gp sequence fields. Higher values allow wrap arounds to
29bc83e4d90546 JP Kobryn               2024-07-15  140   * occur earlier.
29bc83e4d90546 JP Kobryn               2024-07-15  141   * The second value with state is useful in the case of static initialization of
29bc83e4d90546 JP Kobryn               2024-07-15  142   * srcu_usage where srcu_gp_seq_needed is expected to have some state value in its
29bc83e4d90546 JP Kobryn               2024-07-15  143   * lower bits (or else it will appear to be already initialized within
29bc83e4d90546 JP Kobryn               2024-07-15  144   * the call check_init_srcu_struct()).
29bc83e4d90546 JP Kobryn               2024-07-15  145   */
29bc83e4d90546 JP Kobryn               2024-07-15  146  #define SRCU_GP_SEQ_INITIAL_VAL ((0UL - 100UL) << RCU_SEQ_CTR_SHIFT)
29bc83e4d90546 JP Kobryn               2024-07-15  147  #define SRCU_GP_SEQ_INITIAL_VAL_WITH_STATE (SRCU_GP_SEQ_INITIAL_VAL - 1)
29bc83e4d90546 JP Kobryn               2024-07-15  148  
03200b5ca3b4d4 Paul E. McKenney        2023-03-17 @149  #define __SRCU_USAGE_INIT(name)									\
d8be81735aa894 Paul E. McKenney        2017-03-25  150  {												\
d633198088bd9e Paul E. McKenney        2017-10-10  151  	.lock = __SPIN_LOCK_UNLOCKED(name.lock),						\
29bc83e4d90546 JP Kobryn               2024-07-15  152  	.srcu_gp_seq = SRCU_GP_SEQ_INITIAL_VAL,							\
29bc83e4d90546 JP Kobryn               2024-07-15  153  	.srcu_gp_seq_needed = SRCU_GP_SEQ_INITIAL_VAL_WITH_STATE,				\
29bc83e4d90546 JP Kobryn               2024-07-15  154  	.srcu_gp_seq_needed_exp = SRCU_GP_SEQ_INITIAL_VAL,					\
4e6ea4ef56f942 Paul E. McKenney        2018-08-14  155  	.work = __DELAYED_WORK_INITIALIZER(name.work, NULL, 0),					\
03200b5ca3b4d4 Paul E. McKenney        2023-03-17  156  }
03200b5ca3b4d4 Paul E. McKenney        2023-03-17  157  
03200b5ca3b4d4 Paul E. McKenney        2023-03-17  158  #define __SRCU_STRUCT_INIT_COMMON(name, usage_name)						\
95433f7263011e Paul E. McKenney        2023-03-16  159  	.srcu_sup = &usage_name,								\
f4d01a259374ef Paul E. McKenney        2023-03-17  160  	__SRCU_DEP_MAP_INIT(name)
f4d01a259374ef Paul E. McKenney        2023-03-17  161  
95433f7263011e Paul E. McKenney        2023-03-16  162  #define __SRCU_STRUCT_INIT_MODULE(name, usage_name)						\
f4d01a259374ef Paul E. McKenney        2023-03-17  163  {												\
95433f7263011e Paul E. McKenney        2023-03-16  164  	__SRCU_STRUCT_INIT_COMMON(name, usage_name)						\
d8be81735aa894 Paul E. McKenney        2017-03-25  165  }
d8be81735aa894 Paul E. McKenney        2017-03-25  166  
95433f7263011e Paul E. McKenney        2023-03-16 @167  #define __SRCU_STRUCT_INIT(name, usage_name, pcpu_name)						\
f4d01a259374ef Paul E. McKenney        2023-03-17  168  {												\
f4d01a259374ef Paul E. McKenney        2023-03-17  169  	.sda = &pcpu_name,									\
795e7efec6ea7e Paul E. McKenney        2024-12-19  170  	.srcu_ctrp = &pcpu_name.srcu_ctrs[0],							\
95433f7263011e Paul E. McKenney        2023-03-16  171  	__SRCU_STRUCT_INIT_COMMON(name, usage_name)						\
d8be81735aa894 Paul E. McKenney        2017-03-25  172  }
d8be81735aa894 Paul E. McKenney        2017-03-25  173  
d8be81735aa894 Paul E. McKenney        2017-03-25  174  /*
d8be81735aa894 Paul E. McKenney        2017-03-25  175   * Define and initialize a srcu struct at build time.
d8be81735aa894 Paul E. McKenney        2017-03-25  176   * Do -not- call init_srcu_struct() nor cleanup_srcu_struct() on it.
d8be81735aa894 Paul E. McKenney        2017-03-25  177   *
d8be81735aa894 Paul E. McKenney        2017-03-25  178   * Note that although DEFINE_STATIC_SRCU() hides the name from other
d8be81735aa894 Paul E. McKenney        2017-03-25  179   * files, the per-CPU variable rules nevertheless require that the
d8be81735aa894 Paul E. McKenney        2017-03-25  180   * chosen name be globally unique.  These rules also prohibit use of
d8be81735aa894 Paul E. McKenney        2017-03-25  181   * DEFINE_STATIC_SRCU() within a function.  If these rules are too
d8be81735aa894 Paul E. McKenney        2017-03-25  182   * restrictive, declare the srcu_struct manually.  For example, in
d8be81735aa894 Paul E. McKenney        2017-03-25  183   * each file:
d8be81735aa894 Paul E. McKenney        2017-03-25  184   *
d8be81735aa894 Paul E. McKenney        2017-03-25  185   *	static struct srcu_struct my_srcu;
d8be81735aa894 Paul E. McKenney        2017-03-25  186   *
d8be81735aa894 Paul E. McKenney        2017-03-25  187   * Then, before the first use of each my_srcu, manually initialize it:
d8be81735aa894 Paul E. McKenney        2017-03-25  188   *
d8be81735aa894 Paul E. McKenney        2017-03-25  189   *	init_srcu_struct(&my_srcu);
d8be81735aa894 Paul E. McKenney        2017-03-25  190   *
d8be81735aa894 Paul E. McKenney        2017-03-25  191   * See include/linux/percpu-defs.h for the rules on per-CPU variables.
d8be81735aa894 Paul E. McKenney        2017-03-25  192   */
fe15b50cdeeebd Paul E. McKenney        2019-04-05  193  #ifdef MODULE
fe15b50cdeeebd Paul E. McKenney        2019-04-05  194  # define __DEFINE_SRCU(name, is_static)								\
03200b5ca3b4d4 Paul E. McKenney        2023-03-17  195  	static struct srcu_usage name##_srcu_usage = __SRCU_USAGE_INIT(name##_srcu_usage);	\
95433f7263011e Paul E. McKenney        2023-03-16  196  	is_static struct srcu_struct name = __SRCU_STRUCT_INIT_MODULE(name, name##_srcu_usage);	\
db8f1471c61336 Alexander Aring         2022-01-26  197  	extern struct srcu_struct * const __srcu_struct_##name;					\
056b89e7e69974 Joel Fernandes (Google  2019-04-11  198) 	struct srcu_struct * const __srcu_struct_##name						\
fe15b50cdeeebd Paul E. McKenney        2019-04-05  199  		__section("___srcu_struct_ptrs") = &name
fe15b50cdeeebd Paul E. McKenney        2019-04-05  200  #else
d8be81735aa894 Paul E. McKenney        2017-03-25  201  # define __DEFINE_SRCU(name, is_static)								\
da915ad5cf25b5 Paul E. McKenney        2017-04-05  202  	static DEFINE_PER_CPU(struct srcu_data, name##_srcu_data);				\
03200b5ca3b4d4 Paul E. McKenney        2023-03-17  203  	static struct srcu_usage name##_srcu_usage = __SRCU_USAGE_INIT(name##_srcu_usage);	\
fe15b50cdeeebd Paul E. McKenney        2019-04-05  204  	is_static struct srcu_struct name =							\
95433f7263011e Paul E. McKenney        2023-03-16  205  		__SRCU_STRUCT_INIT(name, name##_srcu_usage, name##_srcu_data)
fe15b50cdeeebd Paul E. McKenney        2019-04-05  206  #endif
d8be81735aa894 Paul E. McKenney        2017-03-25 @207  #define DEFINE_SRCU(name)		__DEFINE_SRCU(name, /* not static */)
d8be81735aa894 Paul E. McKenney        2017-03-25 @208  #define DEFINE_STATIC_SRCU(name)	__DEFINE_SRCU(name, static)
d8be81735aa894 Paul E. McKenney        2017-03-25  209  
443971156cebfc Paul E. McKenney        2025-01-13 @210  int __srcu_read_lock(struct srcu_struct *ssp) __acquires(ssp);
aacb5d91ab1bfb Paul E. McKenney        2018-10-28 @211  void synchronize_srcu_expedited(struct srcu_struct *ssp);
aacb5d91ab1bfb Paul E. McKenney        2018-10-28 @212  void srcu_barrier(struct srcu_struct *ssp);
aacb5d91ab1bfb Paul E. McKenney        2018-10-28 @213  void srcu_torture_stats_print(struct srcu_struct *ssp, char *tt, char *tf);
d8be81735aa894 Paul E. McKenney        2017-03-25  214  
f4bde41dd19db5 Paul E. McKenney        2025-01-08  215  // Converts a per-CPU pointer to an ->srcu_ctrs[] array element to that
f4bde41dd19db5 Paul E. McKenney        2025-01-08  216  // element's index.
f4bde41dd19db5 Paul E. McKenney        2025-01-08 @217  static inline bool __srcu_ptr_to_ctr(struct srcu_struct *ssp, struct srcu_ctr __percpu *scpp)
f4bde41dd19db5 Paul E. McKenney        2025-01-08  218  {
f4bde41dd19db5 Paul E. McKenney        2025-01-08  219  	return scpp - &ssp->sda->srcu_ctrs[0];
f4bde41dd19db5 Paul E. McKenney        2025-01-08  220  }
f4bde41dd19db5 Paul E. McKenney        2025-01-08  221  
4937096b579a36 Paul E. McKenney        2025-01-08  222  // Converts an integer to a per-CPU pointer to the corresponding
4937096b579a36 Paul E. McKenney        2025-01-08  223  // ->srcu_ctrs[] array element.
4937096b579a36 Paul E. McKenney        2025-01-08 @224  static inline struct srcu_ctr __percpu *__srcu_ctr_to_ptr(struct srcu_struct *ssp, int idx)
4937096b579a36 Paul E. McKenney        2025-01-08  225  {
4937096b579a36 Paul E. McKenney        2025-01-08  226  	return &ssp->sda->srcu_ctrs[idx];
4937096b579a36 Paul E. McKenney        2025-01-08  227  }
4937096b579a36 Paul E. McKenney        2025-01-08  228  
c4020620528e4e Paul E. McKenney        2025-01-09  229  /*
c4020620528e4e Paul E. McKenney        2025-01-09  230   * Counts the new reader in the appropriate per-CPU element of the
c4020620528e4e Paul E. McKenney        2025-01-09  231   * srcu_struct.  Returns a pointer that must be passed to the matching
c4020620528e4e Paul E. McKenney        2025-01-09  232   * srcu_read_unlock_fast().
c4020620528e4e Paul E. McKenney        2025-01-09  233   *
3cec27453db49a Paul E. McKenney        2025-01-28  234   * Note that both this_cpu_inc() and atomic_long_inc() are RCU read-side
3cec27453db49a Paul E. McKenney        2025-01-28  235   * critical sections either because they disables interrupts, because they
3cec27453db49a Paul E. McKenney        2025-01-28  236   * are a single instruction, or because they are a read-modify-write atomic
3cec27453db49a Paul E. McKenney        2025-01-28  237   * operation, depending on the whims of the architecture.
3cec27453db49a Paul E. McKenney        2025-01-28  238   *
3cec27453db49a Paul E. McKenney        2025-01-28  239   * This means that __srcu_read_lock_fast() is not all that fast
3cec27453db49a Paul E. McKenney        2025-01-28  240   * on architectures that support NMIs but do not supply NMI-safe
3cec27453db49a Paul E. McKenney        2025-01-28  241   * implementations of this_cpu_inc().
c4020620528e4e Paul E. McKenney        2025-01-09  242   */
c4020620528e4e Paul E. McKenney        2025-01-09 @243  static inline struct srcu_ctr __percpu *__srcu_read_lock_fast(struct srcu_struct *ssp)
c4020620528e4e Paul E. McKenney        2025-01-09  244  {
c4020620528e4e Paul E. McKenney        2025-01-09  245  	struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
c4020620528e4e Paul E. McKenney        2025-01-09  246  
c4020620528e4e Paul E. McKenney        2025-01-09  247  	RCU_LOCKDEP_WARN(!rcu_is_watching(), "RCU must be watching srcu_read_lock_fast().");
3cec27453db49a Paul E. McKenney        2025-01-28  248  	if (!IS_ENABLED(CONFIG_NEED_SRCU_NMI_SAFE))
c4020620528e4e Paul E. McKenney        2025-01-09  249  		this_cpu_inc(scp->srcu_locks.counter); /* Y */
3cec27453db49a Paul E. McKenney        2025-01-28  250  	else
3cec27453db49a Paul E. McKenney        2025-01-28  251  		atomic_long_inc(raw_cpu_ptr(&scp->srcu_locks));  /* Z */
c4020620528e4e Paul E. McKenney        2025-01-09  252  	barrier(); /* Avoid leaking the critical section. */
c4020620528e4e Paul E. McKenney        2025-01-09  253  	return scp;
c4020620528e4e Paul E. McKenney        2025-01-09  254  }
c4020620528e4e Paul E. McKenney        2025-01-09  255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
