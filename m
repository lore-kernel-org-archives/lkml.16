Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94DA20968E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744929143; cv=none; b=Q8myyWPQKsxOGA0RyQyQbaoTfaqzv/bGwFYo0uSgx/jcKbYReIzgj0FXSWY6g962yp6HOzLFJQpUo1Kz2k2+T0rACULOOE3HPIXBab6j4QJvG1Y5BsMHRUO/Eis7tZgVMnvktFw7PPrFjzUmCX0jxdowuE7TxFlROLMakFxPplQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744929143; c=relaxed/simple;
	bh=VNUmKQZZJBMOUmgLAiYTceoj2tXJqtJX5TVTzyW3bbU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dd5PIQHWYQO9Svjh8OCM7WCDeqVuz1EgN7oHNAvoH//IEYo5QIdu2lhBxKEZgSNdsds3vB0IjfOR63Mx1nHOVwPj9rVsb+GvMXBscmYJGgQgAm91XzeUMh+04+vtrdEHKSeOHkxhDlLglyKsRWXVl7lNgqi9VEO1kyXvsi5z7CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RYmPdySJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYmPdySJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744929142; x=1776465142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VNUmKQZZJBMOUmgLAiYTceoj2tXJqtJX5TVTzyW3bbU=;
  b=RYmPdySJktrVzM5jFBRSqq7SCMXyW0eWsD8HRd/q372vW7PHDrgODfNw
   7gHy9GiYN1+HQbbGu4nw3ghvX6/keK6S7lz0bg3Lfau9M5HDDXp26LX1D
   D1wI3CceLX9e8HG3A+IO8gNjqiKpJRPvSjOw/qQLUYiJYGrEqobbVNUop
   zgU+G0el3LW4AWOmWrmQ3DZg/uQi9ZXDKvwkq6qD1Gt1MfxkI2rcSm+7/
   e7LMCi+/Sc6U2lp2i87NfuB2duMbK15fNcY3VbTry/SNUExiDWo/CV2t6
   DZEO8POWSdbCn2QdVS11GZeC6KZEwu4MmU96CcUXAkHuHiKUJaXcGkPaN
   Q==;
X-CSE-ConnectionGUID: akPnqTk8TQKgdDRHyO6gOg==
X-CSE-MsgGUID: qmS7BG2uRZiPFbP5/u9T2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57916282"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="57916282"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 15:32:21 -0700
X-CSE-ConnectionGUID: 1yzu9j8oSmywbfXjKeQp2Q==
X-CSE-MsgGUID: ADGxIFwbQL+l42Y595R4oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="136118819"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Apr 2025 15:32:20 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5XmL-00026P-0X;
	Thu, 17 Apr 2025 22:32:17 +0000
Date: Fri, 18 Apr 2025 06:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 LEDS_EXPRESSWIRE when selected by BACKLIGHT_KTD2801
Message-ID: <202504180617.TyJnsMoY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5c6891b2c5b54bf58069966296917da46cda6f2
commit: a5554f1b5bc3be5d01f41b7550aa5b05b7c88c09 backlight: Add Kinetic KTD2801 Backlight support
date:   1 year, 1 month ago
config: sparc64-kismet-CONFIG_LEDS_EXPRESSWIRE-CONFIG_BACKLIGHT_KTD2801-0-0 (https://download.01.org/0day-ci/archive/20250418/202504180617.TyJnsMoY-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250418/202504180617.TyJnsMoY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180617.TyJnsMoY-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE when selected by BACKLIGHT_KTD2801
   WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
     Depends on [n]: NEW_LEDS [=y] && GPIOLIB [=n]
     Selected by [y]:
     - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
