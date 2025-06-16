Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAE329CB48
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750074005; cv=none; b=S98qssLNrGwzHBaSjUrWAzG9CvFdemH7IScMX7PypivrbyOfzaAtcNCwE44WORu9OtqT/0WrUpA+J7lq9fYqbW22z79X0KYrq9dElFh1y2qn37FbBLB0jN8qdqvwk9Lcx7RBIJmT1f/MDOdEckXQHRiIwU6/0mTVD1jGBgtLsJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750074005; c=relaxed/simple;
	bh=UGARc4J6l7iTL9kWQcHxUPxULYLkQMKq1AkhDvpK+EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOj6oZJMornhTAg8ahvDhHXJUn7V27t6mrgNDoFzWag6oZF0TkGhfZwC/vkDSexbn7evSGcChkSBGWrywCppFI1QNkI/ZvIbdlF0n8pjgmwekroVT9B8qsTP1VH2KPcrxxyYRuVLzSmDrLQD1oOh+nyX5m9GDFdMqjL+i4/LxvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhbvjXex; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhbvjXex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750074003; x=1781610003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UGARc4J6l7iTL9kWQcHxUPxULYLkQMKq1AkhDvpK+EU=;
  b=nhbvjXexUBPx9wKp+L6ePZRcD//SfJBXegF/l3lfXqvmyIx7gycU2R4s
   KF7sD7t3duk9Tte+CvRJsJXN5xQofoHiGYJzhuKE3Y4Iu7a+nVPZduvVH
   ZGO6fs1ybHKQ3iMu2kMhMmneaonZYttpAJjy3GdE9L6cfNsw8QMUn4PZh
   zPz9dxRYw7581RLNRwFj8g/Un2ekwMKbnkfrNvi/gSc8wCBSAy6maH0gV
   uu1UI9ChVFHGL/iGxg6trMuPuWo5E9Gs3ouu2KuyW0p/hhBfqFP+OvgQM
   RIMJUlxiPb3zEh25R4rxWsE80+itU7E5vZBmP3EGidLzIZjdyrx2LSaVA
   g==;
X-CSE-ConnectionGUID: NIgbKcpjRSer6t6/jIaRaQ==
X-CSE-MsgGUID: /8leozDdSOyAJcIMYG74Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69658294"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="69658294"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 04:40:03 -0700
X-CSE-ConnectionGUID: ox07V1DyRueyaq7QBFpl7g==
X-CSE-MsgGUID: y9HyWZnqRjyX6L26ZmkiUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="152284195"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jun 2025 04:39:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR8Bv-000EzU-2M;
	Mon, 16 Jun 2025 11:39:55 +0000
Date: Mon, 16 Jun 2025 19:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
	mjguzik@gmail.com, luto@kernel.org, acme@kernel.org,
	namhyung@kernel.org, tglx@linutronix.de, willy@infradead.org,
	jon.grimm@amd.com, bharata@amd.com, raghavendra.kt@amd.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
	ankur.a.arora@oracle.com
Subject: Re: [PATCH v4 13/13] x86/folio_zero_user: Add multi-page clearing
Message-ID: <202506161939.YrEAfTPY-lkp@intel.com>
References: <20250616052223.723982-14-ankur.a.arora@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616052223.723982-14-ankur.a.arora@oracle.com>

Hi Ankur,

kernel test robot noticed the following build warnings:

[auto build test WARNING on perf-tools-next/perf-tools-next]
[also build test WARNING on tip/perf/core perf-tools/perf-tools linus/master v6.16-rc2 next-20250616]
[cannot apply to acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ankur-Arora/perf-bench-mem-Remove-repetition-around-time-measurement/20250616-132651
base:   https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git perf-tools-next
patch link:    https://lore.kernel.org/r/20250616052223.723982-14-ankur.a.arora%40oracle.com
patch subject: [PATCH v4 13/13] x86/folio_zero_user: Add multi-page clearing
config: x86_64-buildonly-randconfig-003-20250616 (https://download.01.org/0day-ci/archive/20250616/202506161939.YrEAfTPY-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506161939.YrEAfTPY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506161939.YrEAfTPY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/memory.c:61:6: warning: no previous prototype for function 'folio_zero_user' [-Wmissing-prototypes]
      61 | void folio_zero_user(struct folio *folio, unsigned long addr_hint)
         |      ^
   arch/x86/mm/memory.c:61:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      61 | void folio_zero_user(struct folio *folio, unsigned long addr_hint)
         | ^
         | static 
   1 warning generated.


vim +/folio_zero_user +61 arch/x86/mm/memory.c

    39	
    40	/*
    41	 * folio_zero_user() - multi-page clearing.
    42	 *
    43	 * @folio: hugepage folio
    44	 * @addr_hint: faulting address (if any)
    45	 *
    46	 * Overrides common code folio_zero_user(). This version takes advantage of
    47	 * the fact that string instructions in clear_pages() are more performant
    48	 * on larger extents compared to the usual page-at-a-time clearing.
    49	 *
    50	 * Clearing of 2MB pages is split in three parts: pages in the immediate
    51	 * locality of the faulting page, and its left, right regions; with the local
    52	 * neighbourhood cleared last in order to keep cache lines of the target
    53	 * region hot.
    54	 *
    55	 * For GB pages, there is no expectation of cache locality so just do a
    56	 * straight zero.
    57	 *
    58	 * Note that the folio is fully allocated already so we don't do any exception
    59	 * handling.
    60	 */
  > 61	void folio_zero_user(struct folio *folio, unsigned long addr_hint)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
