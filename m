Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE91C18C345
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743118313; cv=none; b=WLPqBgKv+bLFQuMaCrngwGYoIE+gJs3CJtl7HIa0b5laNw9w5qZmBXN0n7CzFumkLw4EPyDNGyd4P/wEFgXJAtt5Sb6ISeBGsjHd00jk6G5NEu7RVyA5lxqRVtPe+Up0Pl5N8SQCX879BcVdUBE4casXTniZMCjIemkYqrzlJwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743118313; c=relaxed/simple;
	bh=dwx6aEWWZJ2ZJesr7YmAKGxq6m8bu7P144utfCqZpw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EveIfnQ3KGpQhhV/MxqQGRA5isSUdYmBNswNDDfUmDBQD0fVAuDQR2361UWduFrwnPcI7dlg7ockiw1Nh+/BEREX4qf6AUf1j4sB0uBWnbY0ya+yS0wsd+bFGt8i7YbbBq9CP1yKmbgejklxc/39f5YSdM5hw2We3mX666ikQLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S2XEupPK; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S2XEupPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743118312; x=1774654312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dwx6aEWWZJ2ZJesr7YmAKGxq6m8bu7P144utfCqZpw0=;
  b=S2XEupPKcc5gztZ90TLWj1FqMMNxoH3a4fG1HT7EFFpYqvyTutyy3ove
   zVPksJfmG4VZtzEirz/Ig00M+GrPBenwhk/lErXoLBpHT45a+H3DTtfJb
   DSZ8xPnPrrKneesLmyaQzQSKvgoCDSIJgqoUfOnG4fDfl5Q+oeVYQ/DIk
   Ux092XqKIMSWlDOgR0ENhQuxFOHjoWIWdoBKPcuZotBToGnOZIGDQEJe0
   lQU635vKnV9D9D+Fkwb6CGazQHrgiSUredPj+kWKBm0VXBH38sUfCCECb
   VN/pL0woOK7aeMcsRyVjg7353kurhDPBLnV9/185eAsrTLI6CoOqyTrko
   g==;
X-CSE-ConnectionGUID: wNzfsDBiSFCROz5sZnpLsg==
X-CSE-MsgGUID: C2rRl0TnRh6Qd+vuzM2Uvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44352960"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="44352960"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 16:31:51 -0700
X-CSE-ConnectionGUID: 2o2+nJkXQgeAzXvY/ml0Rg==
X-CSE-MsgGUID: CWsH0USeTgGIb3C9yL8c+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="125090626"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 27 Mar 2025 16:31:50 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txwhP-00070k-38;
	Thu, 27 Mar 2025 23:31:47 +0000
Date: Fri, 28 Mar 2025 07:31:45 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Subject: [tip:objtool/urgent 9/23] arch/loongarch/kernel/traps.o: warning:
 objtool: show_stack+0xe0: skipping duplicate warning(s)
Message-ID: <202503280703.OARM8SrY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool/urgent
head:   1c9d28fdf70d4ae3e8dfeadee982461403c6bb50
commit: c5995abe15476798b2e2f0163a33404c41aafc8f [9/23] objtool: Improve error handling
config: loongarch-randconfig-001-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280703.OARM8SrY-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503280703.OARM8SrY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503280703.OARM8SrY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[22]=-1+0 reg2[22]=-2-160
   arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: stack state mismatch: reg1[23]=-1+0 reg2[23]=-2-152
>> arch/loongarch/kernel/traps.o: warning: objtool: show_stack+0xe0: skipping duplicate warning(s)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
