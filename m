Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3254C9F
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 06:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739083813; cv=none; b=Lnysy/rmnlPHJJxeGo2ksR77e++DQZ8GtMYE19w4eS+lbI5qJN/fXUaZ0vq8Eo3lifE4sfLyB61mOfGdJSvcx+roGo4dNC2e8ZzFdOYTYfdrTvENSZVpO22cH3S0+pkf3GvnWPa6gmXIDXWsJtM1r0//M/UrIH2EsT6dJI6ZUYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739083813; c=relaxed/simple;
	bh=Xep+RJukubvWR9VBCpzfAsN7h8x4Fl+f+RAvyLx3ORk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fZDNTh4oqUuwxmxoJidIrJbPx0PyAc/VFgp4dlSkHDC0eUiVGDDu4eTHzX/tuoR52ZWoN2PAhzxybuo+xn5gMirfbO0Es7do0RlC7jM635uSS7hjAvB69986jvYUVX14L5M/R/jLHNWurXNqFq8GeslqCsxp6GgImIDspLTPJC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDm3wP4e; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDm3wP4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739083810; x=1770619810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xep+RJukubvWR9VBCpzfAsN7h8x4Fl+f+RAvyLx3ORk=;
  b=QDm3wP4eWRPsrX+HcUMZlPFiNKk7owEOXcgJwVHvkuMuqozfbw+T/grV
   k+88GfDoaB9ykgmLaYahmroSUrsx3dPjN/Ns3mlSyVkD4Sv3Ff6Yxt5p6
   ux5supBFsdQgNdYxV1YVo78NIVhGNS+H0VNSXFramkUELTq6uy3SvhzsL
   WXwChxp+1hO69j1QuSjgqlCVv99LsBVgjssxdtVScs9eViGVzx3H/rFcZ
   gUBGmHO8rcSdyTsbVbKzlxjQUAoAvwSOzH+ZkhX9ZUqj4JsV2bkZvEYP1
   jyTU9jGbzFBnlOBKDT7bxZM8SIx41ez0PTwULjL6cxbA0jCBPKFvoVsVj
   Q==;
X-CSE-ConnectionGUID: PM2sd/e5SP6fvZnvpPZDEg==
X-CSE-MsgGUID: UF6Cm4HNT3uPBunmJVcDew==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="27289134"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="27289134"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 22:50:09 -0800
X-CSE-ConnectionGUID: gSYT+ZhYSwWT+3HeJYiEJg==
X-CSE-MsgGUID: T/2wPogDRlyG4yFqbPnaqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117098880"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Feb 2025 22:50:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th18n-0011Ar-2n;
	Sun, 09 Feb 2025 06:50:05 +0000
Date: Sun, 9 Feb 2025 14:49:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:841:52:
 warning: '%s' directive output may be truncated writing up to 431 bytes into
 a region of size 28
Message-ID: <202502091410.x7gbq8Wl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jose,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9946eaf552b194bb352c2945b54ff98c8193b3f1
commit: 091810dbded96c2af81f645e386e4262553e3493 net: stmmac: Introduce selftests support
date:   6 years ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250209/202502091410.x7gbq8Wl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091410.x7gbq8Wl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091410.x7gbq8Wl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c: In function 'stmmac_selftest_get_strings':
>> drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:841:52: warning: '%s' directive output may be truncated writing up to 431 bytes into a region of size 28 [-Wformat-truncation=]
     841 |                 snprintf(p, ETH_GSTRING_LEN, "%2d. %s", i + 1,
         |                                                    ^~
   drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c:841:17: note: 'snprintf' output between 5 and 436 bytes into a destination of size 32
     841 |                 snprintf(p, ETH_GSTRING_LEN, "%2d. %s", i + 1,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     842 |                          stmmac_selftests[i].name);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~


vim +841 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c

   834	
   835	void stmmac_selftest_get_strings(struct stmmac_priv *priv, u8 *data)
   836	{
   837		u8 *p = data;
   838		int i;
   839	
   840		for (i = 0; i < stmmac_selftest_get_count(priv); i++) {
 > 841			snprintf(p, ETH_GSTRING_LEN, "%2d. %s", i + 1,
   842				 stmmac_selftests[i].name);
   843			p += ETH_GSTRING_LEN;
   844		}
   845	}
   846	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
