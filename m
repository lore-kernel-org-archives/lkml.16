Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A469C28A406
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746631385; cv=none; b=qRX0A2dLXJNoXxh30iNIHTG4SJo7HeLi5JWkFfisc0hNh6RNRg+TRv2X6SvHB0jmcwOvV0vfDcVojt3H3pXRwd8Lw7Ioh8roi5isVu+704YuYRIhTdtkQg/2zsqXbCQ4VsSN+CTUXe4EoaTtVFkIKjkWa3USrUZlM9MXfGcqfmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746631385; c=relaxed/simple;
	bh=Zgmr6iJd8g+KzK5o4rT/ELhK01dSOYofk9zzH8Ey8ic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ol/A7W5ljpJP38M1P52DqK4miR+UH64BkxH3stPgSGbtjxXJEgqvhDZCuXkHWYclc+6DCeYB7lsbgr6slc+CGNNMws2vKxHjeyfm9VCRXfPlSbdVOjP4vPQrRtc3Stwm8nme1HtaqmrTVNfOJ2AVmbiNBQyXp6pYCH0KF81tlrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOciCNrz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOciCNrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746631383; x=1778167383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zgmr6iJd8g+KzK5o4rT/ELhK01dSOYofk9zzH8Ey8ic=;
  b=fOciCNrzxvFsfxd1i6RnGDnVtougFqKahW7D34Kwj06Zek8rlvwN/a2F
   DmdW4TO5n/rc97QiDs/7FjRBJBaPN+0UZo+x0bqUhh1d1n8tW0pBZJOFf
   oj0WSIo58+0nLaP2JkUp9U4lH4YPMZsbaE/EMkXTwbauROm3K1atAL5Ss
   Ipb5z2BmwHqvRbvt37LE2idCcWnbomyflVu7gBZsFeDjVEdvA4oMOAoND
   j8ZmpCYFeQza50/2KHZweB2otaD5Z6K8JtWzOB1lzuEpI6Yp3nwCG2RDC
   zeDm74iU2ndKsAXiYdsQIV+nttNAOYu22NXqLOrgKuHKAru+vCpJaZxLv
   A==;
X-CSE-ConnectionGUID: 74uG4hwARLynV10MAX5OMg==
X-CSE-MsgGUID: yXoGOgV+Q3yIHadaiMaAjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52186926"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="52186926"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 08:23:03 -0700
X-CSE-ConnectionGUID: SQZhonD9SmSnwxX7tMw4lQ==
X-CSE-MsgGUID: iJ5SNU+pR9exN/yj1i6iTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="173179086"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 May 2025 08:23:01 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCgbr-00084H-2k;
	Wed, 07 May 2025 15:22:59 +0000
Date: Wed, 7 May 2025 23:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes
 available for requested alignment of 8 bytes
Message-ID: <202505072328.Xo8JNSdv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d8d44db295ccad20052d6301ef49ff01fb8ae2d
commit: d4b500cceb0e09ae22722d41454df6012848062b Merge patch series "riscv: 64-bit NOMMU fixes and enhancements"
date:   1 year ago
config: riscv-randconfig-r113-20250428 (https://download.01.org/0day-ci/archive/20250507/202505072328.Xo8JNSdv-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505072328.Xo8JNSdv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072328.Xo8JNSdv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes available for requested alignment of 8 bytes
>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes available for requested alignment of 8 bytes
>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes available for requested alignment of 8 bytes
>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes available for requested alignment of 8 bytes

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
