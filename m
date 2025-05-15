Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599CC28152A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 01:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747273543; cv=none; b=REEPWI2PHpee28DNDgh9oX25DVDMTgw1QNKX1cabcJIi3mzqvl/TH9gvrakzjkbL671jFUIAkNBYvPhvgsakQKLZcQq94/at5GWNFGbzCJWoXsxCBQ3fa5zqRwoO7WFHf9rtcNBcDZl7QVqoZLysjAymBRiDeAcvXZGZc6WOpbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747273543; c=relaxed/simple;
	bh=mTAKBvruWSGs27qAdgmHzaFXS4fWhPHgKmMkrAWa7Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwESDwdZB9Nb7xkKq9626s8c010pOJV4iIBKhGowIm6Gd59xIQ5sRg1xvzqmwvVMFAMMeRSKNqTyD/0PCtQxEOzHdUstM5R/JSaDD/rcTZmax5Mxbntq2puNvSmzg+FtJYPMrRXas9zGmmT0tyQnlyuwLtzTMECh9hdcBuscIYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nv1F2dov; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nv1F2dov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747273541; x=1778809541;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mTAKBvruWSGs27qAdgmHzaFXS4fWhPHgKmMkrAWa7Ag=;
  b=Nv1F2dovU+YraiNuFZE121KveOExO01fVRwvB/Q8NKtkkflhGQxvNS8D
   XWqGvA9TvxBjLzZ6BA1DHFRZ9aJ+PvxDtA2IQhX53pIvxDqWRxPWcQdm+
   uUaw69UD76Z0iTMaCQIRx49veiMcJZZEDvDPHiE1vFAp4szdPCC9b9fdN
   JGfaYKQpAQXJ29/qVKSSHSZhBr1LpXDmQQ6YfbLIZsghCcstxy+zBBYO/
   fUSRCfVvN7uDMgNzRu+5gwsD7yBeECZYLCDHU3cZuXIRcipNKsh5HRWzs
   mlNXVH8k+EIcUIHYsOuSKKEA4IF6NNeGZfQirHAfIR6UnbWDKZT69gsNp
   w==;
X-CSE-ConnectionGUID: GpeIlxfcT8CI6oS42Sh8RA==
X-CSE-MsgGUID: 6FuWV3UMTLGp2nSflIqp+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52998946"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="52998946"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 18:45:41 -0700
X-CSE-ConnectionGUID: f0L1mMBEQzKurhLdRDS4Gg==
X-CSE-MsgGUID: xdbFWmHESU+T4Io5HL7DAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="137945612"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 May 2025 18:45:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFNfE-000HmB-2o;
	Thu, 15 May 2025 01:45:36 +0000
Date: Thu, 15 May 2025 09:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Liu <liubo03@inspur.com>, xiang@kernel.org, chao@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Bo Liu <liubo03@inspur.com>
Subject: Re: [PATCH v2] erofs: support deflate decompress by using Intel QAT
Message-ID: <202505150946.oGwqIzrW-lkp@intel.com>
References: <20250514121709.2557-1-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514121709.2557-1-liubo03@inspur.com>

Hi Bo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on xiang-erofs/dev xiang-erofs/fixes linus/master v6.15-rc6 next-20250514]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Liu/erofs-support-deflate-decompress-by-using-Intel-QAT/20250514-202351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20250514121709.2557-1-liubo03%40inspur.com
patch subject: [PATCH v2] erofs: support deflate decompress by using Intel QAT
config: riscv-randconfig-002-20250515 (https://download.01.org/0day-ci/archive/20250515/202505150946.oGwqIzrW-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150946.oGwqIzrW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150946.oGwqIzrW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/erofs/decompressor_crypto.c:211:9: warning: braces around scalar initializer
     211 |         [Z_EROFS_COMPRESSION_DEFLATE] = {&(struct z_erofs_crypto_engine) {
         |         ^
   fs/erofs/decompressor_crypto.c:211:9: note: (near initialization for 'z_erofs_crypto[2]')
   fs/erofs/decompressor_crypto.c:216:17: warning: excess elements in scalar initializer
     216 |                 &(const struct z_erofs_crypto_engine) { NULL },
         |                 ^
   fs/erofs/decompressor_crypto.c:216:17: note: (near initialization for 'z_erofs_crypto[2]')


vim +211 fs/erofs/decompressor_crypto.c

   207	
   208	struct z_erofs_crypto_engine *z_erofs_crypto[] = {
   209		[Z_EROFS_COMPRESSION_LZ4] = &(struct z_erofs_crypto_engine) {NULL},
   210		[Z_EROFS_COMPRESSION_LZMA] = &(struct z_erofs_crypto_engine) {NULL},
 > 211		[Z_EROFS_COMPRESSION_DEFLATE] = {&(struct z_erofs_crypto_engine) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
