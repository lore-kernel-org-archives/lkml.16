Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625F91A9B23
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 12:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743857318; cv=none; b=aKEK0cvYWtXGImuuccOgea1NBrfJy/JgzR4i4rX0iKXPIlM/LoHVC94XIgiEssM/vFciOS/LngoURHn5rKrL0usIT+kALqn4N52SWEBxPVP2kDMDApBYhhrGHTs6dZ+GR+7JDClV2Bc506/BZM+EWuSPwZgtOTFZJtcBFN7O6Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743857318; c=relaxed/simple;
	bh=rEKB5o3tXinJ0e4nM3y2sFbzk380OYk6wMscqAt4kac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f6eScvCZtnqAQt6YjGPEI58p7UsprdUug8fD5Zm2KO6ypbgI0dNQIj9GJ1N7BdveDYx0i06ZFd2mc+e8oMgzblpFc/hSGATQCUKmw6P+v9/Z2u+cdnaczhSmfATDZkidOjJI4VMFGa719G9bQ+JO0rnBBcsAWY+ndHMVwhNuiYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNmlsjFJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNmlsjFJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743857316; x=1775393316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rEKB5o3tXinJ0e4nM3y2sFbzk380OYk6wMscqAt4kac=;
  b=XNmlsjFJ68V6IwbsCtfW7zRkeK1r15THeHLFZTX5ixvkrCmpp1CxfJsj
   eInUPujYQ2RUIqR6qJF8MfWUXro/zpL1P0MEBQsYWKD1C/GUj1rgpqbd+
   R+7V1+1h0pn899zx0FzDrcg/qJsJco1h3/FQGKyzzo7RAzjG9wf+/zTEV
   +8GuZRtMBPE68IKOdD1B5JZYlLBecTKGcKGCJLg/SgIfANLAnGTeVoBYW
   tLtjv/e7YqMFH0MVkc0dRGXTjZZJI3WewPEK3LolH+CfI/8/q2PfMVi71
   U51E0YYOcNKKOL4HamlJJr3BTGWfkm9bN5GO2AJenyg5CmLtOcf+jXC9B
   g==;
X-CSE-ConnectionGUID: jdQ7WEx3T7WHT1Gn6KXxkg==
X-CSE-MsgGUID: MwYi3EMuT4yyt52npjutDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="44435481"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="44435481"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 05:46:23 -0700
X-CSE-ConnectionGUID: FKz5BdQuSRG15LyZFBxneA==
X-CSE-MsgGUID: agc02w7UT6SGrQ+nBl7REw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="132389101"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Apr 2025 05:46:19 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u12uf-00021r-15;
	Sat, 05 Apr 2025 12:46:17 +0000
Date: Sat, 5 Apr 2025 20:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v2] x86/xen: fix balloon target initialization for PVH
 dom0
Message-ID: <202504052022.avvx45LI-lkp@intel.com>
References: <20250404133459.16125-1-roger.pau@citrix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404133459.16125-1-roger.pau@citrix.com>

Hi Roger,

kernel test robot noticed the following build errors:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on tip/x86/core linus/master v6.14 next-20250404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roger-Pau-Monne/x86-xen-fix-balloon-target-initialization-for-PVH-dom0/20250404-214218
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/20250404133459.16125-1-roger.pau%40citrix.com
patch subject: [PATCH v2] x86/xen: fix balloon target initialization for PVH dom0
config: x86_64-buildonly-randconfig-001-20250405 (https://download.01.org/0day-ci/archive/20250405/202504052022.avvx45LI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504052022.avvx45LI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504052022.avvx45LI-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/xen/balloon.o: in function `balloon_init':
>> drivers/xen/balloon.c:727: undefined reference to `xen_released_pages'


vim +727 drivers/xen/balloon.c

   716	
   717	static int __init balloon_init(void)
   718	{
   719		struct task_struct *task;
   720		int rc;
   721	
   722		if (!xen_domain())
   723			return -ENODEV;
   724	
   725		pr_info("Initialising balloon driver\n");
   726	
 > 727		if (xen_released_pages >= get_num_physpages()) {
   728			WARN(1, "Released pages underflow current target");
   729			return -ERANGE;
   730		}
   731	
   732		balloon_stats.current_pages = get_num_physpages() - xen_released_pages;
   733		balloon_stats.target_pages  = balloon_stats.current_pages;
   734		balloon_stats.balloon_low   = 0;
   735		balloon_stats.balloon_high  = 0;
   736		balloon_stats.total_pages   = balloon_stats.current_pages;
   737	
   738		balloon_stats.schedule_delay = 1;
   739		balloon_stats.max_schedule_delay = 32;
   740		balloon_stats.retry_count = 1;
   741		balloon_stats.max_retry_count = 4;
   742	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
