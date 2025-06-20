Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378A22EB5AD;
	Fri, 20 Jun 2025 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750441252; cv=none; b=gudWV0kX742hHw9l8F5Ffvw9PWVF3/RliwfpBhCKlpA93y5YOuDoc5bIMBz0Hf56+/r927L+XTLQ8B8S3Pvv9GoH3FUlDPyHaWuUmPUTd7Lkaz8VIF2ygwqg7NA1itQA6PTEdusVUzHGJTlFZUFCkZTBgFzBcZ2w4iNOiax++Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750441252; c=relaxed/simple;
	bh=NRGSRyTah5ICBT0QVblczXDuitpxn/LFY+zhFSrKnus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozl3oXX7KqqB0/r2AsEi8BoC3op3eWtu8Q4QkOWO0Ws2a5EH+HSRBLfp6SQQWmSIloSqq6NCzagiBCw2vrHyxu/jlu65d1ih/X5yCnuUFYxXuaxlyjB4kWTTGlV/yDBkSLBEZcKshuean8e44SeoLCkg7gHO1uIlJ2BWCnJygqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEYSZ7Ic; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEYSZ7Ic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750441251; x=1781977251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NRGSRyTah5ICBT0QVblczXDuitpxn/LFY+zhFSrKnus=;
  b=KEYSZ7IcR++AAyn3Kfl/qsrDYhoJITcyBzcUm6lgzHo4SzvIcVig3amv
   alnKdLxh5GbptWo8uc+FyP9CTr0CAsdw1yqp7j+DbLiEZh5fnC9xSZ56q
   lEZRrrewJYK/9NTR+rVSjyhUlGUJlyee2hQ/Q/oGZOOGHSDtmSzm5l7vY
   bJsAo17RxxKLCbK9y3M/zsNDIZhb65EXJA06SZQ4Hx+3DUJ/rYrX7M6mc
   MKzPZ3ixloXxH90Z3XBbS/BgjzXIx7ikgdURMH1vPSDpqng0lB28lRPeR
   HGQdcsa3AqgFpOA7r+j5X3RO22ex9AYHBYwfo3I5NEZuIhwprYj9UXOVu
   w==;
X-CSE-ConnectionGUID: 1WZr/DZoQwGgzgv0a3unxg==
X-CSE-MsgGUID: B8aOE63URzCZdtInQ3R0Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52586070"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="52586070"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 10:40:50 -0700
X-CSE-ConnectionGUID: RH6NSA+vRnOBwGunq1Sriw==
X-CSE-MsgGUID: 967yrwNfSTCe7ac8Cpd9sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="150459518"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Jun 2025 10:40:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSfjI-000M1Q-0R;
	Fri, 20 Jun 2025 17:40:44 +0000
Date: Sat, 21 Jun 2025 01:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Message-ID: <202506210114.2Ix0TkA0-lkp@intel.com>
References: <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>

Hi Peng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 4325743c7e209ae7845293679a4de94b969f2bef]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/firmware-arm_scmi-bus-Add-pm-ops/20250620-114042
base:   4325743c7e209ae7845293679a4de94b969f2bef
patch link:    https://lore.kernel.org/r/20250620-scmi-pm-v1-2-c2f02cae5122%40nxp.com
patch subject: [PATCH 2/2] firmware: arm_scmi: power_control: Set SCMI_SYSPOWER_IDLE in pm resume
config: arm-randconfig-002-20250621 (https://download.01.org/0day-ci/archive/20250621/202506210114.2Ix0TkA0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506210114.2Ix0TkA0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506210114.2Ix0TkA0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/scmi_power_control.c:363:12: warning: 'scmi_system_power_resume' defined but not used [-Wunused-function]
     363 | static int scmi_system_power_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/scmi_system_power_resume +363 drivers/firmware/arm_scmi/scmi_power_control.c

   362	
 > 363	static int scmi_system_power_resume(struct device *dev)
   364	{
   365	
   366		struct scmi_syspower_conf *sc = dev_get_drvdata(dev);
   367	
   368		sc->state = SCMI_SYSPOWER_IDLE;
   369	
   370		return 0;
   371	}
   372	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
