Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DDA20E034
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638080; cv=none; b=cgn1vi4pvMpCAWKoWZGOPJ5urw9rTuudzci3aUt5wtko9jJeDAwOu6C7lL0+4MysUGhYMDLodgK+mFupHNVqXyiaJUpCMuOjCZ8F6VrT8XWuoqBrlYe62qO+LlICC9ml0IoDZijkJyqKI41nxDJG6E28qmZhWpi4bYWZdhaWKZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638080; c=relaxed/simple;
	bh=kVdHzQBgB53jpSCE7iH/Z1xba4HCOoFk0p585OMCppE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gybi6YVU6WSHQYI2IwqjzLVpWOQ1pAwDV7+Hc0ydctCuxwHu+M1c9gNPM/SxhPvIidYPrgfcpdke4ZJivd8G5KPOYskRM4Jn9C1zFtKoxuWvHVX9ABwEhX5kanO59KXowyeWIhhLaSls7fnfZY3O6DTvjtAFa3/xPvrnubEVc5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3l/hwyU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3l/hwyU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748638078; x=1780174078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kVdHzQBgB53jpSCE7iH/Z1xba4HCOoFk0p585OMCppE=;
  b=n3l/hwyUkjvy8YO2vKjP/sTu7kI5FwPXmGhphB8OFyexb+5fyfUAJs8S
   TE6k5a0Y3Lkuov9D7cdERfmb2JQqS8dgQ7MsPq1JZDhOslB5IUodHnchG
   FVbX7Ywi2NtWWbzOMCV884vKUYKCRTjwexip8S4pBMP+M4JKR8awN/PDh
   UTKxLKdZFNdgJlL0Z5BA+xauLD+iZzFw4orDQ6V+ooeZJ1MlCmtWYEMd4
   LozS7Fc5rTG8+6ySPnaI+QWCOEQ5qo7gsjn+2raeFNa6Ptb7xl6/Bf9HX
   lOIU8r/4bmwXb+7B04DQNZBQqLnrDbuGEaKkJzGrGBe5wGRcMiS9CZYM0
   Q==;
X-CSE-ConnectionGUID: H5OGcPnORluFAa3XojCXLg==
X-CSE-MsgGUID: FpGusTVYQpmY5on/E8iX3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="38369549"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="38369549"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 13:47:58 -0700
X-CSE-ConnectionGUID: TClzUYvGQBqcagOv8GjclQ==
X-CSE-MsgGUID: CHsgVe2QQVWp6IIPmUYPJQ==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; 
   d="scan'208";a="144311295"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 May 2025 13:47:56 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uL6du-000Xx0-0k;
	Fri, 30 May 2025 20:47:54 +0000
Date: Sat, 31 May 2025 04:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>, Kees Cook <kees@kernel.org>
Subject: drivers/iio/accel/sca3000.c:1447:12: warning: stack frame size
 (8472) exceeds limit (8192) in 'sca3000_probe'
Message-ID: <202505310435.F9RU4dQi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8477ab143069c6b05d6da4a8184ded8b969240f5
commit: 315ad8780a129e82e2c5c65ee6e970d91a577acb kbuild: Add AutoFDO support for Clang build
date:   7 months ago
config: x86_64-randconfig-161-20250531 (https://download.01.org/0day-ci/archive/20250531/202505310435.F9RU4dQi-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505310435.F9RU4dQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505310435.F9RU4dQi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/accel/sca3000.c:15:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/iio/accel/sca3000.c:1447:12: warning: stack frame size (8472) exceeds limit (8192) in 'sca3000_probe' [-Wframe-larger-than]
    1447 | static int sca3000_probe(struct spi_device *spi)
         |            ^
   2 warnings generated.


vim +/sca3000_probe +1447 drivers/iio/accel/sca3000.c

6fe8135fccd66a drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-05-18  1446  
4ae1c61ff2ba4f drivers/staging/iio/accel/sca3000_core.c Bill Pemberton     2012-11-19 @1447  static int sca3000_probe(struct spi_device *spi)
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1448  {
d2fffd6c2fd60f drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-10-14  1449  	int ret;
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1450  	struct sca3000_state *st;
83f0422dc6a16f drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-06-27  1451  	struct iio_dev *indio_dev;
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1452  
0189d93fdf82cd drivers/staging/iio/accel/sca3000_core.c Sachin Kamat       2013-08-24  1453  	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
0189d93fdf82cd drivers/staging/iio/accel/sca3000_core.c Sachin Kamat       2013-08-24  1454  	if (!indio_dev)
0189d93fdf82cd drivers/staging/iio/accel/sca3000_core.c Sachin Kamat       2013-08-24  1455  		return -ENOMEM;
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1456  
03bda05d9ced3a drivers/staging/iio/accel/sca3000_core.c Dan Carpenter      2011-06-29  1457  	st = iio_priv(indio_dev);
83f0422dc6a16f drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-06-27  1458  	spi_set_drvdata(spi, indio_dev);
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1459  	st->us = spi;
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1460  	mutex_init(&st->lock);
25888dc51163a5 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-05-18  1461  	st->info = &sca3000_spi_chip_info_tbl[spi_get_device_id(spi)
25888dc51163a5 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-05-18  1462  					      ->driver_data];
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1463  
83f0422dc6a16f drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-06-27  1464  	indio_dev->name = spi_get_device_id(spi)->name;
83f0422dc6a16f drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-06-27  1465  	indio_dev->info = &sca3000_info;
bb0090e99b0194 drivers/staging/iio/accel/sca3000_core.c Peter Meerwald     2014-01-13  1466  	if (st->info->temp_output) {
bb0090e99b0194 drivers/staging/iio/accel/sca3000_core.c Peter Meerwald     2014-01-13  1467  		indio_dev->channels = sca3000_channels_with_temp;
bb0090e99b0194 drivers/staging/iio/accel/sca3000_core.c Peter Meerwald     2014-01-13  1468  		indio_dev->num_channels =
bb0090e99b0194 drivers/staging/iio/accel/sca3000_core.c Peter Meerwald     2014-01-13  1469  			ARRAY_SIZE(sca3000_channels_with_temp);
bb0090e99b0194 drivers/staging/iio/accel/sca3000_core.c Peter Meerwald     2014-01-13  1470  	} else {
83f0422dc6a16f drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-06-27  1471  		indio_dev->channels = sca3000_channels;
83f0422dc6a16f drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-06-27  1472  		indio_dev->num_channels = ARRAY_SIZE(sca3000_channels);
bb0090e99b0194 drivers/staging/iio/accel/sca3000_core.c Peter Meerwald     2014-01-13  1473  	}
83f0422dc6a16f drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-06-27  1474  	indio_dev->modes = INDIO_DIRECT_MODE;
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1475  
e03ed893e2cf73 drivers/iio/accel/sca3000.c              Alexandru Ardelean 2021-02-15  1476  	ret = devm_iio_kfifo_buffer_setup(&spi->dev, indio_dev,
e03ed893e2cf73 drivers/iio/accel/sca3000.c              Alexandru Ardelean 2021-02-15  1477  					  &sca3000_ring_setup_ops);
da2d54494c5633 drivers/iio/accel/sca3000.c              Christophe JAILLET 2018-04-08  1478  	if (ret)
da2d54494c5633 drivers/iio/accel/sca3000.c              Christophe JAILLET 2018-04-08  1479  		return ret;
d2fffd6c2fd60f drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-10-14  1480  
3e2c96eab92783 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-10-12  1481  	if (spi->irq) {
25888dc51163a5 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-05-18  1482  		ret = request_threaded_irq(spi->irq,
25888dc51163a5 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-05-18  1483  					   NULL,
25888dc51163a5 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-05-18  1484  					   &sca3000_event_handler,
a91aff1c09fc41 drivers/staging/iio/accel/sca3000_core.c Lars-Peter Clausen 2012-07-02  1485  					   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
25888dc51163a5 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-05-18  1486  					   "sca3000",
83f0422dc6a16f drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-06-27  1487  					   indio_dev);
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1488  		if (ret)
9a4936dc89a34e drivers/staging/iio/accel/sca3000.c      Jonathan Cameron   2016-10-08  1489  			return ret;
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1490  	}
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1491  	ret = sca3000_clean_setup(st);
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1492  	if (ret)
25888dc51163a5 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-05-18  1493  		goto error_free_irq;
7ab9fa0052878c drivers/staging/iio/accel/sca3000.c      Jonathan Cameron   2016-10-08  1494  
7ab9fa0052878c drivers/staging/iio/accel/sca3000.c      Jonathan Cameron   2016-10-08  1495  	ret = sca3000_print_rev(indio_dev);
7ab9fa0052878c drivers/staging/iio/accel/sca3000.c      Jonathan Cameron   2016-10-08  1496  	if (ret)
7ab9fa0052878c drivers/staging/iio/accel/sca3000.c      Jonathan Cameron   2016-10-08  1497  		goto error_free_irq;
7ab9fa0052878c drivers/staging/iio/accel/sca3000.c      Jonathan Cameron   2016-10-08  1498  
9a4936dc89a34e drivers/staging/iio/accel/sca3000.c      Jonathan Cameron   2016-10-08  1499  	return iio_device_register(indio_dev);
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1500  
25888dc51163a5 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-05-18  1501  error_free_irq:
3e2c96eab92783 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-10-12  1502  	if (spi->irq)
83f0422dc6a16f drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2011-06-27  1503  		free_irq(spi->irq, indio_dev);
9a4936dc89a34e drivers/staging/iio/accel/sca3000.c      Jonathan Cameron   2016-10-08  1504  
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1505  	return ret;
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1506  }
574fb258d63658 drivers/staging/iio/accel/sca3000_core.c Jonathan Cameron   2009-08-18  1507  

:::::: The code at line 1447 was first introduced by commit
:::::: 4ae1c61ff2ba4fea4e4c1a045cb1f34520608789 staging: iio: remove use of __devinit

:::::: TO: Bill Pemberton <wfp5p@virginia.edu>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
