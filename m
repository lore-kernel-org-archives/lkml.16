Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE20F21ABCF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751008052; cv=none; b=jmUczs+YGxVOk+S7/g9ml0oiyu0Ubt1tDTBLknpeQYOOYmdr4nvOYRhbOrJIMgf+d5fPddXEQErLNyU8+GhWSZEiRIlDjtOq6P6sjFevHSdgBu+5HMWy/g5Ndn/bO2gNAb3R4wOMr9uQFtv/iip3xFyX6OSxxyJn0+uEh5BmHqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751008052; c=relaxed/simple;
	bh=nHdiRy3stV+rcgza0BoLT+2CGiXpoTADufk1CFbeKqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bA252THG57Xh2QtiMC2oLHAEiKe/REguahIsH7hBy1A4bW66EhAOOQJ4mXjtGP51S4LMAAncrxUJZChJhbJjb3N7IKSdgIUDJsrLqCPsnymnUN069jiXRJF3m54bhqZ0JDeDiuPt6qF5UWggnQlr0mmH6YF6HOzOU0SFtK6w3oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lR3n1Vkf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lR3n1Vkf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751008051; x=1782544051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nHdiRy3stV+rcgza0BoLT+2CGiXpoTADufk1CFbeKqA=;
  b=lR3n1VkfNP2RQ6Mi/WxjWqWXMfOCO0xh5E2mzpGVBFTl7oXmHi3f6chq
   sF9XQSZIjT8zF/m8Dj6rEFngvAmatzZ7yMtpaHc9P+C7JD7Kcp2z2QG2l
   bPbGh80jlz8Gn3g8TgQFw/OLvi9EqEf4mrDGGJJn96HAhDt4d9acrv8ad
   KUuXXvLB0JJwvSNqc0E26DkyG7np+1/HW7YhkWNG3H6nfPGy68mFy1j35
   FfXa728jUFKEeNB1DgF6JtELNZtXas3Srx6RVw/hBj7rXRk9jCPkRhLxN
   Dc5Q61bowzZh2nPNL+qY5XcRjk3LBJHNxdkXamECpYIcLT9sx3pDlB3cM
   A==;
X-CSE-ConnectionGUID: KIV3ycUGRd+S81WMHoXt8g==
X-CSE-MsgGUID: sPA+Tv0LSM2Jf8cYLo5gIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53397768"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="53397768"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:07:30 -0700
X-CSE-ConnectionGUID: +tAArbUYQi+9Q+kyJDE8gQ==
X-CSE-MsgGUID: f+yryH1cRt6c7y9aYmnFvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="157018304"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jun 2025 00:07:28 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV3BF-0000cx-2Q;
	Fri, 27 Jun 2025 07:07:25 +0000
Date: Fri, 27 Jun 2025 09:06:45 +0200
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
Message-ID: <202506270925.eyPB7JXk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6f2a71a99ebd5dfaa7948a2e9c59eae94b741bd8
commit: 584e61452f75bfeac2cdd83730b4059526ec60c7 rust: helpers: Remove volatile qualifier from io helpers
date:   2 months ago
config: um-randconfig-2006-20250627 (https://download.01.org/0day-ci/archive/20250627/202506270925.eyPB7JXk-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506270925.eyPB7JXk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270925.eyPB7JXk-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 21.0.0
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
>> error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
   --> rust/kernel/block/mq/operations.rs:15:33
   |
   15 | use core::{marker::PhantomData, sync::atomic::AtomicU64, sync::atomic::Ordering};
   |                                 ^^^^^^^^^^^^^^---------
   |                                 |             |
   |                                 |             help: a similar name exists in the module: `AtomicU32`
   |                                 no `AtomicU64` in `sync::atomic`
--
>> error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
   --> rust/kernel/block/mq/request.rs:16:20
   |
   16 |     sync::atomic::{AtomicU64, Ordering},
   |                    ^^^^^^^^^
   |                    |
   |                    no `AtomicU64` in `sync::atomic`
   |                    help: a similar name exists in the module: `AtomicU32`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
