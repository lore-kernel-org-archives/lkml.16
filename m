Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E70B63B9
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 00:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749342115; cv=none; b=CJg+kGX0Z865jH9eU6fyjGJf7ZdcFjQkggnFPGaBJtKCsuODVRA/nfGIzSeAN4q1KhDaIt53UOzIrArrmWTkbf62VviYEY0sPnFrsTSWWOSMl4yH6/qvGaUH18jbCj3aAtS205JLHallznDCsHFpDWMvChVPsOxrTQ0edvGOiMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749342115; c=relaxed/simple;
	bh=O4ygcpmtID8bHDRthW9ISDxd0YSjspsbrE4Jta76IG0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=immfhwLXaxS1ZGRnHOVggYLaj9BL/3UqBxE3GtvL/oHzCddRgd6hBBdp5cADQ989ZITYxFOMWKAMAb9Atjp98vjT4lOHpfwfVB9oh22ZGzo6GPbQ8nwJpu8zNTvIOuqJkSl+PB+LV3QqfDnvSEHuHn9Y+lpEoFJs/8R2Hp4gKXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hR0eLRLV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hR0eLRLV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749342113; x=1780878113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O4ygcpmtID8bHDRthW9ISDxd0YSjspsbrE4Jta76IG0=;
  b=hR0eLRLVvX6PUx0IU7Nk8u6s3swedql/+QowRFEkshlR0dGsoEf6EjWZ
   HUn7M4VI67tOsEc3NWAj3VZL2GSpWrTxFcGVSEgp3/G/fzeFk6OPQy6Ml
   SgBWIdy/1dNB9WmbBGHlgD1QBM07g0yElorS8Rv3kxu2rxlNeGl6sJ2Vs
   TDX/sYbieEbpcW9NkrAtnJ4fY9qg8U8v9PWaZBG7BUs00GpbGBUEQv5Mh
   3dj30p8rJdF1b1hC3ZKt97vTganwUIQeXOymtk0ZCki8ULPl33cOcRJXn
   tu0zAt/S6jxBNes/ZpuYe9eO7UjanKlu3DQvFOUMzGMg7s8frkw8BS3Bv
   w==;
X-CSE-ConnectionGUID: AxOAMzQaTwuVxznPamhMyA==
X-CSE-MsgGUID: zjwKS6fYQ0m00Fpif1XWMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51317106"
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="51317106"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 17:21:53 -0700
X-CSE-ConnectionGUID: 5At49lWqRJ+woAG6FKOPIg==
X-CSE-MsgGUID: vrSilM0TSaWq0FO8UicHag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="183341700"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Jun 2025 17:21:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uO3nJ-00065y-0Z;
	Sun, 08 Jun 2025 00:21:49 +0000
Date: Sun, 8 Jun 2025 08:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Subject: error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
Message-ID: <202506080840.LF35utzo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi FUJITA,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8630c59e99363c4b655788fd01134aef9bcd9264
commit: 584e61452f75bfeac2cdd83730b4059526ec60c7 rust: helpers: Remove volatile qualifier from io helpers
date:   8 weeks ago
config: um-randconfig-r062-20250608 (https://download.01.org/0day-ci/archive/20250608/202506080840.LF35utzo-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506080840.LF35utzo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506080840.LF35utzo-lkp@intel.com/

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
