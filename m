Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E516F1F3B8B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 20:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745699317; cv=none; b=nPafsHxiYkWWcPTP3ZVL17varNUovzMDH5oPJvMh0RJivRQvk+7H7JTSWESVS4ZPEBY983k9qGsq7aTQBQj2JODl3SuyY0hdYrnXX6xwsayahhQmVxeRAdOPuk3Rd597d3SJMKMon6N0NQEDYtVAxqk09fYc2t5Jf12Anai7ipA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745699317; c=relaxed/simple;
	bh=mNXXTcVKUUz50eSUe3QE6Wd5LmCexaP8c+TKZxSTxLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MyeN8R9MPqvitiEsXnfsj+6Gp3m2g9BuG/+bIF4gr7tHCb1l9tFI/UN0stoOMOfJaVQhbMKHaMtG0kj15MDYQBESbrlUO35XALlIFpobdpiDvM1qYhvOtkYWpCGOrffgMMxqeHBoGKlImDXcwmis9CHgJQeIx8T+lTqPxgYuX1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LO4q7UkF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LO4q7UkF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745699316; x=1777235316;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mNXXTcVKUUz50eSUe3QE6Wd5LmCexaP8c+TKZxSTxLI=;
  b=LO4q7UkF1LxTH6dWSClfhIzGj0ncUyHDayPmqCUnMl5mzH+3kKTDwWcG
   ZyVts7Gkf5xeZRRUbW2/OqXmVwYKKQlq7Eo7RWGXuaNBc7/+umwS5a493
   qzmaaeNjZ7Bw8y/1S8NAYmWKOp1XLP50aA4JcIQdTUBnS4/oe3VUNXYVB
   fR514+W1DsrhX64BMAw3jdiJ/qw90n9h/W6tQ7y1pFfWCsrYn3wStcra2
   gLhGB4KYobjmjQD74JY+Zd6rimYSvXmKdLJBbtKHLPWt5lblKd/b2pm+v
   deBv9A+6AO2yzTPJKefkKQNix14yKmwMZ7Rjyr2I65Bjzm1ltpUB/GxoA
   w==;
X-CSE-ConnectionGUID: z0LBV/UUQjW0sjOdAn7dbg==
X-CSE-MsgGUID: LHBN0lWdRiGa/CX4g7h1mw==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="49981172"
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="49981172"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 13:28:35 -0700
X-CSE-ConnectionGUID: 8BV+OAFUTqubI/9V1aWcdw==
X-CSE-MsgGUID: Ekmu35D9TaSitN95YcVC3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="133670546"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2025 13:28:34 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8m8W-0005yj-0M;
	Sat, 26 Apr 2025 20:28:32 +0000
Date: Sun, 27 Apr 2025 04:28:25 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bob Peterson <rpeterso@redhat.com>
Subject: fs/gfs2/glock.c:1213: warning: Function parameter or struct member
 'ip' not described in '__gfs2_holder_init'
Message-ID: <202504270418.VcPbMEFk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andreas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: b016d9a84abdd2efaa273814eaeb59e112ecffbd gfs2: Save ip from gfs2_glock_nq_init
date:   3 years, 6 months ago
config: csky-randconfig-r036-20230303 (https://download.01.org/0day-ci/archive/20250427/202504270418.VcPbMEFk-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270418.VcPbMEFk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270418.VcPbMEFk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/gfs2/glock.c:1213: warning: Function parameter or struct member 'ip' not described in '__gfs2_holder_init'
   fs/gfs2/glock.c:1213: warning: expecting prototype for gfs2_holder_init(). Prototype was for __gfs2_holder_init() instead


vim +1213 fs/gfs2/glock.c

b3b94faa5fe596 David Teigland      2006-01-16  1201  
b3b94faa5fe596 David Teigland      2006-01-16  1202  /**
b3b94faa5fe596 David Teigland      2006-01-16  1203   * gfs2_holder_init - initialize a struct gfs2_holder in the default way
b3b94faa5fe596 David Teigland      2006-01-16  1204   * @gl: the glock
b3b94faa5fe596 David Teigland      2006-01-16  1205   * @state: the state we're requesting
b3b94faa5fe596 David Teigland      2006-01-16  1206   * @flags: the modifier flags
b3b94faa5fe596 David Teigland      2006-01-16  1207   * @gh: the holder structure
b3b94faa5fe596 David Teigland      2006-01-16  1208   *
b3b94faa5fe596 David Teigland      2006-01-16  1209   */
b3b94faa5fe596 David Teigland      2006-01-16  1210  
b016d9a84abdd2 Andreas Gruenbacher 2021-09-30  1211  void __gfs2_holder_init(struct gfs2_glock *gl, unsigned int state, u16 flags,
b016d9a84abdd2 Andreas Gruenbacher 2021-09-30  1212  			struct gfs2_holder *gh, unsigned long ip)
b3b94faa5fe596 David Teigland      2006-01-16 @1213  {
b3b94faa5fe596 David Teigland      2006-01-16  1214  	INIT_LIST_HEAD(&gh->gh_list);
b3b94faa5fe596 David Teigland      2006-01-16  1215  	gh->gh_gl = gl;
b016d9a84abdd2 Andreas Gruenbacher 2021-09-30  1216  	gh->gh_ip = ip;
b1e058da50f793 Pavel Emelyanov     2008-02-07  1217  	gh->gh_owner_pid = get_pid(task_pid(current));
b3b94faa5fe596 David Teigland      2006-01-16  1218  	gh->gh_state = state;
b3b94faa5fe596 David Teigland      2006-01-16  1219  	gh->gh_flags = flags;
b3b94faa5fe596 David Teigland      2006-01-16  1220  	gh->gh_error = 0;
b3b94faa5fe596 David Teigland      2006-01-16  1221  	gh->gh_iflags = 0;
b3b94faa5fe596 David Teigland      2006-01-16  1222  	gfs2_glock_hold(gl);
b3b94faa5fe596 David Teigland      2006-01-16  1223  }
b3b94faa5fe596 David Teigland      2006-01-16  1224  

:::::: The code at line 1213 was first introduced by commit
:::::: b3b94faa5fe5968827ba0640ee9fba4b3e7f736e [GFS2] The core of GFS2

:::::: TO: David Teigland <teigland@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
