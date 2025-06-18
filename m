Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB83DA93D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750225873; cv=none; b=jsW7Cq6b97pRReeJxJHM4aqV0B/2ZjHL5tAYM1NbRwG6QIbAA5sS/g+v2Fz1JFySjmwzboXr1jZ9rfXopD4UM03S6UecYL461Bhv9Y+T7JZUWAg3UNowFYpVU24y3MzcFS2MvKxC789/ikTMO8DKMJx/ILZtOvuJuQzLwC5qSKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750225873; c=relaxed/simple;
	bh=Ix9bi/fX1Gwx5BysY/tiJbZOcKkeZxk/l1KDBs0K1Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MoM5nUz8fMU6j8oTHEesjZVM0ZVWCHJf3HmmdMKazUXs9z7OgNiusQ5WOItlQFdVDDmBWvOCKGRzRJ3SizTo1aLFXdkl+QR0H3H0whj3LIoTp0/W7XkXqn02mmveeOufE+cEJqAXNJ5nN88I1ORuyCN7pF+PuXMDHKZnha4q7bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHbAb2IJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHbAb2IJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750225868; x=1781761868;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Ix9bi/fX1Gwx5BysY/tiJbZOcKkeZxk/l1KDBs0K1Ek=;
  b=NHbAb2IJ43rbKHi3zD9BNmzFXqqTWvcELnIg4Xdrj/WDEP2fzpdMXEKU
   kwBovTNZfld4jHtSyX36+4gptTBQN3hFdkAWRmvNz6nFx7K9hTXb9SckD
   ZJ0uUUrdnrFL7u7lnQW2NhiLZiWfWamDoekKBGTeUloApsTFKI3V78BbQ
   FBdcUtGlLCj5PGY9CsM/wMw1IEYhWUOa+W6F/5RAWMFuFf67yhPrx9P0X
   IbvGJnc2CPhydWtf6+t9aqotfIOgT/wllTOXtJbVHd6WIP19wmHRZ0t6g
   Q945gmjq+r/4JRP50aM9SH4qy1w6RdlHLsGKOInH7Ta5e73oUjg2GPK8W
   A==;
X-CSE-ConnectionGUID: IHPokDuYTPGX/MxdcE7NhQ==
X-CSE-MsgGUID: kCzBTU2TQRuNko7mePI7Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52129819"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52129819"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 22:51:05 -0700
X-CSE-ConnectionGUID: /xobBj0uSjSpdsNqEZHD3g==
X-CSE-MsgGUID: /ZiOOu0qQ5qQbIq3slAqyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="149202862"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jun 2025 22:51:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRlhM-000JRU-2A;
	Wed, 18 Jun 2025 05:51:00 +0000
Date: Wed, 18 Jun 2025 13:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>, Gabriel Somlo <somlo@cmu.edu>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Fabian Vogt <fvogt@suse.de>,
	linux-kernel@vger.kernel.org, qemu-devel@nongnu.org
Subject: Re: [PATCH RESEND] firmware: qemu_fw_cfg: Do not hard depend on
 CONFIG_HAS_IOPORT_MAP
Message-ID: <202506181300.OUXh1Amh-lkp@intel.com>
References: <20250616161408.26748-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616161408.26748-1-tiwai@suse.de>

Hi Takashi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc2 next-20250617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Iwai/firmware-qemu_fw_cfg-Do-not-hard-depend-on-CONFIG_HAS_IOPORT_MAP/20250617-001546
base:   linus/master
patch link:    https://lore.kernel.org/r/20250616161408.26748-1-tiwai%40suse.de
patch subject: [PATCH RESEND] firmware: qemu_fw_cfg: Do not hard depend on CONFIG_HAS_IOPORT_MAP
config: arm64-randconfig-r073-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181300.OUXh1Amh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181300.OUXh1Amh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506181300.OUXh1Amh-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/qemu_fw_cfg.c: In function 'fw_cfg_io_cleanup':
>> drivers/firmware/qemu_fw_cfg.c:207:3: error: implicit declaration of function 'ioport_unmap' [-Werror=implicit-function-declaration]
     207 |   ioport_unmap(fw_cfg_dev_base);
         |   ^~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/ioport_unmap +207 drivers/firmware/qemu_fw_cfg.c

2d6d60a3d3eca5 Marc-André Lureau 2018-02-28  199  
75f3e8e47f3810 Gabriel Somlo     2016-01-28  200  /* clean up fw_cfg device i/o */
75f3e8e47f3810 Gabriel Somlo     2016-01-28  201  static void fw_cfg_io_cleanup(void)
75f3e8e47f3810 Gabriel Somlo     2016-01-28  202  {
75f3e8e47f3810 Gabriel Somlo     2016-01-28  203  	if (fw_cfg_is_mmio) {
75f3e8e47f3810 Gabriel Somlo     2016-01-28  204  		iounmap(fw_cfg_dev_base);
75f3e8e47f3810 Gabriel Somlo     2016-01-28  205  		release_mem_region(fw_cfg_p_base, fw_cfg_p_size);
75f3e8e47f3810 Gabriel Somlo     2016-01-28  206  	} else {
75f3e8e47f3810 Gabriel Somlo     2016-01-28 @207  		ioport_unmap(fw_cfg_dev_base);
75f3e8e47f3810 Gabriel Somlo     2016-01-28  208  		release_region(fw_cfg_p_base, fw_cfg_p_size);
75f3e8e47f3810 Gabriel Somlo     2016-01-28  209  	}
75f3e8e47f3810 Gabriel Somlo     2016-01-28  210  }
75f3e8e47f3810 Gabriel Somlo     2016-01-28  211  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
