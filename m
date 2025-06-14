Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041572AE74
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 07:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749887236; cv=none; b=lpGq69qweIqY8jJodMGtTfJL85VdDld44z6/w+X1ELgKkLeznyE8MZat1KYm4df5dzT1hm7eXl6cH7/HxHYgxCzK9hPBqcs51NMMfDakhxhqp3Q+tQiL0srYrVILvNW98Tr+1aECSC/upFUsWbRxDsQK6Xc0gPE3qawzhnPSQeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749887236; c=relaxed/simple;
	bh=hD69HgNr5+rpwXa4azp7eDgeIFvY5wfOsUL5MKSf6I0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hN2/9bXHvjRrn3ZEZjtjNHPMnvicrI0igLmGULCWzzo1IXZheXhRAR68UYX+mbyxDRasWI4ajL4zaaUb9hYZav6IF+Sf+8hKW4zNMK2hIRQI1ih8rOI1H+Vty6iF7zaJfTnGhif3Cl8sHDBn6Cp0uS6Be8idZV8KcRhhyZj64ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwsbOApR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwsbOApR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749887235; x=1781423235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hD69HgNr5+rpwXa4azp7eDgeIFvY5wfOsUL5MKSf6I0=;
  b=bwsbOApRCdMGAPYIg1M4Kzeqb4bnuXDVL6YXXyKgDJfq8rcDNbUEHthP
   s9y/bjBxZZPUxa+w8ZZUk6n8OEQk9SV3KuRZwyMzcU/YAoADlawlrlg3Z
   Q6uLNXet5cPcOC+Eaya1MZcc98fpBqt02ibcEyGfo5enDYPLaxs8sI/Ee
   t/rTJnWGe9mLo6eb9ImRaBJN7TRIUHMwR5pRAh7XK3Rwia5bLQkcE/dxB
   vImYqHO9WzOYYKbAj1gu68IpO6kH1/YfKsRcu47ZV7v8iFBGMTVo5Ll0i
   umbmlq9Q6cOPYrrSUhe7Q1H2fQEr1AdaS1M/cw8XXD0DEPlljawGP7B+D
   w==;
X-CSE-ConnectionGUID: UWQPeiFjSXCCrvqMdncPhw==
X-CSE-MsgGUID: jmZKzzdCRgSNEPoBu77HpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55901344"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="55901344"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 00:47:14 -0700
X-CSE-ConnectionGUID: TXPiX2H5SgeDbQSsxAQwlg==
X-CSE-MsgGUID: OBYHtrNYQd6ND21oqHzFvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="148005749"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2025 00:47:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQLba-000DN8-1l;
	Sat, 14 Jun 2025 07:47:10 +0000
Date: Sat, 14 Jun 2025 15:46:35 +0800
From: kernel test robot <lkp@intel.com>
To: Brent Lu <brent.lu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: ld.lld: error: undefined symbol: snd_soc_acpi_intel_get_codec_name
Message-ID: <202506141543.dN0JJyZC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4774cfe3543abb8ee98089f535e28ebfd45b975a
commit: b28b23dea31497548010c248398162ef4c25cfd2 ASoC: Intel: skl_hda_dsp_generic: use common module for DAI links
date:   9 months ago
config: i386-randconfig-052-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141543.dN0JJyZC-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506141543.dN0JJyZC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506141543.dN0JJyZC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: snd_soc_acpi_intel_get_codec_name
   >>> referenced by sof_board_helpers.c:184 (sound/soc/intel/boards/sof_board_helpers.c:184)
   >>>               sound/soc/intel/boards/sof_board_helpers.o:(sof_intel_board_set_dai_link) in archive vmlinux.a
   >>> referenced by sof_board_helpers.c:340 (sound/soc/intel/boards/sof_board_helpers.c:340)
   >>>               sound/soc/intel/boards/sof_board_helpers.o:(sof_intel_board_set_dai_link) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: snd_soc_acpi_intel_detect_codec_type
   >>> referenced by sof_board_helpers.c:754 (sound/soc/intel/boards/sof_board_helpers.c:754)
   >>>               sound/soc/intel/boards/sof_board_helpers.o:(sof_intel_board_get_ctx) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: snd_soc_acpi_intel_detect_amp_type
   >>> referenced by sof_board_helpers.c:755 (sound/soc/intel/boards/sof_board_helpers.c:755)
   >>>               sound/soc/intel/boards/sof_board_helpers.o:(sof_intel_board_get_ctx) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
