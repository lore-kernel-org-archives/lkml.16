Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4457745BE3;
	Fri, 31 Jan 2025 03:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738294511; cv=none; b=iQO/JtZuy85dl7KOtvC3/wOp2dK9Lx1EsyuF014lwVWpJUoPDLNKyb+ak9j8krOupI4wcYDz2xxw/pMaUs+1hKAfXqLdmWUn+M/CT9eLdXZlITbwAWta5/hWaOqBCVmlI8Cz2DP/6N5+OrwV0CJZZXLus+3ZB9tGfNhz7kuHLaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738294511; c=relaxed/simple;
	bh=cg6bJdKfqd4yDHUF/vNdH6MAs9vW28seWl4OXdnbhH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfHiV0l1hKVmMP7j314QGMNBE5OUSUxEr2qi3uyqVT4Fny9HJD8/QFIQ5mCnU9o+HBpwvQw2RR9HKSlH49c5GhPP9fl/fLavPp/dKeAbXQGwasM+WZ6bbeJ6v7bWaPet32460GsGUEAZWj7D4k868OibPJqb62JBt5WlU922ypg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMhy6lHk; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMhy6lHk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738294508; x=1769830508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cg6bJdKfqd4yDHUF/vNdH6MAs9vW28seWl4OXdnbhH0=;
  b=SMhy6lHkaSq7kySlfx1zqC15kATgHXRXPcX+7CSRb4zrjShGJtQAxkw4
   cK+05a54MwBozIHKYB5DU/SVDW9Yjmbe5PU8EHljJKZ71fFvErpu3qy0p
   rkVWxq0feq+w3nPiVnNuRtSIy2jsXZHB0s9htIbI9w+nWmpVnbvmV/HHv
   DJOTmAONqToj2SHJKMNuINqbXTzM3yo7+wZQvZKKQHiHfw6HqJcaAF9DU
   ewI+s7TYTGJQF6+TPPK2UUyo71N7nr3OnVN7m5Ncu2X1U7oInPZYxLcww
   26J29HxQNbg3gIpzBtCbRTyxuNXtYMY9Vo+cME97j8dZTsqEJsLTW7Z96
   g==;
X-CSE-ConnectionGUID: GXK/P8FcR7mhC0vcMJaFIQ==
X-CSE-MsgGUID: 7C3r54VbS1aK1v4s8CGZkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38967063"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38967063"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 19:35:08 -0800
X-CSE-ConnectionGUID: KPPMDc6nRt69biBqFB8olw==
X-CSE-MsgGUID: ZjTA2HAcRPGHnoR5nCKV7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="114518334"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Jan 2025 19:35:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdho5-000lrL-2t;
	Fri, 31 Jan 2025 03:35:01 +0000
Date: Fri, 31 Jan 2025 11:34:31 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] WIP: drivers/base: Add virtual_device_create()
Message-ID: <202501311112.BDhClMYs-lkp@intel.com>
References: <20250130212843.659437-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130212843.659437-1-lyude@redhat.com>

Hi Lyude,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/UPDATE-20250131-052936/Lyude-Paul/rust-kernel-Add-platform-Device-from_raw/20250123-075718
base:   the 2th patch of https://lore.kernel.org/r/20250122235340.2145383-3-lyude%40redhat.com
patch link:    https://lore.kernel.org/r/20250130212843.659437-1-lyude%40redhat.com
patch subject: [PATCH] WIP: drivers/base: Add virtual_device_create()
config: arc-randconfig-001-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311112.BDhClMYs-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311112.BDhClMYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311112.BDhClMYs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/core.c:4409: warning: Excess function parameter 'class' description in 'virtual_device_create'


vim +4409 drivers/base/core.c

  4392	
  4393	/**
  4394	 * virtual_device_create - creates a virtual device and registers it with sysfs
  4395	 * @class: optional pointer to a struct class this device should be registered to
  4396	 * @drvdata: the data to be added to the device for the callbacks
  4397	 * @fmt: string for the device's name
  4398	 *
  4399	 * This function can be used to create standalone virtual devices, optionally
  4400	 * registered to a specific class. Drivers which create virtual devices can use
  4401	 * this. The device will live in /sys/devices/virtual.
  4402	 *
  4403	 * A pointer to the struct device will be returned from the call. Any further
  4404	 * sysfs files that might be required can be created using this pointer.
  4405	 *
  4406	 * Returns &struct device pointer on success or ERR_PTR() on error.
  4407	 */
  4408	struct device *virtual_device_create(void *drvdata, const char *fmt, ...)
> 4409	{
  4410		va_list vargs;
  4411		struct device *dev;
  4412	
  4413		va_start(vargs, fmt);
  4414		dev = device_create_groups_vargs(NULL, NULL, 0, drvdata, NULL,
  4415						 fmt, vargs);
  4416		va_end(vargs);
  4417		return dev;
  4418	}
  4419	EXPORT_SYMBOL_GPL(virtual_device_create);
  4420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
