Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755B082C60
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 01:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749174656; cv=none; b=t6qFcegzNMSTysPRD3+bzCnnBIbURjkcndBl6qXKcQVmL5iYlFn+v68DLbSdZ2ao5OueqOoVEX+oqO7FHdd7+71ZYzsBfIkK56aUja/moknBSpakgDF1O5NoRvLNs6vUsLwDkBO/xUhm6ZYVG6eZdi6rbvoBCHbFtcHHKZGGUBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749174656; c=relaxed/simple;
	bh=/DJv+NPpUjWWWztYNwh9gNVvsQab8+O1fHBH0SOuxb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIQihUpxPjgve1xdPse99qvTbsJ13goX1OmvnPQGqK1CA6var//YsKfECiuy+4NR94Wo9hTVAEBthHrfwYDMHvnKcickxciGRkgN5nB/d9zzMt1snpAV0BhoL1hJxey1KKPGd2vDtC0lGUtLvgpnfdG3nk5YMuMSUAj2dJ75O0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNUS08jp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNUS08jp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749174654; x=1780710654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/DJv+NPpUjWWWztYNwh9gNVvsQab8+O1fHBH0SOuxb8=;
  b=NNUS08jpaTUWtehpxuo52MGNiWGpWXWiNkznpfg97RykvrXjCGk9hlKI
   y5/Fe/dWrCy9AZZPRhoTGujUVDMZydh6tGX8YfHDfUfCa90CgPb/GV6pn
   fFOL5ZM0wXkwATEQZ+rC1HpKHIJjH+MNP5Qdja1ZGNcoqT2KZoY83TOxI
   m1ngr6WDGuBM7EvFR0jmS1LcYMn2sSvCBdB1VyFmSqzPlmJBRlRSEEfI0
   bFzu92N54XdSJbh3AvTdy9stg7R2lqO6a1NtJI8hy6DXg5LoEtTXzVwrD
   48H1DYw9bfqFAGhI0HFDo0CcXAlLkIuq4T7NbnU5zacLB+wG7Pq/TZ/6o
   g==;
X-CSE-ConnectionGUID: KCUw7ObxTOG4YShX+lrB9g==
X-CSE-MsgGUID: 8ptGD+pzToKS55aDaSjbsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51020245"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="51020245"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 18:50:53 -0700
X-CSE-ConnectionGUID: QnSp8KYWQReB4kmtCIqw5Q==
X-CSE-MsgGUID: FTnBe6xFRp+SkcA369UidQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; 
   d="scan'208";a="150514855"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Jun 2025 18:50:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNMEL-0004dX-0P;
	Fri, 06 Jun 2025 01:50:49 +0000
Date: Fri, 6 Jun 2025 09:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-kernel@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v5 04/10] mm,slub: Use node-notifier instead of
 memory-notifier
Message-ID: <202506060918.HDCPogq9-lkp@intel.com>
References: <20250605142305.244465-5-osalvador@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605142305.244465-5-osalvador@suse.de>

Hi Oscar,

kernel test robot noticed the following build errors:

[auto build test ERROR on driver-core/driver-core-testing]
[also build test ERROR on driver-core/driver-core-next driver-core/driver-core-linus rafael-pm/linux-next rafael-pm/bleeding-edge tj-cgroup/for-next linus/master v6.15 next-20250605]
[cannot apply to akpm-mm/mm-everything vbabka-slab/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oscar-Salvador/mm-memory_hotplug-Remove-status_change_nid_normal-and-update-documentation/20250605-232305
base:   driver-core/driver-core-testing
patch link:    https://lore.kernel.org/r/20250605142305.244465-5-osalvador%40suse.de
patch subject: [PATCH v5 04/10] mm,slub: Use node-notifier instead of memory-notifier
config: riscv-randconfig-001-20250606 (https://download.01.org/0day-ci/archive/20250606/202506060918.HDCPogq9-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506060918.HDCPogq9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506060918.HDCPogq9-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'slab_mem_going_online_callback':
>> mm/slub.c:6168:23: error: invalid use of undefined type 'struct node_notify'
    6168 |         int nid = narg->nid;
         |                       ^~
   mm/slub.c: In function 'slab_memory_callback':
   mm/slub.c:6220:14: error: 'NODE_ADDING_FIRST_MEMORY' undeclared (first use in this function)
    6220 |         case NODE_ADDING_FIRST_MEMORY:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c:6220:14: note: each undeclared identifier is reported only once for each function it appears in
   mm/slub.c:6223:14: error: 'NODE_REMOVING_LAST_MEMORY' undeclared (first use in this function)
    6223 |         case NODE_REMOVING_LAST_MEMORY:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~
   mm/slub.c: In function 'kmem_cache_init':
   mm/slub.c:6300:9: error: implicit declaration of function 'hotplug_node_notifier'; did you mean 'hotplug_memory_notifier'? [-Werror=implicit-function-declaration]
    6300 |         hotplug_node_notifier(slab_memory_callback, SLAB_CALLBACK_PRI);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         hotplug_memory_notifier
   cc1: some warnings being treated as errors


vim +6168 mm/slub.c

  6162	
  6163	static int slab_mem_going_online_callback(void *arg)
  6164	{
  6165		struct kmem_cache_node *n;
  6166		struct kmem_cache *s;
  6167		struct node_notify *narg = arg;
> 6168		int nid = narg->nid;
  6169		int ret = 0;
  6170	
  6171		/*
  6172		 * If the node's memory is already available, then kmem_cache_node is
  6173		 * already created. Nothing to do.
  6174		 */
  6175		if (nid < 0)
  6176			return 0;
  6177	
  6178		/*
  6179		 * We are bringing a node online. No memory is available yet. We must
  6180		 * allocate a kmem_cache_node structure in order to bring the node
  6181		 * online.
  6182		 */
  6183		mutex_lock(&slab_mutex);
  6184		list_for_each_entry(s, &slab_caches, list) {
  6185			/*
  6186			 * The structure may already exist if the node was previously
  6187			 * onlined and offlined.
  6188			 */
  6189			if (get_node(s, nid))
  6190				continue;
  6191			/*
  6192			 * XXX: kmem_cache_alloc_node will fallback to other nodes
  6193			 *      since memory is not yet available from the node that
  6194			 *      is brought up.
  6195			 */
  6196			n = kmem_cache_alloc(kmem_cache_node, GFP_KERNEL);
  6197			if (!n) {
  6198				ret = -ENOMEM;
  6199				goto out;
  6200			}
  6201			init_kmem_cache_node(n);
  6202			s->node[nid] = n;
  6203		}
  6204		/*
  6205		 * Any cache created after this point will also have kmem_cache_node
  6206		 * initialized for the new node.
  6207		 */
  6208		node_set(nid, slab_nodes);
  6209	out:
  6210		mutex_unlock(&slab_mutex);
  6211		return ret;
  6212	}
  6213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
