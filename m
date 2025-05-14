Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4294C6D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 21:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747256419; cv=none; b=Ar+NnqoVsImGWmRJB7A6fEoUBbti3uFLW/PEde5WkBkwqSol5btQHxLgXj637uj9CQt3QN9WOTQftulQ2oMvWeq31ql4WdKKwvADAreIBARu5uBCrguyd4nUDnOj0hRXW56GN4KqOlZW9LsXYNUrVm7/IDPQbWgmEnTHzHok7YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747256419; c=relaxed/simple;
	bh=4p4bGYEBQA+3ER+p0kAYTlPbERQelccJ/G23FK8kjIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AKWCAnl3TleOvm9GFhu5/YHNEypAzPQbjFHcP+E/eLEJBcBUWBALOaxns3u7WW9kjw8cFUVmfN/KcBoiC9bQMZIRVxdKHVJ2/84SONUL8ri5zwT69Zp64Clmu2FqStU9+Lzs5IYkKu/f0+9QDk+v3EsJW9WlmlpEoElQG7jr5DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYvDd4h8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYvDd4h8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747256417; x=1778792417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4p4bGYEBQA+3ER+p0kAYTlPbERQelccJ/G23FK8kjIY=;
  b=bYvDd4h8ewbNkjJgPXNG5Mpy6Jjj8uwUWsK7T/Mi90+MiBXBGapFl6c7
   3SiJ2OUBZ5iAK4bVJyOKQySLHuSiBqURMPjmMwLqZN7qY4oMxSUsnrXfu
   H2lQ/DhfLraNzY2/tPMzFVIT234wsndFCG6g+/C60WV3soT6RPiXht6G3
   MB3lUVGQ0PJVVa7utcP3WhkWqz0zh4SXDBm7Ab8/NjQ/PSuh3pCt5Sz7j
   m88E9n++jVeD37lF4OB13oxYQzCCGRIBL9w/nEQ8FnTUHeF1cQblD0fw9
   HI4WRrt4dCN672oIdQMkLt8Wv8pCTNtlgmwrlCa/TO2hrvu+3wmObZdT2
   w==;
X-CSE-ConnectionGUID: ymsy/YmCT1a/hTjaLNBauQ==
X-CSE-MsgGUID: wScHkp+YQ9KHtdMYu6aFcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49339096"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="49339096"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 14:00:16 -0700
X-CSE-ConnectionGUID: AAumYLZlQIyENEn9lt4BdQ==
X-CSE-MsgGUID: et3ODh0qSuKVmZGbXFax1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="138214563"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2025 14:00:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFJD1-000HYd-2w;
	Wed, 14 May 2025 21:00:11 +0000
Date: Thu, 15 May 2025 04:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: FAILED: load BTF from vmlinux: No data available
Message-ID: <202505150431.WYWPhFv9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c94d59a126cb9a8d1f71e3e044363d654dcd7af8
commit: 8d46603eeeb4c6abff1d2e49f2a6ae289dac765e media: cxd2841er: fix 64-bit division on gcc-9
date:   5 months ago
config: nios2-randconfig-002-20250515 (https://download.01.org/0day-ci/archive/20250515/202505150431.WYWPhFv9-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150431.WYWPhFv9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150431.WYWPhFv9-lkp@intel.com/

All errors (new ones prefixed by >>):

   Complex, interval and imaginary float types are not supported
   Error while encoding BTF.
   pahole: .tmp_vmlinux1: Invalid argument
   libbpf: failed to find '.BTF' ELF section in vmlinux
>> FAILED: load BTF from vmlinux: No data available

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
