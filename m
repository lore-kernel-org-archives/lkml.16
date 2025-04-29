Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48215275874
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915271; cv=none; b=n9TlYALuRsjExUtElvi6ZbyR7ZBf9KAeZv+XSiojXH5aDQkxmuk68RMSYmKq07rPH5AhAwKbVAJ7+H3IcsZJhJwZ+UvxHSAGSdVYF7ilRXAQps/FDf0yx8kzRWdk0aoamLwiejtD/lowCM5Jfbl8tQ1LP6d/bqVsgpgODZz1YBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915271; c=relaxed/simple;
	bh=MGFkciWJC+kP0lV+t4YNAkM8KejSFB29auop8woTfHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JU5qjd2d2xb+GFdryhn50E9ZzPW3xcldTAg4VVqROfDNgjX9YI0EMRSVIka5CgT1eYZkOX2Ofs0xiXyBJTfLgYbA/bb7naaJLxcAg4/YVug8TJtDDStcaeXfgK9kHIA8EtO8HwHhL1p2cW9cijbFhaJqgDLZ3CHycGMES/gIS68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBROfKcn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBROfKcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745915269; x=1777451269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MGFkciWJC+kP0lV+t4YNAkM8KejSFB29auop8woTfHE=;
  b=JBROfKcn0+K8Af3afxZKowgEWY3TE8qcWqXeShDFj8PKymiPU4JQ8lWT
   zdjfDGq4Suaa465Y6SRVoXBlrBpCDPjfHdYSY0M4UWqqdMTRNCBotUiiR
   Og8/4a5ILdKbkkuBAy7QvbWB2yIM+wHryfhhudCTCxy8q0ZSlYWDoattV
   81t5wtEJlAU2Ou/nOimE/vnFJnixKmxQJ3nyRctTrHN9x/biQEGpVDbEU
   pa78LBLeBFhCMHvEgw8DXMyaJVS45s3ehqLrrW1z8G725xdXoFdFVRBNQ
   MQEfJinY0aNMk4DVgRVk5+R6/6Lq/KC1Vscpbdz+lKfwne/tYAP5xXn8J
   w==;
X-CSE-ConnectionGUID: V0erI64eS8ujKOGUMY1rhQ==
X-CSE-MsgGUID: QqQ/aeaoRR2u0m9zStHr+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47664347"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="47664347"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 01:27:49 -0700
X-CSE-ConnectionGUID: TPavYUcBS6SNurWBGJp4sg==
X-CSE-MsgGUID: vPnGXyTdR/akW92PGJjLig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="170994318"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Apr 2025 01:27:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9gJc-0000aD-1o;
	Tue, 29 Apr 2025 08:27:44 +0000
Date: Tue, 29 Apr 2025 16:27:39 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: drivers/s390/block/dcssblk.c:718:undefined reference to `kill_dax'
Message-ID: <202504291604.pvjonhWX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ca91b9500108d4cf083a635c2e11c884d5dd20ea
commit: 653d7825c149932f254e0cd22153ccc945e7e545 dcssblk: mark DAX broken, remove FS_DAX_LIMITED support
date:   6 weeks ago
config: s390-randconfig-r132-20250428 (https://download.01.org/0day-ci/archive/20250429/202504291604.pvjonhWX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250429/202504291604.pvjonhWX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291604.pvjonhWX-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: drivers/s390/block/dcssblk.o: in function `dcssblk_add_store':
>> drivers/s390/block/dcssblk.c:718:(.text+0x1b98): undefined reference to `kill_dax'
>> s390x-linux-ld: drivers/s390/block/dcssblk.c:719:(.text+0x1bb6): undefined reference to `put_dax'
   s390x-linux-ld: drivers/s390/block/dcssblk.o: in function `dcssblk_shared_store':
   drivers/s390/block/dcssblk.c:417:(.text+0x2c2a): undefined reference to `kill_dax'
   s390x-linux-ld: drivers/s390/block/dcssblk.c:418:(.text+0x2c48): undefined reference to `put_dax'
   s390x-linux-ld: drivers/s390/block/dcssblk.o: in function `dcssblk_remove_store':
   drivers/s390/block/dcssblk.c:803:(.text+0x42e2): undefined reference to `kill_dax'
   s390x-linux-ld: drivers/s390/block/dcssblk.c:804:(.text+0x4300): undefined reference to `put_dax'


vim +718 drivers/s390/block/dcssblk.c

653d7825c14993 Dan Williams          2025-02-28  551  
^1da177e4c3f41 Linus Torvalds        2005-04-16  552  /*
^1da177e4c3f41 Linus Torvalds        2005-04-16  553   * device attribute for adding devices
^1da177e4c3f41 Linus Torvalds        2005-04-16  554   */
^1da177e4c3f41 Linus Torvalds        2005-04-16  555  static ssize_t
e404e274f62665 Yani Ioannou          2005-05-17  556  dcssblk_add_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
^1da177e4c3f41 Linus Torvalds        2005-04-16  557  {
af190c53c995bf Christoph Hellwig     2024-02-15  558  	struct queue_limits lim = {
af190c53c995bf Christoph Hellwig     2024-02-15  559  		.logical_block_size	= 4096,
f467fee48da450 Christoph Hellwig     2024-06-17  560  		.features		= BLK_FEAT_DAX,
af190c53c995bf Christoph Hellwig     2024-02-15  561  	};
b2300b9efe1b81 Hongjie Yang          2008-10-10  562  	int rc, i, j, num_of_segments;
^1da177e4c3f41 Linus Torvalds        2005-04-16  563  	struct dcssblk_dev_info *dev_info;
b2300b9efe1b81 Hongjie Yang          2008-10-10  564  	struct segment_info *seg_info, *temp;
^1da177e4c3f41 Linus Torvalds        2005-04-16  565  	char *local_buf;
^1da177e4c3f41 Linus Torvalds        2005-04-16  566  	unsigned long seg_byte_size;
^1da177e4c3f41 Linus Torvalds        2005-04-16  567  
^1da177e4c3f41 Linus Torvalds        2005-04-16  568  	dev_info = NULL;
b2300b9efe1b81 Hongjie Yang          2008-10-10  569  	seg_info = NULL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  570  	if (dev != dcssblk_root_dev) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  571  		rc = -EINVAL;
^1da177e4c3f41 Linus Torvalds        2005-04-16  572  		goto out_nobuf;
^1da177e4c3f41 Linus Torvalds        2005-04-16  573  	}
b2300b9efe1b81 Hongjie Yang          2008-10-10  574  	if ((count < 1) || (buf[0] == '\0') || (buf[0] == '\n')) {
b2300b9efe1b81 Hongjie Yang          2008-10-10  575  		rc = -ENAMETOOLONG;
b2300b9efe1b81 Hongjie Yang          2008-10-10  576  		goto out_nobuf;
b2300b9efe1b81 Hongjie Yang          2008-10-10  577  	}
b2300b9efe1b81 Hongjie Yang          2008-10-10  578  
^1da177e4c3f41 Linus Torvalds        2005-04-16  579  	local_buf = kmalloc(count + 1, GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds        2005-04-16  580  	if (local_buf == NULL) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  581  		rc = -ENOMEM;
^1da177e4c3f41 Linus Torvalds        2005-04-16  582  		goto out_nobuf;
^1da177e4c3f41 Linus Torvalds        2005-04-16  583  	}
b2300b9efe1b81 Hongjie Yang          2008-10-10  584  
^1da177e4c3f41 Linus Torvalds        2005-04-16  585  	/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  586  	 * parse input
^1da177e4c3f41 Linus Torvalds        2005-04-16  587  	 */
b2300b9efe1b81 Hongjie Yang          2008-10-10  588  	num_of_segments = 0;
3a9f9183bdd341 Ameen Ali             2015-02-24  589  	for (i = 0; (i < count && (buf[i] != '\0') && (buf[i] != '\n')); i++) {
42cfc6b590c5eb Martin Schwidefsky    2015-08-19  590  		for (j = i; j < count &&
42cfc6b590c5eb Martin Schwidefsky    2015-08-19  591  			(buf[j] != ':') &&
b2300b9efe1b81 Hongjie Yang          2008-10-10  592  			(buf[j] != '\0') &&
42cfc6b590c5eb Martin Schwidefsky    2015-08-19  593  			(buf[j] != '\n'); j++) {
b2300b9efe1b81 Hongjie Yang          2008-10-10  594  			local_buf[j-i] = toupper(buf[j]);
b2300b9efe1b81 Hongjie Yang          2008-10-10  595  		}
b2300b9efe1b81 Hongjie Yang          2008-10-10  596  		local_buf[j-i] = '\0';
b2300b9efe1b81 Hongjie Yang          2008-10-10  597  		if (((j - i) == 0) || ((j - i) > 8)) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  598  			rc = -ENAMETOOLONG;
b2300b9efe1b81 Hongjie Yang          2008-10-10  599  			goto seg_list_del;
^1da177e4c3f41 Linus Torvalds        2005-04-16  600  		}
b2300b9efe1b81 Hongjie Yang          2008-10-10  601  
b2300b9efe1b81 Hongjie Yang          2008-10-10  602  		rc = dcssblk_load_segment(local_buf, &seg_info);
b2300b9efe1b81 Hongjie Yang          2008-10-10  603  		if (rc < 0)
b2300b9efe1b81 Hongjie Yang          2008-10-10  604  			goto seg_list_del;
^1da177e4c3f41 Linus Torvalds        2005-04-16  605  		/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  606  		 * get a struct dcssblk_dev_info
^1da177e4c3f41 Linus Torvalds        2005-04-16  607  		 */
b2300b9efe1b81 Hongjie Yang          2008-10-10  608  		if (num_of_segments == 0) {
b2300b9efe1b81 Hongjie Yang          2008-10-10  609  			dev_info = kzalloc(sizeof(struct dcssblk_dev_info),
b2300b9efe1b81 Hongjie Yang          2008-10-10  610  					GFP_KERNEL);
^1da177e4c3f41 Linus Torvalds        2005-04-16  611  			if (dev_info == NULL) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  612  				rc = -ENOMEM;
^1da177e4c3f41 Linus Torvalds        2005-04-16  613  				goto out;
^1da177e4c3f41 Linus Torvalds        2005-04-16  614  			}
^1da177e4c3f41 Linus Torvalds        2005-04-16  615  			strcpy(dev_info->segment_name, local_buf);
b2300b9efe1b81 Hongjie Yang          2008-10-10  616  			dev_info->segment_type = seg_info->segment_type;
b2300b9efe1b81 Hongjie Yang          2008-10-10  617  			INIT_LIST_HEAD(&dev_info->seg_list);
b2300b9efe1b81 Hongjie Yang          2008-10-10  618  		}
b2300b9efe1b81 Hongjie Yang          2008-10-10  619  		list_add_tail(&seg_info->lh, &dev_info->seg_list);
b2300b9efe1b81 Hongjie Yang          2008-10-10  620  		num_of_segments++;
b2300b9efe1b81 Hongjie Yang          2008-10-10  621  		i = j;
b2300b9efe1b81 Hongjie Yang          2008-10-10  622  
b2300b9efe1b81 Hongjie Yang          2008-10-10  623  		if ((buf[j] == '\0') || (buf[j] == '\n'))
b2300b9efe1b81 Hongjie Yang          2008-10-10  624  			break;
b2300b9efe1b81 Hongjie Yang          2008-10-10  625  	}
b2300b9efe1b81 Hongjie Yang          2008-10-10  626  
b2300b9efe1b81 Hongjie Yang          2008-10-10  627  	/* no trailing colon at the end of the input */
b2300b9efe1b81 Hongjie Yang          2008-10-10  628  	if ((i > 0) && (buf[i-1] == ':')) {
b2300b9efe1b81 Hongjie Yang          2008-10-10  629  		rc = -ENAMETOOLONG;
b2300b9efe1b81 Hongjie Yang          2008-10-10  630  		goto seg_list_del;
b2300b9efe1b81 Hongjie Yang          2008-10-10  631  	}
820109fb11f24b Wolfram Sang          2022-08-18  632  	strscpy(local_buf, buf, i + 1);
b2300b9efe1b81 Hongjie Yang          2008-10-10  633  	dev_info->num_of_segments = num_of_segments;
b2300b9efe1b81 Hongjie Yang          2008-10-10  634  	rc = dcssblk_is_continuous(dev_info);
b2300b9efe1b81 Hongjie Yang          2008-10-10  635  	if (rc < 0)
b2300b9efe1b81 Hongjie Yang          2008-10-10  636  		goto seg_list_del;
b2300b9efe1b81 Hongjie Yang          2008-10-10  637  
b2300b9efe1b81 Hongjie Yang          2008-10-10  638  	dev_info->start = dcssblk_find_lowest_addr(dev_info);
b2300b9efe1b81 Hongjie Yang          2008-10-10  639  	dev_info->end = dcssblk_find_highest_addr(dev_info);
b2300b9efe1b81 Hongjie Yang          2008-10-10  640  
ef283688f54cc8 Kees Cook             2014-06-10  641  	dev_set_name(&dev_info->dev, "%s", dev_info->segment_name);
^1da177e4c3f41 Linus Torvalds        2005-04-16  642  	dev_info->dev.release = dcssblk_release_segment;
521b3d790c16fa Sebastian Ott         2012-10-01  643  	dev_info->dev.groups = dcssblk_dev_attr_groups;
^1da177e4c3f41 Linus Torvalds        2005-04-16  644  	INIT_LIST_HEAD(&dev_info->lh);
af190c53c995bf Christoph Hellwig     2024-02-15  645  	dev_info->gd = blk_alloc_disk(&lim, NUMA_NO_NODE);
74fa8f9c553f7b Christoph Hellwig     2024-02-15  646  	if (IS_ERR(dev_info->gd)) {
74fa8f9c553f7b Christoph Hellwig     2024-02-15  647  		rc = PTR_ERR(dev_info->gd);
b2300b9efe1b81 Hongjie Yang          2008-10-10  648  		goto seg_list_del;
^1da177e4c3f41 Linus Torvalds        2005-04-16  649  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  650  	dev_info->gd->major = dcssblk_major;
0692ef289f067d Christoph Hellwig     2021-05-21  651  	dev_info->gd->minors = DCSSBLK_MINORS_PER_DISK;
^1da177e4c3f41 Linus Torvalds        2005-04-16  652  	dev_info->gd->fops = &dcssblk_devops;
^1da177e4c3f41 Linus Torvalds        2005-04-16  653  	dev_info->gd->private_data = dev_info;
a41a11b4009580 Gerald Schaefer       2022-10-27  654  	dev_info->gd->flags |= GENHD_FL_NO_PART;
b2300b9efe1b81 Hongjie Yang          2008-10-10  655  
^1da177e4c3f41 Linus Torvalds        2005-04-16  656  	seg_byte_size = (dev_info->end - dev_info->start + 1);
^1da177e4c3f41 Linus Torvalds        2005-04-16  657  	set_capacity(dev_info->gd, seg_byte_size >> 9); // size in sectors
93098bf0157876 Hongjie Yang          2008-12-25  658  	pr_info("Loaded %s with total size %lu bytes and capacity %lu "
93098bf0157876 Hongjie Yang          2008-12-25  659  		"sectors\n", local_buf, seg_byte_size, seg_byte_size >> 9);
^1da177e4c3f41 Linus Torvalds        2005-04-16  660  
^1da177e4c3f41 Linus Torvalds        2005-04-16  661  	dev_info->save_pending = 0;
^1da177e4c3f41 Linus Torvalds        2005-04-16  662  	dev_info->is_shared = 1;
^1da177e4c3f41 Linus Torvalds        2005-04-16  663  	dev_info->dev.parent = dcssblk_root_dev;
^1da177e4c3f41 Linus Torvalds        2005-04-16  664  
^1da177e4c3f41 Linus Torvalds        2005-04-16  665  	/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  666  	 *get minor, add to list
^1da177e4c3f41 Linus Torvalds        2005-04-16  667  	 */
^1da177e4c3f41 Linus Torvalds        2005-04-16  668  	down_write(&dcssblk_devices_sem);
b2300b9efe1b81 Hongjie Yang          2008-10-10  669  	if (dcssblk_get_segment_by_name(local_buf)) {
04f64b5756872b Gerald Schaefer       2008-08-21  670  		rc = -EEXIST;
b2300b9efe1b81 Hongjie Yang          2008-10-10  671  		goto release_gd;
04f64b5756872b Gerald Schaefer       2008-08-21  672  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  673  	rc = dcssblk_assign_free_minor(dev_info);
b2300b9efe1b81 Hongjie Yang          2008-10-10  674  	if (rc)
b2300b9efe1b81 Hongjie Yang          2008-10-10  675  		goto release_gd;
^1da177e4c3f41 Linus Torvalds        2005-04-16  676  	sprintf(dev_info->gd->disk_name, "dcssblk%d",
d0591485e15ccd Gerald Schaefer       2009-06-12  677  		dev_info->gd->first_minor);
^1da177e4c3f41 Linus Torvalds        2005-04-16  678  	list_add_tail(&dev_info->lh, &dcssblk_devices);
^1da177e4c3f41 Linus Torvalds        2005-04-16  679  
^1da177e4c3f41 Linus Torvalds        2005-04-16  680  	if (!try_module_get(THIS_MODULE)) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  681  		rc = -ENODEV;
b2300b9efe1b81 Hongjie Yang          2008-10-10  682  		goto dev_list_del;
^1da177e4c3f41 Linus Torvalds        2005-04-16  683  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  684  	/*
^1da177e4c3f41 Linus Torvalds        2005-04-16  685  	 * register the device
^1da177e4c3f41 Linus Torvalds        2005-04-16  686  	 */
^1da177e4c3f41 Linus Torvalds        2005-04-16  687  	rc = device_register(&dev_info->dev);
b2300b9efe1b81 Hongjie Yang          2008-10-10  688  	if (rc)
521b3d790c16fa Sebastian Ott         2012-10-01  689  		goto put_dev;
^1da177e4c3f41 Linus Torvalds        2005-04-16  690  
653d7825c14993 Dan Williams          2025-02-28  691  	rc = dcssblk_setup_dax(dev_info);
fb08a1908cb119 Christoph Hellwig     2021-11-29  692  	if (rc)
fb08a1908cb119 Christoph Hellwig     2021-11-29  693  		goto out_dax;
7a2765f6e82063 Dan Williams          2017-01-26  694  
521b3d790c16fa Sebastian Ott         2012-10-01  695  	get_device(&dev_info->dev);
1a5db707c859a4 Gerald Schaefer       2021-09-27  696  	rc = device_add_disk(&dev_info->dev, dev_info->gd, NULL);
1a5db707c859a4 Gerald Schaefer       2021-09-27  697  	if (rc)
fb08a1908cb119 Christoph Hellwig     2021-11-29  698  		goto out_dax_host;
436d1bc7fe6e78 Christian Borntraeger 2007-12-04  699  
^1da177e4c3f41 Linus Torvalds        2005-04-16  700  	switch (dev_info->segment_type) {
^1da177e4c3f41 Linus Torvalds        2005-04-16  701  		case SEG_TYPE_SR:
^1da177e4c3f41 Linus Torvalds        2005-04-16  702  		case SEG_TYPE_ER:
^1da177e4c3f41 Linus Torvalds        2005-04-16  703  		case SEG_TYPE_SC:
^1da177e4c3f41 Linus Torvalds        2005-04-16  704  			set_disk_ro(dev_info->gd,1);
^1da177e4c3f41 Linus Torvalds        2005-04-16  705  			break;
^1da177e4c3f41 Linus Torvalds        2005-04-16  706  		default:
^1da177e4c3f41 Linus Torvalds        2005-04-16  707  			set_disk_ro(dev_info->gd,0);
^1da177e4c3f41 Linus Torvalds        2005-04-16  708  			break;
^1da177e4c3f41 Linus Torvalds        2005-04-16  709  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  710  	up_write(&dcssblk_devices_sem);
^1da177e4c3f41 Linus Torvalds        2005-04-16  711  	rc = count;
^1da177e4c3f41 Linus Torvalds        2005-04-16  712  	goto out;
^1da177e4c3f41 Linus Torvalds        2005-04-16  713  
fb08a1908cb119 Christoph Hellwig     2021-11-29  714  out_dax_host:
c8f40a0bccefd6 Gerald Schaefer       2023-08-10  715  	put_device(&dev_info->dev);
fb08a1908cb119 Christoph Hellwig     2021-11-29  716  	dax_remove_host(dev_info->gd);
1a5db707c859a4 Gerald Schaefer       2021-09-27  717  out_dax:
1a5db707c859a4 Gerald Schaefer       2021-09-27 @718  	kill_dax(dev_info->dax_dev);
1a5db707c859a4 Gerald Schaefer       2021-09-27 @719  	put_dax(dev_info->dax_dev);
521b3d790c16fa Sebastian Ott         2012-10-01  720  put_dev:
^1da177e4c3f41 Linus Torvalds        2005-04-16  721  	list_del(&dev_info->lh);
8b9ab62662048a Christoph Hellwig     2022-06-19  722  	put_disk(dev_info->gd);
b2300b9efe1b81 Hongjie Yang          2008-10-10  723  	list_for_each_entry(seg_info, &dev_info->seg_list, lh) {
b2300b9efe1b81 Hongjie Yang          2008-10-10  724  		segment_unload(seg_info->segment_name);
b2300b9efe1b81 Hongjie Yang          2008-10-10  725  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  726  	put_device(&dev_info->dev);
^1da177e4c3f41 Linus Torvalds        2005-04-16  727  	up_write(&dcssblk_devices_sem);
^1da177e4c3f41 Linus Torvalds        2005-04-16  728  	goto out;
b2300b9efe1b81 Hongjie Yang          2008-10-10  729  dev_list_del:
^1da177e4c3f41 Linus Torvalds        2005-04-16  730  	list_del(&dev_info->lh);
b2300b9efe1b81 Hongjie Yang          2008-10-10  731  release_gd:
8b9ab62662048a Christoph Hellwig     2022-06-19  732  	put_disk(dev_info->gd);
b2300b9efe1b81 Hongjie Yang          2008-10-10  733  	up_write(&dcssblk_devices_sem);
b2300b9efe1b81 Hongjie Yang          2008-10-10  734  seg_list_del:
b2300b9efe1b81 Hongjie Yang          2008-10-10  735  	if (dev_info == NULL)
b2300b9efe1b81 Hongjie Yang          2008-10-10  736  		goto out;
b2300b9efe1b81 Hongjie Yang          2008-10-10  737  	list_for_each_entry_safe(seg_info, temp, &dev_info->seg_list, lh) {
b2300b9efe1b81 Hongjie Yang          2008-10-10  738  		list_del(&seg_info->lh);
b2300b9efe1b81 Hongjie Yang          2008-10-10  739  		segment_unload(seg_info->segment_name);
b2300b9efe1b81 Hongjie Yang          2008-10-10  740  		kfree(seg_info);
b2300b9efe1b81 Hongjie Yang          2008-10-10  741  	}
^1da177e4c3f41 Linus Torvalds        2005-04-16  742  	kfree(dev_info);
^1da177e4c3f41 Linus Torvalds        2005-04-16  743  out:
^1da177e4c3f41 Linus Torvalds        2005-04-16  744  	kfree(local_buf);
^1da177e4c3f41 Linus Torvalds        2005-04-16  745  out_nobuf:
^1da177e4c3f41 Linus Torvalds        2005-04-16  746  	return rc;
^1da177e4c3f41 Linus Torvalds        2005-04-16  747  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  748  

:::::: The code at line 718 was first introduced by commit
:::::: 1a5db707c859a4f63c1066c5b88864d3f1c21c12 s390/block/dcssblk: add error handling support for add_disk()

:::::: TO: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
:::::: CC: Vasily Gorbik <gor@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
