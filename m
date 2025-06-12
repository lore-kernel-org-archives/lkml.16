Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF391DACB1;
	Thu, 12 Jun 2025 18:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749752149; cv=none; b=XRSyaJerWimisSXeMTQ7FVkaw9P84bo7K9tMH2kDtRk63QCLezkkAltrmAxeAuhmByQZ5Arts6e/sfHVyIt+vf/ujwwjjE6HnqafRWvFc7sOKybnAcxQINIDueqBSm8oNNPk9yk7ukjtvYjNAup3eBPep2vPeTklY4HmMEjUpV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749752149; c=relaxed/simple;
	bh=4OofUxrS1VHn2NikWkMKBtNsbAo1AC+xDhX2JTKKUZU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d79wF9Igm9frZZibc3/+iUhmP/QF3rGrQoFyeLnheFQe8uLA9ilieYHm2YDtfr7RA/dq9+aEuMkAoUgH7EyVEaRTz/6+62MBwC9ID4CHO3GcnqJVfAHZvsT2ijr/9PsVIiUkbjj6GmDV1mHxIqVo2PWE3DfnpAA+jtja1+M2Nqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QD3mk8JJ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QD3mk8JJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749752148; x=1781288148;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4OofUxrS1VHn2NikWkMKBtNsbAo1AC+xDhX2JTKKUZU=;
  b=QD3mk8JJIFzzkgnZdWtI/u612YZzpHaK2oMQA3cqPe/QzxshiXE2pF+9
   8di4GBJxMvrCGNOF6R0KnBhymCclbnU692LYJVSUCHFQg5qc1Dcw3f+db
   4i3cMIVstIZQk4Ua84c34bpllfexHE8FB49ITmk6Wn1CPbgCk3G892mlk
   k/qc/1Vyz25lz1lTLMV0BzO0ZLU0d37a2/EsMGD4NZF1ODGbedXUfPch5
   w/5CWMfT7D5PpZ6x4TkUk67gs+NwybepHhRxCtJundu2vHrBC7PCsU48E
   dYdxCtWumMmdeXhXtv8cPfSxHL0yXO5Gj5tZzxGkskx7JYff6F67Mm16R
   A==;
X-CSE-ConnectionGUID: tFCkgajiRpO7GZrhcpt3Og==
X-CSE-MsgGUID: PLDy0RCIRdejemds94WQ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="62228330"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="62228330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 11:15:47 -0700
X-CSE-ConnectionGUID: jdO72gOWSsyQQXv8GZky7Q==
X-CSE-MsgGUID: dZNBe+geS7+6msjZDxxpBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; 
   d="scan'208";a="147511276"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jun 2025 11:15:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPmSi-000BrG-2m;
	Thu, 12 Jun 2025 18:15:40 +0000
Date: Fri, 13 Jun 2025 02:15:14 +0800
From: kernel test robot <lkp@intel.com>
To: Chiang Brian <chiang.brian@inventec.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, Chiang Brian <chiang.brian@inventec.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Message-ID: <202506130217.6OQ8zSf5-lkp@intel.com>
References: <20250610102556.236300-3-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610102556.236300-3-chiang.brian@inventec.com>

Hi Chiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on groeck-staging/hwmon-next krzk-dt/for-next linus/master v6.16-rc1 next-20250612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chiang-Brian/hwmon-pmbus-tps53679-Add-support-for-TPS53685/20250610-192612
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250610102556.236300-3-chiang.brian%40inventec.com
patch subject: [PATCH v9 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
config: s390-randconfig-r073-20250611 (https://download.01.org/0day-ci/archive/20250613/202506130217.6OQ8zSf5-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506130217.6OQ8zSf5-lkp@intel.com/

smatch warnings:
drivers/hwmon/pmbus/tps53679.c:288 tps53679_probe() warn: inconsistent indenting

vim +288 drivers/hwmon/pmbus/tps53679.c

   249	
   250	static int tps53679_probe(struct i2c_client *client)
   251	{
   252		struct device *dev = &client->dev;
   253		struct pmbus_driver_info *info;
   254		enum chips chip_id;
   255	
   256		if (dev->of_node)
   257			chip_id = (uintptr_t)of_device_get_match_data(dev);
   258		else
   259			chip_id = i2c_match_id(tps53679_id, client)->driver_data;
   260	
   261		info = devm_kmemdup(dev, &tps53679_info, sizeof(*info), GFP_KERNEL);
   262		if (!info)
   263			return -ENOMEM;
   264	
   265		switch (chip_id) {
   266		case tps53647:
   267		case tps53667:
   268			info->pages = TPS53647_PAGE_NUM;
   269			info->identify = tps53679_identify;
   270			break;
   271		case tps53676:
   272			info->identify = tps53676_identify;
   273			break;
   274		case tps53679:
   275		case tps53688:
   276			info->pages = TPS53679_PAGE_NUM;
   277			info->identify = tps53679_identify;
   278			break;
   279		case tps53681:
   280			info->pages = TPS53679_PAGE_NUM;
   281			info->phases[0] = 6;
   282			info->identify = tps53681_identify;
   283			info->read_word_data = tps53681_read_word_data;
   284			break;
   285		case tps53685:
   286		    info->pages = TPS53679_PAGE_NUM;
   287		    info->identify = tps53685_identify;
 > 288			break;
   289		default:
   290			return -ENODEV;
   291		}
   292	
   293		return pmbus_do_probe(client, info);
   294	}
   295	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
