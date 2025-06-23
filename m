Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DCD2D3A77
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750702982; cv=none; b=hiQDnza1nchDcLtLYLnSre0pCHgqlNofSpykg1f+ew44cXdKkqmgpAv4Hxqva+gfYpx2HURh80E6vSv82ru5mEO84L7otzukoq145WgDDFVpvjmH8wIQ1220sGO+Vv9ldxkYgES+D653qoXY9a6hwEhSj07OlvYPEt6vdYZI6YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750702982; c=relaxed/simple;
	bh=06uLO9m3FXDtmilEMngPa29Gp666mPTIdb/WLw1ueiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Vx+ZHJZOg09lhlGQDCylDq5qI4lFPq1JS+EJly0YWUl/rUat6xCssE9zjJWKWb91pwYOPazNvz9O6riOTeh9K0gu/MuTHfjx08ejJSjRMmB696wE0rGTV3uNrixlD49Sc6Y0CrDZCS5WloXBl1JFkq6lV5hP33HPeEaF+uyP3JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f/qX5UdK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f/qX5UdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750702981; x=1782238981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=06uLO9m3FXDtmilEMngPa29Gp666mPTIdb/WLw1ueiU=;
  b=f/qX5UdKaYn7cptqctzynrfIEO6wtMueGW2eeBR/veLVUfAjxfTX1XWM
   I/1SrNsEXlI0A2OcFuUU/WkEdWZamvIfxgKkdKQfQaQALj3KqU8ZLYPqB
   xSYb+PIsaXaV+zrGLHyoN4ersMNnjesneLjnaYYNutRHzgW9ywf0dZ/Nj
   XTlWk81guDlKJKVrISf0yU2w3di0Q2kLWbogmEne9VF++B729nFrtbz6J
   nnVK+VRhh/e3KxW4NnmOkm9VAzJmyFUEqRYWePrcOzcJrO+uh8aGPsDzR
   HRxPJgqPCnb+4ZYM+6+fcObwTRd38v6MXCfXgJTJFUW8Hir8bmfzZOSjx
   Q==;
X-CSE-ConnectionGUID: LMVCyZdNTRqOPDIifFLNaA==
X-CSE-MsgGUID: CgZ62pRwQ8OXHY3eGoVeog==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52894581"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="52894581"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 11:22:59 -0700
X-CSE-ConnectionGUID: BNv50jDpTBy8uGa+EN9kMQ==
X-CSE-MsgGUID: dQGcEc3MQUiciiglCdSD/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="155687683"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jun 2025 11:22:57 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTlol-000PCY-18;
	Mon, 23 Jun 2025 18:22:55 +0000
Date: Tue, 24 Jun 2025 02:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: Hongbo Li <lihongbo22@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: fs/bcachefs/fs.c:867:12: warning: stack frame size (1056) exceeds
 limit (1024) in 'bch2_rename2'
Message-ID: <202506240200.Fsm6BEST-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   86731a2a651e58953fc949573895f2fa6d456841
commit: e614a6c52d32c9c7ff545ca842eb2de4aeb1d2d9 bcachefs: make directory i_size meaningful
date:   5 months ago
config: s390-defconfig (https://download.01.org/0day-ci/archive/20250624/202506240200.Fsm6BEST-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240200.Fsm6BEST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240200.Fsm6BEST-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/fs.c:4:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/fs.c:867:12: warning: stack frame size (1056) exceeds limit (1024) in 'bch2_rename2' [-Wframe-larger-than]
     867 | static int bch2_rename2(struct mnt_idmap *idmap,
         |            ^
   5 warnings generated.


vim +/bch2_rename2 +867 fs/bcachefs/fs.c

1c6fdbd8f2465d Kent Overstreet   2017-03-16   866  
1c6fdbd8f2465d Kent Overstreet   2017-03-16  @867  static int bch2_rename2(struct mnt_idmap *idmap,
1c6fdbd8f2465d Kent Overstreet   2017-03-16   868  			struct inode *src_vdir, struct dentry *src_dentry,
1c6fdbd8f2465d Kent Overstreet   2017-03-16   869  			struct inode *dst_vdir, struct dentry *dst_dentry,
1c6fdbd8f2465d Kent Overstreet   2017-03-16   870  			unsigned flags)
1c6fdbd8f2465d Kent Overstreet   2017-03-16   871  {
1c6fdbd8f2465d Kent Overstreet   2017-03-16   872  	struct bch_fs *c = src_vdir->i_sb->s_fs_info;
9638574229e3ae Kent Overstreet   2019-10-02   873  	struct bch_inode_info *src_dir = to_bch_ei(src_vdir);
9638574229e3ae Kent Overstreet   2019-10-02   874  	struct bch_inode_info *dst_dir = to_bch_ei(dst_vdir);
9638574229e3ae Kent Overstreet   2019-10-02   875  	struct bch_inode_info *src_inode = to_bch_ei(src_dentry->d_inode);
9638574229e3ae Kent Overstreet   2019-10-02   876  	struct bch_inode_info *dst_inode = to_bch_ei(dst_dentry->d_inode);
1c6fdbd8f2465d Kent Overstreet   2017-03-16   877  	struct bch_inode_unpacked dst_dir_u, src_dir_u;
4645855df01eda Sasha Finkelstein 2024-08-18   878  	struct bch_inode_unpacked src_inode_u, dst_inode_u, *whiteout_inode_u;
6bd68ec266ad71 Kent Overstreet   2023-09-12   879  	struct btree_trans *trans;
9638574229e3ae Kent Overstreet   2019-10-02   880  	enum bch_rename_mode mode = flags & RENAME_EXCHANGE
9638574229e3ae Kent Overstreet   2019-10-02   881  		? BCH_RENAME_EXCHANGE
9638574229e3ae Kent Overstreet   2019-10-02   882  		: dst_dentry->d_inode
9638574229e3ae Kent Overstreet   2019-10-02   883  		? BCH_RENAME_OVERWRITE : BCH_RENAME;
4645855df01eda Sasha Finkelstein 2024-08-18   884  	bool whiteout = !!(flags & RENAME_WHITEOUT);
1c6fdbd8f2465d Kent Overstreet   2017-03-16   885  	int ret;
1c6fdbd8f2465d Kent Overstreet   2017-03-16   886  
4645855df01eda Sasha Finkelstein 2024-08-18   887  	if (flags & ~(RENAME_NOREPLACE|RENAME_EXCHANGE|RENAME_WHITEOUT))
1c6fdbd8f2465d Kent Overstreet   2017-03-16   888  		return -EINVAL;
1c6fdbd8f2465d Kent Overstreet   2017-03-16   889  
9638574229e3ae Kent Overstreet   2019-10-02   890  	if (mode == BCH_RENAME_OVERWRITE) {
9638574229e3ae Kent Overstreet   2019-10-02   891  		ret = filemap_write_and_wait_range(src_inode->v.i_mapping,
1c6fdbd8f2465d Kent Overstreet   2017-03-16   892  						   0, LLONG_MAX);
1c6fdbd8f2465d Kent Overstreet   2017-03-16   893  		if (ret)
1c6fdbd8f2465d Kent Overstreet   2017-03-16   894  			return ret;
1c6fdbd8f2465d Kent Overstreet   2017-03-16   895  	}
1c6fdbd8f2465d Kent Overstreet   2017-03-16   896  
168f4c5fb37513 Kent Overstreet   2019-06-24   897  	bch2_lock_inodes(INODE_UPDATE_LOCK,
9638574229e3ae Kent Overstreet   2019-10-02   898  			 src_dir,
9638574229e3ae Kent Overstreet   2019-10-02   899  			 dst_dir,
9638574229e3ae Kent Overstreet   2019-10-02   900  			 src_inode,
9638574229e3ae Kent Overstreet   2019-10-02   901  			 dst_inode);
9638574229e3ae Kent Overstreet   2019-10-02   902  
f369de82679f4f Kent Overstreet   2024-07-04   903  	trans = bch2_trans_get(c);
f369de82679f4f Kent Overstreet   2024-07-04   904  
112d21fd1a122f Kent Overstreet   2024-06-08   905  	ret   = bch2_subvol_is_ro_trans(trans, src_dir->ei_inum.subvol) ?:
112d21fd1a122f Kent Overstreet   2024-06-08   906  		bch2_subvol_is_ro_trans(trans, dst_dir->ei_inum.subvol);
0d72ab35a925d6 Kent Overstreet   2023-12-29   907  	if (ret)
74ec2f302402c4 Kent Overstreet   2024-10-14   908  		goto err_tx_restart;
0d72ab35a925d6 Kent Overstreet   2023-12-29   909  
9638574229e3ae Kent Overstreet   2019-10-02   910  	if (inode_attr_changing(dst_dir, src_inode, Inode_opt_project)) {
9638574229e3ae Kent Overstreet   2019-10-02   911  		ret = bch2_fs_quota_transfer(c, src_inode,
9638574229e3ae Kent Overstreet   2019-10-02   912  					     dst_dir->ei_qid,
96012e143e699d Kent Overstreet   2018-12-17   913  					     1 << QTYP_PRJ,
96012e143e699d Kent Overstreet   2018-12-17   914  					     KEY_TYPE_QUOTA_PREALLOC);
96012e143e699d Kent Overstreet   2018-12-17   915  		if (ret)
96012e143e699d Kent Overstreet   2018-12-17   916  			goto err;
96012e143e699d Kent Overstreet   2018-12-17   917  	}
96012e143e699d Kent Overstreet   2018-12-17   918  
9638574229e3ae Kent Overstreet   2019-10-02   919  	if (mode == BCH_RENAME_EXCHANGE &&
9638574229e3ae Kent Overstreet   2019-10-02   920  	    inode_attr_changing(src_dir, dst_inode, Inode_opt_project)) {
9638574229e3ae Kent Overstreet   2019-10-02   921  		ret = bch2_fs_quota_transfer(c, dst_inode,
9638574229e3ae Kent Overstreet   2019-10-02   922  					     src_dir->ei_qid,
96012e143e699d Kent Overstreet   2018-12-17   923  					     1 << QTYP_PRJ,
96012e143e699d Kent Overstreet   2018-12-17   924  					     KEY_TYPE_QUOTA_PREALLOC);
96012e143e699d Kent Overstreet   2018-12-17   925  		if (ret)
96012e143e699d Kent Overstreet   2018-12-17   926  			goto err;
96012e143e699d Kent Overstreet   2018-12-17   927  	}
4645855df01eda Sasha Finkelstein 2024-08-18   928  retry:
4645855df01eda Sasha Finkelstein 2024-08-18   929  	bch2_trans_begin(trans);
96012e143e699d Kent Overstreet   2018-12-17   930  
4645855df01eda Sasha Finkelstein 2024-08-18   931  	ret = bch2_rename_trans(trans,
6fed42bb7750e2 Kent Overstreet   2021-03-16   932  				inode_inum(src_dir), &src_dir_u,
6fed42bb7750e2 Kent Overstreet   2021-03-16   933  				inode_inum(dst_dir), &dst_dir_u,
9638574229e3ae Kent Overstreet   2019-10-02   934  				&src_inode_u,
9638574229e3ae Kent Overstreet   2019-10-02   935  				&dst_inode_u,
9638574229e3ae Kent Overstreet   2019-10-02   936  				&src_dentry->d_name,
9638574229e3ae Kent Overstreet   2019-10-02   937  				&dst_dentry->d_name,
4645855df01eda Sasha Finkelstein 2024-08-18   938  				mode);
1c6fdbd8f2465d Kent Overstreet   2017-03-16   939  	if (unlikely(ret))
4645855df01eda Sasha Finkelstein 2024-08-18   940  		goto err_tx_restart;
4645855df01eda Sasha Finkelstein 2024-08-18   941  
4645855df01eda Sasha Finkelstein 2024-08-18   942  	if (whiteout) {
4645855df01eda Sasha Finkelstein 2024-08-18   943  		whiteout_inode_u = bch2_trans_kmalloc_nomemzero(trans, sizeof(*whiteout_inode_u));
4645855df01eda Sasha Finkelstein 2024-08-18   944  		ret = PTR_ERR_OR_ZERO(whiteout_inode_u);
4645855df01eda Sasha Finkelstein 2024-08-18   945  		if (unlikely(ret))
4645855df01eda Sasha Finkelstein 2024-08-18   946  			goto err_tx_restart;
4645855df01eda Sasha Finkelstein 2024-08-18   947  		bch2_inode_init_early(c, whiteout_inode_u);
4645855df01eda Sasha Finkelstein 2024-08-18   948  
4645855df01eda Sasha Finkelstein 2024-08-18   949  		ret = bch2_create_trans(trans,
4645855df01eda Sasha Finkelstein 2024-08-18   950  					inode_inum(src_dir), &src_dir_u,
4645855df01eda Sasha Finkelstein 2024-08-18   951  					whiteout_inode_u,
4645855df01eda Sasha Finkelstein 2024-08-18   952  					&src_dentry->d_name,
4645855df01eda Sasha Finkelstein 2024-08-18   953  					from_kuid(i_user_ns(&src_dir->v), current_fsuid()),
4645855df01eda Sasha Finkelstein 2024-08-18   954  					from_kgid(i_user_ns(&src_dir->v), current_fsgid()),
4645855df01eda Sasha Finkelstein 2024-08-18   955  					S_IFCHR|WHITEOUT_MODE, 0,
4645855df01eda Sasha Finkelstein 2024-08-18   956  					NULL, NULL, (subvol_inum) { 0 }, 0) ?:
4645855df01eda Sasha Finkelstein 2024-08-18   957  		      bch2_quota_acct(c, bch_qid(whiteout_inode_u), Q_INO, 1,
4645855df01eda Sasha Finkelstein 2024-08-18   958  				      KEY_TYPE_QUOTA_PREALLOC);
4645855df01eda Sasha Finkelstein 2024-08-18   959  		if (unlikely(ret))
4645855df01eda Sasha Finkelstein 2024-08-18   960  			goto err_tx_restart;
4645855df01eda Sasha Finkelstein 2024-08-18   961  	}
4645855df01eda Sasha Finkelstein 2024-08-18   962  
4645855df01eda Sasha Finkelstein 2024-08-18   963  	ret = bch2_trans_commit(trans, NULL, NULL, 0);
4645855df01eda Sasha Finkelstein 2024-08-18   964  	if (unlikely(ret)) {
4645855df01eda Sasha Finkelstein 2024-08-18   965  err_tx_restart:
4645855df01eda Sasha Finkelstein 2024-08-18   966  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart))
4645855df01eda Sasha Finkelstein 2024-08-18   967  			goto retry;
1c6fdbd8f2465d Kent Overstreet   2017-03-16   968  		goto err;
4645855df01eda Sasha Finkelstein 2024-08-18   969  	}
1c6fdbd8f2465d Kent Overstreet   2017-03-16   970  
9638574229e3ae Kent Overstreet   2019-10-02   971  	BUG_ON(src_inode->v.i_ino != src_inode_u.bi_inum);
9638574229e3ae Kent Overstreet   2019-10-02   972  	BUG_ON(dst_inode &&
9638574229e3ae Kent Overstreet   2019-10-02   973  	       dst_inode->v.i_ino != dst_inode_u.bi_inum);
9638574229e3ae Kent Overstreet   2019-10-02   974  
6bd68ec266ad71 Kent Overstreet   2023-09-12   975  	bch2_inode_update_after_write(trans, src_dir, &src_dir_u,
e614a6c52d32c9 Hongbo Li         2025-01-07   976  				      ATTR_MTIME|ATTR_CTIME|ATTR_SIZE);
1c6fdbd8f2465d Kent Overstreet   2017-03-16   977  
68a2054d88f7cd Kent Overstreet   2021-11-05   978  	if (src_dir != dst_dir)
6bd68ec266ad71 Kent Overstreet   2023-09-12   979  		bch2_inode_update_after_write(trans, dst_dir, &dst_dir_u,
e614a6c52d32c9 Hongbo Li         2025-01-07   980  					      ATTR_MTIME|ATTR_CTIME|ATTR_SIZE);
1c6fdbd8f2465d Kent Overstreet   2017-03-16   981  
6bd68ec266ad71 Kent Overstreet   2023-09-12   982  	bch2_inode_update_after_write(trans, src_inode, &src_inode_u,
1c6fdbd8f2465d Kent Overstreet   2017-03-16   983  				      ATTR_CTIME);
9638574229e3ae Kent Overstreet   2019-10-02   984  
68a2054d88f7cd Kent Overstreet   2021-11-05   985  	if (dst_inode)
6bd68ec266ad71 Kent Overstreet   2023-09-12   986  		bch2_inode_update_after_write(trans, dst_inode, &dst_inode_u,
1c6fdbd8f2465d Kent Overstreet   2017-03-16   987  					      ATTR_CTIME);
1c6fdbd8f2465d Kent Overstreet   2017-03-16   988  err:
6bd68ec266ad71 Kent Overstreet   2023-09-12   989  	bch2_trans_put(trans);
96012e143e699d Kent Overstreet   2018-12-17   990  
9638574229e3ae Kent Overstreet   2019-10-02   991  	bch2_fs_quota_transfer(c, src_inode,
9638574229e3ae Kent Overstreet   2019-10-02   992  			       bch_qid(&src_inode->ei_inode),
96012e143e699d Kent Overstreet   2018-12-17   993  			       1 << QTYP_PRJ,
96012e143e699d Kent Overstreet   2018-12-17   994  			       KEY_TYPE_QUOTA_NOCHECK);
9638574229e3ae Kent Overstreet   2019-10-02   995  	if (dst_inode)
9638574229e3ae Kent Overstreet   2019-10-02   996  		bch2_fs_quota_transfer(c, dst_inode,
9638574229e3ae Kent Overstreet   2019-10-02   997  				       bch_qid(&dst_inode->ei_inode),
96012e143e699d Kent Overstreet   2018-12-17   998  				       1 << QTYP_PRJ,
96012e143e699d Kent Overstreet   2018-12-17   999  				       KEY_TYPE_QUOTA_NOCHECK);
96012e143e699d Kent Overstreet   2018-12-17  1000  
168f4c5fb37513 Kent Overstreet   2019-06-24  1001  	bch2_unlock_inodes(INODE_UPDATE_LOCK,
9638574229e3ae Kent Overstreet   2019-10-02  1002  			   src_dir,
9638574229e3ae Kent Overstreet   2019-10-02  1003  			   dst_dir,
9638574229e3ae Kent Overstreet   2019-10-02  1004  			   src_inode,
9638574229e3ae Kent Overstreet   2019-10-02  1005  			   dst_inode);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  1006  
1a1c93e7f81417 Kent Overstreet   2024-02-09  1007  	return bch2_err_class(ret);
1c6fdbd8f2465d Kent Overstreet   2017-03-16  1008  }
1c6fdbd8f2465d Kent Overstreet   2017-03-16  1009  

:::::: The code at line 867 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
