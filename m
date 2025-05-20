Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBCC4B1E7B
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775963; cv=none; b=hkWsaOBkA1Zqk816tR94ahlNqfeHWcWm9zWwtUKfdC+CisQAzhmcSYvNpS9Zf1mbohW/iK0hxzYIsIB1iUzU6Xmu5jtfWKRKCyDXd47oqGF7jr5pBzU38fhNBTcvW8qObAg978xdVTXkkjllAbppTp3s19zvWFLp6i7RenmCBKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775963; c=relaxed/simple;
	bh=4eRBBiEiyAVyCDfqjmWq5yf+lJ0Ll06sdRdnyQ0P4aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j8rhkO9IJtoQHU9kmANFE5MXLXP+DecAZ2vbx9HXwOlRnOpMD5p6uTMKJuRhLhG0aOUHqwuEZrGVCiOMvUe8jsEKAxdEmmfP0NWwTsrAia0lKHefZbNoW6CB/HMSh6XTLc5gSKPvPlIEN6/LsJE6KRVbv3k6j1NkGPVQOmU0YrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlRRrvpp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlRRrvpp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747775962; x=1779311962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4eRBBiEiyAVyCDfqjmWq5yf+lJ0Ll06sdRdnyQ0P4aw=;
  b=dlRRrvppd3DXD1lfgrVjk6ErdzBlOu3bhipI/CjRtJAotgBZ34/PaK9e
   q7D+rrzJYCgFk0BQwCCvVS8qtfzAJhDSXMvE5OzkHDUFVCJvbc+zJTE15
   MnCcWCvtAIyxBqBpcXBPXiPGwO5OAgdpCiDRDD+B3HXjavHxFjo1F7DM6
   +YXBexNvbxMmfKyneaLz/8gjOnMctjKpyDUVeqF2CrKmiI4r5Kl7l4LeH
   WYv38/tdwiagEYA3kGd8vCjpcplmwgcpoRcts4EoCkxTev1whHeiig2P3
   EjOeYZY52AId2nUe0hKCiraeIsVhUj9lmcKEWhTdOhmGNbyNGERx25vep
   g==;
X-CSE-ConnectionGUID: MinmJGSKQ/GdsamwIwV0rQ==
X-CSE-MsgGUID: gwdr0kofRhKZ90EBsI3uxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49432867"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49432867"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 14:19:22 -0700
X-CSE-ConnectionGUID: 2C0io8WJT9irfPDLFYn0iw==
X-CSE-MsgGUID: XD97Ua/+QMmO64Uxfaa6pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144553456"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa003.jf.intel.com with ESMTP; 20 May 2025 14:19:20 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHUMn-00011r-33;
	Tue, 20 May 2025 21:19:17 +0000
Date: Wed, 21 May 2025 05:18:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@oracle.com>,
	Jeff Layton <jlayton@kernel.org>
Subject: include/linux/rcupdate.h:538:9: error: dereferencing pointer to
 incomplete type 'struct nfsd_file'
Message-ID: <202505210501.UEXVUlZf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b36ddb9210e6812eb1c86ad46b66cc46aa193487
commit: 86e00412254a717ffd5d38dc5ec0ee1cce6281b3 nfs: cache all open LOCALIO nfsd_file(s) in client
date:   4 months ago
config: riscv-randconfig-2004-20250521 (https://download.01.org/0day-ci/archive/20250521/202505210501.UEXVUlZf-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210501.UEXVUlZf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210501.UEXVUlZf-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rbtree.h:24:0,
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
