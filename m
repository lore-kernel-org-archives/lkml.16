Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BF31EBA1C
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254686; cv=none; b=DRmufE3qksD8LfmOYJc2NMJhXkNcwGLTduNpGhfpaMegO7R5m0Qo19Bn+iWZue8azwNjiQP5HAgU2LxUEbrPtPiqV8veMek1xe/Ts2Ir4R2eSR2/xGrVl1xli9zGfKfCJGe6FxsKIKWxACBaTESdmhhbzcpX7ASku63zDEVFY4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254686; c=relaxed/simple;
	bh=VWSoO1/bo1WdOcFbjx7VPWk3Nu9O5LGhJQspvZ+ivu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NlAn1/aIdN7ruoKOjUCh/R//u6S8hcydPt+L+jh9csQXykDrVb0fe+OqPFrcIbr/Thoh3JDE/s3nH75DnzXlUZ8k/gCpr3Et2nYgi3HBrN+o/tLTTtwAOHiS3/6BOirE9cRSxwDwAcuohuyXDru65YT7e4+0ZcqDLhWyrppVlR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pk/Um/FR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pk/Um/FR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738254685; x=1769790685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VWSoO1/bo1WdOcFbjx7VPWk3Nu9O5LGhJQspvZ+ivu0=;
  b=Pk/Um/FR4rvTphqGUjFTH87sI42Yv7O1tiDjeVUgWxCHcApjM+Jb7TAJ
   xEjjSzEie7/6ZWRpakjdANQkBO65eX7qY6zI6RFkLMgy8BqaA7ZQTGF8X
   7xihidXnzxg0RvianwQVWUqx8Rolb8l5ZHvwD4khdw/StD1d1lyLi7iX0
   MT2As8SKrL/ewcudVlmx2N6alUqYD8wc3dSXGUdxZ6Zyv3M7kecLvbisl
   d7QuXETRlXG6NmG2MeOEltvPW3DWonfeCSCFCzE8Xr3wS17YzI6Og1CxG
   M48S3vCZ3E6cnNz5CiCKGRFJ+VXAGZVT+PuNbxT8gH9g5j6SjO0A3o9Mf
   w==;
X-CSE-ConnectionGUID: UOXIoER9SUm7Oy2us47ZqA==
X-CSE-MsgGUID: 2Gz86Te3TsK2l7wgo/dIUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="56237102"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="56237102"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 08:31:25 -0800
X-CSE-ConnectionGUID: CwGSPk3KTXaSNbgp/C+0hg==
X-CSE-MsgGUID: HmhFl2v/Rz2zGkzMmheNUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="109977891"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jan 2025 08:31:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdXRo-000kgJ-0c;
	Thu, 30 Jan 2025 16:31:20 +0000
Date: Fri, 31 Jan 2025 00:30:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250124 14/15]
 fs/hpfs/anode.c:103:11: error: use of undeclared identifier 'anode_btree';
 did you mean 'node_state'?
Message-ID: <202501310035.jc65cSS0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250124
head:   63f1602f557a3ea1a3396e876b6648cf6c3635c4
commit: 140def2fc1dc741f3f85d6d90e65ac79b8d8fc06 [14/15] fs: hpfs: Avoid multiple -Wflex-array-member-not-at-end warnings
config: powerpc64-randconfig-003-20250130 (https://download.01.org/0day-ci/archive/20250131/202501310035.jc65cSS0-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501310035.jc65cSS0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501310035.jc65cSS0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/hpfs/anode.c:103:11: error: use of undeclared identifier 'anode_btree'; did you mean 'node_state'?
     103 |                 btree = anode_btree;
         |                         ^~~~~~~~~~~
         |                         node_state
   include/linux/nodemask.h:472:28: note: 'node_state' declared here
     472 | static __always_inline int node_state(int node, enum node_states state)
         |                            ^
   fs/hpfs/anode.c:165:11: error: use of undeclared identifier 'anode_btree'; did you mean 'ranode_btree'?
     165 |                 btree = anode_btree;
         |                         ^~~~~~~~~~~
         |                         ranode_btree
   fs/hpfs/anode.c:161:24: note: 'ranode_btree' declared here
     161 |                 struct bplus_header *ranode_btree =
         |                                      ^
   fs/hpfs/anode.c:182:12: error: use of undeclared identifier 'anode_btree'; did you mean 'node_state'?
     182 |                         btree = anode_btree;
         |                                 ^~~~~~~~~~~
         |                                 node_state
   include/linux/nodemask.h:472:28: note: 'node_state' declared here
     472 | static __always_inline int node_state(int node, enum node_states state)
         |                            ^
>> fs/hpfs/anode.c:185:12: error: use of undeclared identifier 'fnode_btree'
     185 |                         btree = fnode_btree;
         |                                 ^
   fs/hpfs/anode.c:220:4: error: use of undeclared identifier 'anode_btree'
     220 |                         anode_btree->u.internal[0].down = cpu_to_le32(a);
         |                         ^
   fs/hpfs/anode.c:221:4: error: use of undeclared identifier 'anode_btree'
     221 |                         anode_btree->u.internal[0].file_secno = cpu_to_le32(-1);
         |                         ^
   fs/hpfs/anode.c:243:11: error: use of undeclared identifier 'anode_btree'; did you mean 'node_state'?
     243 |                 btree = anode_btree;
         |                         ^~~~~~~~~~~
         |                         node_state
   include/linux/nodemask.h:472:28: note: 'node_state' declared here
     472 | static __always_inline int node_state(int node, enum node_states state)
         |                            ^
   fs/hpfs/anode.c:249:11: error: use of undeclared identifier 'fnode_btree'
     249 |                 btree = fnode_btree;
         |                         ^
   fs/hpfs/anode.c:255:2: error: use of undeclared identifier 'ranode_btree'
     255 |         ranode_btree->n_free_nodes = (bp_internal(ranode_btree) ? 60 : 40) - ranode_btree->n_used_nodes;
         |         ^
   fs/hpfs/anode.c:255:44: error: use of undeclared identifier 'ranode_btree'
     255 |         ranode_btree->n_free_nodes = (bp_internal(ranode_btree) ? 60 : 40) - ranode_btree->n_used_nodes;
         |                                                   ^
   fs/hpfs/anode.c:255:71: error: use of undeclared identifier 'ranode_btree'
     255 |         ranode_btree->n_free_nodes = (bp_internal(ranode_btree) ? 60 : 40) - ranode_btree->n_used_nodes;
         |                                                                              ^
   fs/hpfs/anode.c:256:18: error: use of undeclared identifier 'ranode_btree'
     256 |         if (bp_internal(ranode_btree)) for (n = 0; n < ranode_btree->n_used_nodes; n++) {
         |                         ^
   fs/hpfs/anode.c:256:49: error: use of undeclared identifier 'ranode_btree'
     256 |         if (bp_internal(ranode_btree)) for (n = 0; n < ranode_btree->n_used_nodes; n++) {
         |                                                        ^
   13 errors generated.


vim +103 fs/hpfs/anode.c

    60	
    61	secno hpfs_add_sector_to_btree(struct super_block *s, secno node, int fnod, unsigned fsecno)
    62	{
    63		struct bplus_header *btree;
    64		struct anode *anode = NULL, *ranode = NULL;
    65		struct fnode *fnode;
    66		anode_secno a, na = -1, ra, up = -1;
    67		secno se;
    68		struct buffer_head *bh, *bh1, *bh2;
    69		int n;
    70		unsigned fs;
    71		int c1, c2 = 0;
    72	
    73		if (fnod) {
    74			if (!(fnode = hpfs_map_fnode(s, node, &bh))) return -1;
    75			struct bplus_header *fnode_btree =
    76						container_of(&fnode->btree,
    77							     struct bplus_header,
    78							     __hdr);
    79			btree = fnode_btree;
    80		} else {
    81			if (!(anode = hpfs_map_anode(s, node, &bh))) return -1;
    82			struct bplus_header *anode_btree =
    83						container_of(&anode->btree,
    84							     struct bplus_header,
    85							     __hdr);
    86			btree = anode_btree;
    87		}
    88		a = node;
    89		go_down:
    90		if ((n = btree->n_used_nodes - 1) < -!!fnod) {
    91			hpfs_error(s, "anode %08x has no entries", a);
    92			brelse(bh);
    93			return -1;
    94		}
    95		if (bp_internal(btree)) {
    96			a = le32_to_cpu(btree->u.internal[n].down);
    97			btree->u.internal[n].file_secno = cpu_to_le32(-1);
    98			mark_buffer_dirty(bh);
    99			brelse(bh);
   100			if (hpfs_sb(s)->sb_chk)
   101				if (hpfs_stop_cycles(s, a, &c1, &c2, "hpfs_add_sector_to_btree #1")) return -1;
   102			if (!(anode = hpfs_map_anode(s, a, &bh))) return -1;
 > 103			btree = anode_btree;
   104			goto go_down;
   105		}
   106		if (n >= 0) {
   107			if (le32_to_cpu(btree->u.external[n].file_secno) + le32_to_cpu(btree->u.external[n].length) != fsecno) {
   108				hpfs_error(s, "allocated size %08x, trying to add sector %08x, %cnode %08x",
   109					le32_to_cpu(btree->u.external[n].file_secno) + le32_to_cpu(btree->u.external[n].length), fsecno,
   110					fnod?'f':'a', node);
   111				brelse(bh);
   112				return -1;
   113			}
   114			if (hpfs_alloc_if_possible(s, se = le32_to_cpu(btree->u.external[n].disk_secno) + le32_to_cpu(btree->u.external[n].length))) {
   115				le32_add_cpu(&btree->u.external[n].length, 1);
   116				mark_buffer_dirty(bh);
   117				brelse(bh);
   118				return se;
   119			}
   120		} else {
   121			if (fsecno) {
   122				hpfs_error(s, "empty file %08x, trying to add sector %08x", node, fsecno);
   123				brelse(bh);
   124				return -1;
   125			}
   126			se = !fnod ? node : (node + 16384) & ~16383;
   127		}	
   128		if (!(se = hpfs_alloc_sector(s, se, 1, fsecno*ALLOC_M>ALLOC_FWD_MAX ? ALLOC_FWD_MAX : fsecno*ALLOC_M<ALLOC_FWD_MIN ? ALLOC_FWD_MIN : fsecno*ALLOC_M))) {
   129			brelse(bh);
   130			return -1;
   131		}
   132		fs = n < 0 ? 0 : le32_to_cpu(btree->u.external[n].file_secno) + le32_to_cpu(btree->u.external[n].length);
   133		if (!btree->n_free_nodes) {
   134			up = a != node ? le32_to_cpu(anode->up) : -1;
   135			if (!(anode = hpfs_alloc_anode(s, a, &na, &bh1))) {
   136				brelse(bh);
   137				hpfs_free_sectors(s, se, 1);
   138				return -1;
   139			}
   140			if (a == node && fnod) {
   141				anode->up = cpu_to_le32(node);
   142				anode->btree.flags |= BP_fnode_parent;
   143				anode->btree.n_used_nodes = btree->n_used_nodes;
   144				anode->btree.first_free = btree->first_free;
   145				anode->btree.n_free_nodes = 40 - anode->btree.n_used_nodes;
   146				memcpy(&anode->u, &btree->u, btree->n_used_nodes * 12);
   147				btree->flags |= BP_internal;
   148				btree->n_free_nodes = 11;
   149				btree->n_used_nodes = 1;
   150				btree->first_free = cpu_to_le16((char *)&(btree->u.internal[1]) - (char *)btree);
   151				btree->u.internal[0].file_secno = cpu_to_le32(-1);
   152				btree->u.internal[0].down = cpu_to_le32(na);
   153				mark_buffer_dirty(bh);
   154			} else if (!(ranode = hpfs_alloc_anode(s, /*a*/0, &ra, &bh2))) {
   155				brelse(bh);
   156				brelse(bh1);
   157				hpfs_free_sectors(s, se, 1);
   158				hpfs_free_sectors(s, na, 1);
   159				return -1;
   160			}
   161			struct bplus_header *ranode_btree =
   162						container_of(&ranode->btree, struct bplus_header, __hdr);
   163			brelse(bh);
   164			bh = bh1;
   165			btree = anode_btree;
   166		}
   167		btree->n_free_nodes--; n = btree->n_used_nodes++;
   168		le16_add_cpu(&btree->first_free, 12);
   169		btree->u.external[n].disk_secno = cpu_to_le32(se);
   170		btree->u.external[n].file_secno = cpu_to_le32(fs);
   171		btree->u.external[n].length = cpu_to_le32(1);
   172		mark_buffer_dirty(bh);
   173		brelse(bh);
   174		if ((a == node && fnod) || na == -1) return se;
   175		c2 = 0;
   176		while (up != (anode_secno)-1) {
   177			struct anode *new_anode;
   178			if (hpfs_sb(s)->sb_chk)
   179				if (hpfs_stop_cycles(s, up, &c1, &c2, "hpfs_add_sector_to_btree #2")) return -1;
   180			if (up != node || !fnod) {
   181				if (!(anode = hpfs_map_anode(s, up, &bh))) return -1;
   182				btree = anode_btree;
   183			} else {
   184				if (!(fnode = hpfs_map_fnode(s, up, &bh))) return -1;
 > 185				btree = fnode_btree;
   186			}
   187			if (btree->n_free_nodes) {
   188				btree->n_free_nodes--; n = btree->n_used_nodes++;
   189				le16_add_cpu(&btree->first_free, 8);
   190				btree->u.internal[n].file_secno = cpu_to_le32(-1);
   191				btree->u.internal[n].down = cpu_to_le32(na);
   192				btree->u.internal[n-1].file_secno = cpu_to_le32(fs);
   193				mark_buffer_dirty(bh);
   194				brelse(bh);
   195				brelse(bh2);
   196				hpfs_free_sectors(s, ra, 1);
   197				if ((anode = hpfs_map_anode(s, na, &bh))) {
   198					anode->up = cpu_to_le32(up);
   199					if (up == node && fnod)
   200						anode->btree.flags |= BP_fnode_parent;
   201					else
   202						anode->btree.flags &= ~BP_fnode_parent;
   203					mark_buffer_dirty(bh);
   204					brelse(bh);
   205				}
   206				return se;
   207			}
   208			up = up != node ? le32_to_cpu(anode->up) : -1;
   209			btree->u.internal[btree->n_used_nodes - 1].file_secno = cpu_to_le32(/*fs*/-1);
   210			mark_buffer_dirty(bh);
   211			brelse(bh);
   212			a = na;
   213			if ((new_anode = hpfs_alloc_anode(s, a, &na, &bh))) {
   214				anode = new_anode;
   215				/*anode->up = cpu_to_le32(up != -1 ? up : ra);*/
   216				anode->btree.flags |= BP_internal;
   217				anode->btree.n_used_nodes = 1;
   218				anode->btree.n_free_nodes = 59;
   219				anode->btree.first_free = cpu_to_le16(16);
   220				anode_btree->u.internal[0].down = cpu_to_le32(a);
   221				anode_btree->u.internal[0].file_secno = cpu_to_le32(-1);
   222				mark_buffer_dirty(bh);
   223				brelse(bh);
   224				if ((anode = hpfs_map_anode(s, a, &bh))) {
   225					anode->up = cpu_to_le32(na);
   226					mark_buffer_dirty(bh);
   227					brelse(bh);
   228				}
   229			} else na = a;
   230		}
   231		if ((anode = hpfs_map_anode(s, na, &bh))) {
   232			anode->up = cpu_to_le32(node);
   233			if (fnod)
   234				anode->btree.flags |= BP_fnode_parent;
   235			mark_buffer_dirty(bh);
   236			brelse(bh);
   237		}
   238		if (!fnod) {
   239			if (!(anode = hpfs_map_anode(s, node, &bh))) {
   240				brelse(bh2);
   241				return -1;
   242			}
   243			btree = anode_btree;
   244		} else {
   245			if (!(fnode = hpfs_map_fnode(s, node, &bh))) {
   246				brelse(bh2);
   247				return -1;
   248			}
   249			btree = fnode_btree;
   250		}
   251		ranode->up = cpu_to_le32(node);
   252		memcpy(&ranode->btree, btree, le16_to_cpu(btree->first_free));
   253		if (fnod)
   254			ranode->btree.flags |= BP_fnode_parent;
   255		ranode_btree->n_free_nodes = (bp_internal(ranode_btree) ? 60 : 40) - ranode_btree->n_used_nodes;
   256		if (bp_internal(ranode_btree)) for (n = 0; n < ranode_btree->n_used_nodes; n++) {
   257			struct anode *unode;
   258			if ((unode = hpfs_map_anode(s, le32_to_cpu(ranode->u.internal[n].down), &bh1))) {
   259				unode->up = cpu_to_le32(ra);
   260				unode->btree.flags &= ~BP_fnode_parent;
   261				mark_buffer_dirty(bh1);
   262				brelse(bh1);
   263			}
   264		}
   265		btree->flags |= BP_internal;
   266		btree->n_free_nodes = fnod ? 10 : 58;
   267		btree->n_used_nodes = 2;
   268		btree->first_free = cpu_to_le16((char *)&btree->u.internal[2] - (char *)btree);
   269		btree->u.internal[0].file_secno = cpu_to_le32(fs);
   270		btree->u.internal[0].down = cpu_to_le32(ra);
   271		btree->u.internal[1].file_secno = cpu_to_le32(-1);
   272		btree->u.internal[1].down = cpu_to_le32(na);
   273		mark_buffer_dirty(bh);
   274		brelse(bh);
   275		mark_buffer_dirty(bh2);
   276		brelse(bh2);
   277		return se;
   278	}
   279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
