Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5A96136
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745684302; cv=none; b=TlR9YENOSP8fEu4OOdM6FN9y/Jrnun7O7lQ/XwgNTjRGcJsHOkQxrSYdJPiVhsapB7Dsr/xAY7sdQlAT6UwRVv7oikQX1Xk8tXKxXEsf5MSDDpMG9yZJeJ6qeWYDBAuStGGyr/oqDF8QLGr3KPmwxYnPD3BbdGQnkkhBfwwvdpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745684302; c=relaxed/simple;
	bh=x7o/T1lb7X9o3ncEBPT76S4RfV75UxAnmAFiaJqWILc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hTEy7zJnTDqa3k2DbmYJWabf3lJRbTDU/WIuvAKnQPwbS+9rKN07udib2NpmU4N+gpg9gaJ8aaSu/uYvlj0MBcGnj8RGrBpm2cETv/jjpM/Y0pt9T1xQcYhXjsV8kjHVIlWoAIj9gXdEoXGcOfzj82DJ2iyF2u4Si+litd2HXKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F31qxphU; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F31qxphU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745684300; x=1777220300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x7o/T1lb7X9o3ncEBPT76S4RfV75UxAnmAFiaJqWILc=;
  b=F31qxphUuRGNdgw3VS793h/13ym7CH/cY73TfO5cCR3JRpqQ+a8I2YWT
   cOtRobkZiMCVCoApyoFJz2x6v0UqCOvO74/X412fB4hOKub5oXvhazDs0
   H/i7XIPe5sSSv6Y6CxbNpZyYAxnUYgY9a1RbCnbgGHC0IYhYnsesIQ9/U
   ZyThiZnzN1f3Dz9B4WFHrlVMc7LZk1djekuq5D/8UL6Qi3AqQypsYImba
   i+JPqQZmVnHZjAZVWhlzriiMky6F4qjjhlNPBPytlq8djpHzmesiQt957
   ZKsHc4Xw8w4eI578FkMvfYSWIrPJ/NxKimsbFBRzKTbljwRyOK46yr5P6
   Q==;
X-CSE-ConnectionGUID: OOwlu2b2TSqlSAK+hLog1Q==
X-CSE-MsgGUID: Fc05rWQgRlabSIEPOqOTFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47409485"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="47409485"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 09:18:19 -0700
X-CSE-ConnectionGUID: zTkJ63THQmGtFY+A0AJN1A==
X-CSE-MsgGUID: O1wcD4QsSfmg+anfQUM1HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="170358507"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Apr 2025 09:18:18 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8iEJ-0005uj-2D;
	Sat, 26 Apr 2025 16:18:15 +0000
Date: Sun, 27 Apr 2025 00:17:57 +0800
From: kernel test robot <lkp@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matt Roper <matthew.d.roper@intel.com>,
	Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: drivers/gpu/drm/xe/xe_guc_capture.c:218: warning: cannot understand
 function prototype: 'struct __guc_mmio_reg_descr_group *extlists; '
Message-ID: <202504270013.yxJGp0R1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: b170d696c1e2226713471d810c63b1162335079f drm/xe/guc: Add XE_LP steered register lists
date:   7 months ago
config: riscv-randconfig-002-20250426 (https://download.01.org/0day-ci/archive/20250427/202504270013.yxJGp0R1-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270013.yxJGp0R1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270013.yxJGp0R1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_guc_capture.c:218: warning: cannot understand function prototype: 'struct __guc_mmio_reg_descr_group *extlists; '


vim +218 drivers/gpu/drm/xe/xe_guc_capture.c

   211	
   212	struct xe_guc_state_capture {
   213		const struct __guc_mmio_reg_descr_group *reglists;
   214		/**
   215		 * NOTE: steered registers have multiple instances depending on the HW configuration
   216		 * (slices or dual-sub-slices) and thus depends on HW fuses discovered
   217		 */
 > 218		struct __guc_mmio_reg_descr_group *extlists;
   219		struct __guc_capture_ads_cache ads_cache[GUC_CAPTURE_LIST_INDEX_MAX]
   220							[GUC_STATE_CAPTURE_TYPE_MAX]
   221							[GUC_CAPTURE_LIST_CLASS_MAX];
   222		void *ads_null_cache;
   223	};
   224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
