Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7000716E863
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750047984; cv=none; b=ZTzHAHKXgctDEtasotVBtaepHPEAnOfT4nzFeALSWyMzlbxhRa+ax549PACa/GawQM8svjPfZwN+U7dj1QMUYqgMs1K0uJbKKibQsnkzegwXECzF2gvNn4+IsbgjcKqtoPZqBVEBFgFVShbBpL2LUMz09Kdhgy7BG1Qr+HX3l9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750047984; c=relaxed/simple;
	bh=m3S0zSBgDFKKScH5RHAi0V+FAYo9FVJQ4q5+WQzTGBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQ/IDBAENLLtY8s51ZKE5z+PoXhUNpqGCnw+vqZ+r2sDFkgQDhX6a7gPSNX3sYiPitxJNnNlq2qEyJ0xEtm8bNtDtK5lz5SyIP8potd9f8me8uTLY6IpookDQIxsO8qga45YQxxWDwYwUXqYf0bAf6UQZ2NP+N4oQuYoPnt2IG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b91cMfJR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b91cMfJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750047983; x=1781583983;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m3S0zSBgDFKKScH5RHAi0V+FAYo9FVJQ4q5+WQzTGBk=;
  b=b91cMfJRsaXLrzHC6yop4mWjXPfwdsFNRtK4Rm8chENeHR7Vv20C7++w
   /77kiEojTDKQZiPtZYhDdDn4DbVATwKqIIv8KXelLAQqTEaRRll3f7OOJ
   fTIoKroMwEd4Y2p2uNm07Um93EvU3+2489rahDRpcqHxaNYr9LqLc5gqk
   4S6H/bxwn/UnFQmqfiDDZ2uL8Nv+m2adyLmSBbxchZlPBg8IT7iFIDzV2
   DYQTCbRwRSbPT5bFjEmYixvF5rzus44JCQpnLx9AlkCxNjanhaGgIkTQ4
   PkVhWq9NupOC3OF49deQDDMELWxhrtROe7/YEmijO9YrDmCKVbqmIrb8L
   w==;
X-CSE-ConnectionGUID: 78Mc1WqHQwqj7wZ45DevrQ==
X-CSE-MsgGUID: yWSG9vYrQ4u1lnNmRKMNJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="54800379"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="54800379"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 21:26:18 -0700
X-CSE-ConnectionGUID: zylQUKlmThCzhIwHPwYjjg==
X-CSE-MsgGUID: exEdgsBoQpepmT98IkqQIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="149239912"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jun 2025 21:26:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR1QB-000Ek0-37;
	Mon, 16 Jun 2025 04:26:11 +0000
Date: Mon, 16 Jun 2025 12:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: Feng Tang <feng.tang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	paulmck@kernel.org, john.ogness@linutronix.de,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: Re: [PATCH V2 3/5] sys_info: add help to translate sys_info string
 to bitmap
Message-ID: <202506161234.wRZSzo5v-lkp@intel.com>
References: <20250616010840.38258-4-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616010840.38258-4-feng.tang@linux.alibaba.com>

Hi Feng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on akpm-mm/mm-everything linus/master v6.16-rc2 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Feng-Tang/panic-clean-up-code-for-console-replay/20250616-091042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20250616010840.38258-4-feng.tang%40linux.alibaba.com
patch subject: [PATCH V2 3/5] sys_info: add help to translate sys_info string to bitmap
config: x86_64-buildonly-randconfig-001-20250616 (https://download.01.org/0day-ci/archive/20250616/202506161234.wRZSzo5v-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506161234.wRZSzo5v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506161234.wRZSzo5v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/sys_info.c:13:19: warning: unused variable 'sys_info_avail' [-Wunused-const-variable]
      13 | static const char sys_info_avail[] = "tasks,mem,timer,lock,ftrace,all_bt,blocked_tasks";
         |                   ^~~~~~~~~~~~~~
   1 warning generated.


vim +/sys_info_avail +13 lib/sys_info.c

    12	
  > 13	static const char sys_info_avail[] = "tasks,mem,timer,lock,ftrace,all_bt,blocked_tasks";
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
