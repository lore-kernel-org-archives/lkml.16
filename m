Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5902BAF9
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 01:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748570064; cv=none; b=FOJ5d2fZ7UgoooIIIXDp+Vxe/lIpRgW0dOGK4Adu8bHmyA9rBPWd9TZXSHoK2O0Z1DRRF1WyW4L7vTGxJyO4rwq1X6/DtKOxwv+ElekvXRelIrdbMWlV/9nuXe6ZU9jXExugwhWArCeWeYBIvliAttRhVh+NkiOc3mFQqcUl/zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748570064; c=relaxed/simple;
	bh=SsRo0QX60mZRmDjG77f8nnfi3/mv6+EiM659mVQRHNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iq4Ju1aMm9qQNWNLA1LxTdOHyzo4BWw09p+9rVKNn8ampIeyfk4pGvqAPa5By4CHMnTdMhijavsFP1XdW15TSKvjue1tnCQ++nnedasfxQQAa4RQTGRhRKrh47+QS8o/k2o+na687hmxvLNRahP15NNnhfL3mMQ37Bkj6UsV5wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pk8oZt3e; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pk8oZt3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748570062; x=1780106062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SsRo0QX60mZRmDjG77f8nnfi3/mv6+EiM659mVQRHNk=;
  b=Pk8oZt3eW76GbqvRB0jOKGICAOaiiAY1NC1OlQBiC8a76sN4lez3wM8k
   pBDjAC2K4nWXZikSNFA+m0HppzYrGSQXVwyJ13Lo5D6HIjVQUx3w3f72R
   LJ9bc5PoOL6i9FwRdtT05OAnjdHKUK4h2+5AaXxjTHooyUhitBS2+Ixdf
   rI7x9+dyif2HkQ3AipjuG5v6Y8hG6USKKsTUhJUPKmuMocsSC+IYTfOZS
   WCyJfomVNqEjz6jm8gfmCpwYm++t+dq+lg4wRgg1t4s/v9mP+N/1vIKTD
   wr7tugFLZvYegBiAo+wSg0v0COUerOoREBPM5Vq0dxzXzcX9ZZG1ASoeT
   A==;
X-CSE-ConnectionGUID: //UfhS+USfCPpHGZ1sUxbg==
X-CSE-MsgGUID: nZo4ehMdSHacjWIktRPQvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50537770"
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="50537770"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 18:54:22 -0700
X-CSE-ConnectionGUID: sDp4wXUDRq6HnvjkYx8Abg==
X-CSE-MsgGUID: xkdTflvvS8SVMCCuP7nMAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,194,1744095600"; 
   d="scan'208";a="144067946"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2025 18:54:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKows-000XFw-1F;
	Fri, 30 May 2025 01:54:18 +0000
Date: Fri, 30 May 2025 09:53:42 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Machata <petrm@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	David Ahern <dsahern@kernel.org>
Subject: include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
Message-ID: <202505300908.fNWr1zST-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e0797d3b91de75b6c95b4a0e0649ebd4aac1d9d1
commit: 4ee2a8cace3fb9a34aea6a56426f89d26dd514f3 net: ipv4: Add a sysctl to set multipath hash seed
date:   12 months ago
config: arm64-randconfig-r123-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300908.fNWr1zST-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250530/202505300908.fNWr1zST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505300908.fNWr1zST-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv4/route.c: note: in included file (through include/linux/mroute_base.h, include/linux/mroute.h):
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast to non-scalar
>> include/net/ip_fib.h:539:19: sparse: sparse: cast from non-scalar

vim +539 include/net/ip_fib.h

   532	
   533	static inline u32 fib_multipath_hash_from_keys(const struct net *net,
   534						       struct flow_keys *keys)
   535	{
   536		siphash_aligned_key_t hash_key;
   537		u32 mp_seed;
   538	
 > 539		mp_seed = READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed).mp_seed;
   540		fib_multipath_hash_construct_key(&hash_key, mp_seed);
   541	
   542		return flow_hash_from_keys_seed(keys, &hash_key);
   543	}
   544	#else
   545	static inline u32 fib_multipath_hash_from_keys(const struct net *net,
   546						       struct flow_keys *keys)
   547	{
   548		return flow_hash_from_keys(keys);
   549	}
   550	#endif
   551	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
