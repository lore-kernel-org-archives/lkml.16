Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC311C8611
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 04:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745988903; cv=none; b=mK5lmTIA8EMmS8MNe7fir50Xm1BjPjj9O7lmmjPaidNWYq9zeIgWNu/PgGrk0FdpHq/+L4a90OuY001W/S408nEME5boQqyTSlb+dXjVeCIjEM0roMgVqi50av4kmH8ZdNDTLMLS1ZAcoDCfVoOWH5M9HGn1vxqhUFQgdqVj+cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745988903; c=relaxed/simple;
	bh=8jcUURxGcPbuXLBbkLUfa5vg5TKDq+rHrT3IJFD2sOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+S7tNad9zoohlPWTHNiBWYR/a4H1UmmuulT0B/dwKZ+pac0I9a+M9TQI6TVX0mrjbUX13NzHH3r79/yOK+EAdJ8i609AS00uC/7CJdWr0JaZZFKiqawDbvxuCp6GWVItLnwTqf3h3bwxbLUx+VsHVZ60gow7y5Q+dacHoVSNp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZ0xJUGP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZ0xJUGP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745988901; x=1777524901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8jcUURxGcPbuXLBbkLUfa5vg5TKDq+rHrT3IJFD2sOg=;
  b=SZ0xJUGPYP4NAUNee/HLF3YaNGimpKtJ03iui8OGBPwLqO2ArQk3Ug3f
   Vz5FrHMXEzBdYzF2mt41bN5dx8zHseMSZEgySPkP9GIkZECfYbXAxXP/m
   kjXoEGzMU7tWUpHRiACi40+J6Xt8dD0PHx+yQ8Ty67JZgFOPiHGvgOpuV
   Csc9KlnUU8ZwD/zX8p4ReNGG0/1jS/KHQMvy3ECGeto1GDZ48OB8JQk5d
   1NYHEuszGYRO4VKM/m9p+XgDaaackewy5RjKdnmv58EKzG86pdtZUjibh
   a+8umoJyCXUlAluSFfNyBpJp3WkgMcPsk0GPcdB1llTvVNiBVid5MOqID
   A==;
X-CSE-ConnectionGUID: 6cCXrYORTSaLgByq1GxnaA==
X-CSE-MsgGUID: yWyBhKGiQQuvbqGubuCQlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="65171618"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="65171618"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 21:55:00 -0700
X-CSE-ConnectionGUID: OMGxhHnfSQaqXMReccWFLA==
X-CSE-MsgGUID: ODx3vE8xSryAAZzygcpBPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="134961460"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Apr 2025 21:54:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9zTF-0003AL-0V;
	Wed, 30 Apr 2025 04:54:57 +0000
Date: Wed, 30 Apr 2025 12:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Subject: error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
Message-ID: <202504301208.YQCguEmE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8bac8898fe398ffa3e09075ecea2be511725fb0b
commit: 584e61452f75bfeac2cdd83730b4059526ec60c7 rust: helpers: Remove volatile qualifier from io helpers
date:   2 weeks ago
config: um-randconfig-r063-20250430 (https://download.01.org/0day-ci/archive/20250430/202504301208.YQCguEmE-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504301208.YQCguEmE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504301208.YQCguEmE-lkp@intel.com/

All errors (new ones prefixed by >>):

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
