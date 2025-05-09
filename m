Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40110269AFD
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 05:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746769834; cv=none; b=pKi1PMKaVXCCcOXYWRAkwvcN9vtESj0qz/m3A/j4aO96HLwIV4/9dCZhQLeqqqStdP9bZ9L9U4fRnzTT+eg/HUoEj7Bq81/J0ru0iSHu7JZmaMj/INydvssb/EMsarhw7WO23SND2RdNmcCz3fueHE1ue6kuXukyeaKSvSRLU9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746769834; c=relaxed/simple;
	bh=COd8PkeAsFo4HSPp0LPOHY/QegXh/DLqQXiVxo41jZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f8JVnjJDIlsZKSC8kT8mrdxsOZww/zU0BJK5BL3T5f9N+Igz/68BeNlFcfVQy2NEH9R3qD5wnEXZtV6qVubkk2ITpBhihALNceNWOZbmOiPWR0oOd58aCi7To9W4bP85l+Nutg1DIZpIuRLsgz5uiAZP1ryzTGUn8RytKWCz700=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpXJ06Rn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpXJ06Rn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746769832; x=1778305832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=COd8PkeAsFo4HSPp0LPOHY/QegXh/DLqQXiVxo41jZ8=;
  b=hpXJ06RnEFe93t2XjPjgwEYMJwsCsK4sS7fMUPTNBCySIj3cHnPx58iH
   Gvnu0oqWNIsrWCteGyIyYTxwYSyg38FB2JHFPj9P3fM2uL3BJQFQ2yyOQ
   A8MILrPs4bh0KjaErYhZYdYmeroLPYTvDMjsE5dHA3g06yExA15q6b8VL
   qRV3uFRbBm3STV9SFJhKZYEGjA/hfIDhXJ+ByrKVeHTavFSpJFDHhtQtD
   MxHnlGWj++Mnq6/iB8iydgdHp0eMGWouw3TMU16UzW0NY0SKK1oKUkhDc
   OPZSnuONWqhOuwdAXUT1SSVrdepVBrheOqFhJFP9qJ9DuM8g+Tjc0S90x
   w==;
X-CSE-ConnectionGUID: t7CcMjSnQYeM4u4G1Xgelw==
X-CSE-MsgGUID: gPDoTd84Qey8ALq45mo0Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="47840635"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="47840635"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 22:50:32 -0700
X-CSE-ConnectionGUID: VfLkEeFRQxyJEdro7R0OcA==
X-CSE-MsgGUID: XgkQyyz+Ri29WzgrlqRQBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="167455943"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 May 2025 22:50:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDGct-000BhP-1e;
	Fri, 09 May 2025 05:50:27 +0000
Date: Fri, 9 May 2025 13:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stafford Horne <shorne@gmail.com>, Rong Xu <xur@google.com>
Subject: (.head.text+0x900): relocation truncated to fit: R_OR1K_INSN_REL_26
 against `no symbol'
Message-ID: <202505091345.bUlAO0vS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c69f88849045499e8ad114e5e13dbb3c85f4443
commit: a412f04070e52e6d6b5f6f964b9d9644de16bb81 openrisc: place exception table at the head of vmlinux
date:   5 months ago
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20250509/202505091345.bUlAO0vS-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091345.bUlAO0vS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091345.bUlAO0vS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/openrisc/kernel/head.o: in function `_dispatch_do_ipage_fault':
>> (.head.text+0x900): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   (.head.text+0xa00): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   arch/openrisc/kernel/head.o: in function `exit_with_no_dtranslation':
>> (.init.text+0x21bc): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   arch/openrisc/kernel/head.o: in function `exit_with_no_itranslation':
   (.init.text+0x2264): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   init/main.o: in function `trace_event_raw_event_initcall_level':
   main.c:(.text+0x28c): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `strlen' defined in .text section in lib/string.o
   init/main.o: in function `initcall_blacklisted':
   main.c:(.text+0x6f4): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `strcmp' defined in .text section in lib/string.o
   init/main.o: in function `trace_initcall_finish_cb':
   main.c:(.text+0x818): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `__muldi3' defined in .text section in ../lib/gcc/or1k-linux/14.2.0/libgcc.a(_muldi3.o)
   main.c:(.text+0x83c): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `__muldi3' defined in .text section in ../lib/gcc/or1k-linux/14.2.0/libgcc.a(_muldi3.o)
   main.c:(.text+0x87c): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `__muldi3' defined in .text section in ../lib/gcc/or1k-linux/14.2.0/libgcc.a(_muldi3.o)
   main.c:(.text+0x8a8): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `__muldi3' defined in .text section in ../lib/gcc/or1k-linux/14.2.0/libgcc.a(_muldi3.o)
   init/main.o: in function `do_one_initcall':
   main.c:(.text+0xec0): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
