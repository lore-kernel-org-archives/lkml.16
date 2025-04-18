Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8137B213E74
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 21:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745012180; cv=none; b=pdus9QVKbuk/5mLZ+9d6vjNOSLOwq4UPIsyJulrgBznQ40V4vwtPxVpJ1O3evfLLbHalBrG6NiixkkkZ3JNP49dyTuVW2iuM2y8EUTFN6+YeuzOFvpPsGrcHH8lxijBaOivZK3RKt4Phszhr0DMapC4YKAc4igZikw7mDyqPH3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745012180; c=relaxed/simple;
	bh=dGtegSjuezmdFS7iqWnjT7CT6lPB+TjvW3gth5ZpkVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sooOmM7kIXX49u9t5yvufeWXUwh+wQ67mk75go0jCISGBscViibK2AQS9Gy2gkUWfX1mhg/oXxwnRqyZs/H1Ts4IXlp5h9ngnQ7MKkyBepFIVCyfRlAS7QzecX3nVTFvyfvLRENAWYAzNEjPdsWfCMv1CGjv2yn93rZmlAszjhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Si2ZU5wp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Si2ZU5wp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745012179; x=1776548179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dGtegSjuezmdFS7iqWnjT7CT6lPB+TjvW3gth5ZpkVA=;
  b=Si2ZU5wpsq5QF4rdXcSV2FpUWR5gX/F98M64LWwgAyPb4ao80u8a2N3C
   P4QodMq7TZhxOsLB+/H1Zb2JzYY2U85vb3w1x8SVxILIgV5TymNNMyI3g
   CfKjgHycpowuLzGGnQUfm+YTwo04JzCyqEJAPywakW3LoZkXTMi8qxzu8
   E0qMnwRWlSMGBYNQl5AhYVzpTIvf13mgnpr+X6PpKdaw6KI5Dbua8lRJX
   D0oPwqlO9RdXyR+/cPyHJum+QeGwr4TRzqO/ixbUx6Xt6F1NAhClPOk6n
   S4zBFw3L5tCBbxMwR1in6McYF2ZydX2FG+fNVzBrlwc7V485ENUnfsXFO
   Q==;
X-CSE-ConnectionGUID: Lz32Hl21QxiQXfih8yAXrw==
X-CSE-MsgGUID: upvaregoT/yJKqAoSalyMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="45879561"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="45879561"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 14:36:18 -0700
X-CSE-ConnectionGUID: 7SDLo/bYQbie86UkUcA3hw==
X-CSE-MsgGUID: A6uKU8c5RBeUUwF8s87q6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="154382085"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Apr 2025 14:36:17 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5tNe-0003Lx-1b;
	Fri, 18 Apr 2025 21:36:14 +0000
Date: Sat, 19 Apr 2025 05:35:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 hash_debug_pagealloc_alloc_slots+0xb0 (section: .text) ->
 memblock_alloc_try_nid (section: .init.text)
Message-ID: <202504190552.mnFGs5sj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7e74f756f5f643148ca5537bf2fee6767e4b0ed9
commit: 8846d9683884fa9ef5bb160011a748701216e186 book3s64/hash: Early detect debug_pagealloc size requirement
date:   6 months ago
config: powerpc64-randconfig-002-20250419 (https://download.01.org/0day-ci/archive/20250419/202504190552.mnFGs5sj-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504190552.mnFGs5sj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504190552.mnFGs5sj-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: hash_debug_pagealloc_alloc_slots+0xb0 (section: .text) -> memblock_alloc_try_nid (section: .init.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
