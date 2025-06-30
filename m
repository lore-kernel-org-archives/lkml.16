Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F338283680;
	Mon, 30 Jun 2025 11:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284191; cv=none; b=L9q32xcKlc0SuAgHQWkD0hhPJuldZSigA9ZtlIJ6ea7xt8V3VpvM8U+SdGPUlUKvGf5vuFi2GAincg46RxcKMePPKJ+BVCf2udie5QDp3Jetz79Ysgh+3HozzdlKbPIZKNpMElmWs9vBtGXojtlPYsGBL8GhD26dWJ/vOcG0mRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284191; c=relaxed/simple;
	bh=FubJ0f4TUj+LS4X9PahmEZxliWzY+t0GjeUIOd2VVXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N7WzPM4/S+YLgBAExMlUUMUbPZOHjIJl8BZgH4pt+sP/X7ht0XmquiwRvM0miUDGzLHYnqTKAozKfPWIeuNw51Vnv6apQ3IbMVnPll1RBgMmlQ3bZde02JnF/ZWjRA1gbXxbSWCa1vossgIuc8IhQseHo8sKwtW38HFIgbvbkuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B445rSor; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B445rSor"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751284190; x=1782820190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FubJ0f4TUj+LS4X9PahmEZxliWzY+t0GjeUIOd2VVXE=;
  b=B445rSorN4lS/+WSA+cVveQPH8121IemDTGLCYmMVz23x0ePSGsN6v8z
   nE/HdQj8CcEQQs9iVUrEdfhAh8cUaSTikv8FBKeQ4tdhjEV3YNlkz7DEL
   E3tR7Beuxv85pXwwoFO3vCw6+Sl2bEiobB58dWt3mwVDUcC+lSZ893MJ2
   rguusNK0wDK4zvmL9RRX1KJQEfg55zHpBMvzfWZTlvbl158dtUSKCJbVc
   ENUB4aZCWgJLIZfeOK2R871B0EQtAq3gupFK3hn5Z6kUqc5HwtPCsqRt4
   +K1HiozAEJOH6QmpZ7Ov7JejP17PUeAr2mUrtIAa1oA7Vg+WR7erLKL0I
   g==;
X-CSE-ConnectionGUID: 3fpPNc5aQ/Wa5Zo2tTqCuQ==
X-CSE-MsgGUID: up07I+RnTQa7qfhbfo49Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="64956120"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="64956120"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 04:49:49 -0700
X-CSE-ConnectionGUID: d7dkjV0FSwOqxf3IMTuDzw==
X-CSE-MsgGUID: BDwFvLBwQMCw21Ce23nyvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="157829155"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Jun 2025 04:49:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWD16-000Yvu-2c;
	Mon, 30 Jun 2025 11:49:44 +0000
Date: Mon, 30 Jun 2025 19:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: Denis Benato <benato.denis96@gmail.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com, "Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v9 2/8] platform/x86: asus-armoury: move existing tunings
 to asus-armoury module
Message-ID: <202506301937.xAR28T0l-lkp@intel.com>
References: <20250629131423.9013-3-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629131423.9013-3-benato.denis96@gmail.com>

Hi Denis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc4 next-20250630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Denis-Benato/platform-x86-asus-wmi-export-symbols-used-for-read-write-WMI/20250629-211651
base:   linus/master
patch link:    https://lore.kernel.org/r/20250629131423.9013-3-benato.denis96%40gmail.com
patch subject: [PATCH v9 2/8] platform/x86: asus-armoury: move existing tunings to asus-armoury module
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20250630/202506301937.xAR28T0l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301937.xAR28T0l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301937.xAR28T0l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/platform/x86/asus-armoury.c:28:
>> include/linux/platform_data/x86/asus-wmi.h:202:35: warning: 'asus_use_hid_led_dmi_ids' defined but not used [-Wunused-const-variable=]
     202 | static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/asus_use_hid_led_dmi_ids +202 include/linux/platform_data/x86/asus-wmi.h

ffb6ce7086ee2d Daniel Drake  2018-10-09  200  
a720dee5e03923 Luke D. Jones 2024-07-13  201  /* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
a720dee5e03923 Luke D. Jones 2024-07-13 @202  static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
a720dee5e03923 Luke D. Jones 2024-07-13  203  	{
a720dee5e03923 Luke D. Jones 2024-07-13  204  		.matches = {
a720dee5e03923 Luke D. Jones 2024-07-13  205  			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Zephyrus"),
a720dee5e03923 Luke D. Jones 2024-07-13  206  		},
a720dee5e03923 Luke D. Jones 2024-07-13  207  	},
a720dee5e03923 Luke D. Jones 2024-07-13  208  	{
a720dee5e03923 Luke D. Jones 2024-07-13  209  		.matches = {
a720dee5e03923 Luke D. Jones 2024-07-13  210  			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Strix"),
a720dee5e03923 Luke D. Jones 2024-07-13  211  		},
a720dee5e03923 Luke D. Jones 2024-07-13  212  	},
a720dee5e03923 Luke D. Jones 2024-07-13  213  	{
a720dee5e03923 Luke D. Jones 2024-07-13  214  		.matches = {
a720dee5e03923 Luke D. Jones 2024-07-13  215  			DMI_MATCH(DMI_PRODUCT_FAMILY, "ROG Flow"),
a720dee5e03923 Luke D. Jones 2024-07-13  216  		},
a720dee5e03923 Luke D. Jones 2024-07-13  217  	},
53078a736fbc60 Luke D. Jones 2025-01-11  218  	{
53078a736fbc60 Luke D. Jones 2025-01-11  219  		.matches = {
53078a736fbc60 Luke D. Jones 2025-01-11  220  			DMI_MATCH(DMI_PRODUCT_FAMILY, "ProArt P16"),
53078a736fbc60 Luke D. Jones 2025-01-11  221  		},
53078a736fbc60 Luke D. Jones 2025-01-11  222  	},
a720dee5e03923 Luke D. Jones 2024-07-13  223  	{
a720dee5e03923 Luke D. Jones 2024-07-13  224  		.matches = {
a720dee5e03923 Luke D. Jones 2024-07-13  225  			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
a720dee5e03923 Luke D. Jones 2024-07-13  226  		},
a720dee5e03923 Luke D. Jones 2024-07-13  227  	},
a720dee5e03923 Luke D. Jones 2024-07-13  228  	{
a720dee5e03923 Luke D. Jones 2024-07-13  229  		.matches = {
a720dee5e03923 Luke D. Jones 2024-07-13  230  			DMI_MATCH(DMI_BOARD_NAME, "GU605M"),
a720dee5e03923 Luke D. Jones 2024-07-13  231  		},
a720dee5e03923 Luke D. Jones 2024-07-13  232  	},
a720dee5e03923 Luke D. Jones 2024-07-13  233  	{
a720dee5e03923 Luke D. Jones 2024-07-13  234  		.matches = {
a720dee5e03923 Luke D. Jones 2024-07-13  235  			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
a720dee5e03923 Luke D. Jones 2024-07-13  236  		},
a720dee5e03923 Luke D. Jones 2024-07-13  237  	},
a720dee5e03923 Luke D. Jones 2024-07-13  238  	{ },
a720dee5e03923 Luke D. Jones 2024-07-13  239  };
a720dee5e03923 Luke D. Jones 2024-07-13  240  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
