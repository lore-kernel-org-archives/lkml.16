Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5055C15098A
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 05:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738216302; cv=none; b=fR89e3PuULEBO092WmdBu7AU0TWAIVZm0VIVtKOvxzGdC4meaJRBLt23dtR5kVzJZxuPJ15cJr/A7yAFhZTISc3GnSh0Yo4R+D6nPhNeZiwpWDk9ba8onz4TWOz+qI/ECV0ZASwoJ/MTYqqN4hnMlLmCT0+91fzQSYHFbXfHB70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738216302; c=relaxed/simple;
	bh=gx2gNCXXob56NNw05t32Ay1x2X0k8FVr1JMuJ4YZ+s4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oWUpUiDtfUkRUSKuBCIJ2ydP9i1FoyBc+SX44oXVts7kGkpwuwBZEEnXf25aTM/rKHzqGd59an+xjMV6ccEJuFtgXwgr57E9dFOXB7oyl3xZ3beW58SehAFAd1dPFYEw1cU3iY9uZ4r9BKhiISixJfWgYzI0axuVEYh7UbxEv0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPD1O15s; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPD1O15s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738216300; x=1769752300;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gx2gNCXXob56NNw05t32Ay1x2X0k8FVr1JMuJ4YZ+s4=;
  b=dPD1O15sJn21MMZ6Oz+CqOewlPHofGL7/CWrWnELsjafdwvXs366TOO3
   uRoX00GV2MISvJBitIlL1a+KPGaaOK29eL4a3DJD/IyN95QhaqIoPzz5h
   L2SyNksBHTASqZN6EeilcnnWg76Ovc5Ru0lk9qEklQCkiwhVibs/JpUWN
   9xmx7+7doweKxb5CSBppPgTQf1jpB01Xsa8NmvsFwPbvt336Lbi+jRgmF
   ZHCvrVdKNtxsjaRbctmCDxS48OUqOWLbG3Z9DvbEPskgaGxtRBZ0+nNs1
   c5z0BZCt3y3f4Wee03Qs0lpVozLy515arAa//+ef9ygWlCdl5MvfGyBNT
   w==;
X-CSE-ConnectionGUID: m3nNUbhZTcGZeYE/J0VTKA==
X-CSE-MsgGUID: 6oI2jX4MQLS4/205Bghs9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50169670"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50169670"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 21:51:40 -0800
X-CSE-ConnectionGUID: ZL2bYIhsQmqDkUmTI6hTUw==
X-CSE-MsgGUID: 3FsUHnGNQTCGU/4Y1HCwpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132502977"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jan 2025 21:51:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdNSi-000jir-1X;
	Thu, 30 Jan 2025 05:51:36 +0000
Date: Thu, 30 Jan 2025 13:50:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/mtd/mtdpart.c:985:34: warning: '%s' directive argument is
 null
Message-ID: <202501301350.XWliXFDW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   72deda0abee6e705ae71a93f69f55e33be5bca5c
commit: 239a5791ffd5559f51815df442c4dbbe7fc21ade dynamic_debug: allow to work if debugfs is disabled
date:   5 years ago
config: um-randconfig-r113-20240905 (https://download.01.org/0day-ci/archive/20250130/202501301350.XWliXFDW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301350.XWliXFDW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301350.XWliXFDW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   In file included from include/linux/kernel.h:15,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/mtd/mtdpart.c:10:
   drivers/mtd/mtdpart.c: In function 'parse_mtd_partitions':
>> drivers/mtd/mtdpart.c:985:34: warning: '%s' directive argument is null [-Wformat-overflow=]
     985 |                         pr_debug("%s: got parser %s\n", master->name,
         |                                  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:288:21: note: in definition of macro 'pr_fmt'
     288 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/dynamic_debug.h:143:9: note: in expansion of macro '__dynamic_func_call'
     143 |         __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:153:9: note: in expansion of macro '_dynamic_func_call'
     153 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:335:9: note: in expansion of macro 'dynamic_pr_debug'
     335 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/mtd/mtdpart.c:985:25: note: in expansion of macro 'pr_debug'
     985 |                         pr_debug("%s: got parser %s\n", master->name,
         |                         ^~~~~~~~
   drivers/mtd/mtdpart.c:985:50: note: format string is defined here
     985 |                         pr_debug("%s: got parser %s\n", master->name,
         |                                                  ^~


vim +985 drivers/mtd/mtdpart.c

5b644aa012f67f Rafał Miłecki           2018-03-14   941  
ad274cecdbce18 Artem Bityutskiy        2011-06-08   942  /**
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   943   * parse_mtd_partitions - parse and register MTD partitions
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   944   *
ad274cecdbce18 Artem Bityutskiy        2011-06-08   945   * @master: the master partition (describes whole MTD device)
ad274cecdbce18 Artem Bityutskiy        2011-06-08   946   * @types: names of partition parsers to try or %NULL
c7975330154af1 Dmitry Eremin-Solenikov 2011-06-10   947   * @data: MTD partition parser-specific data
ad274cecdbce18 Artem Bityutskiy        2011-06-08   948   *
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   949   * This function tries to find & register partitions on MTD device @master. It
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   950   * uses MTD partition parsers, specified in @types. However, if @types is %NULL,
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   951   * then the default list of parsers is used. The default list contains only the
d26c87d64eff27 Dmitry Eremin-Solenikov 2011-05-29   952   * "cmdlinepart" and "ofpart" parsers ATM.
c51803ddba10d8 Huang Shijie            2012-08-18   953   * Note: If there are more then one parser in @types, the kernel only takes the
c51803ddba10d8 Huang Shijie            2012-08-18   954   * partitions parsed out by the first parser.
ad274cecdbce18 Artem Bityutskiy        2011-06-08   955   *
ad274cecdbce18 Artem Bityutskiy        2011-06-08   956   * This function may return:
ad274cecdbce18 Artem Bityutskiy        2011-06-08   957   * o a negative error code in case of failure
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   958   * o number of found partitions otherwise
ad274cecdbce18 Artem Bityutskiy        2011-06-08   959   */
26a4734623e4f0 Artem Bityutskiy        2013-03-11   960  int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
c7975330154af1 Dmitry Eremin-Solenikov 2011-06-10   961  			 struct mtd_part_parser_data *data)
^1da177e4c3f41 Linus Torvalds          2005-04-16   962  {
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   963  	struct mtd_partitions pparts = { };
^1da177e4c3f41 Linus Torvalds          2005-04-16   964  	struct mtd_part_parser *parser;
5a2415b0769233 Brian Norris            2015-10-11   965  	int ret, err = 0;
^1da177e4c3f41 Linus Torvalds          2005-04-16   966  
5c4eefbd5bb82a Dmitry Eremin-Solenikov 2011-06-02   967  	if (!types)
76a832254ab055 Rafał Miłecki           2018-07-13   968  		types = mtd_is_partition(master) ? default_subpartition_types :
76a832254ab055 Rafał Miłecki           2018-07-13   969  			default_mtd_part_types;
5c4eefbd5bb82a Dmitry Eremin-Solenikov 2011-06-02   970  
5a2415b0769233 Brian Norris            2015-10-11   971  	for ( ; *types; types++) {
5b644aa012f67f Rafał Miłecki           2018-03-14   972  		/*
5b644aa012f67f Rafał Miłecki           2018-03-14   973  		 * ofpart is a special type that means OF partitioning info
5b644aa012f67f Rafał Miłecki           2018-03-14   974  		 * should be used. It requires a bit different logic so it is
5b644aa012f67f Rafał Miłecki           2018-03-14   975  		 * handled in a separated function.
5b644aa012f67f Rafał Miłecki           2018-03-14   976  		 */
5b644aa012f67f Rafał Miłecki           2018-03-14   977  		if (!strcmp(*types, "ofpart")) {
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   978  			ret = mtd_part_of_parse(master, &pparts);
5b644aa012f67f Rafał Miłecki           2018-03-14   979  		} else {
5b644aa012f67f Rafał Miłecki           2018-03-14   980  			pr_debug("%s: parsing partitions %s\n", master->name,
5b644aa012f67f Rafał Miłecki           2018-03-14   981  				 *types);
5531ae4818fb04 Brian Norris            2015-12-04   982  			parser = mtd_part_parser_get(*types);
^1da177e4c3f41 Linus Torvalds          2005-04-16   983  			if (!parser && !request_module("%s", *types))
5531ae4818fb04 Brian Norris            2015-12-04   984  				parser = mtd_part_parser_get(*types);
8e2c992b59fcb5 Michal Suchanek         2015-08-18  @985  			pr_debug("%s: got parser %s\n", master->name,
8e2c992b59fcb5 Michal Suchanek         2015-08-18   986  				parser ? parser->name : NULL);
7c802fbd541448 Artem Bityutskiy        2011-05-17   987  			if (!parser)
^1da177e4c3f41 Linus Torvalds          2005-04-16   988  				continue;
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   989  			ret = mtd_part_do_parse(parser, master, &pparts, data);
5b644aa012f67f Rafał Miłecki           2018-03-14   990  			if (ret <= 0)
5b644aa012f67f Rafał Miłecki           2018-03-14   991  				mtd_part_parser_put(parser);
5b644aa012f67f Rafał Miłecki           2018-03-14   992  		}
01f9c7240a900d Brian Norris            2017-05-23   993  		/* Found partitions! */
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   994  		if (ret > 0) {
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   995  			err = add_mtd_partitions(master, pparts.parts,
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   996  						 pparts.nr_parts);
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   997  			mtd_part_parser_cleanup(&pparts);
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   998  			return err ? err : pparts.nr_parts;
5ac67ce36cfe38 Rafał Miłecki           2018-03-27   999  		}
5a2415b0769233 Brian Norris            2015-10-11  1000  		/*
5a2415b0769233 Brian Norris            2015-10-11  1001  		 * Stash the first error we see; only report it if no parser
5a2415b0769233 Brian Norris            2015-10-11  1002  		 * succeeds
5a2415b0769233 Brian Norris            2015-10-11  1003  		 */
5a2415b0769233 Brian Norris            2015-10-11  1004  		if (ret < 0 && !err)
5a2415b0769233 Brian Norris            2015-10-11  1005  			err = ret;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1006  	}
5a2415b0769233 Brian Norris            2015-10-11  1007  	return err;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1008  }
5daa7b21496aeb Roman Tereshonkov       2010-09-17  1009  

:::::: The code at line 985 was first introduced by commit
:::::: 8e2c992b59fcb5e56e3667f5c30c7d26fbbf14a2 mtd: mtdpart: add debug prints to partition parser.

:::::: TO: Michal Suchanek <hramrach@gmail.com>
:::::: CC: Brian Norris <computersforpeace@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
