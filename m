Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8801B040B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 21:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745531883; cv=none; b=o6ZQXjWKK2legzFx5+SBSv73z3ONxXIoeQvGx1eDaNupT8rlKJWegD+lxMRSaHH6kex8+wUhyBsjIsLfKUKeeC/+q91kh8UrOcoU9jHDtagdw8VA+mL0NyuRy775otNSuWhv1pBtWtJ+ay3xROFiW91YXfj5O7XykqL3jjzuNPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745531883; c=relaxed/simple;
	bh=vTOXVRdShiBH+qH7hnNXtelBBmdxqmnw24CH4iY82JM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tet9Q+W98oRfSzsRugmafg++dnB8H61lRmiybt3PY9ZlJyWXmE8aHC3aj+eeZ6zVTRrk7E8M8f8Lwv1uASl/UajxPs8Mv/yowzbwE3AqBIFCm+Y3aoof7PaPRJV5KakDb2b15DHvrx39KKu9UNViSDMt3bxFcGjAOuHxtfo4m+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fSB8TfUA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fSB8TfUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745531881; x=1777067881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vTOXVRdShiBH+qH7hnNXtelBBmdxqmnw24CH4iY82JM=;
  b=fSB8TfUAe43LaPB3a1zUjyZImpq24Pcwhy+9fjQZe+342DNTXtu7FTAJ
   ILq/s1WNqV7CsVriKn42sRKyjPaQ7Qf02o6OLoDUJ8i2ANMrMqxXUMK7e
   Pe2v37OsAkB9DBoNMUdbMc7SFd/MroH0rkNURhAX4T9xc1cRqpsrPU6ND
   X89hPpSpZ2vVrTOhLmWUnegHzBJq86I7BKYI3mQamNUyyhX74WkGAoWiq
   q0mVc6UR8q1sWnKms6ssZNxUV/LODQ4XExgtuSi/jm4b1rK7HTd9Mmhsz
   2bCqRJSTPBWuHk/qE/KHOocln1redga1wka1g5ThjgOkNia/sjznLRkf5
   w==;
X-CSE-ConnectionGUID: VyAK/DmnT3amOHv9B/sYMg==
X-CSE-MsgGUID: reh5QdNTTYuNyGmh5srFqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="58550818"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="58550818"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 14:58:00 -0700
X-CSE-ConnectionGUID: Ei6XVoexSBuDdgio483g1g==
X-CSE-MsgGUID: CorPKcBzRs66M43va4HYkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="155961927"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Apr 2025 14:57:58 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u84Zv-0004cn-2X;
	Thu, 24 Apr 2025 21:57:55 +0000
Date: Fri, 25 Apr 2025 05:57:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: drivers/s390/block/dcssblk.c:417: undefined reference to `kill_dax'
Message-ID: <202504250530.hiUs8Un2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e72e9e6933071fbbb3076811d3a0cc20e8720a5b
commit: 653d7825c149932f254e0cd22153ccc945e7e545 dcssblk: mark DAX broken, remove FS_DAX_LIMITED support
date:   5 weeks ago
config: s390-randconfig-r054-20250424 (https://download.01.org/0day-ci/archive/20250425/202504250530.hiUs8Un2-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250530.hiUs8Un2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250530.hiUs8Un2-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/s390/block/dcssblk.o: in function `dcssblk_shared_store':
>> drivers/s390/block/dcssblk.c:417: undefined reference to `kill_dax'
>> s390-linux-ld: drivers/s390/block/dcssblk.c:418: undefined reference to `put_dax'
   s390-linux-ld: drivers/s390/block/dcssblk.o: in function `dcssblk_remove_store':
   drivers/s390/block/dcssblk.c:803: undefined reference to `kill_dax'
   s390-linux-ld: drivers/s390/block/dcssblk.c:804: undefined reference to `put_dax'
   s390-linux-ld: drivers/s390/block/dcssblk.o: in function `dcssblk_add_store':
   drivers/s390/block/dcssblk.c:718: undefined reference to `kill_dax'
   s390-linux-ld: drivers/s390/block/dcssblk.c:719: undefined reference to `put_dax'


vim +417 drivers/s390/block/dcssblk.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  344  
^1da177e4c3f41 Linus Torvalds    2005-04-16  345  static ssize_t
e404e274f62665 Yani Ioannou      2005-05-17  346  dcssblk_shared_store(struct device *dev, struct device_attribute *attr, const char *inbuf, size_t count)
^1da177e4c3f41 Linus Torvalds    2005-04-16  347  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  348  	struct dcssblk_dev_info *dev_info;
b2300b9efe1b81 Hongjie Yang      2008-10-10  349  	struct segment_info *entry, *temp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  350  	int rc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  351  
ded77fb4dfcd6f Hongjie Yang      2008-07-14  352  	if ((count > 1) && (inbuf[1] != '\n') && (inbuf[1] != '\0'))
^1da177e4c3f41 Linus Torvalds    2005-04-16  353  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  354  	down_write(&dcssblk_devices_sem);
^1da177e4c3f41 Linus Torvalds    2005-04-16  355  	dev_info = container_of(dev, struct dcssblk_dev_info, dev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  356  	if (atomic_read(&dev_info->use_count)) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  357  		rc = -EBUSY;
^1da177e4c3f41 Linus Torvalds    2005-04-16  358  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  359  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  360  	if (inbuf[0] == '1') {
b2300b9efe1b81 Hongjie Yang      2008-10-10  361  		/* reload segments in shared mode */
b2300b9efe1b81 Hongjie Yang      2008-10-10  362  		list_for_each_entry(entry, &dev_info->seg_list, lh) {
b2300b9efe1b81 Hongjie Yang      2008-10-10  363  			rc = segment_modify_shared(entry->segment_name,
^1da177e4c3f41 Linus Torvalds    2005-04-16  364  						SEGMENT_SHARED);
^1da177e4c3f41 Linus Torvalds    2005-04-16  365  			if (rc < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  366  				BUG_ON(rc == -EINVAL);
444f0e5489e7ac Gerald Schaefer   2007-02-05  367  				if (rc != -EAGAIN)
^1da177e4c3f41 Linus Torvalds    2005-04-16  368  					goto removeseg;
b2300b9efe1b81 Hongjie Yang      2008-10-10  369  			}
b2300b9efe1b81 Hongjie Yang      2008-10-10  370  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  371  		dev_info->is_shared = 1;
^1da177e4c3f41 Linus Torvalds    2005-04-16  372  		switch (dev_info->segment_type) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  373  		case SEG_TYPE_SR:
^1da177e4c3f41 Linus Torvalds    2005-04-16  374  		case SEG_TYPE_ER:
^1da177e4c3f41 Linus Torvalds    2005-04-16  375  		case SEG_TYPE_SC:
^1da177e4c3f41 Linus Torvalds    2005-04-16  376  			set_disk_ro(dev_info->gd, 1);
^1da177e4c3f41 Linus Torvalds    2005-04-16  377  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  378  	} else if (inbuf[0] == '0') {
b2300b9efe1b81 Hongjie Yang      2008-10-10  379  		/* reload segments in exclusive mode */
^1da177e4c3f41 Linus Torvalds    2005-04-16  380  		if (dev_info->segment_type == SEG_TYPE_SC) {
93098bf0157876 Hongjie Yang      2008-12-25  381  			pr_err("DCSS %s is of type SC and cannot be "
93098bf0157876 Hongjie Yang      2008-12-25  382  			       "loaded as exclusive-writable\n",
93098bf0157876 Hongjie Yang      2008-12-25  383  			       dev_info->segment_name);
^1da177e4c3f41 Linus Torvalds    2005-04-16  384  			rc = -EINVAL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  385  			goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  386  		}
b2300b9efe1b81 Hongjie Yang      2008-10-10  387  		list_for_each_entry(entry, &dev_info->seg_list, lh) {
b2300b9efe1b81 Hongjie Yang      2008-10-10  388  			rc = segment_modify_shared(entry->segment_name,
^1da177e4c3f41 Linus Torvalds    2005-04-16  389  						   SEGMENT_EXCLUSIVE);
^1da177e4c3f41 Linus Torvalds    2005-04-16  390  			if (rc < 0) {
^1da177e4c3f41 Linus Torvalds    2005-04-16  391  				BUG_ON(rc == -EINVAL);
444f0e5489e7ac Gerald Schaefer   2007-02-05  392  				if (rc != -EAGAIN)
^1da177e4c3f41 Linus Torvalds    2005-04-16  393  					goto removeseg;
b2300b9efe1b81 Hongjie Yang      2008-10-10  394  			}
b2300b9efe1b81 Hongjie Yang      2008-10-10  395  		}
^1da177e4c3f41 Linus Torvalds    2005-04-16  396  		dev_info->is_shared = 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  397  		set_disk_ro(dev_info->gd, 0);
^1da177e4c3f41 Linus Torvalds    2005-04-16  398  	} else {
^1da177e4c3f41 Linus Torvalds    2005-04-16  399  		rc = -EINVAL;
^1da177e4c3f41 Linus Torvalds    2005-04-16  400  		goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  401  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  402  	rc = count;
^1da177e4c3f41 Linus Torvalds    2005-04-16  403  	goto out;
^1da177e4c3f41 Linus Torvalds    2005-04-16  404  
^1da177e4c3f41 Linus Torvalds    2005-04-16  405  removeseg:
93098bf0157876 Hongjie Yang      2008-12-25  406  	pr_err("DCSS device %s is removed after a failed access mode "
93098bf0157876 Hongjie Yang      2008-12-25  407  	       "change\n", dev_info->segment_name);
b2300b9efe1b81 Hongjie Yang      2008-10-10  408  	temp = entry;
b2300b9efe1b81 Hongjie Yang      2008-10-10  409  	list_for_each_entry(entry, &dev_info->seg_list, lh) {
b2300b9efe1b81 Hongjie Yang      2008-10-10  410  		if (entry != temp)
b2300b9efe1b81 Hongjie Yang      2008-10-10  411  			segment_unload(entry->segment_name);
b2300b9efe1b81 Hongjie Yang      2008-10-10  412  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  413  	list_del(&dev_info->lh);
789dd8cb1eb150 Gerald Schaefer   2023-08-22  414  	up_write(&dcssblk_devices_sem);
^1da177e4c3f41 Linus Torvalds    2005-04-16  415  
c8f40a0bccefd6 Gerald Schaefer   2023-08-10  416  	dax_remove_host(dev_info->gd);
7a2765f6e82063 Dan Williams      2017-01-26 @417  	kill_dax(dev_info->dax_dev);
7a2765f6e82063 Dan Williams      2017-01-26 @418  	put_dax(dev_info->dax_dev);
^1da177e4c3f41 Linus Torvalds    2005-04-16  419  	del_gendisk(dev_info->gd);
8b9ab62662048a Christoph Hellwig 2022-06-19  420  	put_disk(dev_info->gd);
0b60f9ead5d481 Tejun Heo         2014-02-03  421  
0b60f9ead5d481 Tejun Heo         2014-02-03  422  	if (device_remove_file_self(dev, attr)) {
0b60f9ead5d481 Tejun Heo         2014-02-03  423  		device_unregister(dev);
0b60f9ead5d481 Tejun Heo         2014-02-03  424  		put_device(dev);
0b60f9ead5d481 Tejun Heo         2014-02-03  425  	}
0b60f9ead5d481 Tejun Heo         2014-02-03  426  	return rc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  427  out:
^1da177e4c3f41 Linus Torvalds    2005-04-16  428  	up_write(&dcssblk_devices_sem);
^1da177e4c3f41 Linus Torvalds    2005-04-16  429  	return rc;
^1da177e4c3f41 Linus Torvalds    2005-04-16  430  }
521b3d790c16fa Sebastian Ott     2012-10-01  431  static DEVICE_ATTR(shared, S_IWUSR | S_IRUSR, dcssblk_shared_show,
521b3d790c16fa Sebastian Ott     2012-10-01  432  		   dcssblk_shared_store);
^1da177e4c3f41 Linus Torvalds    2005-04-16  433  

:::::: The code at line 417 was first introduced by commit
:::::: 7a2765f6e82063f348ebce78c28eceff741689d4 dcssblk: add dax_operations support

:::::: TO: Dan Williams <dan.j.williams@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
