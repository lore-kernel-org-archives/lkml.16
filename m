Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F3F2D323E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750702321; cv=none; b=OVC3VUggzcOcV1iJ9ptvVK999N0r49+VBBwr9+ydL0foSYzBissNzote5NJOgNhN9aDfw9ISCr/dI+Ca/Dq9RCMCY/O6ZWfSGTBEIfY8gHlw6uicZg+TJSKTrH0jghdATtrjrzsd7+r5UYQCWvYtzNaSrHFD/CBKQuSp3nhxuao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750702321; c=relaxed/simple;
	bh=va0T8ulaBQpx4skDDCdaq0VuEfDt2Nf05jRRXs/fYRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pxeYMzNxFj7ZcVW7E2fB4OSMibBiyZZkmGjz3mtrn2nCgk1vbPdzHUH+k6QUm85x4MULyrqmEep1DIzZ7SsXKmEpHY/lq9mol6fORRIl9ONHm3Qsqx5zoOs6XBbXr0nPls0PeaIjNO/HpLVywAjV2a07TR6lUiCZzGHYOup/vYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMaFAK8c; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMaFAK8c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750702318; x=1782238318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=va0T8ulaBQpx4skDDCdaq0VuEfDt2Nf05jRRXs/fYRM=;
  b=FMaFAK8cWatOoVvoLYyHVDA4dZ6KmPzZaA4DolVaG8DobrcbwvJ/aObZ
   w3CTstdtTTemBuPj4DZ1qP3EBkkPsq5g+D+sVXzFOscmg/MD6jVepYFRu
   4kMXqoBmqszkHC06QUiddjpYXvAS1Mjh83pq0sttoepjIBFw+RPHfWnFN
   mzf0J/F7M1mZabCKlTj2C8RAeqSA3/UdQPN1Cy9TbMNLDU1MDaPRpiz3B
   FQS2pTIMPlm0sOjCRe5cZEQlRAUKdWW69nYyH8ndI54IQG/yQsflVLnNr
   nXVElVHLEnPY7t6tiqsTJ+1NoW6vTSDL10PctC3dy2s3QMNSeLicQfYsZ
   A==;
X-CSE-ConnectionGUID: Tlky1P/kRLexAWEM3CzjEw==
X-CSE-MsgGUID: sjSKviPsSz6dJBm4Vgt3lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52792481"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="52792481"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 11:11:58 -0700
X-CSE-ConnectionGUID: BNoo/FlWSBapBZMOSEaj4w==
X-CSE-MsgGUID: ElLQ73gwTyeTkjDOyInlrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="151092981"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Jun 2025 11:11:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTle6-000PCC-0I;
	Mon, 23 Jun 2025 18:11:54 +0000
Date: Tue, 24 Jun 2025 02:11:49 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: crypto/testmgr.c:2994:1: warning: the frame size of 1032 bytes is
 larger than 1024 bytes
Message-ID: <202506240244.cOarmYVt-lkp@intel.com>
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
commit: 40b9969796bfa49ed1b0f7ddc254f48cb2ac6d2c crypto: testmgr - replace CRYPTO_MANAGER_DISABLE_TESTS with CRYPTO_SELFTESTS
date:   6 weeks ago
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250624/202506240244.cOarmYVt-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240244.cOarmYVt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240244.cOarmYVt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/testmgr.c: In function 'test_skcipher_vec_cfg':
>> crypto/testmgr.c:2994:1: warning: the frame size of 1032 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2994 | }
         | ^
   crypto/testmgr.c: In function 'test_aead_vec_cfg':
   crypto/testmgr.c:2240:1: warning: the frame size of 1144 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2240 | }
         | ^


vim +2994 crypto/testmgr.c

1aa4ecd95d8d67 Herbert Xu      2008-08-17  2838  
6e5972fa4a0db6 Eric Biggers    2020-10-26  2839  static int test_skcipher_vec_cfg(int enc, const struct cipher_testvec *vec,
951d13328a8a36 Eric Biggers    2019-04-11  2840  				 const char *vec_name,
4e7babba30d820 Eric Biggers    2019-01-31  2841  				 const struct testvec_config *cfg,
4e7babba30d820 Eric Biggers    2019-01-31  2842  				 struct skcipher_request *req,
4e7babba30d820 Eric Biggers    2019-01-31  2843  				 struct cipher_test_sglists *tsgls)
da7f033ddc9fde Herbert Xu      2008-07-31  2844  {
4e7babba30d820 Eric Biggers    2019-01-31  2845  	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
4e7babba30d820 Eric Biggers    2019-01-31  2846  	const unsigned int alignmask = crypto_skcipher_alignmask(tfm);
4e7babba30d820 Eric Biggers    2019-01-31  2847  	const unsigned int ivsize = crypto_skcipher_ivsize(tfm);
6e5972fa4a0db6 Eric Biggers    2020-10-26  2848  	const char *driver = crypto_skcipher_driver_name(tfm);
4e7babba30d820 Eric Biggers    2019-01-31  2849  	const u32 req_flags = CRYPTO_TFM_REQ_MAY_BACKLOG | cfg->req_flags;
4e7babba30d820 Eric Biggers    2019-01-31  2850  	const char *op = enc ? "encryption" : "decryption";
4e7babba30d820 Eric Biggers    2019-01-31  2851  	DECLARE_CRYPTO_WAIT(wait);
4e7babba30d820 Eric Biggers    2019-01-31  2852  	u8 _iv[3 * (MAX_ALGAPI_ALIGNMASK + 1) + MAX_IVLEN];
4e7babba30d820 Eric Biggers    2019-01-31  2853  	u8 *iv = PTR_ALIGN(&_iv[0], 2 * (MAX_ALGAPI_ALIGNMASK + 1)) +
4e7babba30d820 Eric Biggers    2019-01-31  2854  		 cfg->iv_offset +
4e7babba30d820 Eric Biggers    2019-01-31  2855  		 (cfg->iv_offset_relative_to_alignmask ? alignmask : 0);
4e7babba30d820 Eric Biggers    2019-01-31  2856  	struct kvec input;
4e7babba30d820 Eric Biggers    2019-01-31  2857  	int err;
08d6af8c160b6b Jussi Kivilinna 2012-09-21  2858  
4e7babba30d820 Eric Biggers    2019-01-31  2859  	/* Set the key */
4e7babba30d820 Eric Biggers    2019-01-31  2860  	if (vec->wk)
4e7babba30d820 Eric Biggers    2019-01-31  2861  		crypto_skcipher_set_flags(tfm, CRYPTO_TFM_REQ_FORBID_WEAK_KEYS);
da7f033ddc9fde Herbert Xu      2008-07-31  2862  	else
4e7babba30d820 Eric Biggers    2019-01-31  2863  		crypto_skcipher_clear_flags(tfm,
4e7babba30d820 Eric Biggers    2019-01-31  2864  					    CRYPTO_TFM_REQ_FORBID_WEAK_KEYS);
fd8c37c72d60c7 Eric Biggers    2019-12-01  2865  	err = do_setkey(crypto_skcipher_setkey, tfm, vec->key, vec->klen,
fd8c37c72d60c7 Eric Biggers    2019-12-01  2866  			cfg, alignmask);
4e7babba30d820 Eric Biggers    2019-01-31  2867  	if (err) {
5283a8ee9badf6 Eric Biggers    2019-04-11  2868  		if (err == vec->setkey_error)
4e7babba30d820 Eric Biggers    2019-01-31  2869  			return 0;
951d13328a8a36 Eric Biggers    2019-04-11  2870  		pr_err("alg: skcipher: %s setkey failed on test vector %s; expected_error=%d, actual_error=%d, flags=%#x\n",
951d13328a8a36 Eric Biggers    2019-04-11  2871  		       driver, vec_name, vec->setkey_error, err,
5283a8ee9badf6 Eric Biggers    2019-04-11  2872  		       crypto_skcipher_get_flags(tfm));
4e7babba30d820 Eric Biggers    2019-01-31  2873  		return err;
4e7babba30d820 Eric Biggers    2019-01-31  2874  	}
5283a8ee9badf6 Eric Biggers    2019-04-11  2875  	if (vec->setkey_error) {
951d13328a8a36 Eric Biggers    2019-04-11  2876  		pr_err("alg: skcipher: %s setkey unexpectedly succeeded on test vector %s; expected_error=%d\n",
951d13328a8a36 Eric Biggers    2019-04-11  2877  		       driver, vec_name, vec->setkey_error);
4e7babba30d820 Eric Biggers    2019-01-31  2878  		return -EINVAL;
da7f033ddc9fde Herbert Xu      2008-07-31  2879  	}
da7f033ddc9fde Herbert Xu      2008-07-31  2880  
4e7babba30d820 Eric Biggers    2019-01-31  2881  	/* The IV must be copied to a buffer, as the algorithm may modify it */
4e7babba30d820 Eric Biggers    2019-01-31  2882  	if (ivsize) {
4e7babba30d820 Eric Biggers    2019-01-31  2883  		if (WARN_ON(ivsize > MAX_IVLEN))
4e7babba30d820 Eric Biggers    2019-01-31  2884  			return -EINVAL;
730f67d8b826d9 Eric Biggers    2024-12-27  2885  		if (vec->iv)
4e7babba30d820 Eric Biggers    2019-01-31  2886  			memcpy(iv, vec->iv, ivsize);
da7f033ddc9fde Herbert Xu      2008-07-31  2887  		else
4e7babba30d820 Eric Biggers    2019-01-31  2888  			memset(iv, 0, ivsize);
4e7babba30d820 Eric Biggers    2019-01-31  2889  	} else {
4e7babba30d820 Eric Biggers    2019-01-31  2890  		iv = NULL;
08d6af8c160b6b Jussi Kivilinna 2012-09-21  2891  	}
da7f033ddc9fde Herbert Xu      2008-07-31  2892  
4e7babba30d820 Eric Biggers    2019-01-31  2893  	/* Build the src/dst scatterlists */
4e7babba30d820 Eric Biggers    2019-01-31  2894  	input.iov_base = enc ? (void *)vec->ptext : (void *)vec->ctext;
4e7babba30d820 Eric Biggers    2019-01-31  2895  	input.iov_len = vec->len;
4e7babba30d820 Eric Biggers    2019-01-31  2896  	err = build_cipher_test_sglists(tsgls, cfg, alignmask,
4e7babba30d820 Eric Biggers    2019-01-31  2897  					vec->len, vec->len, &input, 1);
4e7babba30d820 Eric Biggers    2019-01-31  2898  	if (err) {
951d13328a8a36 Eric Biggers    2019-04-11  2899  		pr_err("alg: skcipher: %s %s: error preparing scatterlists for test vector %s, cfg=\"%s\"\n",
951d13328a8a36 Eric Biggers    2019-04-11  2900  		       driver, op, vec_name, cfg->name);
4e7babba30d820 Eric Biggers    2019-01-31  2901  		return err;
da7f033ddc9fde Herbert Xu      2008-07-31  2902  	}
da7f033ddc9fde Herbert Xu      2008-07-31  2903  
4e7babba30d820 Eric Biggers    2019-01-31  2904  	/* Do the actual encryption or decryption */
4e7babba30d820 Eric Biggers    2019-01-31  2905  	testmgr_poison(req->__ctx, crypto_skcipher_reqsize(tfm));
4e7babba30d820 Eric Biggers    2019-01-31  2906  	skcipher_request_set_callback(req, req_flags, crypto_req_done, &wait);
4e7babba30d820 Eric Biggers    2019-01-31  2907  	skcipher_request_set_crypt(req, tsgls->src.sgl_ptr, tsgls->dst.sgl_ptr,
4e7babba30d820 Eric Biggers    2019-01-31  2908  				   vec->len, iv);
6570737c7fa047 Eric Biggers    2019-03-12  2909  	if (cfg->nosimd)
6570737c7fa047 Eric Biggers    2019-03-12  2910  		crypto_disable_simd_for_test();
6570737c7fa047 Eric Biggers    2019-03-12  2911  	err = enc ? crypto_skcipher_encrypt(req) : crypto_skcipher_decrypt(req);
6570737c7fa047 Eric Biggers    2019-03-12  2912  	if (cfg->nosimd)
6570737c7fa047 Eric Biggers    2019-03-12  2913  		crypto_reenable_simd_for_test();
6570737c7fa047 Eric Biggers    2019-03-12  2914  	err = crypto_wait_req(err, &wait);
8a826a34a52eef Boris Brezillon 2015-06-16  2915  
fa353c99174e83 Eric Biggers    2019-01-31  2916  	/* Check that the algorithm didn't overwrite things it shouldn't have */
fa353c99174e83 Eric Biggers    2019-01-31  2917  	if (req->cryptlen != vec->len ||
fa353c99174e83 Eric Biggers    2019-01-31  2918  	    req->iv != iv ||
fa353c99174e83 Eric Biggers    2019-01-31  2919  	    req->src != tsgls->src.sgl_ptr ||
fa353c99174e83 Eric Biggers    2019-01-31  2920  	    req->dst != tsgls->dst.sgl_ptr ||
fa353c99174e83 Eric Biggers    2019-01-31  2921  	    crypto_skcipher_reqtfm(req) != tfm ||
fa353c99174e83 Eric Biggers    2019-01-31  2922  	    req->base.complete != crypto_req_done ||
fa353c99174e83 Eric Biggers    2019-01-31  2923  	    req->base.flags != req_flags ||
fa353c99174e83 Eric Biggers    2019-01-31  2924  	    req->base.data != &wait) {
951d13328a8a36 Eric Biggers    2019-04-11  2925  		pr_err("alg: skcipher: %s %s corrupted request struct on test vector %s, cfg=\"%s\"\n",
951d13328a8a36 Eric Biggers    2019-04-11  2926  		       driver, op, vec_name, cfg->name);
fa353c99174e83 Eric Biggers    2019-01-31  2927  		if (req->cryptlen != vec->len)
fa353c99174e83 Eric Biggers    2019-01-31  2928  			pr_err("alg: skcipher: changed 'req->cryptlen'\n");
fa353c99174e83 Eric Biggers    2019-01-31  2929  		if (req->iv != iv)
fa353c99174e83 Eric Biggers    2019-01-31  2930  			pr_err("alg: skcipher: changed 'req->iv'\n");
fa353c99174e83 Eric Biggers    2019-01-31  2931  		if (req->src != tsgls->src.sgl_ptr)
fa353c99174e83 Eric Biggers    2019-01-31  2932  			pr_err("alg: skcipher: changed 'req->src'\n");
fa353c99174e83 Eric Biggers    2019-01-31  2933  		if (req->dst != tsgls->dst.sgl_ptr)
fa353c99174e83 Eric Biggers    2019-01-31  2934  			pr_err("alg: skcipher: changed 'req->dst'\n");
fa353c99174e83 Eric Biggers    2019-01-31  2935  		if (crypto_skcipher_reqtfm(req) != tfm)
fa353c99174e83 Eric Biggers    2019-01-31  2936  			pr_err("alg: skcipher: changed 'req->base.tfm'\n");
fa353c99174e83 Eric Biggers    2019-01-31  2937  		if (req->base.complete != crypto_req_done)
fa353c99174e83 Eric Biggers    2019-01-31  2938  			pr_err("alg: skcipher: changed 'req->base.complete'\n");
fa353c99174e83 Eric Biggers    2019-01-31  2939  		if (req->base.flags != req_flags)
fa353c99174e83 Eric Biggers    2019-01-31  2940  			pr_err("alg: skcipher: changed 'req->base.flags'\n");
fa353c99174e83 Eric Biggers    2019-01-31  2941  		if (req->base.data != &wait)
fa353c99174e83 Eric Biggers    2019-01-31  2942  			pr_err("alg: skcipher: changed 'req->base.data'\n");
fa353c99174e83 Eric Biggers    2019-01-31  2943  		return -EINVAL;
fa353c99174e83 Eric Biggers    2019-01-31  2944  	}
fa353c99174e83 Eric Biggers    2019-01-31  2945  	if (is_test_sglist_corrupted(&tsgls->src)) {
951d13328a8a36 Eric Biggers    2019-04-11  2946  		pr_err("alg: skcipher: %s %s corrupted src sgl on test vector %s, cfg=\"%s\"\n",
951d13328a8a36 Eric Biggers    2019-04-11  2947  		       driver, op, vec_name, cfg->name);
fa353c99174e83 Eric Biggers    2019-01-31  2948  		return -EINVAL;
fa353c99174e83 Eric Biggers    2019-01-31  2949  	}
fa353c99174e83 Eric Biggers    2019-01-31  2950  	if (tsgls->dst.sgl_ptr != tsgls->src.sgl &&
fa353c99174e83 Eric Biggers    2019-01-31  2951  	    is_test_sglist_corrupted(&tsgls->dst)) {
951d13328a8a36 Eric Biggers    2019-04-11  2952  		pr_err("alg: skcipher: %s %s corrupted dst sgl on test vector %s, cfg=\"%s\"\n",
951d13328a8a36 Eric Biggers    2019-04-11  2953  		       driver, op, vec_name, cfg->name);
fa353c99174e83 Eric Biggers    2019-01-31  2954  		return -EINVAL;
fa353c99174e83 Eric Biggers    2019-01-31  2955  	}
fa353c99174e83 Eric Biggers    2019-01-31  2956  
5283a8ee9badf6 Eric Biggers    2019-04-11  2957  	/* Check for success or failure */
5283a8ee9badf6 Eric Biggers    2019-04-11  2958  	if (err) {
5283a8ee9badf6 Eric Biggers    2019-04-11  2959  		if (err == vec->crypt_error)
5283a8ee9badf6 Eric Biggers    2019-04-11  2960  			return 0;
951d13328a8a36 Eric Biggers    2019-04-11  2961  		pr_err("alg: skcipher: %s %s failed on test vector %s; expected_error=%d, actual_error=%d, cfg=\"%s\"\n",
951d13328a8a36 Eric Biggers    2019-04-11  2962  		       driver, op, vec_name, vec->crypt_error, err, cfg->name);
5283a8ee9badf6 Eric Biggers    2019-04-11  2963  		return err;
5283a8ee9badf6 Eric Biggers    2019-04-11  2964  	}
5283a8ee9badf6 Eric Biggers    2019-04-11  2965  	if (vec->crypt_error) {
951d13328a8a36 Eric Biggers    2019-04-11  2966  		pr_err("alg: skcipher: %s %s unexpectedly succeeded on test vector %s; expected_error=%d, cfg=\"%s\"\n",
951d13328a8a36 Eric Biggers    2019-04-11  2967  		       driver, op, vec_name, vec->crypt_error, cfg->name);
5283a8ee9badf6 Eric Biggers    2019-04-11  2968  		return -EINVAL;
5283a8ee9badf6 Eric Biggers    2019-04-11  2969  	}
5283a8ee9badf6 Eric Biggers    2019-04-11  2970  
4e7babba30d820 Eric Biggers    2019-01-31  2971  	/* Check for the correct output (ciphertext or plaintext) */
4e7babba30d820 Eric Biggers    2019-01-31  2972  	err = verify_correct_output(&tsgls->dst, enc ? vec->ctext : vec->ptext,
4e7babba30d820 Eric Biggers    2019-01-31  2973  				    vec->len, 0, true);
4e7babba30d820 Eric Biggers    2019-01-31  2974  	if (err == -EOVERFLOW) {
951d13328a8a36 Eric Biggers    2019-04-11  2975  		pr_err("alg: skcipher: %s %s overran dst buffer on test vector %s, cfg=\"%s\"\n",
951d13328a8a36 Eric Biggers    2019-04-11  2976  		       driver, op, vec_name, cfg->name);
4e7babba30d820 Eric Biggers    2019-01-31  2977  		return err;
8a826a34a52eef Boris Brezillon 2015-06-16  2978  	}
4e7babba30d820 Eric Biggers    2019-01-31  2979  	if (err) {
951d13328a8a36 Eric Biggers    2019-04-11  2980  		pr_err("alg: skcipher: %s %s test failed (wrong result) on test vector %s, cfg=\"%s\"\n",
951d13328a8a36 Eric Biggers    2019-04-11  2981  		       driver, op, vec_name, cfg->name);
4e7babba30d820 Eric Biggers    2019-01-31  2982  		return err;
da7f033ddc9fde Herbert Xu      2008-07-31  2983  	}
da7f033ddc9fde Herbert Xu      2008-07-31  2984  
4e7babba30d820 Eric Biggers    2019-01-31  2985  	/* If applicable, check that the algorithm generated the correct IV */
8efd972ef96a3f Eric Biggers    2019-02-14  2986  	if (vec->iv_out && memcmp(iv, vec->iv_out, ivsize) != 0) {
951d13328a8a36 Eric Biggers    2019-04-11  2987  		pr_err("alg: skcipher: %s %s test failed (wrong output IV) on test vector %s, cfg=\"%s\"\n",
951d13328a8a36 Eric Biggers    2019-04-11  2988  		       driver, op, vec_name, cfg->name);
4e7babba30d820 Eric Biggers    2019-01-31  2989  		hexdump(iv, ivsize);
4e7babba30d820 Eric Biggers    2019-01-31  2990  		return -EINVAL;
4e7babba30d820 Eric Biggers    2019-01-31  2991  	}
da7f033ddc9fde Herbert Xu      2008-07-31  2992  
4e7babba30d820 Eric Biggers    2019-01-31  2993  	return 0;
4e7babba30d820 Eric Biggers    2019-01-31 @2994  }
da7f033ddc9fde Herbert Xu      2008-07-31  2995  

:::::: The code at line 2994 was first introduced by commit
:::::: 4e7babba30d820c4195b1d58cf51dce3c22ecf2b crypto: testmgr - convert skcipher testing to use testvec_configs

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
