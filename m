Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6447262F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750700336; cv=none; b=s3ad4RD+PmMqmeFVJILMYCl4plrK9/goAQzeZEmctogBzzID9djI3ytNJQ5F9KdJZxUge0N7rJUi71BcrOdCxDgLKLbV4B2OfD/DsAdXCNLaun8R3mf41MWQNLngDxjKOasdjLkWxwIaOI8s4YTdUv765s8rwAGYT8J9/8SaxBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750700336; c=relaxed/simple;
	bh=w7fAhpsEqLdl8TuUCarpRODVHWlOqY93FGWAptkMNz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MjpAIT5jSwUF6p4H9WdKablU5F+3MVTLgT0kRAiJgTZZIVydWF0aCahikscUQRp8CyKiVWmf/IpzRtCKf9AzFofhiRAxPcFMVpDq3nL30Vry4KjkYQeOQtlh3UTNa/IRULc/QZHD+1jDALdi4GWC+Q3I4JQNHQDJEDFmanwQ/RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQi1BdEy; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQi1BdEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750700334; x=1782236334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w7fAhpsEqLdl8TuUCarpRODVHWlOqY93FGWAptkMNz4=;
  b=JQi1BdEy1UlviUKojNqTDV4U+jJdYTfYfIJCUjmrRCngCXybO0PQVwWt
   o6t3gTVuNOh3mSsjcVHxa/CxO73Kl0bLpFDZYxustbahSX/yrJDBqnca3
   FUMtVif5vpdNCMW0ITH1FnkAj5jObHQUOUUCZJeN+CsOHCv55XgamBe89
   Y4S7ET9M7tSei1i7RjUGM5iX0+u9IsXsFFRRLOfNOyHjLhvzas38mJvqk
   SoOVTccCurT2ZHMjsZ9tAHwrTMEF6iEt/eexV4Jr9pczvwl3ya2Yi1756
   KbKdR3AkfZa5JRdI6e3RwikF+WZnSKW9pthbIclLicFV8wSE9NIuJGe0p
   g==;
X-CSE-ConnectionGUID: KiiHsm/8SCGjg3Ns3mX+wA==
X-CSE-MsgGUID: JfccxRz1ScWU77aEyvXvkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="64349414"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="64349414"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 10:38:54 -0700
X-CSE-ConnectionGUID: F+5CatMISSSnfBdTZNbbbw==
X-CSE-MsgGUID: QpZGA2f/TvK9TPR1Im6phQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="151836099"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Jun 2025 10:38:52 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTl85-000PAQ-35;
	Mon, 23 Jun 2025 17:38:49 +0000
Date: Tue, 24 Jun 2025 01:38:24 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: lib/crypto/sm3.c:169:6: warning: stack frame size (1200) exceeds
 limit (1024) in 'sm3_block_generic'
Message-ID: <202506240133.iBttMRY7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   86731a2a651e58953fc949573895f2fa6d456841
commit: cb16ba46958e41f8d805cbdb027a601b3a0c65b4 crypto: lib/sm3 - Export generic block function
date:   10 weeks ago
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250624/202506240133.iBttMRY7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240133.iBttMRY7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240133.iBttMRY7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/crypto/sm3.c:169:6: warning: stack frame size (1200) exceeds limit (1024) in 'sm3_block_generic' [-Wframe-larger-than]
     169 | void sm3_block_generic(struct sm3_state *sctx, u8 const *data, int blocks)
         |      ^
   1 warning generated.


vim +/sm3_block_generic +169 lib/crypto/sm3.c

   168	
 > 169	void sm3_block_generic(struct sm3_state *sctx, u8 const *data, int blocks)
   170	{
   171		u32 W[16];
   172	
   173		do {
   174			sm3_transform(sctx, data, W);
   175			data += SM3_BLOCK_SIZE;
   176		} while (--blocks);
   177	
   178		memzero_explicit(W, sizeof(W));
   179	}
   180	EXPORT_SYMBOL_GPL(sm3_block_generic);
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
