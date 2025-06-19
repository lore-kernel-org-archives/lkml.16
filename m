Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5243D1F09BF
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335234; cv=none; b=ODIIBegFsWv84bE4OTGVfQzsTwZWlm3i4qTCv4jdOiro/8K6e7m61VUN95zaLf7nj1dfw2jk+/SQ21y79lDYdJL/OCY94FfksFznWr7dYcwY2NEBKXnuqelzM3p2HSR/mjQnKW8Qvap/6s3EpMrV2tVYwZm+f1NxFQi4dE3WMZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335234; c=relaxed/simple;
	bh=Qlz3FN2eCazRLX2Bfo58ATC0F3oaR8PaS9tFD9Q500M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nZLAuNwT/YL8aPwOHfujjrjFcvIIvoQvDZRTuVW1O0xsf4HeIqFP5fThDIBMLbQtVDz2acvjWBEo5FWb3szIei2wA6TKWaULzfmNRyE2edQqn1I8v0P1n+vS2zKPT1Gp7moIxCiJ0QAErOE3ym3oJBSv1ZHybESba9nwVJNhx48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hc0Sir0s; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hc0Sir0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750335233; x=1781871233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qlz3FN2eCazRLX2Bfo58ATC0F3oaR8PaS9tFD9Q500M=;
  b=Hc0Sir0snuXsnLOE1t/8fMXXJThAqPCOB6QnvpFrC/yNzXyEQmeNCQoO
   C/ZwxZ0QjzQothqAebvgQZXT/nHg37sbcvz2dQ3CMmmmouCDCJgMD5Q26
   40kxpOjV7j6Bh6j+3OtoFgWjaAX5craI+6SZg3sF9FB1sNz9Sjw1BwfHD
   ku0rwkQ0irLkmWUBjkw5j/bzCIF+wluUxd1rEJ0LN3XUV5R3BW4Zpxmt2
   sDgBVyykp6NmWDR3ZWRoXxDdcGrI6hZhLsm/Td4Ay6WgJvo6jtRDbNe0j
   dIHMSKhcQ9RMPxzjg0JAv8bDwiirdGlVmKjLZn4BcKakQjAdtsCQCBKNu
   w==;
X-CSE-ConnectionGUID: ixPMy+WbQ0WIdwWL5xAq8A==
X-CSE-MsgGUID: DUEGSSOsQ3aBMPDAmr4yEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52728031"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52728031"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 05:13:53 -0700
X-CSE-ConnectionGUID: i/UihO5VQA2ttitTWWIdPg==
X-CSE-MsgGUID: kr2kECjvS5Kq2tshYdPQKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155195379"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jun 2025 05:13:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSE9N-000KjK-0H;
	Thu, 19 Jun 2025 12:13:49 +0000
Date: Thu, 19 Jun 2025 20:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: crypto/hmac.c:251:12: warning: stack frame size (1152) exceeds limit
 (1024) in 'hmac_setkey_ahash'
Message-ID: <202506192035.7dBntw28-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fb4d33ab452ea254e2c319bac5703d1b56d895bf
commit: c3103416d5217655d707d9417aaf66f184e3d72f crypto: hmac - Add ahash support
date:   4 weeks ago
config: mips-eyeq6_defconfig (https://download.01.org/0day-ci/archive/20250619/202506192035.7dBntw28-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506192035.7dBntw28-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506192035.7dBntw28-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/hmac.c:251:12: warning: stack frame size (1152) exceeds limit (1024) in 'hmac_setkey_ahash' [-Wframe-larger-than]
     251 | static int hmac_setkey_ahash(struct crypto_ahash *parent,
         |            ^
   1 warning generated.


vim +/hmac_setkey_ahash +251 crypto/hmac.c

   250	
 > 251	static int hmac_setkey_ahash(struct crypto_ahash *parent,
   252				     const u8 *inkey, unsigned int keylen)
   253	{
   254		struct ahash_hmac_ctx *tctx = crypto_ahash_ctx(parent);
   255		struct crypto_ahash *fb = crypto_ahash_fb(tctx->hash);
   256		int ds = crypto_ahash_digestsize(parent);
   257		int bs = crypto_ahash_blocksize(parent);
   258		int ss = crypto_ahash_statesize(parent);
   259		HASH_REQUEST_ON_STACK(req, fb);
   260		u8 *opad = &tctx->pads[ss];
   261		u8 *ipad = &tctx->pads[0];
   262		int err, i;
   263	
   264		if (fips_enabled && (keylen < 112 / 8))
   265			return -EINVAL;
   266	
   267		ahash_request_set_callback(req, 0, NULL, NULL);
   268	
   269		if (keylen > bs) {
   270			ahash_request_set_virt(req, inkey, ipad, keylen);
   271			err = crypto_ahash_digest(req);
   272			if (err)
   273				goto out_zero_req;
   274	
   275			keylen = ds;
   276		} else
   277			memcpy(ipad, inkey, keylen);
   278	
   279		memset(ipad + keylen, 0, bs - keylen);
   280		memcpy(opad, ipad, bs);
   281	
   282		for (i = 0; i < bs; i++) {
   283			ipad[i] ^= HMAC_IPAD_VALUE;
   284			opad[i] ^= HMAC_OPAD_VALUE;
   285		}
   286	
   287		ahash_request_set_virt(req, ipad, NULL, bs);
   288		err = crypto_ahash_init(req) ?:
   289		      crypto_ahash_update(req) ?:
   290		      crypto_ahash_export(req, ipad);
   291	
   292		ahash_request_set_virt(req, opad, NULL, bs);
   293		err = err ?:
   294		      crypto_ahash_init(req) ?:
   295		      crypto_ahash_update(req) ?:
   296		      crypto_ahash_export(req, opad);
   297	
   298	out_zero_req:
   299		HASH_REQUEST_ZERO(req);
   300		return err;
   301	}
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
