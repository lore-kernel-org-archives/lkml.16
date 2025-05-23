Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF517DA8C
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747988552; cv=none; b=lfdRSf/NCZUMo0rm8zZe7uhSbEKdayctku4b34i8yEmrH81Mf18sPV+qRQivYp56oMkcvwI70wfg6dHmvZwp8WZth5B4HvYLqD90qyc3L1atC4MrNN6TlyupZYyDCv2x+wiYHJP2sd0fjcKPCSD6pPlVbOp3ombP23lS6tF+BtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747988552; c=relaxed/simple;
	bh=KofmuoWW6RM4yPLO4s7CIDSJr8srBWbA+nfOYDRVIKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bz3IMBSmkAmbeP9kLM2s+rzcX4ghBmECaZF/TcuYPu53TiKucdAKa5jhU7r1mj90JzOzt+oPLcq6yVaMz+g++B26YKDZ+c5LhmO18byXTIrP0JNJ+rD67+8xh9TeO9tnIYl6v+fw1N3uIACgAyQBvAYZtRroDTn/VVaMbRTqRsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=We1qFMgU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="We1qFMgU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747988550; x=1779524550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KofmuoWW6RM4yPLO4s7CIDSJr8srBWbA+nfOYDRVIKU=;
  b=We1qFMgUiznpXY7HqPyt+mbYG26jj3i3QTkCjXvz+Hvi7pHoLm4QcJ3j
   E2z69Q+z1RlFpMrlyJsvRmpuoKn4IJ8OrNDgIeiJOpdq+p+K3jWiYMDHJ
   H90b39sm7SvKB9TGkzfZ5xd6be+xZLwW9vCoPu7niCf0MTQYJ1QqO+PDn
   T29sa0GgYhN8tqF2I9nfdljrdSOSSyijdj2QIVmNtATdS122l9VajCECk
   +rknMHS2KBuFQiL9VqKZeqHmq0+Be+Ru9fpRru8ugyCsemZQgndxbTEfh
   yFjfBt30/k8WdAjVowYQ7cUlNbepQTysW68kWpurlrDiIDhGrGT9/V10l
   Q==;
X-CSE-ConnectionGUID: uPm73aXtR2amHTgE+v4GNw==
X-CSE-MsgGUID: 91Qs8NhiTt+Wo7ZH5e0TdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49958773"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="49958773"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 01:22:29 -0700
X-CSE-ConnectionGUID: NPBBHz9PQlCsiniAjuTgDQ==
X-CSE-MsgGUID: u2Z1kWcETRi5Eda0DINPCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="146032455"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 May 2025 01:22:28 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uINfe-000QCA-0R;
	Fri, 23 May 2025 08:22:26 +0000
Date: Fri, 23 May 2025 16:22:02 +0800
From: kernel test robot <lkp@intel.com>
To: Pawel Laszczak <pawell@cadence.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/usb/cdns3/cdnsp-gadget.c:157:16: sparse: sparse: cast to
 restricted __le32
Message-ID: <202505231647.JddZ6QjR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94305e83eccb3120c921cd3a015cd74731140bac
commit: 241e2ce88e5a494be7a5d44c0697592f1632fbee usb: cdnsp: Fix issue with resuming from L1
date:   3 weeks ago
config: i386-randconfig-r122-20250523 (https://download.01.org/0day-ci/archive/20250523/202505231647.JddZ6QjR-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505231647.JddZ6QjR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505231647.JddZ6QjR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/cdns3/cdnsp-gadget.c:157:16: sparse: sparse: cast to restricted __le32
>> drivers/usb/cdns3/cdnsp-gadget.c:159:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int val @@     got restricted __le32 [usertype] @@
   drivers/usb/cdns3/cdnsp-gadget.c:159:16: sparse:     expected unsigned int val
   drivers/usb/cdns3/cdnsp-gadget.c:159:16: sparse:     got restricted __le32 [usertype]

vim +157 drivers/usb/cdns3/cdnsp-gadget.c

   141	
   142	static void cdnsp_set_apb_timeout_value(struct cdnsp_device *pdev)
   143	{
   144		struct cdns *cdns = dev_get_drvdata(pdev->dev);
   145		__le32 __iomem *reg;
   146		void __iomem *base;
   147		u32 offset = 0;
   148		u32 val;
   149	
   150		if (!cdns->override_apb_timeout)
   151			return;
   152	
   153		base = &pdev->cap_regs->hc_capbase;
   154		offset = cdnsp_find_next_ext_cap(base, offset, D_XEC_PRE_REGS_CAP);
   155		reg = base + offset + REG_CHICKEN_BITS_3_OFFSET;
   156	
 > 157		val  = le32_to_cpu(readl(reg));
   158		val = CHICKEN_APB_TIMEOUT_SET(val, cdns->override_apb_timeout);
 > 159		writel(cpu_to_le32(val), reg);
   160	}
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
