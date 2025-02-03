Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2422E1D88A4
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738566045; cv=none; b=N+xyPytZihitKG1AHmXgK89H1JWa3YwKHWtjNS55vlhxwOddZ05ivxtA7cWYU1osgGeWrPFtY8P2SVZ5aEqDe/fGyWre6ruO+BrREttp58dBedCKT0kNNDtiySKc+XpGsLBoEVuwuzxWmDs8+/HXyivXKMF/QJFz2oDlL4pwFo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738566045; c=relaxed/simple;
	bh=n+TmfR0xc+h+nYB+96Wjg06wVTgEHqXhyCZxEjDXr3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ka2/bOstOLELFrlLrcPvQtl1/To3u9QIWb3hB4TW+NEwOP4QPWPmpOQ0sMzkBkOQX5FtbLU71fKPusMjaVQSOGo4QKSaxZYXyq8+oJNgm4iYYbh/fz5F1at1PGnVa5PVUwFDvxGQTi3LeAIf/pE5iGSdaeZWM6bUDBsqTalI50I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VCw97n+e; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VCw97n+e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738566043; x=1770102043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n+TmfR0xc+h+nYB+96Wjg06wVTgEHqXhyCZxEjDXr3s=;
  b=VCw97n+eamLp4q/j6br/8O/dOKkKb5JBev2nZ3EySCn62P7Sr8I0wJDI
   WJYaNjgo9xzmUfXRV1yL2pT5qiRCJuyJT9OLuGj3hOwqviP1VG6GQrSlk
   SdeZriLaZwHxtNbXSmmHNvqLPCB7ljf6QLV63KolFZrazdER7iEe+I+8z
   ihk/E0pzNuLtPzg9pVfRV03nJetIOX0kbku25jkDas7oiDyOr4Rcjlrvo
   cvSuFogD2eG3bRN/qd1D68nVfvxHJZ9IM0kT5ozmXbdQHws1TPwx7L8n/
   I5fbpYmEfg7DSe855jZ85qEjeB2sXHcnkZpbGwkgAu6o3uFiVk63wZQk0
   w==;
X-CSE-ConnectionGUID: EmWjI9raQ9qt9PyZ//4b4Q==
X-CSE-MsgGUID: 54iQp1w9Rn6o+69e5DFlFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="50040840"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="50040840"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 23:00:42 -0800
X-CSE-ConnectionGUID: eZW0MOskSUOVqnzT9TbOmQ==
X-CSE-MsgGUID: Oszwt1+XTJqoSLA6cCqaTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133460242"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Feb 2025 23:00:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teqRj-000qaJ-0F;
	Mon, 03 Feb 2025 07:00:39 +0000
Date: Mon, 3 Feb 2025 15:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yhs@fb.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: Kernel image exceeds maximum size for relocation!
Message-ID: <202502031419.HKpdUUb2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2014c95afecee3e76ca4a56956a936e23283f05b
commit: dffbbdc2d9889670c30e07d05fc0dd712e8ad430 libbpf: Add enum64 parsing and new enum64 public API
date:   2 years, 8 months ago
config: mips-randconfig-r015-20230807 (https://download.01.org/0day-ci/archive/20250203/202502031419.HKpdUUb2-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031419.HKpdUUb2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031419.HKpdUUb2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Kernel image exceeds maximum size for relocation!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
