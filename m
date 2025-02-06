Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3987D226539
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738836482; cv=none; b=Ibn4fIHL1JaWmu9Usy+FNNW1g07mXXJfgQYW8eEuKkdn44asScUjP3vYkFSaqHKnCsDT2YVaDXmQJ8yqM3ZDAROnced3RT1VPN3hss92wSHCZyzRzXjnrgmLewv8NWQWozZUH4YCu0e0fZ8Rbi/n/sFFZzAfews05IzrMdwWjqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738836482; c=relaxed/simple;
	bh=hrwtftk7oU9Rc7wZox208swUK+xs8ljljXA8Dna6QC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HnZKdbNnnL1msQXphGPmD8G2v9HRWCiQe45o/Vvwt/H/kubWltQgH2n7DlyR0F1OAQ2t/0pQTkNUaoY0d0FqX5CgQ3q2+Cz+C8fQKALZSHdDHRb41JqhAh+vCZgcKdmxPvKXxJ/QL5UIOH5dty7N0oLjeJP5AHPqCNhVo/iTUL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csqeGEDd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csqeGEDd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738836481; x=1770372481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hrwtftk7oU9Rc7wZox208swUK+xs8ljljXA8Dna6QC8=;
  b=csqeGEDdE8VuDBrTQ9TzGJQgvjcZn/21UNREn/ND+IgbVqgrJaqdMuXM
   pvKMh+8ZhuQA7udYTqzDOo81fK7zH/Ln192/JkfPI4SDpTN820CKvdiK/
   CSAnr3ZEvkDGSs5Xtz5tTNWtdxLaHzs6G0RDy7mdrw3KogAHdWwh36ZeU
   Itrop3ogSM4b+D4uOzs+P0EuXB+BKWZ0GFI21UbfeYOea66vPnlhvygZz
   y/C3RuDaa0YGfBsJqf+dwG+hZJLjgz8wGEFieP7hi9KkvLm6JXIXaptNB
   ueky8YHUmvvDw9nKpMQHdW2XsHl2kouaWaomM9XNDba/Nv7F726fNg3sh
   Q==;
X-CSE-ConnectionGUID: y8RFB85sQYWEiBz0BjVEgQ==
X-CSE-MsgGUID: 0heZGOmuTWyBEs5qw0kt5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64784838"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="64784838"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 02:08:00 -0800
X-CSE-ConnectionGUID: J6LPecoHSXC7pDqi/KGfdw==
X-CSE-MsgGUID: J/TFcmHERxGpQzkt+EV8IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116132588"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Feb 2025 02:08:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfynd-000wjT-0J;
	Thu, 06 Feb 2025 10:07:57 +0000
Date: Thu, 6 Feb 2025 18:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/firmware/broadcom/tee_bnxt_fw.c:62: warning: Function
 parameter or struct member 'fw_shm_pool' not described in
 'tee_bnxt_fw_private'
Message-ID: <202502061810.UJdImyeD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Helge,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92514ef226f511f2ca1fb1b8752966097518edc0
commit: 024f5b597564acced9e69305f7a9ef1202186a61 parisc: Add qemu fw_cfg interface
date:   4 years, 4 months ago
config: parisc-randconfig-r025-20211224 (https://download.01.org/0day-ci/archive/20250206/202502061810.UJdImyeD-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061810.UJdImyeD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061810.UJdImyeD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/broadcom/tee_bnxt_fw.c:62: warning: Function parameter or struct member 'fw_shm_pool' not described in 'tee_bnxt_fw_private'


vim +62 drivers/firmware/broadcom/tee_bnxt_fw.c

246880958ac939 Vikas Gupta 2019-10-31  50  
246880958ac939 Vikas Gupta 2019-10-31  51  /**
246880958ac939 Vikas Gupta 2019-10-31  52   * struct tee_bnxt_fw_private - OP-TEE bnxt private data
246880958ac939 Vikas Gupta 2019-10-31  53   * @dev:		OP-TEE based bnxt device.
246880958ac939 Vikas Gupta 2019-10-31  54   * @ctx:		OP-TEE context handler.
246880958ac939 Vikas Gupta 2019-10-31  55   * @session_id:		TA session identifier.
246880958ac939 Vikas Gupta 2019-10-31  56   */
246880958ac939 Vikas Gupta 2019-10-31  57  struct tee_bnxt_fw_private {
246880958ac939 Vikas Gupta 2019-10-31  58  	struct device *dev;
246880958ac939 Vikas Gupta 2019-10-31  59  	struct tee_context *ctx;
246880958ac939 Vikas Gupta 2019-10-31  60  	u32 session_id;
246880958ac939 Vikas Gupta 2019-10-31  61  	struct tee_shm *fw_shm_pool;
246880958ac939 Vikas Gupta 2019-10-31 @62  };
246880958ac939 Vikas Gupta 2019-10-31  63  

:::::: The code at line 62 was first introduced by commit
:::::: 246880958ac93989c97c73ae1e60b78b4c4c88c5 firmware: broadcom: add OP-TEE based BNXT f/w manager

:::::: TO: Vikas Gupta <vikas.gupta@broadcom.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
