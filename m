Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B572218C03D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028596; cv=none; b=VoCECz2Yo/6ye8iJVKl5HygpNNmO3Kl1X9+afZjiVD3oG+TCF+vvp9+pRUJrYvjIz1wjtAJ+A/TiN+HwM9fArGmOKH7y+a/Weg0JOHEHXuQvM7P3dw2OVYSisVMZwEgBHESPTCm0LMXtq0Xhxrk6630d5Mli5FNiCjvtUjEN/9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028596; c=relaxed/simple;
	bh=096kVDdxg1bt3pvxSu/GiFwko2Wx0gFgiiIeigTZ2P8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDYJlJlsfgQ6iqyjdpweJ4ed98G/17P7jPCPUTiaVcVxrsUZo0cp8j9i85yJhI9HbLrJZCoSwXYdzzeWAXMfXAslvz5bEF0GVKZY0fiqWQwujQuGyvhr6B79S1Bs4CTG96gTXWiDZrAr673xArdHnzYh5D4WgFhOuEEXzLOmhUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBolSfK2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBolSfK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749028594; x=1780564594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=096kVDdxg1bt3pvxSu/GiFwko2Wx0gFgiiIeigTZ2P8=;
  b=JBolSfK2vLoJgV+sdh/w/w1gdq9UPsTBTS/kzfyekDLRkOxTTuBGGZ86
   YeQ/u1XTFraTXbD9KOTlVFlid+TChNhOKsRY1S6P0VScYY/rlPKQN/SKv
   Lc0fqT2F80xI9NkLeCrVFtRIE2NDbNpKRy8KoRoQrkL1TA4p3P3DvApCM
   0v6v0YZWQyAM0bMfIixhsSEUWsxZfMIWjgXL8IFlbKbE0leYuh7pXAOwn
   RXji3lhAiZKAsegc2PfJatUJuNRIl44DPk9dvYvH2CprLbIFgym7xVLnT
   Ik7q0HfKP+mRUZBDzBYXWd6jZB/JazmbZ/8Oav7YzCCD3QMnsxHEAhZei
   Q==;
X-CSE-ConnectionGUID: ve4GTAp0Q1+aB4ZhQwIr8A==
X-CSE-MsgGUID: vN+yswhxTnyIhaCGuE3Xqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68652927"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="68652927"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 02:16:33 -0700
X-CSE-ConnectionGUID: ck5TeUIyTcK9LNO3BH9VWg==
X-CSE-MsgGUID: MIUcF7U2TEyL3Uf9HDe2LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="182302295"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Jun 2025 02:16:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMkEW-00030f-2k;
	Wed, 04 Jun 2025 09:16:28 +0000
Date: Wed, 4 Jun 2025 17:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: error: <unknown>:0:0: ran out of registers during register
 allocation in function 'hv_apicid_to_vp_index'
Message-ID: <202506041747.095KSALN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5abc7438f1e9d62e91ad775cc83c9594c48d2282
commit: 86c48271e0d60c82665e9fd61277002391efcef7 x86/hyperv: Fix APIC ID and VP index confusion in hv_snp_boot_ap()
date:   12 days ago
config: i386-buildonly-randconfig-001-20250604 (https://download.01.org/0day-ci/archive/20250604/202506041747.095KSALN-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506041747.095KSALN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506041747.095KSALN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: <unknown>:0:0: ran out of registers during register allocation in function 'hv_apicid_to_vp_index'
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
