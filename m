Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218CBEEDE
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 01:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749344638; cv=none; b=cAZ9NkfSDHtoXBnHFpI4ILNkg9uqOaWDaIukcWFl5ahbjD1d9+8/03pGRC3+BGWgx9Ls7A4F4oyTdw/ovI01D9OfQtl2P6Mq/vg4czByyw72OYrfwAuHN0/j6DLDXzmwv/vdkZP9CP7FT61mOYlrJNk088IafFhbbpAntbEtOqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749344638; c=relaxed/simple;
	bh=NRIa/LbPRW8mOnkqUqqn0cCDl9cTBkCpVjOIQ50QLw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rSyBvPD3th2DcKim1W4DpJzc+I6RIPXuI4T7imqXrBpkZ6ySPFpatv4aavgwTHD93pv9BRvwA3BPkEoqHHeLd/lUMiyR9beKcaZDLO7A1jwkWhnR3VHdc14j4YB+LPbrG8te6A4BJ5N8b+oQC4/tvcYSGcvzsLPIc1MMPgNvntg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V31ppRS+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V31ppRS+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749344636; x=1780880636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NRIa/LbPRW8mOnkqUqqn0cCDl9cTBkCpVjOIQ50QLw4=;
  b=V31ppRS+q2T2PYZHXXlfjgYrei7S0yD0fQ5KmZPBVk6VNZGeho3DsHp3
   afaQorM9Vx6tHoEGJ33OaG6E6gnvLyJoSmY/BXxONysrMw+bS6+iU+NFQ
   Cw+ZO9et6KnsAew64UN20zRHXSr7tet+TU09a0EP9998q43RH+33HFTZt
   M8zx1bSALzkhSbUlLQsax8lGLH/Vx9ASzHtC12iP45duwc/Z2Va78cmgf
   bk+viBVjSCejJ6FlnvPWLWx4Wgs4zXDE7Li6Pzr+0+yAaqfTvQDF5Bv4g
   zHAE7Jf8wj6VL/nkqUyg+O5By2SukwmDPDZltQ5p/moViwmK0BGs5ZVKh
   Q==;
X-CSE-ConnectionGUID: FPB4kZH9QlKxp0m1DL2oXw==
X-CSE-MsgGUID: 5KOoaB/6TdWqn4M/PCPKiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51454100"
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="51454100"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 18:03:55 -0700
X-CSE-ConnectionGUID: XhHHoTbwSsCozvp03qM4Dg==
X-CSE-MsgGUID: kq7BfiU2TWCfK98SK065rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="150990374"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Jun 2025 18:03:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uO4Rz-00066f-2p;
	Sun, 08 Jun 2025 01:03:51 +0000
Date: Sun, 8 Jun 2025 09:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wei Liu <wei.liu@kernel.org>,
	Saurabh Sengar <ssengar@linux.microsoft.com>
Subject: screen_info_pci.c:undefined reference to `screen_info'
Message-ID: <202506080820.1wmkQufc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8630c59e99363c4b655788fd01134aef9bcd9264
commit: 96959283a58d91ae20d025546f00e16f0a555208 Drivers: hv: Always select CONFIG_SYSFB for Hyper-V guests
date:   2 weeks ago
config: arm64-randconfig-r113-20250607 (https://download.01.org/0day-ci/archive/20250608/202506080820.1wmkQufc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250608/202506080820.1wmkQufc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506080820.1wmkQufc-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: aarch64-linux-ld: DWARF error: could not find abbrev number 50
   drivers/video/screen_info_pci.o: in function `screen_info_fixup_lfb':
>> screen_info_pci.c:(.text+0x1b4): undefined reference to `screen_info'
   aarch64-linux-ld: drivers/video/screen_info_pci.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> screen_info_pci.c:(.text+0x1b4): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: screen_info_pci.c:(.text+0x1b8): undefined reference to `screen_info'
   aarch64-linux-ld: screen_info_pci.c:(.text+0x1bc): undefined reference to `screen_info'
   aarch64-linux-ld: drivers/video/screen_info_pci.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   screen_info_pci.c:(.text+0x1bc): dangerous relocation: unsupported relocation
   aarch64-linux-ld: screen_info_pci.c:(.text+0x1c0): undefined reference to `screen_info'
   aarch64-linux-ld: screen_info_pci.c:(.text+0x248): undefined reference to `screen_info'
   aarch64-linux-ld: drivers/video/screen_info_pci.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   screen_info_pci.c:(.text+0x248): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/video/screen_info_pci.o:screen_info_pci.c:(.text+0x24c): more undefined references to `screen_info' follow
   aarch64-linux-ld: drivers/video/screen_info_pci.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/video/screen_info_pci.o: in function `screen_info_fixup_lfb':
   screen_info_pci.c:(.text+0x25c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/video/screen_info_pci.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/video/screen_info_pci.o: in function `screen_info_apply_fixups':
   screen_info_pci.c:(.text+0x3e8): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/video/screen_info_pci.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   screen_info_pci.c:(.text+0x3f0): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/video/screen_info_pci.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   screen_info_pci.c:(.text+0x404): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/video/screen_info_pci.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   screen_info_pci.c:(.text+0x498): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/video/screen_info_pci.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   screen_info_pci.c:(.text+0x4ac): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/video/screen_info_pci.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   screen_info_pci.c:(.text+0x4c0): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/video/screen_info_pci.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   screen_info_pci.c:(.text+0x4cc): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/video/screen_info_pci.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   screen_info_pci.c:(.text+0x520): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/video/screen_info_pci.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   screen_info_pci.c:(.text+0x538): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/video/screen_info_pci.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   screen_info_pci.c:(.text+0x54c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/firmware/sysfb.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   aarch64-linux-ld: DWARF error: could not find abbrev number 4733
   drivers/firmware/sysfb.o: in function `sysfb_parent_dev.constprop.3':
>> sysfb.c:(.text+0x60): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/firmware/sysfb.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/firmware/sysfb.o: in function `sysfb_handles_screen_info':
   sysfb.c:(.text+0x170): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/firmware/sysfb.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   sysfb.c:(.text+0x180): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/firmware/sysfb.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   sysfb.c:(.text+0x20c): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/firmware/sysfb.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   sysfb.c:(.text+0x224): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/firmware/sysfb.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   sysfb.c:(.text+0x238): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/firmware/sysfb.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   sysfb.c:(.text+0x248): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/firmware/sysfb.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/firmware/sysfb.o: in function `sysfb_init':
>> sysfb.c:(.init.text+0x50): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/firmware/sysfb.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `screen_info' which may bind externally can not be used when making a shared object; recompile with -fPIC
   sysfb.c:(.init.text+0x58): dangerous relocation: unsupported relocation

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
