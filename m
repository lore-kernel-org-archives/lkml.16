Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970C61E7C25
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247028; cv=none; b=VJR6Uh401B5mfUH2vyCEg6iumUu+K6tyzL2GiIzQxWGEym8kKX+8Gc1hehtGJ433pXAbJtYVRx0gDQ2jmHy+X+EBDC2ubKF5BO4t92+HJfUkJkTdJb8pQKoR/SMmAoE5CA+07dwUufmxBDU4XDF3f9kdqjxDeL/dBsp7WWmgLIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247028; c=relaxed/simple;
	bh=5K+pg8TTMFnjVWGrRD6NisXu+17jcfQKKzI4XAsF8h4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hM02VMdrZkGtdIrJM/70QopbSQtx0DXnH+NsfkF/2e+H40El/iszMrZqBbXyONaB7TGP7OtD72HhSVvW0XYctdH4BVsNNDiYl9E9Y1488mnwpGto6b1QqsBqCs/EXnGcnoqvZfpSh7XLdrOtsZqdWk6KvdXcVug6ZlyUnMd6LD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kR77OTix; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kR77OTix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738247027; x=1769783027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5K+pg8TTMFnjVWGrRD6NisXu+17jcfQKKzI4XAsF8h4=;
  b=kR77OTixDBoc5x2halqoF2UaDOc89mHaYhFinysgfzZ0N8J8pfLidQpK
   7fZ1mLMXo3E1n1lLlSNREW6hI6D3J6icOBffT8qbzfiDHvzwuxHHWbWnH
   3IKsrEojLtkZJ8GGFQ+BUZUqlqLqlrPCaBbKitb5yCHXQTdPfiDVXMPJ8
   xh5r6L1rDgRD+GNGUkl0n61b8aKlTv1vlZHS1uqzaItKmHI+tWigUHBSg
   gA3FhwQzk8WlotiNo1xL7zKb9DsioAfpN77QvIa3e7LEpZXCDmpk3iW2Z
   yEXubOFVh8QqRUoIN/iGdvEP+M/ANzpHBATg+8acwO/PdXUeXYRt5g/JI
   A==;
X-CSE-ConnectionGUID: pGMxKs5TQ2iGUIjrxLDSmQ==
X-CSE-MsgGUID: Oum0L/mbTfytD8zbihS1vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="64154959"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="64154959"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 06:23:46 -0800
X-CSE-ConnectionGUID: dDvItgeSSbmxwmUmFjFN7Q==
X-CSE-MsgGUID: 9XR6dBqFQvOYkkxBcgQ53g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; 
   d="scan'208";a="109900423"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jan 2025 06:23:44 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdVSI-000kDj-1O;
	Thu, 30 Jan 2025 14:23:42 +0000
Date: Thu, 30 Jan 2025 22:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250124 14/15]
 fs/hpfs/anode.c:103:25: error: 'anode_btree' undeclared
Message-ID: <202501302224.mRgkKFRI-lkp@intel.com>
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
config: csky-randconfig-001-20250130 (https://download.01.org/0day-ci/archive/20250130/202501302224.mRgkKFRI-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501302224.mRgkKFRI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501302224.mRgkKFRI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/hpfs/anode.c: In function 'hpfs_add_sector_to_btree':
>> fs/hpfs/anode.c:103:25: error: 'anode_btree' undeclared (first use in this function)
     103 |                 btree = anode_btree;
         |                         ^~~~~~~~~~~
   fs/hpfs/anode.c:103:25: note: each undeclared identifier is reported only once for each function it appears in
>> fs/hpfs/anode.c:161:38: warning: unused variable 'ranode_btree' [-Wunused-variable]
     161 |                 struct bplus_header *ranode_btree =
         |                                      ^~~~~~~~~~~~
>> fs/hpfs/anode.c:185:33: error: 'fnode_btree' undeclared (first use in this function); did you mean 'fnode_ea'?
     185 |                         btree = fnode_btree;
         |                                 ^~~~~~~~~~~
         |                                 fnode_ea
   fs/hpfs/anode.c:255:9: error: 'ranode_btree' undeclared (first use in this function)
     255 |         ranode_btree->n_free_nodes = (bp_internal(ranode_btree) ? 60 : 40) - ranode_btree->n_used_nodes;
         |         ^~~~~~~~~~~~


vim +/anode_btree +103 fs/hpfs/anode.c

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
 > 161			struct bplus_header *ranode_btree =
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
