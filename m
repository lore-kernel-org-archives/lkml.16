Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AB521C184
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 17:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743788150; cv=none; b=KTEontZMDJGo3wtUL5EeAu0NQbicVhxz3qzXC2MroT6PiyLUpOx8NKoljKWVSjisoPxAzn9MNlXmAssd5SZTGpIOfUzrnLc82F/tzKONSQ991Y5UlJA6X4Wqcoudm9jvgklzLQz25q/7NS+pslrVC56eGP6tboza2ChEb+z2+rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743788150; c=relaxed/simple;
	bh=SMTilVN6x/E0WFJK/nmz+VVmcBRCXyfsBBBi5eJrBg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JV5Voxud9tY/B7Lod7lRkEbK06BcYqKE0uyZbiwYaV5jR73kjC+1LkLv6Rt/pU92Su8G4lLmCixEzwBF255VmLvcYby2JhO/eQcA4aPwwwCFwPuo1vb66rVX738SvtLDLKS1HRuZXri8JI8bEvBsLmPb/MclmThEERLZcCMGeJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kv3UlUL8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kv3UlUL8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743788149; x=1775324149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SMTilVN6x/E0WFJK/nmz+VVmcBRCXyfsBBBi5eJrBg0=;
  b=Kv3UlUL8B4CA/I56wwKudw2QC/ExrqIHfUVeX4XwJvm0HcpMSJgNrLSx
   KBkJ/2mXzOVYJKWBrHLv6b5FAtiRdRgNPou4DkceClExqYqYa/2/m3KDe
   Wh5wev9bkikAOYzTn2FpS26n9CpOtqS+880gOSOqXc3/S9Wwf/8RP1f0P
   C+StD8sD6Ui4b5n0C3+xTpfrZnAa6bXxmVGNu0Yy5IQaaU4jgQWq4HskQ
   EIU8CVeF4BJXpcbqEDcvlv4VfVcJnl3eX7ivZIH4zc7/x3s10dUqeQy73
   s6aeNVb1GEBpSN5aND6EybAiV5DLMKXe9TxUboyoti+gTBBecLE7yha2h
   A==;
X-CSE-ConnectionGUID: Fo5abx0iT3SK4jkHHBLaKw==
X-CSE-MsgGUID: DkFn4dCpSvC/c5yGoZEVzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="67708237"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="67708237"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 10:35:48 -0700
X-CSE-ConnectionGUID: 5r/4FHUMRv+MLE8ULpeY8g==
X-CSE-MsgGUID: sabSRLRAQjW5kAO58gXOow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="131508551"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Apr 2025 10:35:46 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0kxE-0001QX-0e;
	Fri, 04 Apr 2025 17:35:44 +0000
Date: Sat, 5 Apr 2025 01:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: [tip:timers/cleanups 5/10] kernel/time/timer_list.c:49:77: error:
 macro "ACCESS_PRIVATE" requires 2 arguments, but only 1 given
Message-ID: <202504050305.zbYN7qiW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/cleanups
head:   5c4da3a96bf484f965057c281f1ef48ac46987bc
commit: 9453228aa82f20c07670d22c3d54f1be6c4244b4 [5/10] hrtimers: Make callback function pointer private
config: arm-randconfig-002-20250404 (https://download.01.org/0day-ci/archive/20250405/202504050305.zbYN7qiW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050305.zbYN7qiW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050305.zbYN7qiW-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/timer_list.c: In function 'print_timer':
>> kernel/time/timer_list.c:49:77: error: macro "ACCESS_PRIVATE" requires 2 arguments, but only 1 given
     SEQ_printf(m, " #%d: <%p>, %ps", idx, taddr, ACCESS_PRIVATE(timer->function));
                                                                                ^
>> kernel/time/timer_list.c:49:47: error: 'ACCESS_PRIVATE' undeclared (first use in this function); did you mean 'DQF_PRIVATE'?
     SEQ_printf(m, " #%d: <%p>, %ps", idx, taddr, ACCESS_PRIVATE(timer->function));
                                                  ^~~~~~~~~~~~~~
                                                  DQF_PRIVATE
   kernel/time/timer_list.c:49:47: note: each undeclared identifier is reported only once for each function it appears in


vim +/ACCESS_PRIVATE +49 kernel/time/timer_list.c

    44	
    45	static void
    46	print_timer(struct seq_file *m, struct hrtimer *taddr, struct hrtimer *timer,
    47		    int idx, u64 now)
    48	{
  > 49		SEQ_printf(m, " #%d: <%p>, %ps", idx, taddr, ACCESS_PRIVATE(timer->function));
    50		SEQ_printf(m, ", S:%02x", timer->state);
    51		SEQ_printf(m, "\n");
    52		SEQ_printf(m, " # expires at %Lu-%Lu nsecs [in %Ld to %Ld nsecs]\n",
    53			(unsigned long long)ktime_to_ns(hrtimer_get_softexpires(timer)),
    54			(unsigned long long)ktime_to_ns(hrtimer_get_expires(timer)),
    55			(long long)(ktime_to_ns(hrtimer_get_softexpires(timer)) - now),
    56			(long long)(ktime_to_ns(hrtimer_get_expires(timer)) - now));
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
