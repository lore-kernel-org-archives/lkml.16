Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB89839ACC
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 20:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743193241; cv=none; b=oUEkwYFLo6nWomHalnNZVUVe1Llm3oEk79k+9h3on+C98q3GZJ3jyao5QIO0VQCZ2KyFVNZRunDF4VrNAUiitipYdsCksy+rSnv7uazvATVkOSjiyVfL7wuAMEDrHOk9yKuQ3DEH/TTVodGZnWNYKGHwfuHu1c7vLZI23xVhT/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743193241; c=relaxed/simple;
	bh=Dun8URzIUdihCaS0dGvB6zHYpzGMq2w67tiSvH81GDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+bW/irsMMgHcgxuCAg8SAoIXQDjqUtBP2Sy8jdd3UePn7JxxweVL6jAZaMkSyUMo+5mg/A8W+JAX7dvBWQN8mtjqIppemfFzuzxxOS/u5xBgRtPUItKkg1jMwv+dPUJNWSu6sYXT3ygiteq2jzgsQahLMr1fdCdpBCdYHYWYRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RGUTUnic; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RGUTUnic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743193240; x=1774729240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dun8URzIUdihCaS0dGvB6zHYpzGMq2w67tiSvH81GDw=;
  b=RGUTUnicX3KgVf4jn8/VtOCD/Jm8bKc57UQb+12ifjIyVaLIAb5C/9rw
   39XVvqYjrpMxyIVjmUIbRBs3UpQDMlw/Vh0Hp0H9Pw6ou2klxYTfIpMBV
   gy2asWdSctsKrVm9X6YesHzalX2ToGZCpgxn7X6lksi1YC9TQB81Ktc96
   ogMimUeFunn1UzyxFCHI/4oxPLBceIv3uBIHkemSRlke8HWtlDddvYa3e
   bgekRr6EaBhivUHQ95w67rADJFMtLR4dBQ9qHNk0Z9wJxcxQaYgSiAwkY
   zuWRkaHm81KcxQIrrxQ/Ea+5kDzUTFRRZWgplDzaHOyVdUiiSVGZ4b2Q9
   A==;
X-CSE-ConnectionGUID: /bfPz91eRuGMzQlIWMt5OA==
X-CSE-MsgGUID: J2c98L3iRLWs0oaSbuq04A==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55935012"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="55935012"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 13:20:39 -0700
X-CSE-ConnectionGUID: Amahi2BBQWKXCBuAJelPMg==
X-CSE-MsgGUID: Kts6jgtURRa+HHZURxpZwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="125304729"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Mar 2025 13:20:38 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyGBv-0007gK-12;
	Fri, 28 Mar 2025 20:20:35 +0000
Date: Sat, 29 Mar 2025 04:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [tip:WIP.x86/alternatives 31/51] vmlinux.o: warning: objtool:
 smp_text_poke_int3_trap_handler+0x15: call to try_get_text_poke_array()
 leaves .noinstr.text section
Message-ID: <202503290433.IufZBqKJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/alternatives
head:   5c21e894a3e5752ac672af6e542775b3914c6668
commit: 87e9984ae6f497399e1e0a6fc794a166cf8ddbde [31/51] x86/alternatives: Simplify try_get_text_poke_array()
config: x86_64-buildonly-randconfig-004-20250328 (https://download.01.org/0day-ci/archive/20250329/202503290433.IufZBqKJ-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290433.IufZBqKJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290433.IufZBqKJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: smp_text_poke_int3_trap_handler+0x15: call to try_get_text_poke_array() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
