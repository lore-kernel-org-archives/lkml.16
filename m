Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343601EE001
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743546373; cv=none; b=KxQUoLuYjLQlLAcTItYDTcC+wcqu/OOQ6fhng+zmSBSa3RImUSMyzilJRYWezfE7+mArPYWTXprvxL+t/4g4weCTm0hIHJzPvifKpMubNED1+cAEz7jeXHabC3ESKPNql7wsIi4QgRMHlpykvnugpsmiLghr7RRAb/DkoVhHwtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743546373; c=relaxed/simple;
	bh=bNCnRyJ71qC9x59DQFLXj9G8Kxb1wKq4Z03PGoAdBTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hqWooBLBEd0cba4Fc4LsylpnzESfkm6/4RDAkfZiibtROiLBC0p8BwYqb5j4DCDYMHX26HtA3y7GmfWAk3xnJlabkrbAzF4L/2u/FPwCGV307t0J97m52ZTEiyDKPBHVaCt7dwYbn3ZmFOwaVeUhvN0nD7HO5RYXDEXgyST6uEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dqbYFHvR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dqbYFHvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743546372; x=1775082372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bNCnRyJ71qC9x59DQFLXj9G8Kxb1wKq4Z03PGoAdBTc=;
  b=dqbYFHvRKMx9DLfF1UEHggc8KVWZTnVZnzftdpYvfOiuHlHMADa136jw
   fJtrVBVouIttIUjBOdAu2MxzEyuQlROSJg3utOcXkBuSZJnzUXMxMTBK9
   ZDVrb9cKnOyDcZvNFWWOkvfn6YO+kWu5iuC0HH0DIZmcwW7+g4Hf64Nnd
   hpbN1ZUqR+Mq7T3P/fYgaK1gndnNm99nUnge/+DWaevtXvug3djO+O+bx
   jAvpsCYdNtDHQV8trNaFk45dFBSZqfWRB/o3Z/zd6tHj0I+XU9pNt+Tq9
   UA22wjGprCVDVI+SurBIi/y9rz2ZQOfZJz3Mte56d+FgD+ZcoNefMY1s6
   w==;
X-CSE-ConnectionGUID: OXslKXteSlGRQwKoE4P8Dg==
X-CSE-MsgGUID: lTk+AlIeRaqVoVqvHvl6tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="67362043"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="67362043"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 15:26:12 -0700
X-CSE-ConnectionGUID: DjaJtEvQTP6zAoI6+JQSiQ==
X-CSE-MsgGUID: m4bbaJNwTTybL+yRx0sLXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="126473231"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Apr 2025 15:26:10 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzk3c-000ACC-14;
	Tue, 01 Apr 2025 22:26:08 +0000
Date: Wed, 2 Apr 2025 06:25:34 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: drivers/acpi/acpi_processor.o: warning: objtool:
 acpi_processor_get_info+0x178: stack state mismatch: reg1[29]=-1+0
 reg2[29]=-2-64
Message-ID: <202504020608.4vIsaUWL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   91e5bfe317d8f8471fbaa3e70cf66cae1314a516
commit: 5685d7fcb55fd729d7e0452c157a0ac8d72ca7b6 LoongArch: Give a chance to build with !CONFIG_SMP
date:   11 months ago
config: loongarch-randconfig-002-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020608.4vIsaUWL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504020608.4vIsaUWL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020608.4vIsaUWL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/acpi_processor.o: warning: objtool: acpi_processor_get_info+0x178: stack state mismatch: reg1[29]=-1+0 reg2[29]=-2-64

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GENERIC_IRQ_EFFECTIVE_AFF_MASK
   Depends on [n]: SMP [=n]
   Selected by [y]:
   - IRQ_LOONGARCH_CPU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
