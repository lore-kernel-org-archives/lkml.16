Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC442500CC
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 15:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739029458; cv=none; b=dSFjaucITcLGv6ggW1EkYyt6pVnJgSM9xY5eh6Uzqlr8rfBgbrs1dAQqFDqS+ehvLs4DCbpvDSFsGK3nStGDBhr1kKg6kxJ7FZx4P7wUYPdLigmuxwhpnCyfnYM2mQxbc89fw3qOwlxM8pT8j/xl+WS5a5uP3tUwCmPGV89o57k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739029458; c=relaxed/simple;
	bh=xUZn1jdtqzXKX1TiARyZSyN5VHuGp6K0mBV7bZcvK8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FUlwuy4kvN/2eXuHrMaY5UPNxo8Z35ebkwijvoXirl8gycjeS1AuruTFnhxfbVC6xZaoV23UnfqLG27DbJkN5HmveKuaUFEyW9RBMnIhuFqkWx60e4Z2JA3X8HiIJjl/e8vXOsLCJBPOiO1cF3YhAjV7tt5LXvgLPxm2WgdVPJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYfsVfvi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYfsVfvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739029457; x=1770565457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xUZn1jdtqzXKX1TiARyZSyN5VHuGp6K0mBV7bZcvK8g=;
  b=TYfsVfviyJ1hC+lBdNQB0GSvrQDgL1R9+wm1FEinHTC8iPtjxU2eaTb7
   UFnJxKyVkbXq4eNQt5WmuJxnHqV3mNI4y0a82C1YQ3EpywBhws5lMq4p0
   D8BWycBOCgF/S8pxLRPbRS+21LTjRA/knGZ4GaKBlxO6BE0jn5o4ABDLf
   aGXB3o7jIQ+2Td/M0rvXfqZOxGVRdx0wjZD9p1G7nBvrn+K+mOkkxSXCU
   7XEfkswqKNkTKu3U4DjZddWahEqLUEX7bKC63lrbd/knNlnGXFwP2JriA
   tiS/gj3pOmvFPlBjU2hDRmsbWal6Fm2bV/slsLTI3WNN+3+oAll5k+wqi
   w==;
X-CSE-ConnectionGUID: 6bo3+u0/QKKCiYWV1ZQi6A==
X-CSE-MsgGUID: D56kjxdBSe+zUDigT4D/bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39565699"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39565699"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:44:17 -0800
X-CSE-ConnectionGUID: TpfZDMTnQJyJKZO4lHQrkg==
X-CSE-MsgGUID: SAfU2nZoTZiaMu+pNAFf1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="111619575"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2025 07:44:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgn08-0010EF-2Y;
	Sat, 08 Feb 2025 15:44:12 +0000
Date: Sat, 8 Feb 2025 23:43:32 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: arch/parisc/kernel/pdt.c:65:6: warning: no previous prototype for
 'arch_report_meminfo'
Message-ID: <202502082315.IPaHaTyM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6629c004b193d23612641c3607e785819e97ab
commit: ef104443bffa004f631729dfc924f0b84abbd602 procfs: consolidate arch_report_meminfo declaration
date:   1 year, 9 months ago
config: parisc-randconfig-r016-20230411 (https://download.01.org/0day-ci/archive/20250208/202502082315.IPaHaTyM-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082315.IPaHaTyM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082315.IPaHaTyM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/parisc/kernel/pdt.c:65:6: warning: no previous prototype for 'arch_report_meminfo' [-Wmissing-prototypes]
      65 | void arch_report_meminfo(struct seq_file *m)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/arch_report_meminfo +65 arch/parisc/kernel/pdt.c

c9c2877d08d9aa Helge Deller 2017-05-11  63  
c9c2877d08d9aa Helge Deller 2017-05-11  64  /* report PDT entries via /proc/meminfo */
c9c2877d08d9aa Helge Deller 2017-05-11 @65  void arch_report_meminfo(struct seq_file *m)
c9c2877d08d9aa Helge Deller 2017-05-11  66  {
c9c2877d08d9aa Helge Deller 2017-05-11  67  	if (pdt_type == PDT_NONE)
c9c2877d08d9aa Helge Deller 2017-05-11  68  		return;
c9c2877d08d9aa Helge Deller 2017-05-11  69  
c9c2877d08d9aa Helge Deller 2017-05-11  70  	seq_printf(m, "PDT_max_entries: %7lu\n",
c9c2877d08d9aa Helge Deller 2017-05-11  71  			pdt_status.pdt_size);
c9c2877d08d9aa Helge Deller 2017-05-11  72  	seq_printf(m, "PDT_cur_entries: %7lu\n",
c9c2877d08d9aa Helge Deller 2017-05-11  73  			pdt_status.pdt_entries);
c9c2877d08d9aa Helge Deller 2017-05-11  74  }
c9c2877d08d9aa Helge Deller 2017-05-11  75  

:::::: The code at line 65 was first introduced by commit
:::::: c9c2877d08d9aa0ca0a5c227ac795fbb76269300 parisc: Add Page Deallocation Table (PDT) support

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
