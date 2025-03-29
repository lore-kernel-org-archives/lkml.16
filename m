Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA212114
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 03:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743217891; cv=none; b=q9YZYGCVedPC8lfVb0kaMvEM0QQfXawY0mN53FIE8TZrVdY1m0YiSToRQ7tSGsSvcTq6QvG420SV/5++tgQxOnd3L+vQfrhdlnJRF3zgEsoedIUEsIYqPYMWoXeLq7QAbJq75mKqzTN2jr1b51HCBDceU3pd7Krp6XzRW08UedU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743217891; c=relaxed/simple;
	bh=ozYsBlwZ80mmC9DOto6zSpibtseYMNHA9EQC5POqTBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WXiE7UmH2Z/SYC4b/3oRIko1TSoJeJSL+8dmT/tz0P97FTGL+Tzyny48tCuVTjpFR04VyiOnQ9cb3AmIZz4RUTkWmS9Yi9oqEW8l45vvVHykRGrevk3Ss3tgPeDbCiIf4NDt+Op9ATu0jK8dz6w9DGzEREIjvqzp1T7NN7CCMi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbMCIEgG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbMCIEgG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743217889; x=1774753889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ozYsBlwZ80mmC9DOto6zSpibtseYMNHA9EQC5POqTBM=;
  b=bbMCIEgGZ7Ms2ch22K2Xj4eXfJU3lW4uq6PfUEaq2uRPKv3TrW4d6WJA
   8wC3e4+ClL5s3WWwYRVPtz4FaAiUG7kj4Hcigy87qQR30mh2ofOqVPoBq
   ag5d9uGSRPBuxEkZBx163h8UVR8jy3PVzRHfgkdKqqpAEqN+eVEuvExDE
   9+o3YjlyVO1Ovjn5mlvAgnPgF7rfdHPuQovfGW2/NOg92PuMpJGCbnI8A
   2bnBLq2KSYf4y5N+nx6hB8rnHNWAguwlE3bLIEIg3L3WYzbM+ImToz9oI
   nKZow60gDSc905wTdkQl9yMUPWskdwcKg1qkbN2OqpfLp3UNL7TjCI+gR
   w==;
X-CSE-ConnectionGUID: a7l6aTVUR/ScpRALZYAOvQ==
X-CSE-MsgGUID: Xf/FWxoIRk+++xluaEqkFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="43833855"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="43833855"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 20:11:28 -0700
X-CSE-ConnectionGUID: x0S5uQqvSy68I0odGtaLgw==
X-CSE-MsgGUID: 5HkueOixTkK7PRUM6kZwqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="126134780"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 Mar 2025 20:11:28 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyMbS-0007sM-0L;
	Sat, 29 Mar 2025 03:11:23 +0000
Date: Sat, 29 Mar 2025 11:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sumanth Korikkar <sumanthk@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: s390-linux-ld: Error: unable to disambiguate: -no-pie (did you mean
 --no-pie ?)
Message-ID: <202503291141.yTqSRdTX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sumanth,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0c86b42439b6c11d758b3392a21117934fef00c1
commit: 00cda11d3b2ea07295490b7d67942014f1cbc5c1 s390: Compile kernel with -fPIC and link with -no-pie
date:   11 months ago
config: s390-randconfig-001-20250329 (https://download.01.org/0day-ci/archive/20250329/202503291141.yTqSRdTX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291141.yTqSRdTX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291141.yTqSRdTX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> s390-linux-ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM_XE [=m] && DRM_XE [=m]=m

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
