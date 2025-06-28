Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1651E21A436
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 18:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751135156; cv=none; b=fXBhKCbyEClMGNNY/2Ny8UP/93gCz3JlcMKbKoqDEbB3NxiuEBhFbajosOka2VpWgv1MW1wfPqAGgN0C2Op6tCeo3VxWszj2lh3sY+5+Pk1bZ3sRfhCyOlNATXmWiDUDV3FCRa32QI8kSdd4LUILdjSDuAHSw0VGlX15fBfQmvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751135156; c=relaxed/simple;
	bh=XgzsEwhezMMU+V51Ath1wxKyhOcPF1vUDAXN9/Z3b08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ee+vP7yzPFgke2nszknIx+6/OFz/2EMH90O6yoRPdmuD3SrVVPeAahARwhr//U6n/kXjRgI5vPr5bB1jhtxVsVd/lrN7G1D7Uhg8ngiXI7nKNiSF0JrLz2a7uaaY3HPVAxiIt9ue+ZEGxeHDDrklgI7ZIN1ZKbFxlIu/OxeVf08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L7AUHiXe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L7AUHiXe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751135155; x=1782671155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XgzsEwhezMMU+V51Ath1wxKyhOcPF1vUDAXN9/Z3b08=;
  b=L7AUHiXehTScKvmsI7slhmPBBZx3WueHDN2lry/t7U95p/Y3jg7oVSl9
   4JIdYro001sXBAnSPsySDXt2Kib+SaLPhaeSIXW9DxljHWjEFBDkXaUr4
   FOYel5vxjsybx3ULsb2yneY2bgpbO8XF+2ULLbfRSW4We2Sf0tbgHjeAa
   GM/GpYK3Bcb0WpgGF1ESGZXe5CBbli0fprsRbRt8XGTX9XdfJFLwhWoJ8
   IOASnQn3faC9KcK0Mc0uL9tFsOZJqNfp/lIPoTbXluEECtv5/cUe9Vk3e
   +tJsd6+Q8p/ID2LVsxBN+JX3lqCpfBBIv4XmENC2eu5IqrPkNuX+bTtsL
   A==;
X-CSE-ConnectionGUID: OhAXjvNtSJucYRW4KD9G7w==
X-CSE-MsgGUID: dvCcyNVXRtiSbQooOhAFtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="52644490"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="52644490"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 11:25:55 -0700
X-CSE-ConnectionGUID: YWNIahcVRQiRNlkPNfk7BQ==
X-CSE-MsgGUID: kheUMx1hTcugSDHAAN82Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="152808962"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 28 Jun 2025 11:25:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVaFK-000XIO-1q;
	Sat, 28 Jun 2025 18:25:50 +0000
Date: Sun, 29 Jun 2025 02:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: Nam Cao <namcao@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at
 899876), and 'i32 1' from vmlinux.a(security.o at 937376)
Message-ID: <202506290255.KBVM83vZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aaf724ed69264719550ec4f194d3ab17b886af9a
commit: 890ba5be6335dbbbc99af14ea007befb5f83f174 Revert "riscv: Define TASK_SIZE_MAX for __access_ok()"
date:   5 days ago
config: riscv-randconfig-001-20250628 (https://download.01.org/0day-ci/archive/20250629/202506290255.KBVM83vZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290255.KBVM83vZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290255.KBVM83vZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(net-traces.o at 1014596)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(e1000_main.o at 992876)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(core.o at 912236)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(security.o at 937376)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(sock.o at 1012256)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(ioctl.o at 1015736)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(socket.o at 1012196)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(ring_buffer.o at 910076)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(hugetlb.o at 919016)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(btf.o at 913916)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(page_alloc.o at 918536)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(slub.o at 918836)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(spi.o at 992036)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(vmalloc.o at 918296)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(syscall.o at 912296)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(trace.o at 910136)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(skbuff.o at 1012376)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(vmscan.o at 916376)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(xprtsock.o at 1024196)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 899876), and 'i32 1' from vmlinux.a(filemap.o at 915776)
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
