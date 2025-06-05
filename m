Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E623324B26;
	Thu,  5 Jun 2025 05:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749100340; cv=none; b=NuGqRMSWcVRhpOGV1dsQM8qvGzcqGYjUliJEE8l/8n3+O7HOZJF5aoA4FWokf3rV4T51T9Dr1fzc58+InNcU2NDr34rO9v2/zSdPxJ34BTojJniscNkcaYhjqw1oe/os9T5LyjfWWZBx94RsxjJtBqJudRP8JhBNeAgALRrya4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749100340; c=relaxed/simple;
	bh=Cojmq5Bw19bcv4D8O2BvzUtCCdxSCkh1++xIikVWjiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VF6ifSX2pI8axH0LGiPMTINsJ8qfm+7YOjpjNIoqE3rPVJXvixEFtbXyxFCPBacIFCG2hXd1axjFWiD6+1YkeSvx+YOSzP+3/xvKqh+NcjxaxMP95khwb3AOMOmW/1ZZubVD6SSTySucmBV/5z8O06aB9/z+BfmfUm+OhFgfAts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iigaeUz2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iigaeUz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749100339; x=1780636339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cojmq5Bw19bcv4D8O2BvzUtCCdxSCkh1++xIikVWjiQ=;
  b=iigaeUz23tmDfaYno5Tm3jhdxZDwcuR1GekOlucQ39h/kL+mR4BCg9EY
   TCezB0PebmCXyRrqr3sjalcrJpfB3GyD8J5pFf+2iFrLnqJoW3SeVpVlZ
   nqyZPiuuYl6ti4D6TU8mcjpsRrdFMAAaQLqezry95vYUiF7tRjV26QO5H
   IiqzVYvfHJS/hD92DfLZOAQvy5L0o1mw124qHXeaYC4hkqXKw3OUEvSdO
   caONnN4SQm6KitDqUompuPxzMX0i8sDbIcR2ye6v9JNy/VZAK8ZAC9y3+
   OWQCfBSpt/UYM4Z+A24qi9ujm5ZfdaZl4NFuyP08Ao5IxZVAfR6q4QcQ0
   A==;
X-CSE-ConnectionGUID: z0002rrrS+y906dRWBwZuA==
X-CSE-MsgGUID: xBe60VFHR9m8aLFxdPFX8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68754326"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="68754326"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 22:12:18 -0700
X-CSE-ConnectionGUID: pP3Otw1VR0Op+zdYIbAlJQ==
X-CSE-MsgGUID: K9klzGtHRqiTQbrzEuROdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="149232736"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jun 2025 22:12:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN2th-0003kP-1q;
	Thu, 05 Jun 2025 05:12:13 +0000
Date: Thu, 5 Jun 2025 13:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Marques <jorge.marques@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jorge Marques <jorge.marques@analog.com>
Subject: Re: [PATCH 2/2] i3c: master: Add driver for Analog Devices I3C
 Controller IP
Message-ID: <202506051224.6jLJ0AOh-lkp@intel.com>
References: <20250604-adi-i3c-master-v1-2-0488e80dafcb@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604-adi-i3c-master-v1-2-0488e80dafcb@analog.com>

Hi Jorge,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 00286d7d643d3c98e48d9cc3a9f471b37154f462]

url:    https://github.com/intel-lab-lkp/linux/commits/Jorge-Marques/dt-bindings-i3c-Add-adi-i3c-master/20250604-235108
base:   00286d7d643d3c98e48d9cc3a9f471b37154f462
patch link:    https://lore.kernel.org/r/20250604-adi-i3c-master-v1-2-0488e80dafcb%40analog.com
patch subject: [PATCH 2/2] i3c: master: Add driver for Analog Devices I3C Controller IP
config: alpha-randconfig-r111-20250605 (https://download.01.org/0day-ci/archive/20250605/202506051224.6jLJ0AOh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250605/202506051224.6jLJ0AOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051224.6jLJ0AOh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i3c/master/adi-i3c-master.c:768:28: sparse: sparse: dubious: x | !y

vim +768 drivers/i3c/master/adi-i3c-master.c

   759	
   760	static void adi_i3c_master_handle_da_req(struct adi_i3c_master *master)
   761	{
   762		u8 payload0[8];
   763		u32 addr;
   764	
   765		/* Clear device characteristics */
   766		adi_i3c_master_rd_from_rx_fifo(master, payload0, 6);
   767		addr = master->daa.addrs[master->daa.index++];
 > 768		addr = (addr << 1) | !parity8(addr);
   769	
   770		writel(addr, master->regs + REG_SDO_FIFO);
   771	}
   772	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
