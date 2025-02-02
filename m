Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD9B1D54D1
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738490250; cv=none; b=nP7xbaSqhb+enM+qgqAfXrPcL6cvefxy1sWFCwykXosoEYgpOR2ZDKogYRpzTnmAr3D7kPIBrNq/Uzwmu7nle0fVwxOzRcDQc/fHT/dGrF2lEJnhbHLXencB1fRTUZjBEnCiO9if0aPR3lxmOXxHJYl0kCIeqg7d0nEaB/U29YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738490250; c=relaxed/simple;
	bh=zM6O9w/Rkvu3IwcbJSBYc1+2DvotW/H7SlOa3v4ra/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oHygHC0rlJEdaP5Qsit44JiabwzP7wekIZWgrjw6PyGcyIe+Facmf3ZLe5XyTen1pjHmnOWiuBnV63n4WzVrSYs4RvcemWR4gpeuHFS4+UimPwBm7Djb4Dv8U8OUNzcr0hz46MTX7WhOXn1zIiDlcRzJA22Db2H7tMpyA7ky6qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHEL6RZm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHEL6RZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738490248; x=1770026248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zM6O9w/Rkvu3IwcbJSBYc1+2DvotW/H7SlOa3v4ra/k=;
  b=lHEL6RZmyEqVkr/PbygGdnNrUyUAoGp8SP8JjG2fZ9+si8e+ktJpuM1c
   V+aqPswcjsPxHCM605kXHHBrSsXzCoMgKbDuMEXsD8L63nDjbfcE2D0OL
   TIHBz+AuiKqmwMNtB3monC/qsN3W/p6hsBqU/SQQyNnimbdHtgYnZbWRP
   OnZAE7LfxJhjtpT8iHqj43tgx9VY53APSNam2cD7RGju7LQkJLTgrsSlQ
   tLBYNIXtw0LiyvSsNDmwRvlCyTFjLfXDmhBkUETj/+YTmkuqv0Dlo+vFq
   +0vnIIVht9OHeJZpE5y1VEEV79DRutowSX35B+qY+eFEKxK+2Ez8l+zKO
   A==;
X-CSE-ConnectionGUID: NvfyMnHOSZy4OWpFrHxhdQ==
X-CSE-MsgGUID: LFE/4KkjRdqNodKVMisaGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="61471811"
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; 
   d="scan'208";a="61471811"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 01:57:27 -0800
X-CSE-ConnectionGUID: igYnGtdhTdmz0PtzfabLrw==
X-CSE-MsgGUID: O8bdsmNTQH2afffxn0HTrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; 
   d="scan'208";a="115036467"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Feb 2025 01:57:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teWjD-000pXH-26;
	Sun, 02 Feb 2025 09:57:23 +0000
Date: Sun, 2 Feb 2025 17:57:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Borislav Petkov (AMD)" <bp@alien8.de>
Subject: fs/eventpoll.o: warning: objtool: ep_poll_callback+0xf8: unreachable
 instruction
Message-ID: <202502021723.9TTa7Wzt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a86bf2283d2c9769205407e2b54777c03d012939
commit: fe42754b94a42d08cf9501790afc25c4f6a5f631 cpu: Re-enable CPU mitigations by default for !X86 architectures
date:   9 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250202/202502021723.9TTa7Wzt-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250202/202502021723.9TTa7Wzt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502021723.9TTa7Wzt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/eventpoll.c:16:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
>> fs/eventpoll.o: warning: objtool: ep_poll_callback+0xf8: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
