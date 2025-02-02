Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FFB635
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738523009; cv=none; b=UNStQmMNddDT4s3cRmHoVJp415rcHBVK8GLzMn3AW1W6qZYlWOrR9Rqb8e9pE7Hr7klnexreOurJJDWbuty0WQiGYiPUhRmdFrnU32zdUHCO+Zwm0jjmTAomEcjY3W6FizrP7esl5H8qOevlFcaASKFbZ0ShTrNsfXu/PqNEIY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738523009; c=relaxed/simple;
	bh=Z4Y5x4HdccZx1s1lNBz9oltGHHjTuUkWU/ahVGJkF5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d/hXT+t6XEQlNiIAErDZB/e/vR+3F09rgWBQy3vM65GlVruQx7YOUdEYH9ZpwOfonfyo+jtz8CiDVeg1PsnqiK2IPpQPNLtgV0/RWNIsTJWpSsTUM50qPxvieUSzKsoJQI6YOL8lAjix8nWln3VWzqyuIPUPHrSMl6+5JXgQeV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nC8qfTHd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nC8qfTHd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738523007; x=1770059007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z4Y5x4HdccZx1s1lNBz9oltGHHjTuUkWU/ahVGJkF5o=;
  b=nC8qfTHdwRu5CBEhf8W6YOWvJZ06ccJmoqNElnUSMIoDX1pA33T+p5vr
   Tb9yivaGu0drmT5UJbtmUFw3fcKQTzLz9XjliWESigSb5qWKX2IDoF+iR
   R7Zs9fluTeaU6116oZvBbMkY0SLfhptFqHFDckFSsJw9qDCSXBjRIA9Du
   EqoStmu3+9jfo/U1uKfQ/5u7V6X2iCzQAu/UUTWnv0KF0jcKQXsw/NGWV
   YzFoZzS0wJTGfiqL3HcZPc5L72vrBOvymx9Nu7twkFCyT6YWlII8Yhn1b
   UkwIa8hQJW2wteruy3nqPinckjT/fTbUwLhoP4a/x5hvU8MaP1aZicgug
   g==;
X-CSE-ConnectionGUID: cBLYuozrRE+5xR2ssR4/7A==
X-CSE-MsgGUID: L2/utWKGSI+up7I4c/xRMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="39161906"
X-IronPort-AV: E=Sophos;i="6.13,254,1732608000"; 
   d="scan'208";a="39161906"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 11:03:27 -0800
X-CSE-ConnectionGUID: EgXULTkrROyfce3cmlBO5g==
X-CSE-MsgGUID: BRXS7/wHTnyj9DuEOlTGvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,254,1732608000"; 
   d="scan'208";a="110669123"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Feb 2025 11:03:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tefFa-000q07-2R;
	Sun, 02 Feb 2025 19:03:22 +0000
Date: Mon, 3 Feb 2025 03:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes
 available for requested alignment of 8 bytes
Message-ID: <202502030359.Q6RS3KPh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a86bf2283d2c9769205407e2b54777c03d012939
commit: aba3f18aba6b1c8dd0095d73194b53be2cdd5f14 Merge commit '3aff0c459e77' into for-next
date:   11 months ago
config: riscv-randconfig-r132-20250202 (https://download.01.org/0day-ci/archive/20250203/202502030359.Q6RS3KPh-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce: (https://download.01.org/0day-ci/archive/20250203/202502030359.Q6RS3KPh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502030359.Q6RS3KPh-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103126) is being placed in '.bss..L_MergedGlobals.103126'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103127) is being placed in '.bss..L_MergedGlobals.103127'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103128) is being placed in '.bss..L_MergedGlobals.103128'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103129) is being placed in '.bss..L_MergedGlobals.103129'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103130) is being placed in '.bss..L_MergedGlobals.103130'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103131) is being placed in '.bss..L_MergedGlobals.103131'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103132) is being placed in '.bss..L_MergedGlobals.103132'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103133) is being placed in '.bss..L_MergedGlobals.103133'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103134) is being placed in '.bss..L_MergedGlobals.103134'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103135) is being placed in '.bss..L_MergedGlobals.103135'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103136) is being placed in '.bss..L_MergedGlobals.103136'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103137) is being placed in '.bss..L_MergedGlobals.103137'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103138) is being placed in '.bss..L_MergedGlobals.103138'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103139) is being placed in '.bss..L_MergedGlobals.103139'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103140) is being placed in '.bss..L_MergedGlobals.103140'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103141) is being placed in '.bss..L_MergedGlobals.103141'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103142) is being placed in '.bss..L_MergedGlobals.103142'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103143) is being placed in '.bss..L_MergedGlobals.103143'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103144) is being placed in '.bss..L_MergedGlobals.103144'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103145) is being placed in '.bss..L_MergedGlobals.103145'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103146) is being placed in '.bss..L_MergedGlobals.103146'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103147) is being placed in '.bss..L_MergedGlobals.103147'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103148) is being placed in '.bss..L_MergedGlobals.103148'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103149) is being placed in '.bss..L_MergedGlobals.103149'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103150) is being placed in '.bss..L_MergedGlobals.103150'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103151) is being placed in '.bss..L_MergedGlobals.103151'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103152) is being placed in '.bss..L_MergedGlobals.103152'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103153) is being placed in '.bss..L_MergedGlobals.103153'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103154) is being placed in '.bss..L_MergedGlobals.103154'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103155) is being placed in '.bss..L_MergedGlobals.103155'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103156) is being placed in '.bss..L_MergedGlobals.103156'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103157) is being placed in '.bss..L_MergedGlobals.103157'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103158) is being placed in '.bss..L_MergedGlobals.103158'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103159) is being placed in '.bss..L_MergedGlobals.103159'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103160) is being placed in '.bss..L_MergedGlobals.103160'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103161) is being placed in '.bss..L_MergedGlobals.103161'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103162) is being placed in '.bss..L_MergedGlobals.103162'
   ld.lld: warning: vmlinux.o:(.bss..L_MergedGlobals.103163) is being placed in '.bss..L_MergedGlobals.103163'
>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes available for requested alignment of 8 bytes
>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes available for requested alignment of 8 bytes
>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes available for requested alignment of 8 bytes
>> ld.lld: error: insufficient padding bytes for R_RISCV_ALIGN: 4 bytes available for requested alignment of 8 bytes

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
