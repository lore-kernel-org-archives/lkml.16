Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479D71624C2
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738856323; cv=none; b=DVhGrE5GY+cZ0q36IURaO69fz/NomXIZUJ8OGPjx3TQ6Vgk3Nmhy1QQUlEmIgQ93biDjCeDI8Cj6EqhZBFvrsCgD69ufIvFcDH4JCGvy6SWaeKJoV+fhTJLOJiQSSfhKhY1y2r2O0rFMAMlGIWxUc4fCy7EGDNFj+d738WeZBRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738856323; c=relaxed/simple;
	bh=tUwyzTk3jgRlV2xPYe/NPEnqn1CPmxBKNXk4cnhiJgI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RqC/05f+As+lYgeJc3+AcQ20Qg5P7E1LXMvMUdCkWQaN+TN5a6GkGr78zEky33D60prZU+lO+BxTH0W/ww6gZ5GAMsdMCQOH3l37SaLhvun2kSV7iEMBUqNqlsCkYo8/d+fKX2FB51c2/GBkBJS2b5veHPN5W1y9sz1mi4E+auw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrKd9AFO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrKd9AFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738856321; x=1770392321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tUwyzTk3jgRlV2xPYe/NPEnqn1CPmxBKNXk4cnhiJgI=;
  b=RrKd9AFOLR/y+0s4XTeBhhi8NDaYwndYjO1/KTpcu26BHFHWiuj0lIcs
   wZsddGOzzBKSFzODNbnJnO+92CCt9vGrE8oPw2SOiLQjCYyve4aRCvsJP
   wgsgfiQLcGa3pYPjW2r/hlajxj06HeKzfTjPlxv/a+jZr45D7kPztXIle
   5/vjE8V6Re7MpxKrtPr5r3Vz60DkH7OiB2CKQpuDeUnWSdLE5hFF+rKed
   S4WqaMUrMR1qsSJnVS6xaCA7i1HUMjsJfPLRjqkAh7qDQMLnAqxcL046W
   znykBAA9SFFaCjCHq4HfG2RUW9RmC+J2fKsEON0OS8rltLY/aE+7htRx7
   g==;
X-CSE-ConnectionGUID: xM2S5nCjRVOnOIYGE/KMXw==
X-CSE-MsgGUID: EyL3/qwRSpSUIC8tf26Y6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27067677"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="27067677"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 07:38:40 -0800
X-CSE-ConnectionGUID: YDZxocitQoiwTcWnq8yilA==
X-CSE-MsgGUID: 0sQzWjdCQVCg9IPpo3bS1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="111433156"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2025 07:38:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg3xd-000x2g-15;
	Thu, 06 Feb 2025 15:38:37 +0000
Date: Thu, 6 Feb 2025 23:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ld.lld: error: vmlinux.a(kernel/panic.o):(function panic:
 .text.unlikely.+0x28): relocation R_RISCV_HI20 out of range: 533364 is not
 in [-524288, 524287]; references 'panic_on_warn'
Message-ID: <202502062306.dwioNmYP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92514ef226f511f2ca1fb1b8752966097518edc0
commit: a07eb4f67ed085f32002a1af2b6073546d67de3f spi: omap2-mcspi: Correctly handle devm_clk_get_optional() errors
date:   2 weeks ago
config: riscv-randconfig-r111-20250205 (https://download.01.org/0day-ci/archive/20250206/202502062306.dwioNmYP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250206/202502062306.dwioNmYP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502062306.dwioNmYP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x28): relocation R_RISCV_HI20 out of range: 533364 is not in [-524288, 524287]; references 'panic_on_warn'
   >>> referenced by panic.c:288 (kernel/panic.c:288)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x36): relocation R_RISCV_HI20 out of range: 533364 is not in [-524288, 524287]; references 'crash_kexec_post_notifiers'
   >>> referenced by panic.c:296 (kernel/panic.c:296)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x118): relocation R_RISCV_HI20 out of range: 533364 is not in [-524288, 524287]; references 'panic_triggering_all_cpu_backtrace'
   >>> referenced by panic.c:0 (kernel/panic.c:0)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x124): relocation R_RISCV_HI20 out of range: 531810 is not in [-524288, 524287]; references 'panic_notifier_list'
   >>> referenced by panic.c:0 (kernel/panic.c:0)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x12c): relocation R_RISCV_HI20 out of range: 533369 is not in [-524288, 524287]; references 'panic.buf'
   >>> referenced by panic.c:0 (kernel/panic.c:0)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x14c): relocation R_RISCV_HI20 out of range: 533364 is not in [-524288, 524287]; references 'panic_print'
   >>> referenced by panic.c:0 (kernel/panic.c:0)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x40): relocation R_RISCV_HI20 out of range: 533340 is not in [-524288, 524287]; references '.LCPI6_0'
   >>> referenced by panic.c:296 (kernel/panic.c:296)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x6a): relocation R_RISCV_HI20 out of range: 533340 is not in [-524288, 524287]; references 'panic_cpu'
   >>> referenced by panic.c:294 (kernel/panic.c:294)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0xd2): relocation R_RISCV_HI20 out of range: 531140 is not in [-524288, 524287]; references '.L.str.4'
   >>> referenced by panic.c:296 (kernel/panic.c:296)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0xe0): relocation R_RISCV_HI20 out of range: 533340 is not in [-524288, 524287]; references 'tainted_mask'
   >>> referenced by panic.c:303 (kernel/panic.c:303)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0xee): relocation R_RISCV_HI20 out of range: 533364 is not in [-524288, 524287]; references 'oops_in_progress'
   >>> referenced by panic.c:303 (kernel/panic.c:303)
   >>> defined in vmlinux.a(kernel/printk/printk.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
