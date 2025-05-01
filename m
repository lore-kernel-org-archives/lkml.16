Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7EE21D3E4
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746125964; cv=none; b=No8Va/22zKw2mLGRNzm9r7CpLEXKdAuPo/iEfg2+cenEi1nMUMX25ebYMGmb/abPp6MW7+NK/boNgxLBQCeKYCS088pb35FsA7HZoDMEqZC1/HuMkygMZaRvGViUQ4OZYgj2v2F0NJpG4y/oLBO1B0bF66RBNGShC5nr0y4K+Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746125964; c=relaxed/simple;
	bh=A03kUDEVQQnK4RyDZNecayUjK2SCxNK77jUM9829Xa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e1Qrz8vSWeUx8756DjXBrojspfo0+X3CIDwXWKbmWvuc/THA++ROVFFCSl3h97uXka91DOmtpLFJEl+k43Kvf2Sbd5tT4PongbcGd64E+pdlVlnBeEUHM5+FvQFLL8cmKFmD57mJXfDZP61t2riOktQkunWYOFmk2k3Z/Wl4/xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8rNCCpZ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8rNCCpZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746125962; x=1777661962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A03kUDEVQQnK4RyDZNecayUjK2SCxNK77jUM9829Xa8=;
  b=a8rNCCpZXQvdfoenowBs7T5aXw+9CkhDXlNqZB9DYLC8bPRrEvVjXG4j
   YT038um5FeazAWcPKDsHwDfmK6jgtFK5TtIJCKqU+11cNRaFgmekm6+Mn
   ASrIejDPNr2+O2tf2vWrJWCqeGNzEl8WmnHNPhiCaF2Nrzjf5Xq1PMJ9Y
   HhmtuzvG5fPWtbstQjcpJN6Fi1cTg9x1iUIbJaiaj30FfWfRgjhkKn7TA
   NmEQ5mywZpQjF7be1WJ1iiupaWLrG2Trr5HRiDu6GiS+SyK8pt+++BIvB
   aE3hpClqhP1QVheqRyJCaR6PyKjTD3yEfIO/EgW+ZDYLR9+FUjcK9ojP0
   g==;
X-CSE-ConnectionGUID: PkihQYmKT5yDitghYkFaFQ==
X-CSE-MsgGUID: MCpZ7K5oTs2+5jNlkSoeFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47058665"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47058665"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 11:59:22 -0700
X-CSE-ConnectionGUID: 7p3YdJRQQom/HzkgMI+l2A==
X-CSE-MsgGUID: qJ4SRmEhROapBSqP/cLV9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="139590501"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 May 2025 11:59:20 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAZ7u-0004KT-0o;
	Thu, 01 May 2025 18:59:18 +0000
Date: Fri, 2 May 2025 02:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Subject: include/linux/rcupdate.h:538:9: error: dereferencing pointer to
 incomplete type 'struct nfsd_file'
Message-ID: <202505020234.i4y4JBan-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4f79eaa2ceac86a0e0f304b0bab556cca5bf4f30
commit: 86e00412254a717ffd5d38dc5ec0ee1cce6281b3 nfs: cache all open LOCALIO nfsd_file(s) in client
date:   4 months ago
config: arm64-randconfig-002-20250502 (https://download.01.org/0day-ci/archive/20250502/202505020234.i4y4JBan-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020234.i4y4JBan-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020234.i4y4JBan-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rbtree.h:24,
                    from include/linux/mm_types.h:11,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from fs/nfs/localio.c:11:
   fs/nfs/localio.c: In function 'nfs_local_open_fh':
>> include/linux/rcupdate.h:538:9: error: dereferencing pointer to incomplete type 'struct nfsd_file'
     typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
            ^
   include/linux/rcupdate.h:686:2: note: in expansion of macro '__rcu_dereference_check'
     __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
     ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:758:28: note: in expansion of macro 'rcu_dereference_check'
    #define rcu_dereference(p) rcu_dereference_check(p, 0)
                               ^~~~~~~~~~~~~~~~~~~~~
   fs/nfs/localio.c:279:7: note: in expansion of macro 'rcu_dereference'
     nf = rcu_dereference(*pnf);
          ^~~~~~~~~~~~~~~


vim +538 include/linux/rcupdate.h

76c8eaafe4f061 Paul E. McKenney        2021-04-21  528  
24ba53017e188e Chun-Hung Tseng         2021-09-15  529  #define __rcu_access_pointer(p, local, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  530  ({ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  531  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  532) 	rcu_check_sparse(p, space); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  533  	((typeof(*p) __force __kernel *)(local)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  534  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  535  #define __rcu_dereference_check(p, local, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  536  ({ \
ac59853c06993a Pranith Kumar           2014-11-13  537  	/* Dependency order vs. p above. */ \
24ba53017e188e Chun-Hung Tseng         2021-09-15 @538  	typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  539  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_check() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  540) 	rcu_check_sparse(p, space); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  541  	((typeof(*p) __force __kernel *)(local)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  542  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  543  #define __rcu_dereference_protected(p, local, c, space) \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  544  ({ \
f78f5b90c4ffa5 Paul E. McKenney        2015-06-18  545  	RCU_LOCKDEP_WARN(!(c), "suspicious rcu_dereference_protected() usage"); \
423a86a610cad1 Joel Fernandes (Google  2018-12-12  546) 	rcu_check_sparse(p, space); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  547  	((typeof(*p) __force __kernel *)(p)); \
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  548  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  549  #define __rcu_dereference_raw(p, local) \
995f1405610bd8 Paul E. McKenney        2016-07-01  550  ({ \
995f1405610bd8 Paul E. McKenney        2016-07-01  551  	/* Dependency order vs. p above. */ \
24ba53017e188e Chun-Hung Tseng         2021-09-15  552  	typeof(p) local = READ_ONCE(p); \
24ba53017e188e Chun-Hung Tseng         2021-09-15  553  	((typeof(*p) __force __kernel *)(local)); \
995f1405610bd8 Paul E. McKenney        2016-07-01  554  })
24ba53017e188e Chun-Hung Tseng         2021-09-15  555  #define rcu_dereference_raw(p) __rcu_dereference_raw(p, __UNIQUE_ID(rcu))
ca5ecddfa8fcbd Paul E. McKenney        2010-04-28  556  

:::::: The code at line 538 was first introduced by commit
:::::: 24ba53017e188e031f9cb8b290286fad52d2af00 rcu: Replace ________p1 and _________p1 with __UNIQUE_ID(rcu)

:::::: TO: Chun-Hung Tseng <henrybear327@gmail.com>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
