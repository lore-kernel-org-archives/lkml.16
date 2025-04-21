Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1754E256C9B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 06:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745216300; cv=none; b=pV+F8hpj7R2nKimNVpf7poJs+9eY6p5PLIujYseGsDiSQjprF849P1fHMKPbi5jVgEmX6Y2o6sEC42/dQR4NjLh2s5ONEx8EJTG9LrbFBH1HfKJY8rvKSR0KAdvdWRHT1ahYujElqH5/LdybLRz9lye1T9auPpei6YcO4J2eevc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745216300; c=relaxed/simple;
	bh=i8mi3Ti3xvwTi6WUGy39chbE1649OgvtyBdXtBl2hD8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mHv2k8qTsSgBql+qOEUARiqvNqBsi/QtHU8qs4mCQnplgSvMsWEu61L8ZJxxLrjQTzAQu0zAI+PmElu6WGstzNZSqY7hrewSOt6p/68Uk0yJBy50NOWBK8VXlBKX+z/VIMqjGh9dESvNC1KzSwZOuCIapS/fBvEJ4KhrDCTWOJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7fm6mYF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7fm6mYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745216299; x=1776752299;
  h=date:from:to:cc:subject:message-id;
  bh=i8mi3Ti3xvwTi6WUGy39chbE1649OgvtyBdXtBl2hD8=;
  b=f7fm6mYFF8mplHBj5NLXFrBBpHSU0Bw7wZLIbKf2sp80vy9wkWmWJhLB
   PfWoe75UE0kwWS50Z5U5WcjUsNwpP5K6zo0PxpGjz9s5kFalEdz2RjEFt
   Ca2WSsYSu5WeRRWhO43lRUXCr3meyQIzdg+YZQsMTRfkl1jkhB21sExDm
   59SK9MX0vCHN9ez8t3vpo1sRSTK31IbGim3dPsG++0nqvPBSjCPlINVIT
   T9Ne5Sgo6qB8tTnmGHp0TfsM2bYByWb4a3ouzxJHcl7dZMZJRS8Of5BdH
   VVhWKvSBmFm0tg98ZHYtrt2ABpIg3bTp8tVvUnaDH9nWzsLE55GLc67aU
   w==;
X-CSE-ConnectionGUID: brXMgJqWREqPurL9YTHYMg==
X-CSE-MsgGUID: oBlQ4akBRTa71+BCPkIbFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46627849"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="46627849"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 23:18:17 -0700
X-CSE-ConnectionGUID: u7PReyXnQ8qB45wuvx305g==
X-CSE-MsgGUID: 8BR5TkZVS0+jPNBFnUHfiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="136443443"
Received: from lkp-server01.sh.intel.com (HELO 9c2f37e2d822) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Apr 2025 23:18:16 -0700
Received: from kbuild by 9c2f37e2d822 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6kTu-0000C5-20;
	Mon, 21 Apr 2025 06:18:14 +0000
Date: Mon, 21 Apr 2025 14:17:36 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:tip/urgent] BUILD SUCCESS
 f99c90b06e760fdf4f311bfe8164281b482602eb
Message-ID: <202504211427.7thM393y-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git tip/urgent
branch HEAD: f99c90b06e760fdf4f311bfe8164281b482602eb  Merge branch into tip/master: 'x86/urgent'

elapsed time: 1446m

configs tested: 19
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250420    clang-20
i386    buildonly-randconfig-002-20250420    clang-20
i386    buildonly-randconfig-003-20250420    clang-20
i386    buildonly-randconfig-004-20250420    clang-20
i386    buildonly-randconfig-005-20250420    clang-20
i386    buildonly-randconfig-006-20250420    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250420    clang-20
x86_64  buildonly-randconfig-002-20250420    gcc-12
x86_64  buildonly-randconfig-003-20250420    gcc-12
x86_64  buildonly-randconfig-004-20250420    gcc-12
x86_64  buildonly-randconfig-005-20250420    clang-20
x86_64  buildonly-randconfig-006-20250420    clang-20
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
