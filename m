Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E211FF7BC
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 22:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749939221; cv=none; b=ZlSFEJIkIILjWTLgPKHZdtMOfhTD7LMzYiJC45154NbTLqji1iz1FMjN8ZXhkma7ZxtSn/atYEN5nZFfgO/ej8DB71GVaHTuSgagLfpTfE6/J8XF1ISXwdWoZZlcPncWF04116kwGAJoEbvov49kNmrU1Xy/vZb12kSmHw09LDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749939221; c=relaxed/simple;
	bh=wdD7a3GWS0YdAWzOXT2Mlff7GSe+kh/OpAvMInhNXUg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZGB3vEFeXXZh0tjG2leSvCEeZYlB5smupWioM2jQ6w/HvQIUTpnSu2pmAcP/NMKpcVphKlAd+2ikoM2QXNlsO+fmpP3BntIO94z2LoN+UgIIHJCfO4GFafgm+Jm3hGnrRWrwD4/xwRQLnPEYIMW73Ua/YYbk3IMo35uGJMyLKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lz3UnSOd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lz3UnSOd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749939220; x=1781475220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wdD7a3GWS0YdAWzOXT2Mlff7GSe+kh/OpAvMInhNXUg=;
  b=Lz3UnSOd8uRKkIYKYwNGU8ZFS3Rci7WXScfHP6YTavUxENrkvGwEJPI4
   MXNcvCmlhCdIofeMCvLrMNA5EAxVF77zC71BBcpoDI0q4lnweO+zjSLHF
   2gm+NSgGAF8uWTHoNSEWVVrpUC6qmyDY4Jf23ANY4K9b6vmVma6phc+H2
   +pLCVL96NZGD7FevQDl+FyGd7asaC1uxKP43hBns2FFTjueIR/99kMzz2
   Ew+iu9stU7O5DBkVSxccnJscFgHBvp5RGcsLEHCT5VADOsIMM2ncGyiaD
   OZs/YEThFHu5a8eCxqrvdO6TqRUmsFXT8EX5e4hgFnS4sF5bJ7U8wODJY
   w==;
X-CSE-ConnectionGUID: qxk9O1JxRZS6qqriXNAVeg==
X-CSE-MsgGUID: 8U30qoV1Qzq8UFZP8yJi9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="51992206"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="51992206"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 15:13:39 -0700
X-CSE-ConnectionGUID: vE6y2M6yQkq5j5GWxd6ozQ==
X-CSE-MsgGUID: CvmdSuqwRQyq+GtJrltPuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="153091045"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Jun 2025 15:13:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQZ83-000Du4-28;
	Sat, 14 Jun 2025 22:13:35 +0000
Date: Sun, 15 Jun 2025 06:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: ld.lld: error: Cannot export BSS symbol __inittext_end to startup
 code
Message-ID: <202506150602.qswx7ZzQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8c6bc74c7f8910ed4c969ccec52e98716f98700a
commit: dc0a083948040ff364d065da8bb50c29f77a39ad arm64: Work around convergence issue with LLD linker
date:   12 days ago
config: arm64-randconfig-004-20250615 (https://download.01.org/0day-ci/archive/20250615/202506150602.qswx7ZzQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150602.qswx7ZzQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506150602.qswx7ZzQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: Cannot export BSS symbol id_aa64isar1_override to startup code
>> ld.lld: error: Cannot export BSS symbol id_aa64isar2_override to startup code
>> ld.lld: error: Cannot export BSS symbol id_aa64mmfr0_override to startup code
>> ld.lld: error: Cannot export BSS symbol id_aa64mmfr1_override to startup code
>> ld.lld: error: Cannot export BSS symbol id_aa64mmfr2_override to startup code
>> ld.lld: error: Cannot export BSS symbol id_aa64pfr0_override to startup code
>> ld.lld: error: Cannot export BSS symbol id_aa64pfr1_override to startup code
>> ld.lld: error: Cannot export BSS symbol id_aa64smfr0_override to startup code
>> ld.lld: error: Cannot export BSS symbol id_aa64zfr0_override to startup code
>> ld.lld: error: Cannot export BSS symbol arm64_sw_feature_override to startup code
>> ld.lld: error: Cannot export BSS symbol arm64_use_ng_mappings to startup code
>> ld.lld: error: Cannot export BSS symbol _ctype to startup code
>> ld.lld: error: Cannot export BSS symbol swapper_pg_dir to startup code
>> ld.lld: error: Cannot export BSS symbol _etext to startup code
>> ld.lld: error: Cannot export BSS symbol __start_rodata to startup code
>> ld.lld: error: Cannot export BSS symbol __inittext_begin to startup code
>> ld.lld: error: Cannot export BSS symbol __inittext_end to startup code
>> ld.lld: error: Cannot export BSS symbol __initdata_begin to startup code
>> ld.lld: error: Cannot export BSS symbol __initdata_end to startup code
>> ld.lld: error: Cannot export BSS symbol _data to startup code

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
