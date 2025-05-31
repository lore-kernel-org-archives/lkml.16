Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E0B149E13
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748709473; cv=none; b=JT1RFsMCJy41EYFAtKT1Z9b/NKiMbPfKceRLOkTiORPuvn8nWCpyHHL9Aa6KMs8u8+mtweYgt1Vvvzv11MAOKLj6hJudPt6rLfvtI1VZ9o/MxdVXI4XrDW68SW36MnW4IZdV79T7jPY9wO+Uu0KIQ58zFZqh7tRD7Tbbm5P12tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748709473; c=relaxed/simple;
	bh=J46ycYqTQ3m/ESNE1CTZvd1Nnu4qoRy2cn0CP7+u6Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lcpcOsNJe7Dfj80dUYn2DIV9vHU9F9oCQO4WvtbDqPAcXDFVp3PECulrssRnLDrHFh5CHGWnQfTkGLq+CFzzrg/X9nsGEC/sdCqrkIDZdONXdvPSDk1iURpCvH/mmLSVv/ZqERUq1AY02x2gO7HvBCrFpop1pyffLQYYMSCmXGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jbkq1Ayv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jbkq1Ayv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748709471; x=1780245471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J46ycYqTQ3m/ESNE1CTZvd1Nnu4qoRy2cn0CP7+u6Ug=;
  b=jbkq1AyviNg/uqcPGpO6TxpxDSamI3ZypFdtpu7vwCqzGgrjl4KNcWZU
   I709yHxAvO95WS8TAkqoo7KU4DzZJ+Qnq+s7EBXZE7kD4csnLXB7wAPV1
   Tuls79sQKlgKaiPkYKINKD8KJYZ7GFUg2de2LjIdVlf73TTnhV7PagIvg
   Qcyute/JB/LUMWXYhpir7H5Rp5U3ChaAp0Ef0O7skg2jyBn5+M8jfYEP9
   sKrOojmiaAEVjLVK+tQza80bqfRiHYJRAV7Ny5/Rq0O0vpr5Z1MNftdJL
   usunRzlKIerkghrMearuokp/p67WFEi/ta48SeeUKampYhUg3DOM4kMKc
   Q==;
X-CSE-ConnectionGUID: PluhBg+kSFq3INnsdgNS0g==
X-CSE-MsgGUID: zct7CTj2Tha7MA0FqojFJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="62179612"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="62179612"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 09:37:50 -0700
X-CSE-ConnectionGUID: YNJujgcBSeWUnGWC926QYQ==
X-CSE-MsgGUID: XylBVezvQcmOz61TMYfGKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144121636"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa010.jf.intel.com with ESMTP; 31 May 2025 09:37:48 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLPDM-00012Q-33;
	Sat, 31 May 2025 16:37:44 +0000
Date: Sun, 1 Jun 2025 00:37:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: fs/bcachefs/super.c:954:25: warning: result of comparison of
 constant 65536 with expression of type 'u16' (aka 'unsigned short') is
 always false
Message-ID: <202506010012.GabD1fud-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f70f5b08a47a3bc1a252e5f451a137cde7c98ce
commit: 9caea9208fc3fbdbd4a41a2de8c6a0c969b030f9 bcachefs: Don't mount bs > ps without TRANSPARENT_HUGEPAGE
date:   8 days ago
config: hexagon-randconfig-2004-20250531 (https://download.01.org/0day-ci/archive/20250601/202506010012.GabD1fud-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506010012.GabD1fud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506010012.GabD1fud-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/super.c:954:25: warning: result of comparison of constant 65536 with expression of type 'u16' (aka 'unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
     954 |             c->opts.block_size > PAGE_SIZE) {
         |             ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~
   1 warning generated.


vim +954 fs/bcachefs/super.c

   837	
   838	static struct bch_fs *bch2_fs_alloc(struct bch_sb *sb, struct bch_opts *opts,
   839					    bch_sb_handles *sbs)
   840	{
   841		struct bch_fs *c;
   842		struct printbuf name = PRINTBUF;
   843		unsigned i, iter_size;
   844		int ret = 0;
   845	
   846		c = kvmalloc(sizeof(struct bch_fs), GFP_KERNEL|__GFP_ZERO);
   847		if (!c) {
   848			c = ERR_PTR(-BCH_ERR_ENOMEM_fs_alloc);
   849			goto out;
   850		}
   851	
   852		c->stdio = (void *)(unsigned long) opts->stdio;
   853	
   854		__module_get(THIS_MODULE);
   855	
   856		closure_init(&c->cl, NULL);
   857	
   858		c->kobj.kset = bcachefs_kset;
   859		kobject_init(&c->kobj, &bch2_fs_ktype);
   860		kobject_init(&c->internal, &bch2_fs_internal_ktype);
   861		kobject_init(&c->opts_dir, &bch2_fs_opts_dir_ktype);
   862		kobject_init(&c->time_stats, &bch2_fs_time_stats_ktype);
   863		kobject_init(&c->counters_kobj, &bch2_fs_counters_ktype);
   864	
   865		c->minor		= -1;
   866		c->disk_sb.fs_sb	= true;
   867	
   868		init_rwsem(&c->state_lock);
   869		mutex_init(&c->sb_lock);
   870		mutex_init(&c->replicas_gc_lock);
   871		mutex_init(&c->btree_root_lock);
   872		INIT_WORK(&c->read_only_work, bch2_fs_read_only_work);
   873	
   874		refcount_set(&c->ro_ref, 1);
   875		init_waitqueue_head(&c->ro_ref_wait);
   876	
   877		for (i = 0; i < BCH_TIME_STAT_NR; i++)
   878			bch2_time_stats_init(&c->times[i]);
   879	
   880		bch2_fs_allocator_background_init(c);
   881		bch2_fs_allocator_foreground_init(c);
   882		bch2_fs_btree_cache_init_early(&c->btree_cache);
   883		bch2_fs_btree_gc_init_early(c);
   884		bch2_fs_btree_interior_update_init_early(c);
   885		bch2_fs_btree_iter_init_early(c);
   886		bch2_fs_btree_key_cache_init_early(&c->btree_key_cache);
   887		bch2_fs_btree_write_buffer_init_early(c);
   888		bch2_fs_copygc_init(c);
   889		bch2_fs_ec_init_early(c);
   890		bch2_fs_journal_init_early(&c->journal);
   891		bch2_fs_journal_keys_init(c);
   892		bch2_fs_move_init(c);
   893		bch2_fs_nocow_locking_init_early(c);
   894		bch2_fs_quota_init(c);
   895		bch2_fs_recovery_passes_init(c);
   896		bch2_fs_sb_errors_init_early(c);
   897		bch2_fs_snapshots_init_early(c);
   898		bch2_fs_subvolumes_init_early(c);
   899	
   900		INIT_LIST_HEAD(&c->list);
   901	
   902		mutex_init(&c->bio_bounce_pages_lock);
   903		mutex_init(&c->snapshot_table_lock);
   904		init_rwsem(&c->snapshot_create_lock);
   905	
   906		spin_lock_init(&c->btree_write_error_lock);
   907	
   908		INIT_LIST_HEAD(&c->journal_iters);
   909	
   910		INIT_LIST_HEAD(&c->fsck_error_msgs);
   911		mutex_init(&c->fsck_error_msgs_lock);
   912	
   913		seqcount_init(&c->usage_lock);
   914	
   915		sema_init(&c->io_in_flight, 128);
   916	
   917		INIT_LIST_HEAD(&c->vfs_inodes_list);
   918		mutex_init(&c->vfs_inodes_lock);
   919	
   920		c->journal.flush_write_time	= &c->times[BCH_TIME_journal_flush_write];
   921		c->journal.noflush_write_time	= &c->times[BCH_TIME_journal_noflush_write];
   922		c->journal.flush_seq_time	= &c->times[BCH_TIME_journal_flush_seq];
   923	
   924		mutex_init(&c->sectors_available_lock);
   925	
   926		ret = percpu_init_rwsem(&c->mark_lock);
   927		if (ret)
   928			goto err;
   929	
   930		mutex_lock(&c->sb_lock);
   931		ret = bch2_sb_to_fs(c, sb);
   932		mutex_unlock(&c->sb_lock);
   933	
   934		if (ret)
   935			goto err;
   936	
   937		/* Compat: */
   938		if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_inode_v2 &&
   939		    !BCH_SB_JOURNAL_FLUSH_DELAY(sb))
   940			SET_BCH_SB_JOURNAL_FLUSH_DELAY(sb, 1000);
   941	
   942		if (le16_to_cpu(sb->version) <= bcachefs_metadata_version_inode_v2 &&
   943		    !BCH_SB_JOURNAL_RECLAIM_DELAY(sb))
   944			SET_BCH_SB_JOURNAL_RECLAIM_DELAY(sb, 100);
   945	
   946		c->opts = bch2_opts_default;
   947		ret = bch2_opts_from_sb(&c->opts, sb);
   948		if (ret)
   949			goto err;
   950	
   951		bch2_opts_apply(&c->opts, *opts);
   952	
   953		if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
 > 954		    c->opts.block_size > PAGE_SIZE) {
   955			bch_err(c, "cannot mount bs > ps filesystem without CONFIG_TRANSPARENT_HUGEPAGE");
   956			ret = -EINVAL;
   957			goto err;
   958		}
   959	
   960		c->btree_key_cache_btrees |= 1U << BTREE_ID_alloc;
   961		if (c->opts.inodes_use_key_cache)
   962			c->btree_key_cache_btrees |= 1U << BTREE_ID_inodes;
   963		c->btree_key_cache_btrees |= 1U << BTREE_ID_logged_ops;
   964	
   965		c->block_bits		= ilog2(block_sectors(c));
   966		c->btree_foreground_merge_threshold = BTREE_FOREGROUND_MERGE_THRESHOLD(c);
   967	
   968		if (bch2_fs_init_fault("fs_alloc")) {
   969			bch_err(c, "fs_alloc fault injected");
   970			ret = -EFAULT;
   971			goto err;
   972		}
   973	
   974		if (c->sb.multi_device)
   975			pr_uuid(&name, c->sb.user_uuid.b);
   976		else
   977			prt_bdevname(&name, sbs->data[0].bdev);
   978	
   979		ret = name.allocation_failure ? -BCH_ERR_ENOMEM_fs_name_alloc : 0;
   980		if (ret)
   981			goto err;
   982	
   983		strscpy(c->name, name.buf, sizeof(c->name));
   984		printbuf_exit(&name);
   985	
   986		iter_size = sizeof(struct sort_iter) +
   987			(btree_blocks(c) + 1) * 2 *
   988			sizeof(struct sort_iter_set);
   989	
   990		if (!(c->btree_read_complete_wq = alloc_workqueue("bcachefs_btree_read_complete",
   991					WQ_HIGHPRI|WQ_FREEZABLE|WQ_MEM_RECLAIM, 512)) ||
   992		    enumerated_ref_init(&c->writes, BCH_WRITE_REF_NR,
   993					bch2_writes_disabled) ||
   994		    mempool_init_kmalloc_pool(&c->fill_iter, 1, iter_size) ||
   995		    bioset_init(&c->btree_bio, 1,
   996				max(offsetof(struct btree_read_bio, bio),
   997				    offsetof(struct btree_write_bio, wbio.bio)),
   998				BIOSET_NEED_BVECS) ||
   999		    !(c->pcpu = alloc_percpu(struct bch_fs_pcpu)) ||
  1000		    !(c->usage = alloc_percpu(struct bch_fs_usage_base)) ||
  1001		    !(c->online_reserved = alloc_percpu(u64)) ||
  1002		    mempool_init_kvmalloc_pool(&c->btree_bounce_pool, 1,
  1003					       c->opts.btree_node_size) ||
  1004		    mempool_init_kmalloc_pool(&c->large_bkey_pool, 1, 2048)) {
  1005			ret = -BCH_ERR_ENOMEM_fs_other_alloc;
  1006			goto err;
  1007		}
  1008	
  1009		ret =
  1010		    bch2_fs_async_obj_init(c) ?:
  1011		    bch2_fs_btree_cache_init(c) ?:
  1012		    bch2_fs_btree_iter_init(c) ?:
  1013		    bch2_fs_btree_key_cache_init(&c->btree_key_cache) ?:
  1014		    bch2_fs_buckets_waiting_for_journal_init(c) ?:
  1015		    bch2_io_clock_init(&c->io_clock[READ]) ?:
  1016		    bch2_io_clock_init(&c->io_clock[WRITE]) ?:
  1017		    bch2_fs_compress_init(c) ?:
  1018		    bch2_fs_counters_init(c) ?:
  1019		    bch2_fs_ec_init(c) ?:
  1020		    bch2_fs_encryption_init(c) ?:
  1021		    bch2_fs_fsio_init(c) ?:
  1022		    bch2_fs_fs_io_direct_init(c) ?:
  1023		    bch2_fs_io_read_init(c) ?:
  1024		    bch2_fs_rebalance_init(c) ?:
  1025		    bch2_fs_sb_errors_init(c) ?:
  1026		    bch2_fs_vfs_init(c);
  1027		if (ret)
  1028			goto err;
  1029	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
