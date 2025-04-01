Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A874113C9C4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 07:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743491651; cv=none; b=B9j10f8GwrNP3INjjvgQdprj4kJx0+DmTRzzINLRL2f74Ke9q64idVU07HwF4Y0KOJLxG+QgAubgX9UMoPXjHKARZj0lYMJnZ/AoIhZkY4A4kxpoxph82cZKghxdTnG0urp5yr5h43vqqbeW7XZ7ay6r6TfiHHSu01wkJV0A2WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743491651; c=relaxed/simple;
	bh=AAf425N8KsUmddjLc2zOGmGqGnniXXVbBNQ+ErWpFuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I20+/7SFXhfPRWfq3NhFUk/fAv9Uf4la5ayEWGsUAhecv23v9GcVfxXyuLsoC7cQtm0P2PC1GuMrN64vcg3uMxregWeqO0xcvy3ief8kgqy9rOMm+nRpd7TSus1kZ6cfRDC5uPVK5vVR7o60oxtZ3Au8ogIwZscmx/xAg2JvJls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5Wu5xcR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5Wu5xcR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743491650; x=1775027650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AAf425N8KsUmddjLc2zOGmGqGnniXXVbBNQ+ErWpFuI=;
  b=S5Wu5xcRaLAE3YD3cZxYWYBfY7R0wB1yJDpcABqnG5Vz/sMpm7aeKbP+
   bVvFuWJFsolA6Z3W7J5o/L7v9T3ILfkU529BcCsRefJh0bUfDF3PuiIjH
   aJZUmAVprMbkUhbwl/0WIzGCEX3YV5Edu7yUBNX8sIAMZr6vIwPY4j6o+
   3fplI1ywsSrHCVFTt4s44xPeAqHOPEmui8HCktI7CYbLe/N0vKWJSWnXn
   DFgeyxxdhANlw5hADSmTdFy1dd77MUhjvYbQm70XGrzIZZy3vzcVHTRZb
   EtBiDfuLUlG894MYc9hiKvLk6f31CmpqUtmg/Vk7Ty4Rgs42vRdUwbXL7
   Q==;
X-CSE-ConnectionGUID: rZU1EKQvQN+qqoSoWWU+FA==
X-CSE-MsgGUID: gIaRAMIaQbClqnMcNccF0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62194764"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="62194764"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 00:14:09 -0700
X-CSE-ConnectionGUID: QsXycjGSRF2ApIHPHVIkgg==
X-CSE-MsgGUID: IVdaTdZrQW+SrgApdc4h3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="130438010"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 01 Apr 2025 00:14:08 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzVoz-0009hS-2E;
	Tue, 01 Apr 2025 07:14:05 +0000
Date: Tue, 1 Apr 2025 15:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/trace/events/initcall.h:48:(.text+0x98): relocation
 truncated to fit: R_ARC_S25W_PCREL against symbol `__st_r13_to_r15' defined
 in .text section in
 ../lib/gcc/arc-linux/12.4.0/hs38/libgcc.a(_millicodethunk_st.o)
Message-ID: <202504011540.dQnvkIZE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08733088b566b58283f0f12fb73f5db6a9a9de30
commit: 1802656ef8906cc949f58b64cb6d8d400326e163 io_uring: add GCOV_PROFILE_URING Kconfig option
date:   7 months ago
config: arc-randconfig-001-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011540.dQnvkIZE-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011540.dQnvkIZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504011540.dQnvkIZE-lkp@intel.com/

All errors (new ones prefixed by >>):

   init/main.o: in function `__traceiter_initcall_finish':
>> include/trace/events/initcall.h:48:(.text+0x98): relocation truncated to fit: R_ARC_S25W_PCREL against symbol `__st_r13_to_r15' defined in .text section in ../lib/gcc/arc-linux/12.4.0/hs38/libgcc.a(_millicodethunk_st.o)


vim +48 include/trace/events/initcall.h

4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  47) 
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23 @48) TRACE_EVENT(initcall_finish,
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  49) 
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  50) 	TP_PROTO(initcall_t func, int ret),
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  51) 
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  52) 	TP_ARGS(func, ret),
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  53) 
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  54) 	TP_STRUCT__entry(
0566e40ce7c493 Rishabh Bhatnagar       2018-04-25  55  		/*
0566e40ce7c493 Rishabh Bhatnagar       2018-04-25  56  		 * Use field_struct to avoid is_signed_type()
0566e40ce7c493 Rishabh Bhatnagar       2018-04-25  57  		 * comparison of a function pointer
0566e40ce7c493 Rishabh Bhatnagar       2018-04-25  58  		 */
0566e40ce7c493 Rishabh Bhatnagar       2018-04-25  59  		__field_struct(initcall_t,	func)
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  60) 		__field(int,			ret)
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  61) 	),
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  62) 
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  63) 	TP_fast_assign(
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  64) 		__entry->func = func;
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  65) 		__entry->ret = ret;
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  66) 	),
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  67) 
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  68) 	TP_printk("func=%pS ret=%d", __entry->func, __entry->ret)
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  69) );
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  70) 

:::::: The code at line 48 was first introduced by commit
:::::: 4ee7c60de83ac01fa4c33c55937357601631e8ad init, tracing: Add initcall trace events

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
