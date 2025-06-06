Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F5D288C93;
	Fri,  6 Jun 2025 15:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749225547; cv=none; b=oTIIv2ssW6vVIdWWkBxRU8fvYyyTh5aOiWRC1DxAWIHLlkaCpMwoWnDrcQeR5UxNGvU7UpRn7NSfhgRPkRrBBX5VLN927u5ZHsuFOSFfAzFoLgaKuyjpCGhFGrXrV4tsSnz9cyDdLCgYZ/RVeH8yfwStSqOx34Ga+byELgPFHsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749225547; c=relaxed/simple;
	bh=DqILrp7MAmIHBHpVhQPDe90I9D1u0u26u1bnK5dDg38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ca3e5TGHTMaKcz3Zb7lmS2bkeZWGBuTJgGtyjHXu2EAv6+9uK7HEPjtNzTSQDssApjR2G9qm9mYnYaXZmcHUQ5BgWXLn1itdC9ldQTdPVqYQNcR8gxmlYYc71rFL/JYoMoHU5YFZd0glW+n+yVZOc0+6nw72BIAzr4NiwtIeT0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsbMtZCo; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsbMtZCo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749225545; x=1780761545;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DqILrp7MAmIHBHpVhQPDe90I9D1u0u26u1bnK5dDg38=;
  b=TsbMtZCoduM1sxMFrHH7pI8RIMh/6aFAQUogt/xFqKsStFglorQhHQH7
   MjmM9ez1vNzBxMRktIAmzZ0Eq3wzQfw7/rkhA9WLy1DI3ETnw+crSO3+J
   f3/BRYF18Btquo8hFk6ruadTZ4o4c/ul78T10kc3X2QIJOGsOLHeB2dqq
   XyCFJpwX33kFOBtlHKfKFqbXicP08wzejlAcQUis/7nFI/L1A+2pDjOXm
   XyWLYalWduLhC6XecGAvUj6TgvoNHKK5VPb1A0mFeEtjRSiVYEXSVDjtM
   J/TCwRf0gOwPAqnVXKcY+hKovQ0jC7IcUfdCyehB7OKGrZpQQpLezZXHc
   w==;
X-CSE-ConnectionGUID: Aq6Y4urORS2+jJtmwBmbiQ==
X-CSE-MsgGUID: PPY+fI+3TEWLs8oZrTv3Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51525633"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="51525633"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 08:59:04 -0700
X-CSE-ConnectionGUID: oZVF5Z4hQXmdJLGOaHW+Wg==
X-CSE-MsgGUID: AjXvMA79Q3u8y2LSr675og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="151020215"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Jun 2025 08:59:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNZT9-00055V-0u;
	Fri, 06 Jun 2025 15:58:59 +0000
Date: Fri, 6 Jun 2025 23:58:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: oe-kbuild-all@lists.linux.dev, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, corbet@lwn.net, ikepanhc@gmail.com,
	hmh@hmh.eng.br, W_Armin@gmx.de, andriy.shevchenko@linux.intel.com,
	linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: Move Lenovo files into lenovo subdir
Message-ID: <202506062319.F0IpDxF6-lkp@intel.com>
References: <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604173702.3025074-1-mpearson-lenovo@squebb.ca>

Hi Mark,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20250606]
[cannot apply to v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mark-Pearson/platform-x86-Move-Lenovo-files-into-lenovo-subdir/20250605-013934
base:   linus/master
patch link:    https://lore.kernel.org/r/20250604173702.3025074-1-mpearson-lenovo%40squebb.ca
patch subject: [PATCH v2] platform/x86: Move Lenovo files into lenovo subdir
config: x86_64-randconfig-078-20250606 (https://download.01.org/0day-ci/archive/20250606/202506062319.F0IpDxF6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506062319.F0IpDxF6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506062319.F0IpDxF6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/lenovo/think-lmi.c: In function 'certificate_store':
>> drivers/platform/x86/lenovo/think-lmi.c:661:47: warning: '%s' directive argument is null [-Wformat-overflow=]
     661 |                 return kasprintf(GFP_KERNEL, "%s,%s", arg1, arg2);
         |                                               ^~
   drivers/platform/x86/lenovo/think-lmi.c:657:50: warning: '%s' directive argument is null [-Wformat-overflow=]
     657 |                 return kasprintf(GFP_KERNEL, "%s,%s,%s",
         |                                                  ^~


vim +661 drivers/platform/x86/lenovo/think-lmi.c

640a5fa50a42b9 drivers/platform/x86/think-lmi.c Mark Pearson 2021-11-17  652  
5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24  653  static char *cert_command(struct tlmi_pwd_setting *setting, const char *arg1, const char *arg2)
5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24  654  {
5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24  655  	/* Prepend with SVC or SMC if multicert supported */
5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24  656  	if (tlmi_priv.pwdcfg.core.password_mode >= TLMI_PWDCFG_MODE_MULTICERT)
5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24  657  		return kasprintf(GFP_KERNEL, "%s,%s,%s",
5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24  658  				 setting == tlmi_priv.pwd_admin ? "SVC" : "SMC",
5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24  659  				 arg1, arg2);
5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24  660  	else
5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24 @661  		return kasprintf(GFP_KERNEL, "%s,%s", arg1, arg2);
5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24  662  }
5dcb5ef125907d drivers/platform/x86/think-lmi.c Mark Pearson 2024-10-24  663  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
