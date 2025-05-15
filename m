Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A8D664C6
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317954; cv=none; b=Vo8p2IENaUNsw5CuHWC27+Ay1S9NYF7DwyFAgtBXpjFK1sz+sjxqYUZdI8Jz/jhvJZCPlElKprkdxAAy6h8pN6F2JLDQDJTprmARG0Ct+QIpm1xD6DWwwog4gh/rQGWv+EEn7zmcuqAkzayu6Yu7n1KDBdOWmYsAsFiKJOoY0Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317954; c=relaxed/simple;
	bh=LPCxOaHHai025e+PzBDr85mz+e2mj1gb/bOANaKRI1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m54KO4tPUDFB4BC07/MyAa/5+RO8CglnN5NvPoDKbuc0PHuM8GO58/VzB5Tuoa0wFORPYiM9xt/7jg+t9gx5x7C6dISbuvNac8fbgdOA4kKYOMyOrp19JVBF56yBip6z1MqJrn1+Dr/sJp74DQbpofidKzQdsU8z0jr+LhvKbTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GpMB8QrS; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GpMB8QrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317952; x=1778853952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LPCxOaHHai025e+PzBDr85mz+e2mj1gb/bOANaKRI1w=;
  b=GpMB8QrSprH3CqOHtKYYbRZpcmPNBDQoz5ZGjFKZcGsG6brmQHeZyK8R
   98/3KIvBQQ6KLKY5/WwScxJTLDSrSycRa8iNE1OlQWqsEJTPiRMffH2a+
   LAuflgyJmz2dVxm1FppmXmp0q41ABz9FAtmxKmMc7zsDYkxV5sAhWERxI
   0pxVf3Cjh99Fg+I1nauwLcB5adYvgC7VKjB9jswbEfDwNdBkmfeLflEY1
   Cyt+5yypoQ/B980zvMNjAc9YYtDhPB0T5EQQAOj/5YXIvdUAaZFZKOn6J
   ycEnZcXDVAEQ1BJwPrLKm0CvX5PAAcibmsb1Pi6agH+6ljob+cRC8W700
   A==;
X-CSE-ConnectionGUID: DvDzmgSgRa6RbiF3QjuYPw==
X-CSE-MsgGUID: mqm5MoaDTIG57phh+ya8dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="48943820"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="48943820"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:05:52 -0700
X-CSE-ConnectionGUID: AIqKWV8IRDqZ6OR2Or1EAw==
X-CSE-MsgGUID: Qw2Cbw4vRPGwBlf49eAy7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="138261404"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa006.fm.intel.com with ESMTP; 15 May 2025 07:05:50 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZDY-0000Fh-2N;
	Thu, 15 May 2025 14:05:48 +0000
Date: Thu, 15 May 2025 22:05:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: arch/sh/kernel/kprobes.c:412:24: warning: variable 'p' set but not
 used
Message-ID: <202505151341.EuRFR22l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f35e33144ae5377d6a8de86dd3bd4d995c6ac65
commit: 7582b7be16d0ba90e3dbd9575a730cabd9eb852a kprobes: remove dependency on CONFIG_MODULES
date:   1 year ago
config: sh-randconfig-2003-20250513 (https://download.01.org/0day-ci/archive/20250515/202505151341.EuRFR22l-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151341.EuRFR22l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151341.EuRFR22l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sh/kernel/kprobes.c:52:16: warning: no previous prototype for 'arch_copy_kprobe' [-Wmissing-prototypes]
      52 | void __kprobes arch_copy_kprobe(struct kprobe *p)
         |                ^~~~~~~~~~~~~~~~
   arch/sh/kernel/kprobes.c:304:15: warning: no previous prototype for 'trampoline_probe_handler' [-Wmissing-prototypes]
     304 | int __kprobes trampoline_probe_handler(struct kprobe *p, struct pt_regs *regs)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/sh/kernel/kprobes.c: In function 'kprobe_exceptions_notify':
>> arch/sh/kernel/kprobes.c:412:24: warning: variable 'p' set but not used [-Wunused-but-set-variable]
     412 |         struct kprobe *p = NULL;
         |                        ^


vim +/p +412 arch/sh/kernel/kprobes.c

d39f5450146ff3 Chris Smith      2008-09-05  405  
d39f5450146ff3 Chris Smith      2008-09-05  406  /*
d39f5450146ff3 Chris Smith      2008-09-05  407   * Wrapper routine to for handling exceptions.
d39f5450146ff3 Chris Smith      2008-09-05  408   */
d39f5450146ff3 Chris Smith      2008-09-05  409  int __kprobes kprobe_exceptions_notify(struct notifier_block *self,
d39f5450146ff3 Chris Smith      2008-09-05  410  				       unsigned long val, void *data)
d39f5450146ff3 Chris Smith      2008-09-05  411  {
d39f5450146ff3 Chris Smith      2008-09-05 @412  	struct kprobe *p = NULL;
d39f5450146ff3 Chris Smith      2008-09-05  413  	struct die_args *args = (struct die_args *)data;
d39f5450146ff3 Chris Smith      2008-09-05  414  	int ret = NOTIFY_DONE;
d39f5450146ff3 Chris Smith      2008-09-05  415  	kprobe_opcode_t *addr = NULL;
d39f5450146ff3 Chris Smith      2008-09-05  416  	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
d39f5450146ff3 Chris Smith      2008-09-05  417  
d39f5450146ff3 Chris Smith      2008-09-05  418  	addr = (kprobe_opcode_t *) (args->regs->pc);
d3023897b4370b Michael Karcher  2019-06-12  419  	if (val == DIE_TRAP &&
d3023897b4370b Michael Karcher  2019-06-12  420  	    args->trapnr == (BREAKPOINT_INSTRUCTION & 0xff)) {
d39f5450146ff3 Chris Smith      2008-09-05  421  		if (!kprobe_running()) {
d39f5450146ff3 Chris Smith      2008-09-05  422  			if (kprobe_handler(args->regs)) {
d39f5450146ff3 Chris Smith      2008-09-05  423  				ret = NOTIFY_STOP;
d39f5450146ff3 Chris Smith      2008-09-05  424  			} else {
d39f5450146ff3 Chris Smith      2008-09-05  425  				/* Not a kprobe trap */
ee386de77419f9 Paul Mundt       2008-09-08  426  				ret = NOTIFY_DONE;
d39f5450146ff3 Chris Smith      2008-09-05  427  			}
d39f5450146ff3 Chris Smith      2008-09-05  428  		} else {
d39f5450146ff3 Chris Smith      2008-09-05  429  			p = get_kprobe(addr);
d39f5450146ff3 Chris Smith      2008-09-05  430  			if ((kcb->kprobe_status == KPROBE_HIT_SS) ||
d39f5450146ff3 Chris Smith      2008-09-05  431  			    (kcb->kprobe_status == KPROBE_REENTER)) {
d39f5450146ff3 Chris Smith      2008-09-05  432  				if (post_kprobe_handler(args->regs))
d39f5450146ff3 Chris Smith      2008-09-05  433  					ret = NOTIFY_STOP;
d39f5450146ff3 Chris Smith      2008-09-05  434  			} else {
fa5a24b16f9441 Masami Hiramatsu 2018-06-20  435  				if (kprobe_handler(args->regs))
d39f5450146ff3 Chris Smith      2008-09-05  436  					ret = NOTIFY_STOP;
d39f5450146ff3 Chris Smith      2008-09-05  437  			}
d39f5450146ff3 Chris Smith      2008-09-05  438  		}
d39f5450146ff3 Chris Smith      2008-09-05  439  	}
d39f5450146ff3 Chris Smith      2008-09-05  440  
d39f5450146ff3 Chris Smith      2008-09-05  441  	return ret;
d39f5450146ff3 Chris Smith      2008-09-05  442  }
d39f5450146ff3 Chris Smith      2008-09-05  443  

:::::: The code at line 412 was first introduced by commit
:::::: d39f5450146ff39f66cfde9d5184420627d0ac51 sh: Add kprobes support.

:::::: TO: Chris Smith <chris.smith@st.com>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
