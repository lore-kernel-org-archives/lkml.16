Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE7C22F776
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 18:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748542849; cv=none; b=ldvimEGxO/vwAS2xhbV/GtD8u/TFRhDoSpudHdHVJiDmTAHcCIijOZ6aZM/O1oAZuvn45U27F5+d+JfqPMBty/YAStUZI9s7qX9flcLDx/QTgkD+UJc/baChLn6mpZMtcMKpkWhiyE4xSC72pLEp254m/fIjGFhqV5fdvC/xPYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748542849; c=relaxed/simple;
	bh=GrYdPthuuV4voe6ZYw1AGGyhQX9V5TzLF3ORYCvQhnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFB4bYEiQ7N/8qQq5rkFz66LOjvz1JIUc1NVh2yKU2ovep9LqAdDIuBmkuOo9k2hieDyCp1vPa5XTRKZfc6B3OOec7uF56wLUYgTO4+aIftbDr/fnZjc5qqOyLhYZhBh2yKBDaA3T7c6Eamuc0GVKSBNJvJdBmAT/BUYLgcN0Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FblRZD3W; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FblRZD3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748542848; x=1780078848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GrYdPthuuV4voe6ZYw1AGGyhQX9V5TzLF3ORYCvQhnA=;
  b=FblRZD3WHWW3z+0BM39HDBfQUzQYBTzOKiONIP9wwWAxqdxiVbAL1spa
   OyC5QDRXiTmX/d+v8LSJ7h7BtS1YtBCo4XWCoJwjpj8c/KwVDDrMKLycO
   So9ug5Js88FYyhuUT3kbbrX8XZu2dMJdLar+Fb3+AVjG4AmtXD0Li8hhF
   JZjnwuIfZuImGaP+z3wQMN97UoYJjW9gQ8NykYDpoalSE+Q9ORo9DGO85
   NlAho+SqZb0v88IhJrP3e7jPr8L7so5lFB2p+ByN+mRzb6f80zR0C3Ltz
   brL74gPwcEc7hteTozIzN0SZRHim8RpZJj9clNwdpZiuJy1LaCFQq4iLL
   g==;
X-CSE-ConnectionGUID: BzBCem9cTjSadk56OjKzGw==
X-CSE-MsgGUID: /49GDQRHT2el8h5xQYndJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50724868"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="50724868"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 11:20:47 -0700
X-CSE-ConnectionGUID: 3nNr2650ReKeeInqckBaSw==
X-CSE-MsgGUID: s+hh8iSeQZGl5OUH0OMUlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="148795686"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 May 2025 11:20:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKhrr-000Wya-1G;
	Thu, 29 May 2025 18:20:39 +0000
Date: Fri, 30 May 2025 02:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jayesh Choudhary <j-choudhary@ti.com>, dianders@chromium.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	dri-devel@lists.freedesktop.org, tomi.valkeinen@ideasonboard.com,
	andyshrk@163.com
Cc: oe-kbuild-all@lists.linux.dev, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, lyude@redhat.com,
	andy.yan@rock-chips.com, mordan@ispras.ru, linux@treblig.org,
	viro@zeniv.linux.org.uk, a-bhatia1@ti.com, javierm@redhat.com,
	linux-kernel@vger.kernel.org, devarsht@ti.com, j-choudhary@ti.com
Subject: Re: [PATCH v3 1/5] drm/bridge: cadence: cdns-mhdp8546-core: Remove
 legacy support for connector initialisation in bridge
Message-ID: <202505300201.2s6r12yc-lkp@intel.com>
References: <20250529142517.188786-2-j-choudhary@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529142517.188786-2-j-choudhary@ti.com>

Hi Jayesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.15 next-20250529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jayesh-Choudhary/drm-bridge-cadence-cdns-mhdp8546-core-Remove-legacy-support-for-connector-initialisation-in-bridge/20250529-222734
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250529142517.188786-2-j-choudhary%40ti.com
patch subject: [PATCH v3 1/5] drm/bridge: cadence: cdns-mhdp8546-core: Remove legacy support for connector initialisation in bridge
config: riscv-randconfig-002-20250530 (https://download.01.org/0day-ci/archive/20250530/202505300201.2s6r12yc-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505300201.2s6r12yc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505300201.2s6r12yc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c: In function 'cdns_mhdp_hpd_work':
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2210:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    2210 |  int ret;
         |      ^~~


vim +/ret +2210 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c

6a3608eae6d33a Parshuram Thombare 2021-04-10  2204  
6a3608eae6d33a Parshuram Thombare 2021-04-10  2205  static void cdns_mhdp_hpd_work(struct work_struct *work)
6a3608eae6d33a Parshuram Thombare 2021-04-10  2206  {
6a3608eae6d33a Parshuram Thombare 2021-04-10  2207  	struct cdns_mhdp_device *mhdp = container_of(work,
6a3608eae6d33a Parshuram Thombare 2021-04-10  2208  						     struct cdns_mhdp_device,
6a3608eae6d33a Parshuram Thombare 2021-04-10  2209  						     hpd_work);
6a3608eae6d33a Parshuram Thombare 2021-04-10 @2210  	int ret;
6a3608eae6d33a Parshuram Thombare 2021-04-10  2211  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2212  	ret = cdns_mhdp_update_link_status(mhdp);
f25484d2ec5e5a Jayesh Choudhary   2025-05-29  2213  
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2214  	drm_bridge_hpd_notify(&mhdp->bridge, cdns_mhdp_detect(mhdp));
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2215  }
fb43aa0acdfd60 Swapnil Jakhade    2020-09-18  2216  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
