Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA4D28F50E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745619426; cv=none; b=ITnb9b8WkKwur7QOSwhluWF395YcvPVehkHKitz+bdi8UkSFb+LGYH9QFTjl8315cOURTlaa9w0IWRtf8CTP/tEWhXMlpSxy+qvDe360DKN1mPTOlcy4W4KVZJ7diqSgq4RgvHPoRges00gvneFD7gG4UDovQMtCfvOx8aokV8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745619426; c=relaxed/simple;
	bh=NZS0pLxphm++YoQ+lY/XIRS6f24N+LZCWzNnPoFPAh8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ASl3m8Pq1lVeqoh9Fhb+0Vwqcdk8j3MOM4jvOOPaz1a2H33Po6glJYBg0o8L7g3hsPA/oEQSag9tBb1kvpr1YCc/eCGhnaMWYFZ3pnLiKZGLr28Fdc8H+tQKQipzNYwNHwxesSFWP55ZR/Oe/P4sVpusFLpzyDvpPSAw1id+lbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZ8UFzzn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZ8UFzzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745619424; x=1777155424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NZS0pLxphm++YoQ+lY/XIRS6f24N+LZCWzNnPoFPAh8=;
  b=lZ8UFzznveEc6aYO8FE3+CgXxRWv2yvSdxxBKNykkApKLFo7vNoZARhB
   +GXL7Bdsj70kmOky3XOKXcIvXqa6PR5tdC3xxamWZA4KuFf5IzHXHrdiB
   xNNur5SKAqxYEYtlzb4IfpiEwnuMb07CJ7++FQUJ3LJ3bOIXPIVlfqwDL
   d8CgNkae61bVhxnZuNsNf8AyMR47xoOy5mcF7Wd6/u5zTemMwz8NuA1PI
   5UnFprfjeB4b0oqVsUXCN8MNseqI7zoCF9EjwN/ciCeWc67UY2wAY7fu/
   XjLXVbx3USSB0fjZx1v58PPpuzIaYPNCwRgBGzt46Peq3pEYx3nWYQfZL
   g==;
X-CSE-ConnectionGUID: QtOLzFUdSlGbzyEoE9F9BA==
X-CSE-MsgGUID: qYjcIhF1SHquRPaFzs2ajg==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="57486697"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="57486697"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 15:17:04 -0700
X-CSE-ConnectionGUID: /7eZaxymSH+ozLcp7jYBNQ==
X-CSE-MsgGUID: PVY2jz9iQoODAgupB5unCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="138110039"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Apr 2025 15:17:02 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8RLv-0005YL-2A;
	Fri, 25 Apr 2025 22:16:59 +0000
Date: Sat, 26 Apr 2025 06:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Subject: ERROR: modpost: "__ubsan_handle_add_overflow" [fs/fuse/virtiofs.ko]
 undefined!
Message-ID: <202504260602.AgMbjS8a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 47f4af43e7c0cf702d6a6321542f0c0d9c4216e3 ubsan/overflow: Enable ignorelist parsing and add type filter
date:   7 weeks ago
config: s390-randconfig-002-20250426 (https://download.01.org/0day-ci/archive/20250426/202504260602.AgMbjS8a-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504260602.AgMbjS8a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504260602.AgMbjS8a-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__ubsan_handle_add_overflow" [fs/fuse/virtiofs.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_sub_overflow" [fs/fuse/virtiofs.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_add_overflow" [fs/ecryptfs/ecryptfs.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_mul_overflow" [fs/ecryptfs/ecryptfs.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_sub_overflow" [fs/ecryptfs/ecryptfs.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_add_overflow" [fs/jffs2/jffs2.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_sub_overflow" [fs/jffs2/jffs2.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_add_overflow" [fs/overlayfs/overlay.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_mul_overflow" [fs/overlayfs/overlay.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_sub_overflow" [fs/overlayfs/overlay.ko] undefined!
WARNING: modpost: suppressed 52 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
