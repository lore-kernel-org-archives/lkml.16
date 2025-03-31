Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C8E1BD00C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 10:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743415401; cv=none; b=koZByBJTI+A9J9o3lngShJuEna2axg6bbhy6oqxg6FlQBOQWipW1TaEE4McVx5YKbQrLD1gu4pi0YoyfnBdZPKib8xdSLUauxgiPlqeYQzzKpoSuYpx7IrdrY/OqKZiiLxX9fkBUMEbaLyf0ZBnFk8m5Xgt6DkPzUdvB5KCNw3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743415401; c=relaxed/simple;
	bh=x79NNq4wFQztyn0qJmZrRiChroiuK/mQs77suz6r/hY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y2fDqcfvFLXHe2DHx2jSZoALbRr2Il6PUzF8dw3KlCK9ZORQDf5Rci5l065iv1PC//+2fKW8FFlzGp+Xvv0nQ+pNlpk5y4IlIVXuq2o6ughHcaHDFLX2YHZdjc+lLxSj7rYY9LoixKJma8nkYDk32L9bkfG3oYaWbP7L/Eeum6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5Lqy4sT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5Lqy4sT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743415400; x=1774951400;
  h=date:from:to:cc:subject:message-id;
  bh=x79NNq4wFQztyn0qJmZrRiChroiuK/mQs77suz6r/hY=;
  b=A5Lqy4sTx8NSkZG2n8RDcyMTr+gviZM+pVJSKa6MWLt/Fc1ptSZTkv7A
   EOtfIJXi8t1dCBRFwtDiYpdbi6tCnBg3yLgchBrrwHVPOTfadgCp7Yn22
   piySelTZrMOg3fzHpVoCIznN+Attz9w4TnY3uS3piBul2A9wyVmzatabH
   SZk4fvaWqSpUAt36rID9+YURou4FjEU9Vvr+xOk0N9cVspHifLyNApwqT
   KQlbipyaAQPfyLyIrV+lpWelvYHW/8GgMoU34f9dvZIL2TC6TNWGwEELf
   /Eo9zysg0lzqpm8COkbo4T8Nylu3yuC9+Nh4p7iPfS+6rmTzroupk+riK
   Q==;
X-CSE-ConnectionGUID: aKusE/3sSB+NTyrXTtD6yA==
X-CSE-MsgGUID: CQrKNmJ0Q4eNO1jImSxzJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="43848002"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="43848002"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 03:03:18 -0700
X-CSE-ConnectionGUID: UwOfmKbTSR+plmstz4Dq2g==
X-CSE-MsgGUID: 3B8oEEcbT0KzUWtnvch7uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="156974403"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 31 Mar 2025 03:03:17 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzBz5-0009A2-0a;
	Mon, 31 Mar 2025 10:03:12 +0000
Date: Mon, 31 Mar 2025 18:02:43 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:WIP.x86/alternatives] BUILD SUCCESS
 21e327420a672edd1070e6c947504dcaf41c341a
Message-ID: <202503311827.uSDrFV1Q-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/alternatives
branch HEAD: 21e327420a672edd1070e6c947504dcaf41c341a  x86/alternatives: Add comment about noinstr expectations

elapsed time: 1445m

configs tested: 19
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250330    gcc-12
i386    buildonly-randconfig-002-20250330    gcc-12
i386    buildonly-randconfig-003-20250330    gcc-12
i386    buildonly-randconfig-004-20250330    clang-20
i386    buildonly-randconfig-005-20250330    gcc-11
i386    buildonly-randconfig-006-20250330    clang-20
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250330    clang-20
x86_64  buildonly-randconfig-002-20250330    gcc-12
x86_64  buildonly-randconfig-003-20250330    gcc-12
x86_64  buildonly-randconfig-004-20250330    clang-20
x86_64  buildonly-randconfig-005-20250330    clang-20
x86_64  buildonly-randconfig-006-20250330    clang-20
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
