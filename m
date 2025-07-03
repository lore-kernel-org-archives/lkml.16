Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555472BF3E2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751579082; cv=none; b=dhw7ND4/WOHTzJ0t4t6MuxZuvT4JyPtRetM1v8TlnDnZq7uQsm0cQu+CrjgCmnF3OwVEcE/3Lab9GzDnw6vI4JWUpxbsNe39Zs9ExWJJSVdRKJYT98fAYx44mSkAZq1LFkdcCmnC0pwfb117ZL818WP7idbcSpbnFCgSwr/h5cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751579082; c=relaxed/simple;
	bh=H63eljMWVUaMDTgQCUgYreoQxIVxKMwjJ1bITq2rCCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g0AMChlLNU8XFGth6Z9IrODZd2eogTKQhdhjNG0SSxNL4T71KgNKu62wMwVPaMKCBzPLoJahbJKrvpqCygBrgKjidvseG6uJaPP9eLtpzmGhEKhxBkuI/BzznD3eZdUiH489daanqITuaaDeAiKDhhp5WVIq6gFq4sDR0Q3NaJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILf7FITt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILf7FITt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751579080; x=1783115080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H63eljMWVUaMDTgQCUgYreoQxIVxKMwjJ1bITq2rCCY=;
  b=ILf7FITtlgdZ/LaUYbV+oyQAA3mL3WDGqfwQxSh0GulXdqumloDf6q84
   N/zDD0gWL3D0FA6unKqQT/FLHG/iN35yY7nm3JQUBtKWnNCAE4y0dNK80
   cNC3ZZKDAUWannZG+VCTVQbIh7l7Ss+jeCjV1gByGHVkrihyamXM1r05J
   pPuDkx3RoZC8058JFumAkxintbBL2KaKEmdaLL+9Zgz1IBKzex0g1XX80
   /vurKCnemlV1Bx05qYPd1wlHMr4g+tTcgP/vULICHs8ctu5hkyvHnaxZM
   bYVaNHUhYDR675+6CKG86ssyOS/lLzslvbi/g00ZzswFSi4PPUbe9mrG7
   Q==;
X-CSE-ConnectionGUID: J9dw5P0ASAe5mMKktJqbvg==
X-CSE-MsgGUID: //pfL8UlRuqRv2YswAn29g==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57693157"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="57693157"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:44:40 -0700
X-CSE-ConnectionGUID: 12EFML+BSdaxZ9iDq8wCKg==
X-CSE-MsgGUID: y2AmScquRvizl0DYH9lerg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="178149198"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jul 2025 14:44:38 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXRjQ-00032F-0x;
	Thu, 03 Jul 2025 21:44:36 +0000
Date: Fri, 4 Jul 2025 05:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at
 1794328), and 'i32 1' from vmlinux.a(target_core_transport.o at 1969228)
Message-ID: <202507040514.0TP3wH3T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   17bbde2e1716e2ee4b997d476b48ae85c5a47671
commit: 1b3291f00013c86a9bb349d6158a9a7a4f0334fe MAINTAINERS: Remove myself
date:   5 months ago
config: riscv-randconfig-001-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040514.0TP3wH3T-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f1a4bb62452d88a0edd9340b3ca7c9b11ad9193f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040514.0TP3wH3T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040514.0TP3wH3T-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(alloc.o at 1845388)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(mad.o at 2031628)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(skbuff.o at 2043568)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(trace.o at 1806688)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(net-traces.o at 2045788)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(slub.o at 1815328)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(osd_client.o at 2079268)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(protocol.o at 2082568)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(volumes.o at 1849168)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(tcp.o at 2052088)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(super.o at 1848028)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(segment.o at 1853908)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(syscall.o at 1808908)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(e1000_main.o at 1980208)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(core.o at 1966588)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(filter.o at 2044648)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(core.o at 1811668)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(super.o at 1853548)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(smc_core.o at 2075128)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(target_core_transport.o at 1969228)
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
