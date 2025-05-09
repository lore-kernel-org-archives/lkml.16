Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F533267B96
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 05:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746768572; cv=none; b=QCb42PwkbGM6+HIBKjmvmUwk4lPRJoJoK6h7c8QIdPYZF9KC/9KmTuwG67yuITF7pQKnsxY7aktKzsfZO3HHoO/C9mh/Vo9TGxs/wyeIFlHiy06enlXZqWmoYbZCpFxmFvyAtoLhlHMJtyh9Cu7NGU/qs9J0bfjJ+LBF+XjaOSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746768572; c=relaxed/simple;
	bh=L4UUaVG5X3LUiYHS/5N1PoJuNArLa1EF6Sqthuav9h4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=So4rJaMEILSwbyDc/6/HDFzl2CCVegMqE2urn65ElQTlGCDT5ZHO/hHHu46ih4JQ1sOZZNQGOVjVFaTdyCUZap3W+yxrrOOYHUDEM549R3A6GU5xsJx6Dz5mwp+ST4r5FAU27MmU2f9KWorbD1LHPqnt9A3jkC75D4uUAicY1nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0pNiRdR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0pNiRdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746768570; x=1778304570;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L4UUaVG5X3LUiYHS/5N1PoJuNArLa1EF6Sqthuav9h4=;
  b=G0pNiRdRKaZP6sqxEWwi/t8CMSMXTigAAntkChfq+CI1KbA3XQUE/K57
   yrba45Fswt+nbRNgos/6SYW3qh1iY96rnAiZmP1Z+dQX03qssAo6qem7F
   NZmLiEKo6fVo9KUTCs01hVRdY1acygF3ZYxq738Lnu2iHck7KGvXnNfTh
   2EqesmyasUBOFRHgA8Z/QHp1uIbd4jXIXeMcvkgar/QUPrcmEhlCEjoxV
   b+o+kW5oaouHODJVgU+XkaXwj+DNf61B455wd5dJ7K2aV2vavLJPtC+hs
   g5rbyGTMK2CgUOsvJ6gBsmMCGHw2mudTnuOcrlDyffR0orbeWL5Yc1n9p
   A==;
X-CSE-ConnectionGUID: Z62g7TJZSM6DAAWlgeyCbg==
X-CSE-MsgGUID: FdcABmp2TuOr8AESRmUbIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59985870"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="59985870"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 22:29:30 -0700
X-CSE-ConnectionGUID: jWPSW1eRRrS74AaaPw5jUw==
X-CSE-MsgGUID: K/jORPu1QKquHkt7pL4iTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136472312"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 May 2025 22:29:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDGIX-000Bgd-1V;
	Fri, 09 May 2025 05:29:25 +0000
Date: Fri, 9 May 2025 13:28:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>,
	Michael Walle <mwalle@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: Verify written data in paranoid mode
Message-ID: <202505091318.0QvCicb9-lkp@intel.com>
References: <20250508183733.514124-3-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508183733.514124-3-csokas.bence@prolan.hu>

Hi Bence,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3]

url:    https://github.com/intel-lab-lkp/linux/commits/Bence-Cs-k-s/mtd-Verify-written-data-in-paranoid-mode/20250509-024044
base:   d76bb1ebb5587f66b0f8b8099bfbb44722bc08b3
patch link:    https://lore.kernel.org/r/20250508183733.514124-3-csokas.bence%40prolan.hu
patch subject: [PATCH v2] mtd: Verify written data in paranoid mode
config: i386-buildonly-randconfig-002-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091318.0QvCicb9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091318.0QvCicb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091318.0QvCicb9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/mtdcore.c:1775:12: warning: '_mtd_verify' defined but not used [-Wunused-function]
    1775 | static int _mtd_verify(struct mtd_info *mtd, loff_t to, size_t len, const u8 *buf)
         |            ^~~~~~~~~~~


vim +/_mtd_verify +1775 drivers/mtd/mtdcore.c

  1774	
> 1775	static int _mtd_verify(struct mtd_info *mtd, loff_t to, size_t len, const u8 *buf)
  1776	{
  1777		struct device *dev = &mtd->dev;
  1778		u_char *verify_buf;
  1779		size_t r_retlen;
  1780		int ret;
  1781	
  1782		verify_buf = devm_kmalloc(dev, len, GFP_KERNEL);
  1783		if (!verify_buf)
  1784			return -ENOMEM;
  1785	
  1786		ret = mtd_read(mtd, to, len, &r_retlen, verify_buf);
  1787		if (ret < 0)
  1788			goto err;
  1789	
  1790		if (len != r_retlen) {
  1791			/* We shouldn't see short reads */
  1792			dev_err(dev, "Verify failed, written %zd but only read %zd",
  1793				len, r_retlen);
  1794			ret = -EIO;
  1795			goto err;
  1796		}
  1797	
  1798		if (memcmp(verify_buf, buf, len)) {
  1799			dev_err(dev, "Verify failed, compare mismatch!");
  1800			ret = -EIO;
  1801		}
  1802	
  1803	err:
  1804		devm_kfree(dev, verify_buf);
  1805		return ret;
  1806	}
  1807	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
