Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B2AA59
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 00:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749340912; cv=none; b=Fo4Pc8hCUi7Dl9GQlj488f2IASWSGXc01MoFDNlBKgj/2l0OfM2Vu3ZPjV4oSm9esY/UI6IKvCJEAsUlU+CgxNS8j1VE/jJWcQBvbZ4jHk2SN27njla+1rVSqZOdVkfSqhWew3Ot+1hj65cSBfj8zpC9Iv1kgjeyXOAa5VZC3Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749340912; c=relaxed/simple;
	bh=8R2uPY1f+jWcsKfkH2Pjb0Fl6unpyZmQFq81JP1d2ec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bn1jtNggJxveG/t3GumZwXYJIZuzgBx2CanjnwknUd+eDPMeT2xgJBBdMkzcYHgkQdtiAyUcgtCeQ1qZ6RCnIa9BPXo3uURL2oE7loEk7fgNx6W/xPMznmHXiO7kFxaVN+OnwxeESMQ8QH9LQHlKIOGdaXTCSH5x/+zAmKhMfHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6XtU9l/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6XtU9l/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749340910; x=1780876910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8R2uPY1f+jWcsKfkH2Pjb0Fl6unpyZmQFq81JP1d2ec=;
  b=m6XtU9l/DZWV4N3ixnvFtv2jrz99kwh6qZhFpA+/Dr81wkC9qOKfMsNB
   XhNRtJ0E5ZHnOLBFOoULaGdKIZZ8gd2PxgyPTqfbwGJjRnzZy2x5su0/N
   6A6AG86H2QR4+vaKmbcH3FvsLaYuLVaox6GXPbdqiRTPiMEZu3yLNknp8
   jPmHOJ9m3rSy98XDll70SdHJ+aFtIXqOI7QZ89pE3QL12NiUXXGkFFD5h
   H7bdxr0/XCx7AxiGhopOkusneN/NtGHFVWyZpZkH8tabQyySEztzOyKli
   8grX6PCKWOmY6vUS89mjjVF0V64gHWeaePEEjpc8UthDl7Ar2u6zWH0wh
   w==;
X-CSE-ConnectionGUID: RBVBP4w/SbaqQcC5WRimeA==
X-CSE-MsgGUID: zHZgsNd+SCGRdqFwMggnGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51337218"
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="51337218"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 17:01:50 -0700
X-CSE-ConnectionGUID: iNQOHQ0PSyedeM5BC4DK7A==
X-CSE-MsgGUID: B0bPJYRkTgGjk49R2v6ivw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="146666359"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Jun 2025 17:01:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uO3Tu-00064z-2u;
	Sun, 08 Jun 2025 00:01:46 +0000
Date: Sun, 8 Jun 2025 08:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: Raul E Rangel <rrangel@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: init/main.c:753:(.init.text+0x7a): relocation truncated to fit:
 R_ARC_S25W_PCREL against symbol `__st_r13_to_r16' defined in .text section
 in ../lib/gcc/arc-linux/8.5.0/libgcc.a(_millicodethunk_st.o)
Message-ID: <202506080718.Q9VUfXsm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8630c59e99363c4b655788fd01134aef9bcd9264
commit: 17b655759e83fd5e28931a0ece96fa9c2ab718e7 init: Don't proxy `console=` to earlycon
date:   8 months ago
config: arc-randconfig-r113-20250607 (https://download.01.org/0day-ci/archive/20250608/202506080718.Q9VUfXsm-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250608/202506080718.Q9VUfXsm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506080718.Q9VUfXsm-lkp@intel.com/

All errors (new ones prefixed by >>):

   init/main.o: in function `do_early_param':
>> init/main.c:753:(.init.text+0x7a): relocation truncated to fit: R_ARC_S25W_PCREL against symbol `__st_r13_to_r16' defined in .text section in ../lib/gcc/arc-linux/8.5.0/libgcc.a(_millicodethunk_st.o)


vim +753 init/main.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  749  
^1da177e4c3f41 Linus Torvalds    2005-04-16  750  /* Check for early params. */
ecc8617053e0a9 Luis R. Rodriguez 2015-03-30  751  static int __init do_early_param(char *param, char *val,
ecc8617053e0a9 Luis R. Rodriguez 2015-03-30  752  				 const char *unused, void *arg)
^1da177e4c3f41 Linus Torvalds    2005-04-16 @753  {
914dcaa84c53f2 Rusty Russell     2010-08-11  754  	const struct obs_kernel_param *p;
^1da177e4c3f41 Linus Torvalds    2005-04-16  755  
^1da177e4c3f41 Linus Torvalds    2005-04-16  756  	for (p = __setup_start; p < __setup_end; p++) {
17b655759e83fd Raul E Rangel     2024-09-11  757  		if (p->early && parameq(param, p->str)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  758  			if (p->setup_func(val) != 0)
ea676e846a8171 Andrew Morton     2013-04-29  759  				pr_warn("Malformed early option '%s'\n", param);
^1da177e4c3f41 Linus Torvalds    2005-04-16  760  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  761  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  762  	/* We accept everything at this stage. */
^1da177e4c3f41 Linus Torvalds    2005-04-16  763  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  764  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  765  

:::::: The code at line 753 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
