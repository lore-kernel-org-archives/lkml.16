Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94F1405F7
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 00:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747009503; cv=none; b=sSDC2Ih1phF9TjNp558OOja9y4oAeJBq/vU+OJTC9jQFaUKdvj0mXgTzjaCsXHNh8heDP1ahvRflwSYCwPBqSFrKVmuRUV+P199olYOhiUQKga2LUhwN1Ni80YPBRed904b7vMpfxosXHKp3bQ2PDsIigXkQT8vWd1jjeQ1n8+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747009503; c=relaxed/simple;
	bh=D6EbC+Su5fTtpCG0zi2YDEnfmEIT53iuQAfybgajQ+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZgSwf8zpB1FuXU3w4ImNMg4RgLLucJgfnyIuqMnDGqNPkd2Q+0fxN8CkyoI3/5OJh4Yij4D3JhcmUrT9bQcg/Eo+iL1GoF3SShaWMGhgAFSv51F4l5UYj/nj6wx1CAqF5GjF2dHhSneYs//sRnpyPm5itw5LuHdkwo7mWgrpuPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZQiyXuH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZQiyXuH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747009501; x=1778545501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D6EbC+Su5fTtpCG0zi2YDEnfmEIT53iuQAfybgajQ+4=;
  b=KZQiyXuHXOVpGW1BSRJ/HV1qzLvzSA50Wtbcr3EVh1pyDGD8l6TZajLj
   j2Qr0UdYXrQ0Hd2QJyZdYxR3hpDXbeVwv9R5vCkbP+cQkOO96OPVGpdJn
   CmxdHv948Hglu8pN8SDMGhOLas09rLQztUprKkRFQx03kViAQ4wa9xWN7
   SrlndFXOmULYuQP7igXmRp7gtXQrcnlfwqqLku/U9MxdradwrdvY1ggXZ
   F46RxZivKAUe8Y+mroC6o3IpwizcVryxsiNP9PsJhiI7M7pakLgg3wT0J
   aPLAcnVScssPMipVlPpmBo+Stb2AiFTgS1Rm+tI+rilzKGWsw1V4LLKxX
   g==;
X-CSE-ConnectionGUID: yzx+owdLSJ2Pib45h+gt/w==
X-CSE-MsgGUID: CrfgvXE6SWu5zvUzz6qoAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="52596459"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="52596459"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 17:25:00 -0700
X-CSE-ConnectionGUID: /9EOSLZASDCQZADYBs1E+w==
X-CSE-MsgGUID: Dh7kjM7FTxCBJtAXvk3B+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="142180671"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 May 2025 17:24:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEGyW-000E57-1V;
	Mon, 12 May 2025 00:24:56 +0000
Date: Mon, 12 May 2025 08:24:04 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: {standard input}:13407: Error: Insn jl_s has an instruction mpyuw
 with limm in its delay slot.
Message-ID: <202505120846.UnBxmVmW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
date:   4 months ago
config: arc-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505120846.UnBxmVmW-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505120846.UnBxmVmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505120846.UnBxmVmW-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:13407: Error: Insn jl_s has an instruction mpyuw with limm in its delay slot.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
