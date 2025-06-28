Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFF22110
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751126504; cv=none; b=dFURTJwIeMgxgXQtRES3Pkj9hs/6ax9exbxMWhWwY+YcAbyBeerPUczC2D2I7rcy6R3Po8rYYxQx5fJMRMtNeyAs3Q+NARcfGHIQTdMce31ktVlXqz/UqznX8BVWKCgcCbcqfoo/WI9EluJeValL/dtl1qy7d4F1OXJ1Kd4bIh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751126504; c=relaxed/simple;
	bh=KJ3XixzatG28JYSLpS2o/7QE9V7IiUgq3N6McJtnJYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBypRl1hDHt/d23SAsC/8lZ+mfBvnmDAOQuRRPZLiuafJ2EHOP6hZSbSPx1L/Rvm3I0elp8QHIakoR4IfRYLajUVsteZd7S5saga/mhrg3NB/j26SrDDD+P5DhqFDnXMcfaedPHL/KP23aiwFBwEK51qpCZhZNkUyfnG0FP6SIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gGDAXAmq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGDAXAmq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751126502; x=1782662502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KJ3XixzatG28JYSLpS2o/7QE9V7IiUgq3N6McJtnJYg=;
  b=gGDAXAmqvEvU0N5rPgdR0j6iy6G/ZBsRVoTXz2qfEsYWaTq4cRTCr4Ga
   oQnK0hTUcgY53M1vxgmg6r0sNV6Tv3uukneI8c+pwWUG3JauJq8gyAwQv
   YpReWaHr9cc7bicupl+Z6I44HwfCGyxUZnikojtfei50q+p4Wfhwm04KD
   iEzWfO9sMeiodRHPb/hi8blBuXYC8QldJcU8Uyj5wTWCZVFLHv7Vap1bo
   jXxrncmele4PBQdplO1g8dLS0PbAkeCI99/1cd1QmTUAyv7q4JxBZJP2J
   Gr6G2/UtWr84QiZjNk9kegdeqOpOXsE4G4/QqT5MWr3ihHGUqMhzj7p2N
   Q==;
X-CSE-ConnectionGUID: pgz6eKPQTQioket37cW6ww==
X-CSE-MsgGUID: evDDlqw+QY+iYr2+WH8icw==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="52530770"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="52530770"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 09:01:39 -0700
X-CSE-ConnectionGUID: BkgfU+e/Tq2wRRtaBnyfwA==
X-CSE-MsgGUID: ZVTHuC/2QE6rPdlahlSrZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153768974"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Jun 2025 09:01:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVXzk-000XAA-14;
	Sat, 28 Jun 2025 16:01:36 +0000
Date: Sun, 29 Jun 2025 00:00:41 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Liu <liubo03@inspur.com>, phillip@squashfs.org.uk
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bo Liu <liubo03@inspur.com>
Subject: Re: [PATCH] Squashfs: add page cache share support
Message-ID: <202506282334.A6g9vp33-lkp@intel.com>
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
[also build test WARNING on linus/master next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Liu/Squashfs-add-page-cache-share-support/20250626-084010
base:   v6.16-rc3
patch link:    https://lore.kernel.org/r/20250626003644.3675-1-liubo03%40inspur.com
patch subject: [PATCH] Squashfs: add page cache share support
config: hexagon-randconfig-r073-20250628 (https://download.01.org/0day-ci/archive/20250628/202506282334.A6g9vp33-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506282334.A6g9vp33-lkp@intel.com/

New smatch warnings:
fs/squashfs/inode.c:97 squashfs_iget() warn: inconsistent indenting

Old smatch warnings:
fs/squashfs/inode.c:293 squashfs_read_inode() warn: missing unwind goto?

vim +97 fs/squashfs/inode.c

    74	
    75	
    76	struct inode *squashfs_iget(struct super_block *sb, long long ino,
    77					unsigned int ino_number)
    78	{
    79		struct inode *inode = iget_locked(sb, ino_number);
    80		int err;
    81	
    82		TRACE("Entered squashfs_iget\n");
    83	
    84		if (!inode)
    85			return ERR_PTR(-ENOMEM);
    86		if (!(inode->i_state & I_NEW))
    87			return inode;
    88	
    89		err = squashfs_read_inode(inode, ino);
    90		if (err) {
    91			iget_failed(inode);
    92			return ERR_PTR(err);
    93		}
    94		unlock_new_inode(inode);
    95	
    96	#ifdef CONFIG_SQUASHFS_PAGE_CACHE_SHARE
  > 97			if ((inode->i_mode & S_IFMT) == S_IFREG) {
    98				if (squashfs_pcs_fill_inode(inode) > 0)
    99					inode->i_fop = &squashfs_pcs_file_fops;
   100			}
   101	#endif
   102	
   103		return inode;
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
