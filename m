Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160FE2405E8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750683177; cv=none; b=lNQ7JiGlo1Czxgiml81HblX+JY/CALvNzVzdSeA3ilUQkI5BMR+N89756rY4HpvzgJmq+x8IC67hxq0Ctu3zbGO45CzRGV5AuYNjynFymkLgfxDesLgLg0Hu7QuQMoMbl+lBnVrTWiTDbXD7PIDteGLeKmE0r+Yrvm/bO58SpXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750683177; c=relaxed/simple;
	bh=JFaDGUHW7KTeYfDt0PWdTNAXJjlRTiT4D3ApfVEeo6E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b0g0rnYyvV/ZSUOwOrmZW9Xgn6QkrnJmag8rcqYoJ/Fp4Zz9l+63LexYexL7JBHYIZEBLbTsCa6hUXWv0HP+a//VaErWm3AgzmyJCFIckXl1BkuIQihoK888fGRZxVyoAD28h06dxuVS5NIflVmkgxEEqp6Yb4uP3kSoBWQpMJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFTCj8xi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFTCj8xi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750683176; x=1782219176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JFaDGUHW7KTeYfDt0PWdTNAXJjlRTiT4D3ApfVEeo6E=;
  b=XFTCj8xiC+l8kemAxV4+ZD3IEGD4fgrQMSYbormUvpydrDj4cmi9gau+
   mYBrCVjwsA3bjQmtVdA3E7A4MBBqQDFoeviow3EoZrwS3RyCO04KYh1bH
   TKCs0zJUUpVRQkVFg2NpQTs87W+XfaX1tBREo+k1Y+yzTCvpDv3mmtCy4
   ScSLTWvPy21IGTt8tlcxDSwklK75CzGbsG75jmFooNfbfpyOPiyGVptjv
   aOGkfBqkWnn3JGSdtuaI2SV0BF7/3LXY+5GrEhR7niqEasYo1l59fsG/i
   tQZzdmXW8wG+JAXM/Vm7FAsCJWLi0YEMVkfCcfm7f/4e/8+mqH0/uxmrm
   g==;
X-CSE-ConnectionGUID: 8tbWc4XlSzCLZVbLFVo5Uw==
X-CSE-MsgGUID: GzyIvQG6RJKU4gxNIx8nJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="40498286"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="40498286"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 05:52:55 -0700
X-CSE-ConnectionGUID: q3U5erVhQd28+R0wDHauuw==
X-CSE-MsgGUID: 3CQGCyRzSzm0xnXgRjiNGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152103587"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2025 05:52:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTgfM-000O5S-01;
	Mon, 23 Jun 2025 12:52:52 +0000
Date: Mon, 23 Jun 2025 20:51:57 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Schrrefl <chrisi.schrefl@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Alice Ryhl <aliceryhl@google.com>
Subject: error: kernel-address sanitizer is not supported for this target
Message-ID: <202506232026.y3pShEn6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   86731a2a651e58953fc949573895f2fa6d456841
commit: ccb8ce526807fcbd4578d6619100d8ec48769ea8 ARM: 9441/1: rust: Enable Rust support for ARMv7
date:   3 months ago
config: arm-randconfig-r052-20250623 (https://download.01.org/0day-ci/archive/20250623/202506232026.y3pShEn6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506232026.y3pShEn6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506232026.y3pShEn6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: kernel-address sanitizer is not supported for this target

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
