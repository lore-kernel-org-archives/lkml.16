Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC637FD
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744439141; cv=none; b=bCzE2sXjXmXTEu0Rj0KhEQIHfUABA7U6kfO1VsMYwHwCQDeadf2Ld+w4jJC38jqjRUsiXtvk8CSf3vX5f6LeGKNifLarY9mnin08HQT+YhxvzYgu6Frs8jmuBVtFzRsM8vmJdld/jVbi80958m0uwosMYY+3Nn/9D5A/2/gqCGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744439141; c=relaxed/simple;
	bh=C9FJCaqWjBbJYONd4u4BeG0MfIDA8Flo5Yry5CDL8Ek=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WQqJkrIrxVr3WPvSXYD1FZoQh4SCA0myTnXWp5TBxGpzEkcM7VQcfi0f9AReE0mdr+6fbpCLPhzVQl/e1Q1OcDcHp+Ot5U3nE27+vcIbTaHuODlFT6oKQxYbiDeUPUFLEKcYef8SPly873kDixne0XJtyvLVaFLsPQHDGhIJ0Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UpC6CwPi; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UpC6CwPi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744439138; x=1775975138;
  h=date:from:to:cc:subject:message-id;
  bh=C9FJCaqWjBbJYONd4u4BeG0MfIDA8Flo5Yry5CDL8Ek=;
  b=UpC6CwPiOiKSfwjAkrRE5xS9IOnGVWLgV7lSR7KimjE/UVH7cgDOePRa
   qwudOtUZuWRD0NNqJz9JSR914NHg58slyyvgSz1IdslArbUI8dYm+kGOB
   tjq3iaVKZzsSXpQHniyNt5w/wjrqo8GGetTljfghlz6qQUHPMFoyf6Lhm
   LO7Wdeobe1VCwSZC25a/0WA8n6hGohnDcb0r3lsfMsCeDMPLgZJQchz8G
   5oiFfckUFkI6WAkRSwbU/MXGOcRNw5EBK4YkanIGx8h3/V7TB3lOof8Hc
   bUpn6ib787fmHz3WS+fU6jRJSVcnBPVQRcOdnhpY/U6ofhjFknWTVkzuY
   Q==;
X-CSE-ConnectionGUID: oiSgsbz1TJeCDFl8U/9Cjw==
X-CSE-MsgGUID: d8xgvV/6Q7ejQ+r1Nm7E1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="49640513"
X-IronPort-AV: E=Sophos;i="6.15,207,1739865600"; 
   d="scan'208";a="49640513"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 23:25:38 -0700
X-CSE-ConnectionGUID: 7wGjlHi3Q5GuuIzbG+V7Lw==
X-CSE-MsgGUID: 3gYxCmxxRIWH6iAi6npdIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,207,1739865600"; 
   d="scan'208";a="129927064"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Apr 2025 23:25:37 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3UJ4-000Bbk-39;
	Sat, 12 Apr 2025 06:25:34 +0000
Date: Sat, 12 Apr 2025 14:25:03 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:timers/urgent] BUILD SUCCESS
 3940f5349b476197fb079c5aa19c9a988de64efb
Message-ID: <202504121457.9cgViO6D-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
branch HEAD: 3940f5349b476197fb079c5aa19c9a988de64efb  x86/i8253: Call clockevent_i8253_disable() with interrupts disabled

elapsed time: 1444m

configs tested: 19
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250411    gcc-12
i386    buildonly-randconfig-002-20250411    gcc-12
i386    buildonly-randconfig-003-20250411    gcc-12
i386    buildonly-randconfig-004-20250411    clang-20
i386    buildonly-randconfig-005-20250411    gcc-11
i386    buildonly-randconfig-006-20250411    gcc-12
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250411    gcc-11
x86_64  buildonly-randconfig-002-20250411    gcc-11
x86_64  buildonly-randconfig-003-20250411    clang-20
x86_64  buildonly-randconfig-004-20250411    gcc-12
x86_64  buildonly-randconfig-005-20250411    clang-20
x86_64  buildonly-randconfig-006-20250411    gcc-12
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
