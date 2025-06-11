Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498632045B5;
	Wed, 11 Jun 2025 05:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749618537; cv=none; b=H+48nv2wpN7mBWJOe/ObEA7FvOI5gq29t6HGFmWO1U8YTV9/85xRSC5YlVn2YQmQ0iNjn1bEncnmyhazbeLpoGM8gE8d4eA9EkqcOIOyYcI+yOaK+GzPfM/n8PuCyguJNBzE5rG9wdUtLt+siYCKhXjWgwv3BLjoHXR3mayfoMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749618537; c=relaxed/simple;
	bh=6nuA4xEX7lOYOpAa4aR6XpGyHElF5bswh33ac9+B1OI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AeElfkYzXplMNheY/jQLNsAgl+1NAR20yXSzLkYTEN1xcBJ9+DJv6eIPo3p3yYLE6r0WCsXLQ4Ir0HaOAnNGZc/zwJIpqeK1a9ENEsM6U1/nDVMtKq0xlv1NnD7q8Cr4+78+Np3fbvAEZ3BY8tkde8RNs3AXkNEaMk1dO7iKB+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzOJfsEx; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzOJfsEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749618536; x=1781154536;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6nuA4xEX7lOYOpAa4aR6XpGyHElF5bswh33ac9+B1OI=;
  b=HzOJfsExL8jv1UMRDVlYts8B1Ba4Wm7ZWZRrlwsA9GPrnHQXQaFFHUmv
   lgmCm+Jc6Mia1srivg5hRzgOkuxd115nShyrcl2rCwKRX+6PQmzdgvtZE
   Skya0Z39MJpbCS/8wQpwCxGpoqHpNGIMHI+OyG/cr87WW3G6j81yvV9Pd
   fmwIEzdzCzGjAayQHemJbDy863lBtPaUzOy+ThHhG1NZAJcmUCmSPVnAq
   DaH8P3WyZsOTtqiGOO187ehYYT1TtARkVJScoTNCnaLk7PqIHJqhrkhpr
   nKl3tlJchRDTQMrTghEAEy8XCqOgOVgrrMVZJXTFchwvnoaRzE9D4kXc6
   A==;
X-CSE-ConnectionGUID: MO13LiIhQI2w5B1ytZRh2w==
X-CSE-MsgGUID: lAFPgC0/S1qkZ3a93blp6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51459311"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="51459311"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 22:08:55 -0700
X-CSE-ConnectionGUID: 5KUD7XQaS7+3OlBQTv1j5Q==
X-CSE-MsgGUID: AcDGY8xxS9i5baqZmzg1dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="151943277"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Jun 2025 22:08:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPDhg-000A1E-1l;
	Wed, 11 Jun 2025 05:08:48 +0000
Date: Wed, 11 Jun 2025 13:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] platform/x86: silicom: remove unnecessary GPIO line
 direction check
Message-ID: <202506111214.mbG7aOVD-lkp@intel.com>
References: <20250610144935.84375-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610144935.84375-1-brgl@bgdev.pl>

Hi Bartosz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc1 next-20250610]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/platform-x86-silicom-remove-unnecessary-GPIO-line-direction-check/20250610-225049
base:   linus/master
patch link:    https://lore.kernel.org/r/20250610144935.84375-1-brgl%40bgdev.pl
patch subject: [PATCH] platform/x86: silicom: remove unnecessary GPIO line direction check
config: x86_64-buildonly-randconfig-001-20250611 (https://download.01.org/0day-ci/archive/20250611/202506111214.mbG7aOVD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506111214.mbG7aOVD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111214.mbG7aOVD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/silicom-platform.c: In function 'silicom_gpio_set':
>> drivers/platform/x86/silicom-platform.c:251:13: warning: unused variable 'direction' [-Wunused-variable]
     251 |         int direction = silicom_gpio_get_direction(gc, offset);
         |             ^~~~~~~~~


vim +/direction +251 drivers/platform/x86/silicom-platform.c

d9cd21d441c8c7 Henry Shi           2023-11-24  247  
88f67f2a99f061 Bartosz Golaszewski 2025-04-08  248  static int silicom_gpio_set(struct gpio_chip *gc, unsigned int offset,
d9cd21d441c8c7 Henry Shi           2023-11-24  249  			    int value)
d9cd21d441c8c7 Henry Shi           2023-11-24  250  {
d9cd21d441c8c7 Henry Shi           2023-11-24 @251  	int direction = silicom_gpio_get_direction(gc, offset);
d9cd21d441c8c7 Henry Shi           2023-11-24  252  	u8 *channels = gpiochip_get_data(gc);
d9cd21d441c8c7 Henry Shi           2023-11-24  253  	int channel = channels[offset];
d9cd21d441c8c7 Henry Shi           2023-11-24  254  
890a48ca7b0540 Dan Carpenter       2024-01-12  255  	silicom_mec_port_set(channel, !value);
88f67f2a99f061 Bartosz Golaszewski 2025-04-08  256  
88f67f2a99f061 Bartosz Golaszewski 2025-04-08  257  	return 0;
d9cd21d441c8c7 Henry Shi           2023-11-24  258  }
d9cd21d441c8c7 Henry Shi           2023-11-24  259  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
