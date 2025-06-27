Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252BE22D781
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011112; cv=none; b=o1kfh2IdzJFfF5pcLoVlcQzvBV4dJUzAaW2WIa6g6v4k60G7RQvVgaKegZJ8yL9rR6sM0RMgPxICUD9KM50CHnl/38sPp/t+R+Cyon9Rgx+/UjFutltjWNAekdY5aC4XDn9G/2tMO1S7igyK0IR7Up08X6RG9Xxrv+CBHwfPiEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011112; c=relaxed/simple;
	bh=l9n8KltPPbYE3t93Ps5saCbC29p8bhSOg0qy1bAZscs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pav3uBM7ToDOMUw1IT+SkHFHCnmKDuq/ltyQ6ykUaT1kl6soPwE11ze2p6pGReFCZHc4KkVBIDoGFynPK1ypiu3Ayo54bnsw/tEXCUs00opkhwsBvecRywWcx7fEMM4mBF4ClcQFW1xnKnbR2DrJzdg4d9f2fs6jghy8YJ8I8XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lm9XR8QN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lm9XR8QN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751011110; x=1782547110;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l9n8KltPPbYE3t93Ps5saCbC29p8bhSOg0qy1bAZscs=;
  b=lm9XR8QN717Dn9AGiFl0LAhZqAp5vDbDnvXvs8418J4O5taW1PZ7ym8n
   GulVOOF3PiB3Hig75R2OxMlnF4fw/ST0cKguPelHhQ7FfoJsXu54yzetj
   U7mOoV1tWpWZLOU3MY3tL0BPewvIeK6koqz987Uck7+B5bA6eLQbhX2Hs
   04PXPgxf5X1787vwLSMcBNLTykumyMdczY3URMrdEYrMBekskyhzTLoHZ
   rI64A4IEpAIal/Dk4jC5QmkAXH1A3M7ktWqGpnjQeVIYgQ4gvzuPupXsx
   VMyH2fL8GbGSWlXZ138wQ6MekcXMuTWfP0oPF0UZwf+DUejlMOdT/e1Zr
   A==;
X-CSE-ConnectionGUID: PbEW0na9S6q6dCO/q3L8Rg==
X-CSE-MsgGUID: 8u7IZybVTwKNnqP2X9nIyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="78759731"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="78759731"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:58:29 -0700
X-CSE-ConnectionGUID: 8dWLYkZISsKZ8xM6dWnpuA==
X-CSE-MsgGUID: Z8UhkWkBQcOjsDb0DD5w2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="152479987"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Jun 2025 00:58:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV3yb-000VwQ-30;
	Fri, 27 Jun 2025 07:58:25 +0000
Date: Fri, 27 Jun 2025 15:58:14 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Liu <liubo03@inspur.com>, phillip@squashfs.org.uk
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bo Liu <liubo03@inspur.com>
Subject: Re: [PATCH] Squashfs: add page cache share support
Message-ID: <202506271526.5iaNmw8d-lkp@intel.com>
References: <20250626003644.3675-1-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626003644.3675-1-liubo03@inspur.com>

Hi Bo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.16-rc3]
[also build test WARNING on linus/master next-20250626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Liu/Squashfs-add-page-cache-share-support/20250626-084010
base:   v6.16-rc3
patch link:    https://lore.kernel.org/r/20250626003644.3675-1-liubo03%40inspur.com
patch subject: [PATCH] Squashfs: add page cache share support
config: m68k-randconfig-r132-20250627 (https://download.01.org/0day-ci/archive/20250627/202506271526.5iaNmw8d-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250627/202506271526.5iaNmw8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271526.5iaNmw8d-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/squashfs/pagecache_share.c:136:35: sparse: sparse: symbol 'squashfs_file_vm_ops' was not declared. Should it be static?

vim +/squashfs_file_vm_ops +136 fs/squashfs/pagecache_share.c

   135	
 > 136	const struct vm_operations_struct squashfs_file_vm_ops = {
   137		.fault		= filemap_fault,
   138		.map_pages	= filemap_map_pages,
   139		.page_mkwrite	= filemap_page_mkwrite,
   140	};
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
