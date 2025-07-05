Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4731EA73;
	Sat,  5 Jul 2025 18:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751741193; cv=none; b=Ag0mrQPdIjI17wVTea+QxY6si3v/3XHzlJOxhbSXOi1VdizPJYLgDkpwYBco9t0MFHsdNSMX2snGP1zz0Hc3Agl/Q6r9QmWNdS+WmXADCQYZglwBfJANPid8ZCf/hDclIjeYMihR8CLKVoAEK0mjJ553uOPcLo8PNW7+j4dq4RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751741193; c=relaxed/simple;
	bh=Z0yzV/VPkDfvyUx/xopWYC8B14lYUePBKBtLJOQOW6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbGWs3qp32xKiZANKtA66xcUK5B1jo63Vt/G91k3iL0zWC5qV76P4qDJMFuoe5KLuDxslMePXsV9kFo5sGJGaSO0/7uiHg/kgBCYVBqzKEX8yTTP44xv/CmtVpNMcE2yoWS8gkuLNhw+UrpfqnKxnPuHDIGy8Q1MiVkBIFpWImU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGjaE1SO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGjaE1SO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751741191; x=1783277191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z0yzV/VPkDfvyUx/xopWYC8B14lYUePBKBtLJOQOW6U=;
  b=RGjaE1SOpogHbX5ZMvtUtqyxUhHHwtaWEQY+i4i1iBEFZlyFLrZB6LNa
   OUpKhv+9Uk+tBzCExdoAkTIqpOihQlGwijIhzPxMLGJEAHwmGOu3Iqg0U
   86Nsp4iFb4ENa1WA9IOuEOwYZT/MBbseyizC78SGiXw/2FhL2XsNDOMKG
   TQvlwgKnJoQ3l3i9Ec/M1St+HnXqp6TUfHc1jNmvlfSf5inaPuEAJDRnw
   CBg96iRsBGYifpt1A4OU/RRPMzcw7wy6s1vFyjD3qI5yJDQwJrkcUngl1
   484lGG6R0AtSUvgwM142LjaRIGe7D13Ce6G+koWemF3lklqNY9VeR60fT
   g==;
X-CSE-ConnectionGUID: EgGZNRROTg6Wm22dx8eExQ==
X-CSE-MsgGUID: qERH2Zm4SiqMFDzNlZu5gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11485"; a="65079090"
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="65079090"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 11:46:31 -0700
X-CSE-ConnectionGUID: YtCQ6xlMTd6QNYDFXdZszw==
X-CSE-MsgGUID: hhfPyBMXRqeKWA/pf1pBJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,290,1744095600"; 
   d="scan'208";a="154988400"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Jul 2025 11:46:27 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uY7u5-0004fv-0y;
	Sat, 05 Jul 2025 18:46:25 +0000
Date: Sun, 6 Jul 2025 02:46:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ze Huang <huang.ze@linux.dev>
Subject: Re: [PATCH v5 2/2] usb: dwc3: add generic driver to support flattened
Message-ID: <202507060206.iiBP6CQi-lkp@intel.com>
References: <20250705-dwc3_generic-v5-2-9dbc53ea53d2@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250705-dwc3_generic-v5-2-9dbc53ea53d2@linux.dev>

Hi Ze,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d9946fe286439c2aeaa7953b8c316efe5b83d515]

url:    https://github.com/intel-lab-lkp/linux/commits/Ze-Huang/dt-bindings-usb-dwc3-add-support-for-SpacemiT-K1/20250705-210419
base:   d9946fe286439c2aeaa7953b8c316efe5b83d515
patch link:    https://lore.kernel.org/r/20250705-dwc3_generic-v5-2-9dbc53ea53d2%40linux.dev
patch subject: [PATCH v5 2/2] usb: dwc3: add generic driver to support flattened
config: arc-randconfig-001-20250706 (https://download.01.org/0day-ci/archive/20250706/202507060206.iiBP6CQi-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250706/202507060206.iiBP6CQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507060206.iiBP6CQi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/dwc3/dwc3-generic-plat.c:151:12: warning: 'dwc3_generic_runtime_idle' defined but not used [-Wunused-function]
    static int dwc3_generic_runtime_idle(struct device *dev)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/dwc3/dwc3-generic-plat.c:144:12: warning: 'dwc3_generic_runtime_resume' defined but not used [-Wunused-function]
    static int dwc3_generic_runtime_resume(struct device *dev)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/dwc3/dwc3-generic-plat.c:137:12: warning: 'dwc3_generic_runtime_suspend' defined but not used [-Wunused-function]
    static int dwc3_generic_runtime_suspend(struct device *dev)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/dwc3/dwc3-generic-plat.c:121:12: warning: 'dwc3_generic_resume' defined but not used [-Wunused-function]
    static int dwc3_generic_resume(struct device *dev)
               ^~~~~~~~~~~~~~~~~~~
>> drivers/usb/dwc3/dwc3-generic-plat.c:107:12: warning: 'dwc3_generic_suspend' defined but not used [-Wunused-function]
    static int dwc3_generic_suspend(struct device *dev)
               ^~~~~~~~~~~~~~~~~~~~


vim +/dwc3_generic_runtime_idle +151 drivers/usb/dwc3/dwc3-generic-plat.c

   106	
 > 107	static int dwc3_generic_suspend(struct device *dev)
   108	{
   109		struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
   110		int ret;
   111	
   112		ret = dwc3_pm_suspend(&dwc3->dwc);
   113		if (ret)
   114			return ret;
   115	
   116		clk_bulk_disable_unprepare(dwc3->num_clocks, dwc3->clks);
   117	
   118		return 0;
   119	}
   120	
 > 121	static int dwc3_generic_resume(struct device *dev)
   122	{
   123		struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
   124		int ret;
   125	
   126		ret = clk_bulk_prepare_enable(dwc3->num_clocks, dwc3->clks);
   127		if (ret)
   128			return ret;
   129	
   130		ret = dwc3_pm_resume(&dwc3->dwc);
   131		if (ret)
   132			return ret;
   133	
   134		return 0;
   135	}
   136	
 > 137	static int dwc3_generic_runtime_suspend(struct device *dev)
   138	{
   139		struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
   140	
   141		return dwc3_runtime_suspend(&dwc3->dwc);
   142	}
   143	
 > 144	static int dwc3_generic_runtime_resume(struct device *dev)
   145	{
   146		struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
   147	
   148		return dwc3_runtime_resume(&dwc3->dwc);
   149	}
   150	
 > 151	static int dwc3_generic_runtime_idle(struct device *dev)
   152	{
   153		struct dwc3_generic *dwc3 = dev_get_drvdata(dev);
   154	
   155		return dwc3_runtime_idle(&dwc3->dwc);
   156	}
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
