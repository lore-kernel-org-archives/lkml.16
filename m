Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD71B672
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745993897; cv=none; b=lVQpW9P6DdXUqyG6O0ZKBl6b5ILfzbIn9Dybx27/6ug9mRnZ5uhPlW5IH4T+/EkSBKf8/A5pXq/YwK0O2qoC+TbCr5+eP5avQ03oA1oiix2rhhyLfo96GFkzS56aOwm8e0ivpS6kyVZwDIKhhrZd4YuM/KUd7TcofARm0q1z/OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745993897; c=relaxed/simple;
	bh=K4PLvp1IVwSdpGNdFRkTovCfxPD0wgIzJ4rXy7vKMuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uS0LPSH94Ha4simygw71epF9SUQ3P15Ezea5zgLh0ieq9pfF6ZWJeYBPOgGtoOphmS/zYIXBRbhoewiW7+W2EojITzDcsa5ZMb94AnXzeYu9TLmctMCW04+gsrLl7zvojGH259XowUfEEcsFS3Sz+Z8xnjX+Zlxb2rW8YjMrErY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPJzmQI2; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPJzmQI2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745993895; x=1777529895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K4PLvp1IVwSdpGNdFRkTovCfxPD0wgIzJ4rXy7vKMuI=;
  b=JPJzmQI2opBy6DC/dblu1p7gF7g4CyQFT/QDbmwiOdcRXq6TYG7xXXMD
   Rq3XJzFz02XdFGrqNrCvWFnmZY0zi+FQRX6c9sBSjZC4eJdiR0HjrLN9Q
   JQOX1N0ueKLhLHm5lsJxHvzO7da6AeojCpeWEF5VQJJofGmpIf92ed+Iy
   uCBaehbCiTtsLLUxhKmykoGEuK30qz//QQ7tK7ZIDUCbYtjlh7s1Y+uDE
   PA/Xzbt4rqrlhuzdZiW4MLHf6c02m//dRVDJyYq2cJt4c+kNdSGbsK8bX
   oFo/CPNVNBz6VT41037i/o+P7f/gLoHmY5KGbwOzmUhQjB95p9O9ldamq
   Q==;
X-CSE-ConnectionGUID: Tb86e2bDSRCm28wQay/2XA==
X-CSE-MsgGUID: 7dzzyLH0Tiup9vLNZdDOAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47771965"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47771965"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 23:18:14 -0700
X-CSE-ConnectionGUID: O3wf4+48RmaFwr/ltZ7Tig==
X-CSE-MsgGUID: UyO8SHadSMWB5s93gyhwWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="138858216"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 29 Apr 2025 23:18:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uA0ll-0003Dt-36;
	Wed, 30 Apr 2025 06:18:09 +0000
Date: Wed, 30 Apr 2025 14:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Liu <liubo03@inspur.com>, agruenba@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org, Bo Liu <liubo03@inspur.com>
Subject: Re: [PATCH]  gfs2: Remove set but not used variable
 'xattr_initialized'
Message-ID: <202504301325.ObKCr0Bh-lkp@intel.com>
References: <20250429054916.2343-1-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429054916.2343-1-liubo03@inspur.com>

Hi Bo,

kernel test robot noticed the following build errors:

[auto build test ERROR on gfs2/for-next]
[also build test ERROR on next-20250429]
[cannot apply to linus/master v6.15-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Liu/gfs2-Remove-set-but-not-used-variable-xattr_initialized/20250429-135321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
patch link:    https://lore.kernel.org/r/20250429054916.2343-1-liubo03%40inspur.com
patch subject: [PATCH]  gfs2: Remove set but not used variable 'xattr_initialized'
config: arc-randconfig-001-20250430 (https://download.01.org/0day-ci/archive/20250430/202504301325.ObKCr0Bh-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301325.ObKCr0Bh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301325.ObKCr0Bh-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/gfs2/inode.c: In function 'gfs2_create_inode':
>> fs/gfs2/inode.c:905:53: error: 'xattr_initialized' undeclared (first use in this function); did you mean 'bioset_initialized'?
     905 |                 dealloc_error = gfs2_ea_dealloc(ip, xattr_initialized);
         |                                                     ^~~~~~~~~~~~~~~~~
         |                                                     bioset_initialized
   fs/gfs2/inode.c:905:53: note: each undeclared identifier is reported only once for each function it appears in


vim +905 fs/gfs2/inode.c

194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  667  
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  668  /**
f2741d9898269e fs/gfs2/inode.c     Steven Whitehouse   2011-05-13  669   * gfs2_create_inode - Create a new inode
f2741d9898269e fs/gfs2/inode.c     Steven Whitehouse   2011-05-13  670   * @dir: The parent directory
f2741d9898269e fs/gfs2/inode.c     Steven Whitehouse   2011-05-13  671   * @dentry: The new dentry
6d4ade986f9c8d fs/gfs2/inode.c     Steven Whitehouse   2013-06-14  672   * @file: If non-NULL, the file which is being opened
f2741d9898269e fs/gfs2/inode.c     Steven Whitehouse   2011-05-13  673   * @mode: The permissions on the new inode
f2741d9898269e fs/gfs2/inode.c     Steven Whitehouse   2011-05-13  674   * @dev: For device nodes, this is the device number
f2741d9898269e fs/gfs2/inode.c     Steven Whitehouse   2011-05-13  675   * @symname: For symlinks, this is the link destination
f2741d9898269e fs/gfs2/inode.c     Steven Whitehouse   2011-05-13  676   * @size: The initial size of the inode (ignored for directories)
c551f66c5dfefd fs/gfs2/inode.c     Lee Jones           2021-03-30  677   * @excl: Force fail if inode exists
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  678   *
38552ff676f072 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-02  679   * FIXME: Change to allocate the disk blocks and write them out in the same
38552ff676f072 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-02  680   * transaction.  That way, we can no longer end up in a situation in which an
38552ff676f072 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-02  681   * inode is allocated, the node crashes, and the block looks like a valid
38552ff676f072 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-02  682   * inode.  (With atomic creates in place, we will also no longer need to zero
38552ff676f072 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-02  683   * the link count and dirty the inode here on failure.)
38552ff676f072 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-02  684   *
f2741d9898269e fs/gfs2/inode.c     Steven Whitehouse   2011-05-13  685   * Returns: 0 on success, or error code
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  686   */
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  687  
f2741d9898269e fs/gfs2/inode.c     Steven Whitehouse   2011-05-13  688  static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
6d4ade986f9c8d fs/gfs2/inode.c     Steven Whitehouse   2013-06-14  689  			     struct file *file,
175a4eb7ea531c fs/gfs2/inode.c     Al Viro             2011-07-26  690  			     umode_t mode, dev_t dev, const char *symname,
b452a458caaa95 fs/gfs2/inode.c     Al Viro             2018-06-08  691  			     unsigned int size, int excl)
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  692  {
f2741d9898269e fs/gfs2/inode.c     Steven Whitehouse   2011-05-13  693  	const struct qstr *name = &dentry->d_name;
e01580bf9e4d0e fs/gfs2/inode.c     Christoph Hellwig   2013-12-20  694  	struct posix_acl *default_acl, *acl;
761fdbbce96fb3 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-04  695  	struct gfs2_holder d_gh, gh;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  696  	struct inode *inode = NULL;
8e2e00473598dd fs/gfs2/inode.c     Bob Peterson        2012-07-19  697  	struct gfs2_inode *dip = GFS2_I(dir), *ip;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  698  	struct gfs2_sbd *sdp = GFS2_SB(&dip->i_inode);
a55a47a3bc82cb fs/gfs2/inode.c     Andreas Gruenbacher 2020-11-27  699  	struct gfs2_glock *io_gl;
2c63986dd35fa9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  700  	int error, dealloc_error;
9dbe9610b9df4e fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  701  	u32 aflags = 0;
b2c8b3ea871e47 fs/gfs2/inode.c     Steven Whitehouse   2014-02-04  702  	unsigned blocks = 1;
19aeb5a65f1a65 fs/gfs2/inode.c     Bob Peterson        2014-09-29  703  	struct gfs2_diradd da = { .bh = NULL, .save_loc = 1, };
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  704  
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  705  	if (!name->len || name->len > GFS2_FNAMESIZE)
f2741d9898269e fs/gfs2/inode.c     Steven Whitehouse   2011-05-13  706  		return -ENAMETOOLONG;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  707  
2fba46a04c383f fs/gfs2/inode.c     Bob Peterson        2020-02-27  708  	error = gfs2_qa_get(dip);
0a305e496059a1 fs/gfs2/inode.c     Bob Peterson        2012-06-06  709  	if (error)
0a305e496059a1 fs/gfs2/inode.c     Bob Peterson        2012-06-06  710  		return error;
0a305e496059a1 fs/gfs2/inode.c     Bob Peterson        2012-06-06  711  
fd4b4e042c6aac fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  712  	error = gfs2_rindex_update(sdp);
fd4b4e042c6aac fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  713  	if (error)
2fba46a04c383f fs/gfs2/inode.c     Bob Peterson        2020-02-27  714  		goto fail;
fd4b4e042c6aac fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  715  
761fdbbce96fb3 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-04  716  	error = gfs2_glock_nq_init(dip->i_gl, LM_ST_EXCLUSIVE, 0, &d_gh);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  717  	if (error)
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  718  		goto fail;
761fdbbce96fb3 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-04  719  	gfs2_holder_mark_uninitialized(&gh);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  720  
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  721  	error = create_ok(dip, name, mode);
5a00f3cc978be4 fs/gfs2/inode.c     Steven Whitehouse   2013-06-11  722  	if (error)
5a00f3cc978be4 fs/gfs2/inode.c     Steven Whitehouse   2013-06-11  723  		goto fail_gunlock;
5a00f3cc978be4 fs/gfs2/inode.c     Steven Whitehouse   2013-06-11  724  
5a00f3cc978be4 fs/gfs2/inode.c     Steven Whitehouse   2013-06-11  725  	inode = gfs2_dir_search(dir, &dentry->d_name, !S_ISREG(mode) || excl);
5a00f3cc978be4 fs/gfs2/inode.c     Steven Whitehouse   2013-06-11  726  	error = PTR_ERR(inode);
5a00f3cc978be4 fs/gfs2/inode.c     Steven Whitehouse   2013-06-11  727  	if (!IS_ERR(inode)) {
571a4b57975aaa fs/gfs2/inode.c     Al Viro             2014-11-19  728  		if (S_ISDIR(inode->i_mode)) {
571a4b57975aaa fs/gfs2/inode.c     Al Viro             2014-11-19  729  			iput(inode);
af4044fd0b77e9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  730  			inode = NULL;
af4044fd0b77e9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  731  			error = -EISDIR;
571a4b57975aaa fs/gfs2/inode.c     Al Viro             2014-11-19  732  			goto fail_gunlock;
571a4b57975aaa fs/gfs2/inode.c     Al Viro             2014-11-19  733  		}
44bb31bac555b0 fs/gfs2/inode.c     Al Viro             2014-11-19  734  		d_instantiate(dentry, inode);
6d4ade986f9c8d fs/gfs2/inode.c     Steven Whitehouse   2013-06-14  735  		error = 0;
0d0d110720d796 fs/gfs2/inode.c     Miklos Szeredi      2013-09-16  736  		if (file) {
44bb31bac555b0 fs/gfs2/inode.c     Al Viro             2014-11-19  737  			if (S_ISREG(inode->i_mode))
be12af3ef5e61e fs/gfs2/inode.c     Al Viro             2018-06-08  738  				error = finish_open(file, dentry, gfs2_open_common);
44bb31bac555b0 fs/gfs2/inode.c     Al Viro             2014-11-19  739  			else
44bb31bac555b0 fs/gfs2/inode.c     Al Viro             2014-11-19  740  				error = finish_no_open(file, NULL);
5ca1db41ecdeb0 fs/gfs2/inode.c     Miklos Szeredi      2013-09-23  741  		}
761fdbbce96fb3 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-04  742  		gfs2_glock_dq_uninit(&d_gh);
2297ab6144c2e8 fs/gfs2/inode.c     Bob Peterson        2020-05-04  743  		goto fail;
5a00f3cc978be4 fs/gfs2/inode.c     Steven Whitehouse   2013-06-11  744  	} else if (error != -ENOENT) {
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  745  		goto fail_gunlock;
5a00f3cc978be4 fs/gfs2/inode.c     Steven Whitehouse   2013-06-11  746  	}
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  747  
3c1c0ae1db74b1 fs/gfs2/inode.c     Steven Whitehouse   2014-01-06  748  	error = gfs2_diradd_alloc_required(dir, name, &da);
fd4b4e042c6aac fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  749  	if (error < 0)
fd4b4e042c6aac fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  750  		goto fail_gunlock;
fd4b4e042c6aac fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  751  
c9aecf73717f55 fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  752  	inode = new_inode(sdp->sd_vfs);
fd4b4e042c6aac fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  753  	error = -ENOMEM;
fd4b4e042c6aac fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  754  	if (!inode)
fd4b4e042c6aac fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  755  		goto fail_gunlock;
3d0258bc11185c fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-02  756  	ip = GFS2_I(inode);
fd4b4e042c6aac fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  757  
e01580bf9e4d0e fs/gfs2/inode.c     Christoph Hellwig   2013-12-20  758  	error = posix_acl_create(dir, &mode, &default_acl, &acl);
e01580bf9e4d0e fs/gfs2/inode.c     Christoph Hellwig   2013-12-20  759  	if (error)
783013c0f5c726 fs/gfs2/inode.c     Bob Peterson        2015-12-04  760  		goto fail_gunlock;
e01580bf9e4d0e fs/gfs2/inode.c     Christoph Hellwig   2013-12-20  761  
2fba46a04c383f fs/gfs2/inode.c     Bob Peterson        2020-02-27  762  	error = gfs2_qa_get(ip);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  763  	if (error)
e01580bf9e4d0e fs/gfs2/inode.c     Christoph Hellwig   2013-12-20  764  		goto fail_free_acls;
c9aecf73717f55 fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  765  
c9aecf73717f55 fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  766  	inode->i_mode = mode;
79ba74808df113 fs/gfs2/inode.c     Steven Whitehouse   2013-03-01  767  	set_nlink(inode, S_ISDIR(mode) ? 2 : 1);
c9aecf73717f55 fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  768  	inode->i_rdev = dev;
c9aecf73717f55 fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  769  	inode->i_size = size;
580f721b6f5ad5 fs/gfs2/inode.c     Jeff Layton         2023-10-04  770  	simple_inode_init_ts(inode);
c9aecf73717f55 fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  771  	munge_mode_uid_gid(dip, inode);
00a158be83839f fs/gfs2/inode.c     Abhi Das            2014-09-18  772  	check_and_update_goal(dip);
c9aecf73717f55 fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  773  	ip->i_goal = dip->i_goal;
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  774  	ip->i_diskflags = 0;
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  775  	ip->i_eattr = 0;
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  776  	ip->i_height = 0;
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  777  	ip->i_depth = 0;
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  778  	ip->i_entries = 0;
cc963a11b67b79 fs/gfs2/inode.c     Bob Peterson        2017-03-16  779  	ip->i_no_addr = 0; /* Temporarily zero until real addr is assigned */
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  780  
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  781  	switch(mode & S_IFMT) {
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  782  	case S_IFREG:
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  783  		if ((dip->i_diskflags & GFS2_DIF_INHERIT_JDATA) ||
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  784  		    gfs2_tune_get(sdp, gt_new_files_jdata))
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  785  			ip->i_diskflags |= GFS2_DIF_JDATA;
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  786  		gfs2_set_aops(inode);
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  787  		break;
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  788  	case S_IFDIR:
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  789  		ip->i_diskflags |= (dip->i_diskflags & GFS2_DIF_INHERIT_JDATA);
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  790  		ip->i_diskflags |= GFS2_DIF_JDATA;
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  791  		ip->i_entries = 2;
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  792  		break;
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  793  	}
acc546fd6108cb fs/gfs2/inode.c     Abhi Das            2015-11-10  794  
acc546fd6108cb fs/gfs2/inode.c     Abhi Das            2015-11-10  795  	/* Force SYSTEM flag on all files and subdirs of a SYSTEM directory */
acc546fd6108cb fs/gfs2/inode.c     Abhi Das            2015-11-10  796  	if (dip->i_diskflags & GFS2_DIF_SYSTEM)
acc546fd6108cb fs/gfs2/inode.c     Abhi Das            2015-11-10  797  		ip->i_diskflags |= GFS2_DIF_SYSTEM;
acc546fd6108cb fs/gfs2/inode.c     Abhi Das            2015-11-10  798  
28fb30275570e9 fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  799  	gfs2_set_inode_flags(inode);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  800  
2b0143b5c986be fs/gfs2/inode.c     David Howells       2015-03-17  801  	if ((GFS2_I(d_inode(sdp->sd_root_dir)) == dip) ||
9dbe9610b9df4e fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  802  	    (dip->i_diskflags & GFS2_DIF_TOPDIR))
9dbe9610b9df4e fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  803  		aflags |= GFS2_AF_ORLOV;
9dbe9610b9df4e fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  804  
b2c8b3ea871e47 fs/gfs2/inode.c     Steven Whitehouse   2014-02-04  805  	if (default_acl || acl)
b2c8b3ea871e47 fs/gfs2/inode.c     Steven Whitehouse   2014-02-04  806  		blocks++;
b2c8b3ea871e47 fs/gfs2/inode.c     Steven Whitehouse   2014-02-04  807  
b2c8b3ea871e47 fs/gfs2/inode.c     Steven Whitehouse   2014-02-04  808  	error = alloc_dinode(ip, aflags, &blocks);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  809  	if (error)
c9aecf73717f55 fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  810  		goto fail_free_inode;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  811  
b2c8b3ea871e47 fs/gfs2/inode.c     Steven Whitehouse   2014-02-04  812  	gfs2_set_inode_blocks(inode, blocks);
b2c8b3ea871e47 fs/gfs2/inode.c     Steven Whitehouse   2014-02-04  813  
c9aecf73717f55 fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  814  	error = gfs2_glock_get(sdp, ip->i_no_addr, &gfs2_inode_glops, CREATE, &ip->i_gl);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  815  	if (error)
2c63986dd35fa9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  816  		goto fail_dealloc_inode;
98e5a91a6136af fs/gfs2/inode.c     Andreas Gruenbacher 2017-07-19  817  
dd0ecf54412563 fs/gfs2/inode.c     Andreas Gruenbacher 2020-11-30  818  	error = gfs2_glock_get(sdp, ip->i_no_addr, &gfs2_iopen_glops, CREATE, &io_gl);
c9aecf73717f55 fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  819  	if (error)
2c63986dd35fa9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  820  		goto fail_dealloc_inode;
dd0ecf54412563 fs/gfs2/inode.c     Andreas Gruenbacher 2020-11-30  821  	gfs2_cancel_delete_work(io_gl);
1072b3aa6863bc fs/gfs2/inode.c     Andreas Gruenbacher 2024-09-16  822  	io_gl->gl_no_formal_ino = ip->i_no_formal_ino;
dd0ecf54412563 fs/gfs2/inode.c     Andreas Gruenbacher 2020-11-30  823  
4ec3c19d058f73 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-05  824  retry:
3d36e57ff768db fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-30  825  	error = insert_inode_locked4(inode, ip->i_no_addr, iget_test, &ip->i_no_addr);
4ec3c19d058f73 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-05  826  	if (error == -EBUSY)
4ec3c19d058f73 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-05  827  		goto retry;
4ec3c19d058f73 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-05  828  	if (error)
4ec3c19d058f73 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-05  829  		goto fail_gunlock2;
3d36e57ff768db fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-30  830  
ebdc416c9c0bed fs/gfs2/inode.c     Andreas Gruenbacher 2022-04-05  831  	error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT | GL_NOPID,
ebdc416c9c0bed fs/gfs2/inode.c     Andreas Gruenbacher 2022-04-05  832  				   &ip->i_iopen_gh);
dd0ecf54412563 fs/gfs2/inode.c     Andreas Gruenbacher 2020-11-30  833  	if (error)
dd0ecf54412563 fs/gfs2/inode.c     Andreas Gruenbacher 2020-11-30  834  		goto fail_gunlock2;
c9aecf73717f55 fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  835  
761fdbbce96fb3 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-04  836  	error = gfs2_glock_nq_init(ip->i_gl, LM_ST_EXCLUSIVE, GL_SKIP, &gh);
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher 2022-01-24  837  	if (error)
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher 2022-01-24  838  		goto fail_gunlock3;
84a79ee68f8404 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-15  839  	clear_bit(GLF_INSTANTIATE_NEEDED, &ip->i_gl->gl_flags);
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher 2022-01-24  840  
b2c8b3ea871e47 fs/gfs2/inode.c     Steven Whitehouse   2014-02-04  841  	error = gfs2_trans_begin(sdp, blocks, 0);
c9aecf73717f55 fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  842  	if (error)
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher 2022-01-24  843  		goto fail_gunlock3;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  844  
6335cf2f0380c0 fs/gfs2/inode.c     Bo Liu              2025-04-29  845  	if (blocks > 1)
b2c8b3ea871e47 fs/gfs2/inode.c     Steven Whitehouse   2014-02-04  846  		gfs2_init_xattr(ip);
79ba74808df113 fs/gfs2/inode.c     Steven Whitehouse   2013-03-01  847  	init_dinode(dip, ip, symname);
fd4b4e042c6aac fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  848  	gfs2_trans_end(sdp);
fd4b4e042c6aac fs/gfs2/inode.c     Steven Whitehouse   2013-02-26  849  
3d36e57ff768db fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-30  850  	glock_set_object(ip->i_gl, ip);
8793e149859ab4 fs/gfs2/inode.c     Bob Peterson        2021-10-01  851  	glock_set_object(io_gl, ip);
c9aecf73717f55 fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  852  	gfs2_set_iop(inode);
c9aecf73717f55 fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  853  
e01580bf9e4d0e fs/gfs2/inode.c     Christoph Hellwig   2013-12-20  854  	if (default_acl) {
1a39ba99b5d533 fs/gfs2/inode.c     Al Viro             2016-05-13  855  		error = __gfs2_set_acl(inode, default_acl, ACL_TYPE_DEFAULT);
6ff9b09e00a441 fs/gfs2/inode.c     Andreas Gruenbacher 2018-11-26  856  		if (error)
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher 2022-01-24  857  			goto fail_gunlock4;
e01580bf9e4d0e fs/gfs2/inode.c     Christoph Hellwig   2013-12-20  858  		posix_acl_release(default_acl);
6ff9b09e00a441 fs/gfs2/inode.c     Andreas Gruenbacher 2018-11-26  859  		default_acl = NULL;
e01580bf9e4d0e fs/gfs2/inode.c     Christoph Hellwig   2013-12-20  860  	}
e01580bf9e4d0e fs/gfs2/inode.c     Christoph Hellwig   2013-12-20  861  	if (acl) {
1a39ba99b5d533 fs/gfs2/inode.c     Al Viro             2016-05-13  862  		error = __gfs2_set_acl(inode, acl, ACL_TYPE_ACCESS);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  863  		if (error)
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher 2022-01-24  864  			goto fail_gunlock4;
6ff9b09e00a441 fs/gfs2/inode.c     Andreas Gruenbacher 2018-11-26  865  		posix_acl_release(acl);
6ff9b09e00a441 fs/gfs2/inode.c     Andreas Gruenbacher 2018-11-26  866  		acl = NULL;
6ff9b09e00a441 fs/gfs2/inode.c     Andreas Gruenbacher 2018-11-26  867  	}
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  868  
f45dc26deda00d fs/gfs2/inode.c     Bob Peterson        2014-03-19  869  	error = security_inode_init_security(&ip->i_inode, &dip->i_inode, name,
f45dc26deda00d fs/gfs2/inode.c     Bob Peterson        2014-03-19  870  					     &gfs2_initxattrs, NULL);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  871  	if (error)
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher 2022-01-24  872  		goto fail_gunlock4;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  873  
3c1c0ae1db74b1 fs/gfs2/inode.c     Steven Whitehouse   2014-01-06  874  	error = link_dinode(dip, name, ip, &da);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  875  	if (error)
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher 2022-01-24  876  		goto fail_gunlock4;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  877  
79ba74808df113 fs/gfs2/inode.c     Steven Whitehouse   2013-03-01  878  	mark_inode_dirty(inode);
6d4ade986f9c8d fs/gfs2/inode.c     Steven Whitehouse   2013-06-14  879  	d_instantiate(dentry, inode);
2c47c1be51fbde fs/gfs2/inode.c     Bob Peterson        2019-11-19  880  	/* After instantiate, errors should result in evict which will destroy
2c47c1be51fbde fs/gfs2/inode.c     Bob Peterson        2019-11-19  881  	 * both inode and iopen glocks properly. */
c5bf8fef52ce18 fs/gfs2/inode.c     Miklos Szeredi      2013-09-16  882  	if (file) {
73a09dd94377e4 fs/gfs2/inode.c     Al Viro             2018-06-08  883  		file->f_mode |= FMODE_CREATED;
be12af3ef5e61e fs/gfs2/inode.c     Al Viro             2018-06-08  884  		error = finish_open(file, dentry, gfs2_open_common);
c5bf8fef52ce18 fs/gfs2/inode.c     Miklos Szeredi      2013-09-16  885  	}
761fdbbce96fb3 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-04  886  	gfs2_glock_dq_uninit(&d_gh);
2297ab6144c2e8 fs/gfs2/inode.c     Bob Peterson        2020-05-04  887  	gfs2_qa_put(ip);
761fdbbce96fb3 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-04  888  	gfs2_glock_dq_uninit(&gh);
2c47c1be51fbde fs/gfs2/inode.c     Bob Peterson        2019-11-19  889  	gfs2_glock_put(io_gl);
2297ab6144c2e8 fs/gfs2/inode.c     Bob Peterson        2020-05-04  890  	gfs2_qa_put(dip);
3d36e57ff768db fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-30  891  	unlock_new_inode(inode);
6d4ade986f9c8d fs/gfs2/inode.c     Steven Whitehouse   2013-06-14  892  	return error;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  893  
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher 2022-01-24  894  fail_gunlock4:
3d36e57ff768db fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-30  895  	glock_clear_object(ip->i_gl, ip);
9c1b28081f43c0 fs/gfs2/inode.c     Bob Peterson        2017-07-18  896  	glock_clear_object(io_gl, ip);
29464ee36bcaae fs/gfs2/inode.c     Andreas Gruenbacher 2022-01-24  897  fail_gunlock3:
783013c0f5c726 fs/gfs2/inode.c     Bob Peterson        2015-12-04  898  	gfs2_glock_dq_uninit(&ip->i_iopen_gh);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  899  fail_gunlock2:
2c47c1be51fbde fs/gfs2/inode.c     Bob Peterson        2019-11-19  900  	gfs2_glock_put(io_gl);
2c63986dd35fa9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  901  fail_dealloc_inode:
2c63986dd35fa9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  902  	set_bit(GIF_ALLOC_FAILED, &ip->i_flags);
2c63986dd35fa9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  903  	dealloc_error = 0;
2c63986dd35fa9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  904  	if (ip->i_eattr)
2c63986dd35fa9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18 @905  		dealloc_error = gfs2_ea_dealloc(ip, xattr_initialized);
2c63986dd35fa9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  906  	clear_nlink(inode);
2c63986dd35fa9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  907  	mark_inode_dirty(inode);
2c63986dd35fa9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  908  	if (!dealloc_error)
2c63986dd35fa9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  909  		dealloc_error = gfs2_dinode_dealloc(ip);
2c63986dd35fa9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  910  	if (dealloc_error)
2c63986dd35fa9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  911  		fs_warn(sdp, "%s: %d\n", __func__, dealloc_error);
2c63986dd35fa9 fs/gfs2/inode.c     Andreas Gruenbacher 2025-04-18  912  	ip->i_no_addr = 0;
c9aecf73717f55 fs/gfs2/inode.c     Steven Whitehouse   2012-10-31  913  fail_free_inode:
9ffa18884cceb2 fs/gfs2/inode.c     Andreas Gruenbacher 2023-01-23  914  	if (ip->i_gl) {
9ffa18884cceb2 fs/gfs2/inode.c     Andreas Gruenbacher 2023-01-23  915  		gfs2_glock_put(ip->i_gl);
9ffa18884cceb2 fs/gfs2/inode.c     Andreas Gruenbacher 2023-01-23  916  		ip->i_gl = NULL;
9ffa18884cceb2 fs/gfs2/inode.c     Andreas Gruenbacher 2023-01-23  917  	}
7336905a89f191 fs/gfs2/inode.c     Andreas Gruenbacher 2021-12-10  918  	gfs2_rs_deltree(&ip->i_res);
1595548fe72ca8 fs/gfs2/inode.c     Andreas Gruenbacher 2020-03-06  919  	gfs2_qa_put(ip);
e01580bf9e4d0e fs/gfs2/inode.c     Christoph Hellwig   2013-12-20  920  fail_free_acls:
e01580bf9e4d0e fs/gfs2/inode.c     Christoph Hellwig   2013-12-20  921  	posix_acl_release(default_acl);
e01580bf9e4d0e fs/gfs2/inode.c     Christoph Hellwig   2013-12-20  922  	posix_acl_release(acl);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  923  fail_gunlock:
2b47dad866d04f fs/gfs2/inode.c     Steven Whitehouse   2014-01-06  924  	gfs2_dir_no_add(&da);
761fdbbce96fb3 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-04  925  	gfs2_glock_dq_uninit(&d_gh);
15a798f7deb393 fs/gfs2/inode.c     Kefeng Wang         2019-06-05  926  	if (!IS_ERR_OR_NULL(inode)) {
3d36e57ff768db fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-30  927  		if (inode->i_state & I_NEW)
3d36e57ff768db fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-30  928  			iget_failed(inode);
3d36e57ff768db fs/gfs2/inode.c     Andreas Gruenbacher 2021-11-30  929  		else
40ac218f52aa5c fs/gfs2/inode.c     Steven Whitehouse   2011-08-02  930  			iput(inode);
40ac218f52aa5c fs/gfs2/inode.c     Steven Whitehouse   2011-08-02  931  	}
761fdbbce96fb3 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-04  932  	if (gfs2_holder_initialized(&gh))
761fdbbce96fb3 fs/gfs2/inode.c     Andreas Gruenbacher 2022-11-04  933  		gfs2_glock_dq_uninit(&gh);
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  934  fail:
2fba46a04c383f fs/gfs2/inode.c     Bob Peterson        2020-02-27  935  	gfs2_qa_put(dip);
f2741d9898269e fs/gfs2/inode.c     Steven Whitehouse   2011-05-13  936  	return error;
194c011fc4650d fs/gfs2/ops_inode.c Steven Whitehouse   2011-05-09  937  }
f2741d9898269e fs/gfs2/inode.c     Steven Whitehouse   2011-05-13  938  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
