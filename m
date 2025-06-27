Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A262D3206
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751027703; cv=none; b=XrLcuQHt2E2pXiYim4q4rHDG0x1f642DicM240TKLlmoVdgWvbtIh0izO+Lr+whvhKYH604Xd5F0nA2iPmUTN4dVcoYA0x2Z9+qNaewgyYvAer0howYJ/bkmPpkyYfRxDv/51oT6DaMy6FjGoaE+IKf6Bo0das7G2+RvLbPQj3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751027703; c=relaxed/simple;
	bh=/h37rza/RJQOcT4K7I2h/SDNf6nDLGZbFq3x6i4OKDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b3U8Ku36mWWEvlt7DvhAn4ucFP2+yWU0QQkcfndxB8R/mmkkZfzdq98BdViymLbV8XnfhJmz7zuBVVXKlo4EWqcKLaFIHJWN0G9xEDRV7iAtu1MAl+wR/mmVEwK1eM7d2HIO3ZbmpaOlsMiEEInEwAnmqTItuvzMcIZB3Trq2A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eMitjOsj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eMitjOsj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751027702; x=1782563702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/h37rza/RJQOcT4K7I2h/SDNf6nDLGZbFq3x6i4OKDM=;
  b=eMitjOsjLJz1o48jAs+7jjsb981KeRrsDj+G/viBzghaIaC42gcGvkNR
   bp3AfZEiRm5lcQAzUDl+VI87epazonSvdGrXXS16W/uiaSW4l7mQI7DNd
   qoPkrg1WqSqO0ge6Uy2vkPPIEHkWX+KkNoeKbl6hZz71CvNZukjSW9kfK
   OkzyY9usRD7ifvdNiNjzJtVN4CULz8gvlewRQQ6V8AaRv+letnRd3G8FQ
   qjw+dMrWClXZHm6fCgBxv0kwoEeDsMIMBPN46FPzLCmflNJs6xegFZiL/
   308aXVhc6/HnQiIez1tl0ukXtippLh3se8e/y5Ksap8UAVg/Du8qG6qeP
   g==;
X-CSE-ConnectionGUID: yeZFI3VZRxqtkuAyVLjREw==
X-CSE-MsgGUID: 4LBR5EndRYK67VrmzC+6Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="52458916"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="52458916"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 05:34:59 -0700
X-CSE-ConnectionGUID: +uSGI0AFTg+PqUsaeIRO/Q==
X-CSE-MsgGUID: h2FdguQZSKGuqYuMqo+d7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="157176718"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Jun 2025 05:34:58 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV8IB-000WAE-1X;
	Fri, 27 Jun 2025 12:34:55 +0000
Date: Fri, 27 Jun 2025 20:34:23 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 EARLY_PRINTK_8250 when selected by ECONET
Message-ID: <202506272006.TpLI6jV8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   67a993863163cb88b1b68974c31b0d84ece4293e
commit: 35fb26f94dfa1b291086b84b2421f957214824d1 mips: Add EcoNet MIPS platform support
date:   5 weeks ago
config: mips-kismet-CONFIG_EARLY_PRINTK_8250-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20250627/202506272006.TpLI6jV8-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250627/202506272006.TpLI6jV8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506272006.TpLI6jV8-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250 when selected by ECONET
   WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
     Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
     Selected by [y]:
     - ECONET [=y]
   
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=n] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
