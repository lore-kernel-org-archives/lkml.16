Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B6C374FF
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738315909; cv=none; b=DgPrJAtPpazLUsEZMGIdeZWkcODYZjMNgaaHgS6IvFo91CfMDqL6LtnVHgVhlregmWS9IAVHfoGzBFxgalrNMq0NvCsNRi637vAzhSWthE3jzcA8sG0njSM2EKif4ccoiu5pt65VNWJfzVXBdo9CSijEywmsD2lYoTrNaiRc3ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738315909; c=relaxed/simple;
	bh=ePzY1L+j7Es0M/ewTTG5qs8c2o9Uosgq/L01OwvO1Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uFXyh1ElkQFBDpTMEJJYw9doHrD6SHU4dggD5GmxWr8PuKiEnx4M9GEi8VqkhsDDoV3YVjKTnPse7E1wfxquPvUYBVl154iqVjzh+m1pjEhBFIAG8kV2CIPa5/cVLmD55iFfvOP/gekMlu/bzfU//00IKKo3hXdwzGzZDnvTj+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YeA732KO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YeA732KO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738315907; x=1769851907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ePzY1L+j7Es0M/ewTTG5qs8c2o9Uosgq/L01OwvO1Wo=;
  b=YeA732KONXr5hGYXsjkfku7B467jAbtTJEznre310WBFb29dCuiCr0dQ
   Ivkej5eufX3WyjzmJ2IaOzKQGr8rrvX9eqJ/B0G3smvHtPRze/jB2eay5
   LaLy4rjr17mkl/TmQdz3lkOHUrauwAvodxzXXjC1psCpaGyH/pHhWiNUZ
   74NN1Tq0s6GoikDbBmuH/ozcTMixx1/nb+zej+uznlrqI/0C5g/x0CBQn
   gFebnUv0/kXVs40D/T6hq+Z3O5zootAfbDhmj5BSuEIV6df0mxJGBL9ln
   gQQi5nn1ak5T7FJH96aFd0JPRIZLCI43g0xfMQl7xLzgFI8NSfYvEGVQV
   g==;
X-CSE-ConnectionGUID: wJEYfj1JTNmuwxEf9q8B4A==
X-CSE-MsgGUID: Hw2j7ocVTFO5bUfwDE2RaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49541556"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="49541556"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 01:31:46 -0800
X-CSE-ConnectionGUID: unsbIpuaT/KQWee15xsamQ==
X-CSE-MsgGUID: EDQtfkdvS32MoUXQKpLNFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110457719"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Jan 2025 01:31:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdnNG-000mED-0e;
	Fri, 31 Jan 2025 09:31:42 +0000
Date: Fri, 31 Jan 2025 17:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	=?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>
Subject: drivers/spi/atmel-quadspi.c:244: warning: Function parameter or
 struct member 'pclk_div' not described in 'atmel_qspi_pcal'
Message-ID: <202501311707.Ltj0qXse-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tudor,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69e858e0b8b2ea07759e995aa383e8780d9d140c
commit: 5af42209a4d23adc9a09e59e586d1b47fef3cc86 spi: atmel-quadspi: Add support for sama7g5 QSPI
date:   6 weeks ago
config: mips-randconfig-r024-20220830 (https://download.01.org/0day-ci/archive/20250131/202501311707.Ltj0qXse-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311707.Ltj0qXse-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311707.Ltj0qXse-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/atmel-quadspi.c:244: warning: Function parameter or struct member 'pclk_div' not described in 'atmel_qspi_pcal'
>> drivers/spi/atmel-quadspi.c:244: warning: Excess struct member 'pclkdiv' description in 'atmel_qspi_pcal'


vim +244 drivers/spi/atmel-quadspi.c

   232	
   233	/* Use PIO for small transfers. */
   234	#define ATMEL_QSPI_DMA_MIN_BYTES	16
   235	/**
   236	 * struct atmel_qspi_pcal - Pad Calibration Clock Division
   237	 * @pclk_rate: peripheral clock rate.
   238	 * @pclkdiv: calibration clock division. The clock applied to the calibration
   239	 *           cell is divided by pclkdiv + 1.
   240	 */
   241	struct atmel_qspi_pcal {
   242		u32 pclk_rate;
   243		u8 pclk_div;
 > 244	};
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
