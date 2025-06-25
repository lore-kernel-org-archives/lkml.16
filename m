Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2A682C60;
	Wed, 25 Jun 2025 01:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750813471; cv=none; b=gj1LSJDqAhl18fD7ypAj0lfU2rs5iAnfe6BTO7Ms3gylmx6910a57czaHZK6E06EBOIHqZfu7nOuKRR5+J3BtN8/4Q222Y8lDuBUuuzdOF13i68BIfK9men+Pss3UIdbnyDXmgtkkSI3LXGgu1rWoQVbomFlqUfBLDPBWsLIGNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750813471; c=relaxed/simple;
	bh=6hP9g/yPzPgGn1ICzoLlczOoRz0hvkKReWDNrFsZrAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pt3gmNsrQ7rgM2CuS/tN3463BtkzybEc8P7TACODGgWfDsnmgRWRNaX5UQg42d+07SYfoNwWufOQZOCxNzGMDHgZnJ6IjUEhQJIK4D9Obhii7LGNV75s5rZ475dT2qKdsrzJNnt0fxVhXXf5kH1grQx8HhfoQ/1C5dnaYYYyJak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LufgD8Yq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LufgD8Yq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750813470; x=1782349470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6hP9g/yPzPgGn1ICzoLlczOoRz0hvkKReWDNrFsZrAM=;
  b=LufgD8Yq4AIGilC0INuqt7jXBUktmEFDRB7BbwcFdgghGCWO3pR15AZE
   KgzEyTQTWZguNn5aTBVhCnXvFMU6zK6E3JcpYFBS8TQi/GfVDBKfTh0EY
   Ats+/6FF7gVwcZf8kyBd4VYpObyx/TZLUp2B4FwoVtHeJT/3/sn0BS5LP
   qNXQEerao94hjLEM21OntUhATru+PgkO8MVRo5BEfkz2oZZtTN9la47O2
   3bAEzVMTN1cZKY3EIp2W4zr6hwsMRpiUHimk/EbqF2wEJ4+q50EEkL15l
   ipSCp9+F014rfAEpq8HvTPaT/TqasztYBVEfDrfPTOByMy+hcega0kKDN
   A==;
X-CSE-ConnectionGUID: D+drhdjLRSCe2OozohA33Q==
X-CSE-MsgGUID: p5DT3fS1QhuDpoZE/6PO9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63330705"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="63330705"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 18:04:29 -0700
X-CSE-ConnectionGUID: W28pzJC0RyCWznVy2OtPjg==
X-CSE-MsgGUID: zn4fBWIAT2auDxJBmbvN7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="182948014"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jun 2025 18:04:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUEYq-000Se2-1N;
	Wed, 25 Jun 2025 01:04:24 +0000
Date: Wed, 25 Jun 2025 09:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: Re: [PATCH v2 1/2] mm/vmalloc: allow to set node and align in
 vrealloc
Message-ID: <202506250832.Ixp27fE5-lkp@intel.com>
References: <20250624123859.3258172-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624123859.3258172-1-vitaly.wool@konsulko.se>

Hi Vitaly,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on rust/alloc-next rust/rust-next linus/master v6.16-rc3 next-20250624]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Wool/mm-vmalloc-allow-to-set-node-and-align-in-vrealloc/20250624-204140
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250624123859.3258172-1-vitaly.wool%40konsulko.se
patch subject: [PATCH v2 1/2] mm/vmalloc: allow to set node and align in vrealloc
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250625/202506250832.Ixp27fE5-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506250832.Ixp27fE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506250832.Ixp27fE5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/nommu.c:28:
>> include/linux/vmalloc.h:202:68: error: expected declaration specifiers or '...' before numeric constant
     202 | #define vrealloc_noprof(p, s, f)        vrealloc_node_noprof(p, s, 1, f, NUMA_NO_NODE)
         |                                                                    ^
   mm/nommu.c:122:7: note: in expansion of macro 'vrealloc_noprof'
     122 | void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
         |       ^~~~~~~~~~~~~~~
   In file included from include/linux/nodemask.h:93,
                    from include/linux/numa.h:6,
                    from include/linux/cpumask.h:17,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/nommu.c:20:
>> include/linux/nodemask_types.h:15:25: error: expected declaration specifiers or '...' before '(' token
      15 | #define NUMA_NO_NODE    (-1)
         |                         ^
   include/linux/vmalloc.h:202:74: note: in expansion of macro 'NUMA_NO_NODE'
     202 | #define vrealloc_noprof(p, s, f)        vrealloc_node_noprof(p, s, 1, f, NUMA_NO_NODE)
         |                                                                          ^~~~~~~~~~~~
   mm/nommu.c:122:7: note: in expansion of macro 'vrealloc_noprof'
     122 | void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
         |       ^~~~~~~~~~~~~~~


vim +202 include/linux/vmalloc.h

   199	
   200	void *__must_check vrealloc_node_noprof(const void *p, size_t size,
   201			unsigned long align, gfp_t flags, int nid) __realloc_size(2);
 > 202	#define vrealloc_noprof(p, s, f)	vrealloc_node_noprof(p, s, 1, f, NUMA_NO_NODE)
   203	#define vrealloc_node(...)		alloc_hooks(vrealloc_node_noprof(__VA_ARGS__))
   204	#define vrealloc(...)			alloc_hooks(vrealloc_noprof(__VA_ARGS__))
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
