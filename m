Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3C42777F1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755601; cv=none; b=SU/prtptRxsRrnLnhz6CSlPI8tMuzOCZ+wezkseD2Ej0JYDnnc6sTsegBWBW0gReIAvb01Dl2AchV0Wipcm0AMrxyzM47AVZLq/XXh03IwPJkF/0DiatECPT7r+1kCiYM8pdDbII73qbv1/JUyatmRRbbRWMQnhamfb20yqdegY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755601; c=relaxed/simple;
	bh=wEPtHpmyCIKci/saBPkb/wZ8R9FuZVNO91uWriyfCGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GUX5EgnTGvwwXHyEcENmoZcYr8iYK7rDYoX6prklstGFw0x/osculqwaUuLunID6OhYFYGaUUGnhq+p5xQ6YqhFDWiu8NLpAwhiYkpfwLdiQMzDHIpYvpG2TTAjaQp0Yy/M0v/+DPNcCbwb1Wojd0IgMgl9m81K+Nwkhp12dwDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7/IPlZC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7/IPlZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750755598; x=1782291598;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=wEPtHpmyCIKci/saBPkb/wZ8R9FuZVNO91uWriyfCGk=;
  b=Q7/IPlZCwBHoX0gOkCA4WRRJATRNi6dhEOMjs8iX4EQ4mhgyXv9CVx24
   BhEGG+5H/CeTY8uK77pHzqdEszFJ7xlBXTSIi3cvjQFqqhB7I128KKHm6
   jKL2e5YIE64iVXc3iiPk7gh2HcPvqS+adXTgu/nabkJXk1+l2nvg0fMLl
   o5Iq6+h4X/gauQNHRtJUbjGHEFqpDo+/OTtuJcTGSxbDiBu5jo4Ev3Lnr
   FU2zKfyCYoRcbUsqk/SUjSmXiU2r3SwuF0bhy0WoPLZENBDWWpiUITXvT
   sANnxpPf2ndqjHATQvrXRXqStudk+SkH2VWnv7dnzrJlLYNDxgqffqClF
   Q==;
X-CSE-ConnectionGUID: 0iWG77aLQNyfyfvNMSjxNA==
X-CSE-MsgGUID: 4fAwBbHvSiGKRcA6LgZZaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63251497"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="63251497"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 01:59:57 -0700
X-CSE-ConnectionGUID: Tn89/qpgTu+QrPPJ8pycHA==
X-CSE-MsgGUID: 3b8tF8voRVO1O3UwMuWvtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="151608387"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Jun 2025 01:59:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTzVQ-000Rxi-28;
	Tue, 24 Jun 2025 08:59:52 +0000
Date: Tue, 24 Jun 2025 16:59:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yu-Ting Tseng <yutingtseng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/android/binder.c:4043:12: warning: stack frame size (1120)
 exceeds limit (1024) in 'binder_thread_write'
Message-ID: <202506241623.nApDbbmE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   78f4e737a53e1163ded2687a922fce138aee73f5
commit: d579b04a52a183db47dfcb7a44304d7747d551e1 binder: frozen notification
date:   11 months ago
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250624/202506241623.nApDbbmE-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506241623.nApDbbmE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506241623.nApDbbmE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/android/binder.c:62:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/android/binder.c:4043:12: warning: stack frame size (1120) exceeds limit (1024) in 'binder_thread_write' [-Wframe-larger-than]
    4043 | static int binder_thread_write(struct binder_proc *proc,
         |            ^
   6 warnings generated.


vim +/binder_thread_write +4043 drivers/android/binder.c

44d8047f1d87ad drivers/android/binder.c         Todd Kjos              2018-08-28  4042  
fb07ebc3e82a98 drivers/staging/android/binder.c Bojan Prtvar           2013-09-02 @4043  static int binder_thread_write(struct binder_proc *proc,
fb07ebc3e82a98 drivers/staging/android/binder.c Bojan Prtvar           2013-09-02  4044  			struct binder_thread *thread,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4045  			binder_uintptr_t binder_buffer, size_t size,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4046  			binder_size_t *consumed)
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4047  {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4048  	uint32_t cmd;
342e5c90b60134 drivers/android/binder.c         Martijn Coenen         2017-02-03  4049  	struct binder_context *context = proc->context;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4050  	void __user *buffer = (void __user *)(uintptr_t)binder_buffer;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4051  	void __user *ptr = buffer + *consumed;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4052  	void __user *end = buffer + size;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4053  
26549d17741035 drivers/android/binder.c         Todd Kjos              2017-06-29  4054  	while (ptr < end && thread->return_error.cmd == BR_OK) {
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4055  		int ret;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4056  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4057  		if (get_user(cmd, (uint32_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4058  			return -EFAULT;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4059  		ptr += sizeof(uint32_t);
975a1ac9a9fe65 drivers/staging/android/binder.c Arve Hjønnevåg         2012-10-16  4060  		trace_binder_command(cmd);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4061  		if (_IOC_NR(cmd) < ARRAY_SIZE(binder_stats.bc)) {
0953c7976c36ce drivers/android/binder.c         Badhri Jagan Sridharan 2017-06-29  4062  			atomic_inc(&binder_stats.bc[_IOC_NR(cmd)]);
0953c7976c36ce drivers/android/binder.c         Badhri Jagan Sridharan 2017-06-29  4063  			atomic_inc(&proc->stats.bc[_IOC_NR(cmd)]);
0953c7976c36ce drivers/android/binder.c         Badhri Jagan Sridharan 2017-06-29  4064  			atomic_inc(&thread->stats.bc[_IOC_NR(cmd)]);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4065  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4066  		switch (cmd) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4067  		case BC_INCREFS:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4068  		case BC_ACQUIRE:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4069  		case BC_RELEASE:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4070  		case BC_DECREFS: {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4071  			uint32_t target;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4072  			const char *debug_string;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4073  			bool strong = cmd == BC_ACQUIRE || cmd == BC_RELEASE;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4074  			bool increment = cmd == BC_INCREFS || cmd == BC_ACQUIRE;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4075  			struct binder_ref_data rdata;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4076  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4077  			if (get_user(target, (uint32_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4078  				return -EFAULT;
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017-06-29  4079  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4080  			ptr += sizeof(uint32_t);
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4081  			ret = -1;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4082  			if (increment && !target) {
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017-06-29  4083  				struct binder_node *ctx_mgr_node;
6c20032c22d982 drivers/android/binder.c         Andrew Bridges         2020-10-27  4084  
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017-06-29  4085  				mutex_lock(&context->context_mgr_node_lock);
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017-06-29  4086  				ctx_mgr_node = context->binder_context_mgr_node;
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4087  				if (ctx_mgr_node) {
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4088  					if (ctx_mgr_node->proc == proc) {
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4089  						binder_user_error("%d:%d context manager tried to acquire desc 0\n",
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4090  								  proc->pid, thread->pid);
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4091  						mutex_unlock(&context->context_mgr_node_lock);
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4092  						return -EINVAL;
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4093  					}
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4094  					ret = binder_inc_ref_for_node(
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4095  							proc, ctx_mgr_node,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4096  							strong, NULL, &rdata);
4b836a1426cb0f drivers/android/binder.c         Jann Horn              2020-07-27  4097  				}
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017-06-29  4098  				mutex_unlock(&context->context_mgr_node_lock);
c44b1231ff1170 drivers/android/binder.c         Todd Kjos              2017-06-29  4099  			}
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4100  			if (ret)
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4101  				ret = binder_update_ref_for_handle(
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4102  						proc, target, increment, strong,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4103  						&rdata);
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4104  			if (!ret && rdata.desc != target) {
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4105  				binder_user_error("%d:%d tried to acquire reference to desc %d, got %d instead\n",
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4106  					proc->pid, thread->pid,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4107  					target, rdata.desc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4108  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4109  			switch (cmd) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4110  			case BC_INCREFS:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4111  				debug_string = "IncRefs";
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4112  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4113  			case BC_ACQUIRE:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4114  				debug_string = "Acquire";
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4115  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4116  			case BC_RELEASE:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4117  				debug_string = "Release";
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4118  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4119  			case BC_DECREFS:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4120  			default:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4121  				debug_string = "DecRefs";
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4122  				break;
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4123  			}
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4124  			if (ret) {
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4125  				binder_user_error("%d:%d %s %d refcount change on invalid ref %d ret %d\n",
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4126  					proc->pid, thread->pid, debug_string,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4127  					strong, target, ret);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4128  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4129  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4130  			binder_debug(BINDER_DEBUG_USER_REFS,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4131  				     "%d:%d %s ref %d desc %d s %d w %d\n",
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4132  				     proc->pid, thread->pid, debug_string,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4133  				     rdata.debug_id, rdata.desc, rdata.strong,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4134  				     rdata.weak);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4135  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4136  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4137  		case BC_INCREFS_DONE:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4138  		case BC_ACQUIRE_DONE: {
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4139  			binder_uintptr_t node_ptr;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4140  			binder_uintptr_t cookie;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4141  			struct binder_node *node;
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4142  			bool free_node;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4143  
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4144  			if (get_user(node_ptr, (binder_uintptr_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4145  				return -EFAULT;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4146  			ptr += sizeof(binder_uintptr_t);
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4147  			if (get_user(cookie, (binder_uintptr_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4148  				return -EFAULT;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4149  			ptr += sizeof(binder_uintptr_t);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4150  			node = binder_get_node(proc, node_ptr);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4151  			if (node == NULL) {
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4152  				binder_user_error("%d:%d %s u%016llx no match\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4153  					proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4154  					cmd == BC_INCREFS_DONE ?
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4155  					"BC_INCREFS_DONE" :
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4156  					"BC_ACQUIRE_DONE",
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4157  					(u64)node_ptr);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4158  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4159  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4160  			if (cookie != node->cookie) {
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4161  				binder_user_error("%d:%d %s u%016llx node %d cookie mismatch %016llx != %016llx\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4162  					proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4163  					cmd == BC_INCREFS_DONE ?
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4164  					"BC_INCREFS_DONE" : "BC_ACQUIRE_DONE",
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4165  					(u64)node_ptr, node->debug_id,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4166  					(u64)cookie, (u64)node->cookie);
adc1884222276d drivers/android/binder.c         Todd Kjos              2017-06-29  4167  				binder_put_node(node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4168  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4169  			}
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4170  			binder_node_inner_lock(node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4171  			if (cmd == BC_ACQUIRE_DONE) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4172  				if (node->pending_strong_ref == 0) {
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4173  					binder_user_error("%d:%d BC_ACQUIRE_DONE node %d has no pending acquire request\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4174  						proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4175  						node->debug_id);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4176  					binder_node_inner_unlock(node);
adc1884222276d drivers/android/binder.c         Todd Kjos              2017-06-29  4177  					binder_put_node(node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4178  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4179  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4180  				node->pending_strong_ref = 0;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4181  			} else {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4182  				if (node->pending_weak_ref == 0) {
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4183  					binder_user_error("%d:%d BC_INCREFS_DONE node %d has no pending increfs request\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4184  						proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4185  						node->debug_id);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4186  					binder_node_inner_unlock(node);
adc1884222276d drivers/android/binder.c         Todd Kjos              2017-06-29  4187  					binder_put_node(node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4188  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4189  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4190  				node->pending_weak_ref = 0;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4191  			}
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4192  			free_node = binder_dec_node_nilocked(node,
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4193  					cmd == BC_ACQUIRE_DONE, 0);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4194  			WARN_ON(free_node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4195  			binder_debug(BINDER_DEBUG_USER_REFS,
adc1884222276d drivers/android/binder.c         Todd Kjos              2017-06-29  4196  				     "%d:%d %s node %d ls %d lw %d tr %d\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4197  				     proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4198  				     cmd == BC_INCREFS_DONE ? "BC_INCREFS_DONE" : "BC_ACQUIRE_DONE",
adc1884222276d drivers/android/binder.c         Todd Kjos              2017-06-29  4199  				     node->debug_id, node->local_strong_refs,
adc1884222276d drivers/android/binder.c         Todd Kjos              2017-06-29  4200  				     node->local_weak_refs, node->tmp_refs);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4201  			binder_node_inner_unlock(node);
adc1884222276d drivers/android/binder.c         Todd Kjos              2017-06-29  4202  			binder_put_node(node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4203  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4204  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4205  		case BC_ATTEMPT_ACQUIRE:
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4206  			pr_err("BC_ATTEMPT_ACQUIRE not supported\n");
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4207  			return -EINVAL;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4208  		case BC_ACQUIRE_RESULT:
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4209  			pr_err("BC_ACQUIRE_RESULT not supported\n");
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4210  			return -EINVAL;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4211  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4212  		case BC_FREE_BUFFER: {
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4213  			binder_uintptr_t data_ptr;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4214  			struct binder_buffer *buffer;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4215  
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4216  			if (get_user(data_ptr, (binder_uintptr_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4217  				return -EFAULT;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4218  			ptr += sizeof(binder_uintptr_t);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4219  
53d311cfa19ad3 drivers/android/binder.c         Todd Kjos              2017-06-29  4220  			buffer = binder_alloc_prepare_to_free(&proc->alloc,
19c987241ca121 drivers/android/binder.c         Todd Kjos              2017-06-29  4221  							      data_ptr);
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4222  			if (IS_ERR_OR_NULL(buffer)) {
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4223  				if (PTR_ERR(buffer) == -EPERM) {
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4224  					binder_user_error(
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4225  						"%d:%d BC_FREE_BUFFER u%016llx matched unreturned or currently freeing buffer\n",
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4226  						proc->pid, thread->pid,
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4227  						(u64)data_ptr);
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4228  				} else {
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4229  					binder_user_error(
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4230  						"%d:%d BC_FREE_BUFFER u%016llx no match\n",
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4231  						proc->pid, thread->pid,
7bada55ab50697 drivers/android/binder.c         Todd Kjos              2018-11-06  4232  						(u64)data_ptr);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4233  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4234  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4235  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4236  			binder_debug(BINDER_DEBUG_FREE_BUFFER,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4237  				     "%d:%d BC_FREE_BUFFER u%016llx found buffer %d for %s transaction\n",
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4238  				     proc->pid, thread->pid, (u64)data_ptr,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4239  				     buffer->debug_id,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4240  				     buffer->transaction ? "active" : "finished");
32e9f56a96d8d0 drivers/android/binder.c         Todd Kjos              2021-10-15  4241  			binder_free_buf(proc, thread, buffer, false);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4242  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4243  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4244  
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4245  		case BC_TRANSACTION_SG:
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4246  		case BC_REPLY_SG: {
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4247  			struct binder_transaction_data_sg tr;
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4248  
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4249  			if (copy_from_user(&tr, ptr, sizeof(tr)))
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4250  				return -EFAULT;
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4251  			ptr += sizeof(tr);
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4252  			binder_transaction(proc, thread, &tr.transaction_data,
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4253  					   cmd == BC_REPLY_SG, tr.buffers_size);
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4254  			break;
7980240b6d63e0 drivers/android/binder.c         Martijn Coenen         2017-02-03  4255  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4256  		case BC_TRANSACTION:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4257  		case BC_REPLY: {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4258  			struct binder_transaction_data tr;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4259  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4260  			if (copy_from_user(&tr, ptr, sizeof(tr)))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4261  				return -EFAULT;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4262  			ptr += sizeof(tr);
4bfac80af3a63f drivers/android/binder.c         Martijn Coenen         2017-02-03  4263  			binder_transaction(proc, thread, &tr,
4bfac80af3a63f drivers/android/binder.c         Martijn Coenen         2017-02-03  4264  					   cmd == BC_REPLY, 0);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4265  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4266  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4267  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4268  		case BC_REGISTER_LOOPER:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4269  			binder_debug(BINDER_DEBUG_THREADS,
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4270  				     "%d:%d BC_REGISTER_LOOPER\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4271  				     proc->pid, thread->pid);
b3e6861283790d drivers/android/binder.c         Todd Kjos              2017-06-29  4272  			binder_inner_proc_lock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4273  			if (thread->looper & BINDER_LOOPER_STATE_ENTERED) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4274  				thread->looper |= BINDER_LOOPER_STATE_INVALID;
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4275  				binder_user_error("%d:%d ERROR: BC_REGISTER_LOOPER called after BC_ENTER_LOOPER\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4276  					proc->pid, thread->pid);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4277  			} else if (proc->requested_threads == 0) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4278  				thread->looper |= BINDER_LOOPER_STATE_INVALID;
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4279  				binder_user_error("%d:%d ERROR: BC_REGISTER_LOOPER called without request\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4280  					proc->pid, thread->pid);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4281  			} else {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4282  				proc->requested_threads--;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4283  				proc->requested_threads_started++;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4284  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4285  			thread->looper |= BINDER_LOOPER_STATE_REGISTERED;
b3e6861283790d drivers/android/binder.c         Todd Kjos              2017-06-29  4286  			binder_inner_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4287  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4288  		case BC_ENTER_LOOPER:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4289  			binder_debug(BINDER_DEBUG_THREADS,
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4290  				     "%d:%d BC_ENTER_LOOPER\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4291  				     proc->pid, thread->pid);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4292  			if (thread->looper & BINDER_LOOPER_STATE_REGISTERED) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4293  				thread->looper |= BINDER_LOOPER_STATE_INVALID;
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4294  				binder_user_error("%d:%d ERROR: BC_ENTER_LOOPER called after BC_REGISTER_LOOPER\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4295  					proc->pid, thread->pid);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4296  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4297  			thread->looper |= BINDER_LOOPER_STATE_ENTERED;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4298  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4299  		case BC_EXIT_LOOPER:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4300  			binder_debug(BINDER_DEBUG_THREADS,
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4301  				     "%d:%d BC_EXIT_LOOPER\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4302  				     proc->pid, thread->pid);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4303  			thread->looper |= BINDER_LOOPER_STATE_EXITED;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4304  			break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4305  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4306  		case BC_REQUEST_DEATH_NOTIFICATION:
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4307  		case BC_CLEAR_DEATH_NOTIFICATION: {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4308  			uint32_t target;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4309  			binder_uintptr_t cookie;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4310  			struct binder_ref *ref;
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4311  			struct binder_ref_death *death = NULL;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4312  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4313  			if (get_user(target, (uint32_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4314  				return -EFAULT;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4315  			ptr += sizeof(uint32_t);
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4316  			if (get_user(cookie, (binder_uintptr_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4317  				return -EFAULT;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4318  			ptr += sizeof(binder_uintptr_t);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4319  			if (cmd == BC_REQUEST_DEATH_NOTIFICATION) {
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4320  				/*
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4321  				 * Allocate memory for death notification
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4322  				 * before taking lock
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4323  				 */
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4324  				death = kzalloc(sizeof(*death), GFP_KERNEL);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4325  				if (death == NULL) {
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4326  					WARN_ON(thread->return_error.cmd !=
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4327  						BR_OK);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4328  					thread->return_error.cmd = BR_ERROR;
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4329  					binder_enqueue_thread_work(
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4330  						thread,
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4331  						&thread->return_error.work);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4332  					binder_debug(
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4333  						BINDER_DEBUG_FAILED_TRANSACTION,
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4334  						"%d:%d BC_REQUEST_DEATH_NOTIFICATION failed\n",
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4335  						proc->pid, thread->pid);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4336  					break;
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4337  				}
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4338  			}
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4339  			binder_proc_lock(proc);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4340  			ref = binder_get_ref_olocked(proc, target, false);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4341  			if (ref == NULL) {
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4342  				binder_user_error("%d:%d %s invalid ref %d\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4343  					proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4344  					cmd == BC_REQUEST_DEATH_NOTIFICATION ?
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4345  					"BC_REQUEST_DEATH_NOTIFICATION" :
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4346  					"BC_CLEAR_DEATH_NOTIFICATION",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4347  					target);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4348  				binder_proc_unlock(proc);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4349  				kfree(death);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4350  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4351  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4352  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4353  			binder_debug(BINDER_DEBUG_DEATH_NOTIFICATION,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4354  				     "%d:%d %s %016llx ref %d desc %d s %d w %d for node %d\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4355  				     proc->pid, thread->pid,
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4356  				     cmd == BC_REQUEST_DEATH_NOTIFICATION ?
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4357  				     "BC_REQUEST_DEATH_NOTIFICATION" :
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4358  				     "BC_CLEAR_DEATH_NOTIFICATION",
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4359  				     (u64)cookie, ref->data.debug_id,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4360  				     ref->data.desc, ref->data.strong,
372e3147df7016 drivers/android/binder.c         Todd Kjos              2017-06-29  4361  				     ref->data.weak, ref->node->debug_id);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4362  
ab51ec6bdf0b7a drivers/android/binder.c         Martijn Coenen         2017-06-29  4363  			binder_node_lock(ref->node);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4364  			if (cmd == BC_REQUEST_DEATH_NOTIFICATION) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4365  				if (ref->death) {
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4366  					binder_user_error("%d:%d BC_REQUEST_DEATH_NOTIFICATION death notification already set\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4367  						proc->pid, thread->pid);
ab51ec6bdf0b7a drivers/android/binder.c         Martijn Coenen         2017-06-29  4368  					binder_node_unlock(ref->node);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4369  					binder_proc_unlock(proc);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4370  					kfree(death);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4371  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4372  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4373  				binder_stats_created(BINDER_STAT_DEATH);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4374  				INIT_LIST_HEAD(&death->work.entry);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4375  				death->cookie = cookie;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4376  				ref->death = death;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4377  				if (ref->node->proc == NULL) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4378  					ref->death->work.type = BINDER_WORK_DEAD_BINDER;
bb74562a7f8398 drivers/android/binder.c         Martijn Coenen         2017-08-31  4379  
1b77e9dcc3da93 drivers/android/binder.c         Martijn Coenen         2017-08-31  4380  					binder_inner_proc_lock(proc);
1b77e9dcc3da93 drivers/android/binder.c         Martijn Coenen         2017-08-31  4381  					binder_enqueue_work_ilocked(
bb74562a7f8398 drivers/android/binder.c         Martijn Coenen         2017-08-31  4382  						&ref->death->work, &proc->todo);
bb74562a7f8398 drivers/android/binder.c         Martijn Coenen         2017-08-31  4383  					binder_wakeup_proc_ilocked(proc);
1b77e9dcc3da93 drivers/android/binder.c         Martijn Coenen         2017-08-31  4384  					binder_inner_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4385  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4386  			} else {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4387  				if (ref->death == NULL) {
56b468fc709b2b drivers/staging/android/binder.c Anmol Sarma            2012-10-30  4388  					binder_user_error("%d:%d BC_CLEAR_DEATH_NOTIFICATION death notification not active\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4389  						proc->pid, thread->pid);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4390  					binder_node_unlock(ref->node);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4391  					binder_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4392  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4393  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4394  				death = ref->death;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4395  				if (death->cookie != cookie) {
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4396  					binder_user_error("%d:%d BC_CLEAR_DEATH_NOTIFICATION death notification cookie mismatch %016llx != %016llx\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4397  						proc->pid, thread->pid,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4398  						(u64)death->cookie,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4399  						(u64)cookie);
673068eee8560d drivers/android/binder.c         Todd Kjos              2017-06-29  4400  					binder_node_unlock(ref->node);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4401  					binder_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4402  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4403  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4404  				ref->death = NULL;
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4405  				binder_inner_proc_lock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4406  				if (list_empty(&death->work.entry)) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4407  					death->work.type = BINDER_WORK_CLEAR_DEATH_NOTIFICATION;
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4408  					if (thread->looper &
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4409  					    (BINDER_LOOPER_STATE_REGISTERED |
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4410  					     BINDER_LOOPER_STATE_ENTERED))
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4411  						binder_enqueue_thread_work_ilocked(
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4412  								thread,
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4413  								&death->work);
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4414  					else {
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4415  						binder_enqueue_work_ilocked(
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4416  								&death->work,
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4417  								&proc->todo);
1b77e9dcc3da93 drivers/android/binder.c         Martijn Coenen         2017-08-31  4418  						binder_wakeup_proc_ilocked(
408c68b17aea2f drivers/android/binder.c         Martijn Coenen         2017-08-31  4419  								proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4420  					}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4421  				} else {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4422  					BUG_ON(death->work.type != BINDER_WORK_DEAD_BINDER);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4423  					death->work.type = BINDER_WORK_DEAD_BINDER_AND_CLEAR;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4424  				}
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4425  				binder_inner_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4426  			}
ab51ec6bdf0b7a drivers/android/binder.c         Martijn Coenen         2017-06-29  4427  			binder_node_unlock(ref->node);
2c1838dc6817dd drivers/android/binder.c         Todd Kjos              2017-06-29  4428  			binder_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4429  		} break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4430  		case BC_DEAD_BINDER_DONE: {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4431  			struct binder_work *w;
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4432  			binder_uintptr_t cookie;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4433  			struct binder_ref_death *death = NULL;
10f62861b4a2f2 drivers/staging/android/binder.c Seunghun Lee           2014-05-01  4434  
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4435  			if (get_user(cookie, (binder_uintptr_t __user *)ptr))
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4436  				return -EFAULT;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4437  
7a64cd887fdb97 drivers/android/binder.c         Lisa Du                2016-02-17  4438  			ptr += sizeof(cookie);
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4439  			binder_inner_proc_lock(proc);
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4440  			list_for_each_entry(w, &proc->delivered_death,
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4441  					    entry) {
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4442  				struct binder_ref_death *tmp_death =
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4443  					container_of(w,
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4444  						     struct binder_ref_death,
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4445  						     work);
10f62861b4a2f2 drivers/staging/android/binder.c Seunghun Lee           2014-05-01  4446  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4447  				if (tmp_death->cookie == cookie) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4448  					death = tmp_death;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4449  					break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4450  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4451  			}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4452  			binder_debug(BINDER_DEBUG_DEAD_BINDER,
8ca86f1639ec58 drivers/android/binder.c         Todd Kjos              2018-02-07  4453  				     "%d:%d BC_DEAD_BINDER_DONE %016llx found %pK\n",
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4454  				     proc->pid, thread->pid, (u64)cookie,
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4455  				     death);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4456  			if (death == NULL) {
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4457  				binder_user_error("%d:%d BC_DEAD_BINDER_DONE %016llx not found\n",
da49889deb34d3 drivers/staging/android/binder.c Arve Hjønnevåg         2014-02-21  4458  					proc->pid, thread->pid, (u64)cookie);
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4459  				binder_inner_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4460  				break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4461  			}
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4462  			binder_dequeue_work_ilocked(&death->work);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4463  			if (death->work.type == BINDER_WORK_DEAD_BINDER_AND_CLEAR) {
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4464  				death->work.type = BINDER_WORK_CLEAR_DEATH_NOTIFICATION;
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4465  				if (thread->looper &
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4466  					(BINDER_LOOPER_STATE_REGISTERED |
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4467  					 BINDER_LOOPER_STATE_ENTERED))
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4468  					binder_enqueue_thread_work_ilocked(
148ade2c4d4f46 drivers/android/binder.c         Martijn Coenen         2017-11-15  4469  						thread, &death->work);
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4470  				else {
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4471  					binder_enqueue_work_ilocked(
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4472  							&death->work,
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4473  							&proc->todo);
408c68b17aea2f drivers/android/binder.c         Martijn Coenen         2017-08-31  4474  					binder_wakeup_proc_ilocked(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4475  				}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4476  			}
72196393a5e3d2 drivers/android/binder.c         Todd Kjos              2017-06-29  4477  			binder_inner_proc_unlock(proc);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4478  		} break;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4479  
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4480  		case BC_REQUEST_FREEZE_NOTIFICATION: {
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4481  			struct binder_handle_cookie handle_cookie;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4482  			int error;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4483  
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4484  			if (copy_from_user(&handle_cookie, ptr, sizeof(handle_cookie)))
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4485  				return -EFAULT;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4486  			ptr += sizeof(handle_cookie);
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4487  			error = binder_request_freeze_notification(proc, thread,
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4488  								   &handle_cookie);
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4489  			if (error)
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4490  				return error;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4491  		} break;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4492  
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4493  		case BC_CLEAR_FREEZE_NOTIFICATION: {
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4494  			struct binder_handle_cookie handle_cookie;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4495  			int error;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4496  
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4497  			if (copy_from_user(&handle_cookie, ptr, sizeof(handle_cookie)))
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4498  				return -EFAULT;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4499  			ptr += sizeof(handle_cookie);
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4500  			error = binder_clear_freeze_notification(proc, thread, &handle_cookie);
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4501  			if (error)
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4502  				return error;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4503  		} break;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4504  
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4505  		case BC_FREEZE_NOTIFICATION_DONE: {
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4506  			binder_uintptr_t cookie;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4507  			int error;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4508  
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4509  			if (get_user(cookie, (binder_uintptr_t __user *)ptr))
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4510  				return -EFAULT;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4511  
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4512  			ptr += sizeof(cookie);
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4513  			error = binder_freeze_notification_done(proc, thread, cookie);
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4514  			if (error)
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4515  				return error;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4516  		} break;
d579b04a52a183 drivers/android/binder.c         Yu-Ting Tseng          2024-07-09  4517  
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4518  		default:
da4864962d768b drivers/android/binder.c         Carlos Llamas          2022-05-09  4519  			pr_err("%d:%d unknown command %u\n",
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4520  			       proc->pid, thread->pid, cmd);
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4521  			return -EINVAL;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4522  		}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4523  		*consumed = ptr - buffer;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4524  	}
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4525  	return 0;
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4526  }
355b0502f6efea drivers/staging/android/binder.c Greg Kroah-Hartman     2011-11-30  4527  

:::::: The code at line 4043 was first introduced by commit
:::::: fb07ebc3e82a98a3605112b71ea819c359549c4b Staging: android: Mark local functions in binder.c as static

:::::: TO: Bojan Prtvar <prtvar.b@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
