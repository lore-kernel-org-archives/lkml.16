Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C3217A306
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 17:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751043681; cv=none; b=gLEPiQ2Mj+w2J9Q1ehuW2X/IBW1wkRScYh1dqegeoyrfFXDEjwP1PCMV2GX7Xe6SmABMdQUt017LK9CcO37/aLhBPzGc53GQIgRfH6VxSRs1xCZwNzhNYR/CNoTmQWqpnk1KyWC9cmgA86YtRe50uSh5bBxQyXAfVjwICOf5TwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751043681; c=relaxed/simple;
	bh=6Po6Tys/cawtmKgVnCBdOs2Jv9ue2yUoscY2Y82XtxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=foakT+Edz+YDvfWRmMmr6iTY+xXuCZT7jVVcz9Te2QVrXNirs25Nma3DBuXNDJjURLLHCG9XsNz3LebYRQFS54kckOObytWR3sOX0eWzXo6fOWn8xTfYUmAc83t4agGbDh8keNcMMrZgWpgLuwBN1gMvihpSZVPnrZUXqTu1IYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCm1xx2h; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCm1xx2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751043679; x=1782579679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6Po6Tys/cawtmKgVnCBdOs2Jv9ue2yUoscY2Y82XtxE=;
  b=NCm1xx2hhPIjq3eXPWpA5IfsKHOX5W99FQsj+oTx5GAMi9/qFxFUUSkh
   QlokDsyUTCEx0KpLw/mh8977setrC+YV9GdFquQxTqHvELgVFZ9guNd9x
   ImxXCr8ko8OEqTHHLmGtqNYgpES36WSGy8zxLN6kTSw7CQHQY0AyRpz7F
   T6aOhk8ZJ8/ZNJFTbshYi+aFmNNXgOdcOELv7gmUvGgxY66TkKcnJgGRN
   sSIK5Vk7cu++K5kr0sjgdZkIxa6FHna4xw677QlI/stzWVzQHCQQx2cYh
   ePfmJM//kyKSuIdwi+HbZo/ufJhZbabewivLcHbQ0vu5TVeZrFhDDSv41
   w==;
X-CSE-ConnectionGUID: o8YkIexKS/2b+zsDqJLn9g==
X-CSE-MsgGUID: GbyRg3B1TWeY2XAgQ9cCLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53224163"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53224163"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 10:01:19 -0700
X-CSE-ConnectionGUID: MSgg9RLpTeifEd1dm4llrw==
X-CSE-MsgGUID: VEGh0DTfSMyyvNK3bicy1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153566144"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jun 2025 10:01:17 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVCRv-0000h9-0E;
	Fri, 27 Jun 2025 17:01:15 +0000
Date: Fri, 27 Jun 2025 19:00:41 +0200
From: kernel test robot <lkp@intel.com>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: security/keys/proc.c:211:19: warning: '%llu' directive writing
 between 1 and 18 bytes into a region of size 16
Message-ID: <202506271922.h8h9N24f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e540341508ce2f6e27810106253d5de194b66750
commit: 00a31dd3acea0f88f947fc71e268ebb34b59f218 asm-generic/div64: optimize/simplify __div64_const32()
date:   8 months ago
config: powerpc-randconfig-2006-20250626 (https://download.01.org/0day-ci/archive/20250627/202506271922.h8h9N24f-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271922.h8h9N24f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271922.h8h9N24f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/keys/proc.c: In function 'proc_keys_show':
   security/keys/proc.c:217:24: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
       sprintf(xbuf, "%lluw", div_u64(timo, 60 * 60 * 24 * 7));
                           ^
   security/keys/proc.c:217:4: note: 'sprintf' output between 3 and 17 bytes into a destination of size 16
       sprintf(xbuf, "%lluw", div_u64(timo, 60 * 60 * 24 * 7));
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/proc.c:215:24: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
       sprintf(xbuf, "%llud", div_u64(timo, 60 * 60 * 24));
                           ^
   security/keys/proc.c:215:4: note: 'sprintf' output between 3 and 17 bytes into a destination of size 16
       sprintf(xbuf, "%llud", div_u64(timo, 60 * 60 * 24));
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/proc.c:213:23: warning: 'h' directive writing 1 byte into a region of size between 0 and 15 [-Wformat-overflow=]
       sprintf(xbuf, "%lluh", div_u64(timo, 60 * 60));
                          ^
   security/keys/proc.c:213:4: note: 'sprintf' output between 3 and 18 bytes into a destination of size 16
       sprintf(xbuf, "%lluh", div_u64(timo, 60 * 60));
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> security/keys/proc.c:211:19: warning: '%llu' directive writing between 1 and 18 bytes into a region of size 16 [-Wformat-overflow=]
       sprintf(xbuf, "%llum", div_u64(timo, 60));
                      ^~~~
   security/keys/proc.c:211:18: note: directive argument in the range [0, 576460752303423487]
       sprintf(xbuf, "%llum", div_u64(timo, 60));
                     ^~~~~~~
   security/keys/proc.c:211:4: note: 'sprintf' output between 3 and 20 bytes into a destination of size 16
       sprintf(xbuf, "%llum", div_u64(timo, 60));
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +211 security/keys/proc.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  152  
^1da177e4c3f41 Linus Torvalds 2005-04-16  153  static int proc_keys_show(struct seq_file *m, void *v)
^1da177e4c3f41 Linus Torvalds 2005-04-16  154  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  155  	struct rb_node *_p = v;
^1da177e4c3f41 Linus Torvalds 2005-04-16  156  	struct key *key = rb_entry(_p, struct key, serial_node);
ab5c69f01313c8 Eric Biggers   2017-09-27  157  	unsigned long flags;
927942aabbbe50 David Howells  2010-06-11  158  	key_ref_t key_ref, skey_ref;
074d58989569b3 Baolin Wang    2017-11-15  159  	time64_t now, expiry;
03dab869b7b239 David Howells  2016-10-26  160  	char xbuf[16];
363b02dab09b32 David Howells  2017-10-04  161  	short state;
074d58989569b3 Baolin Wang    2017-11-15  162  	u64 timo;
06ec7be557a125 Michael LeMay  2006-06-26  163  	int rc;
06ec7be557a125 Michael LeMay  2006-06-26  164  
4bdf0bc3003141 David Howells  2013-09-24  165  	struct keyring_search_context ctx = {
ede0fa98a900e6 Eric Biggers   2019-02-22  166  		.index_key		= key->index_key,
4aa68e07d84556 Eric Biggers   2017-09-18  167  		.cred			= m->file->f_cred,
462919591a1791 David Howells  2014-09-16  168  		.match_data.cmp		= lookup_user_key_possessed,
462919591a1791 David Howells  2014-09-16  169  		.match_data.raw_data	= key,
462919591a1791 David Howells  2014-09-16  170  		.match_data.lookup_type	= KEYRING_SEARCH_LOOKUP_DIRECT,
dcf49dbc8077e2 David Howells  2019-06-26  171  		.flags			= (KEYRING_SEARCH_NO_STATE_CHECK |
dcf49dbc8077e2 David Howells  2019-06-26  172  					   KEYRING_SEARCH_RECURSE),
4bdf0bc3003141 David Howells  2013-09-24  173  	};
4bdf0bc3003141 David Howells  2013-09-24  174  
028db3e290f15a Linus Torvalds 2019-07-10  175  	key_ref = make_key_ref(key, 0);
927942aabbbe50 David Howells  2010-06-11  176  
927942aabbbe50 David Howells  2010-06-11  177  	/* determine if the key is possessed by this process (a test we can
927942aabbbe50 David Howells  2010-06-11  178  	 * skip if the key does not indicate the possessor can view it
927942aabbbe50 David Howells  2010-06-11  179  	 */
028db3e290f15a Linus Torvalds 2019-07-10  180  	if (key->perm & KEY_POS_VIEW) {
028db3e290f15a Linus Torvalds 2019-07-10  181  		rcu_read_lock();
e59428f721ee09 David Howells  2019-06-19  182  		skey_ref = search_cred_keyrings_rcu(&ctx);
028db3e290f15a Linus Torvalds 2019-07-10  183  		rcu_read_unlock();
927942aabbbe50 David Howells  2010-06-11  184  		if (!IS_ERR(skey_ref)) {
927942aabbbe50 David Howells  2010-06-11  185  			key_ref_put(skey_ref);
927942aabbbe50 David Howells  2010-06-11  186  			key_ref = make_key_ref(key, 1);
927942aabbbe50 David Howells  2010-06-11  187  		}
927942aabbbe50 David Howells  2010-06-11  188  	}
927942aabbbe50 David Howells  2010-06-11  189  
4aa68e07d84556 Eric Biggers   2017-09-18  190  	/* check whether the current task is allowed to view the key */
f5895943d91b41 David Howells  2014-03-14  191  	rc = key_task_permission(key_ref, ctx.cred, KEY_NEED_VIEW);
06ec7be557a125 Michael LeMay  2006-06-26  192  	if (rc < 0)
028db3e290f15a Linus Torvalds 2019-07-10  193  		return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  194  
074d58989569b3 Baolin Wang    2017-11-15  195  	now = ktime_get_real_seconds();
^1da177e4c3f41 Linus Torvalds 2005-04-16  196  
028db3e290f15a Linus Torvalds 2019-07-10  197  	rcu_read_lock();
028db3e290f15a Linus Torvalds 2019-07-10  198  
^1da177e4c3f41 Linus Torvalds 2005-04-16  199  	/* come up with a suitable timeout value */
ab5c69f01313c8 Eric Biggers   2017-09-27  200  	expiry = READ_ONCE(key->expiry);
39299bdd254668 David Howells  2023-12-09  201  	if (expiry == TIME64_MAX) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  202  		memcpy(xbuf, "perm", 5);
074d58989569b3 Baolin Wang    2017-11-15  203  	} else if (now >= expiry) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  204  		memcpy(xbuf, "expd", 5);
7b1b9164598286 David Howells  2009-09-02  205  	} else {
074d58989569b3 Baolin Wang    2017-11-15  206  		timo = expiry - now;
^1da177e4c3f41 Linus Torvalds 2005-04-16  207  
^1da177e4c3f41 Linus Torvalds 2005-04-16  208  		if (timo < 60)
074d58989569b3 Baolin Wang    2017-11-15  209  			sprintf(xbuf, "%llus", timo);
^1da177e4c3f41 Linus Torvalds 2005-04-16  210  		else if (timo < 60*60)
074d58989569b3 Baolin Wang    2017-11-15 @211  			sprintf(xbuf, "%llum", div_u64(timo, 60));
^1da177e4c3f41 Linus Torvalds 2005-04-16  212  		else if (timo < 60*60*24)
074d58989569b3 Baolin Wang    2017-11-15  213  			sprintf(xbuf, "%lluh", div_u64(timo, 60 * 60));
^1da177e4c3f41 Linus Torvalds 2005-04-16  214  		else if (timo < 60*60*24*7)
074d58989569b3 Baolin Wang    2017-11-15 @215  			sprintf(xbuf, "%llud", div_u64(timo, 60 * 60 * 24));
^1da177e4c3f41 Linus Torvalds 2005-04-16  216  		else
074d58989569b3 Baolin Wang    2017-11-15  217  			sprintf(xbuf, "%lluw", div_u64(timo, 60 * 60 * 24 * 7));
^1da177e4c3f41 Linus Torvalds 2005-04-16  218  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  219  
363b02dab09b32 David Howells  2017-10-04  220  	state = key_read_state(key);
363b02dab09b32 David Howells  2017-10-04  221  

:::::: The code at line 211 was first introduced by commit
:::::: 074d58989569b39f04294c90ef36dd82b8c2cc1a security: keys: Replace time_t/timespec with time64_t

:::::: TO: Baolin Wang <baolin.wang@linaro.org>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
