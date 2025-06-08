Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F17254873
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 21:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749419109; cv=none; b=piKIkulSQ6Ho7gD6Wz6FKsUnmoXsuDP8RRZMGOfyw1mDwe4JF0n+SvoeH48YEgyNP8azAvNjvIDMXtieFAlC9yUVauA4r1DpEzUgt6wdcplwfBrVKd+bDzWHpDHZCA7VrdCj7JQN6NVeviT4MCQKu0p3ibzbNL6107y108kQE4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749419109; c=relaxed/simple;
	bh=npZfZ2WCHTpliWOXYMmid9BgtGuNxMQTcGwH9McZC+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rabm7BQuo2b/1IN+YeNROJYMZetAM4NadQW8I/j5WdJExLSuHhvysA+XITSn2snpr9IeG1GgyWcTeo2Z4j1fqoJqR8q06jdD+Si8iLbDOPyjJI5AnyszknFR0HoKoImkfkR2MCgTMQM7+EsTmnwgBWzIzy3GgZCoUmpIDXxGs8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzxE4DuM; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzxE4DuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749419108; x=1780955108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=npZfZ2WCHTpliWOXYMmid9BgtGuNxMQTcGwH9McZC+o=;
  b=bzxE4DuMfz+2CI5LS39Lg7HCU+L6THzwgbJ86+ZAanNPUCEFrErTVN5z
   Ec4z6nZpmLQBPvloic5dfQeVqSfdG900yrpZ3dpkAsvMJZx7zTVNnbj1P
   oa1ldvQbJrXjQcTqOSD67JFedD/9OYpmtX5+4J6GSwNS+VxKMDbomjzP0
   K4Jw9NJ/BhyFi8Y2dZdPE+FpHvp3vX/N/euryO2h8bfk6IO46Hg9Q7FTG
   jvgJ13+yBiT3s9Wa1dqLzkcT2rlstSnyzeLBC6bT5tNzIR/NQaqKrT5sL
   Ar4Db7i+pr0IkANt7mVS0FQx1r4zkDL4RlEFFbi7cxKvzFnTSoLQUYVnE
   w==;
X-CSE-ConnectionGUID: Vwa0iJMCT0u36WgjneOBjA==
X-CSE-MsgGUID: rGOTmVpwSgyGJKR4B5qbPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51355904"
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="51355904"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2025 14:45:07 -0700
X-CSE-ConnectionGUID: h6gpoV7kQli88U3B5uVOHQ==
X-CSE-MsgGUID: J09Yft1ISY21ppPiui92ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,221,1744095600"; 
   d="scan'208";a="150161631"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jun 2025 14:45:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uONp8-0006ZN-0W;
	Sun, 08 Jun 2025 21:45:02 +0000
Date: Mon, 9 Jun 2025 05:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH 1/3] bitmap: generalize node_random()
Message-ID: <202506090550.y3ypu2EO-lkp@intel.com>
References: <20250608194536.28130-2-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608194536.28130-2-yury.norov@gmail.com>

Hi Yury,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on tip/timers/core akpm-mm/mm-everything linus/master v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yury-Norov/bitmap-generalize-node_random/20250609-034657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20250608194536.28130-2-yury.norov%40gmail.com
patch subject: [PATCH 1/3] bitmap: generalize node_random()
config: arm-randconfig-002-20250609 (https://download.01.org/0day-ci/archive/20250609/202506090550.y3ypu2EO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250609/202506090550.y3ypu2EO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506090550.y3ypu2EO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:27:
   In file included from include/linux/bitops.h:29:
   include/asm-generic/bitops/generic-non-atomic.h:140:16: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     140 |         return 1UL & (smp_load_acquire(p) >> (nr & (BITS_PER_LONG-1)));
         |                       ^
   include/asm-generic/barrier.h:204:37: note: expanded from macro 'smp_load_acquire'
     204 |         __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
         |                                            ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/mm.h:2618:9: note: previous attribute is here
    2618 |         return max(mm->hiwater_rss, get_mm_rss(mm));
         |                ^
   include/linux/minmax.h:112:19: note: expanded from macro 'max'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   In file included from crypto/krb5/rfc8009_aes2.c:10:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:79:
   In file included from ./arch/arm/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:27:
   In file included from include/linux/bitops.h:29:
   include/asm-generic/bitops/generic-non-atomic.h:140:16: warning: attribute 'error' is already applied with different arguments [-Wignored-attributes]
     140 |         return 1UL & (smp_load_acquire(p) >> (nr & (BITS_PER_LONG-1)));
         |                       ^
   include/asm-generic/barrier.h:204:37: note: expanded from macro 'smp_load_acquire'
     204 |         __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
         |                                            ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
   include/linux/mm.h:2623:9: note: previous attribute is here
    2623 |         return max(mm->hiwater_vm, mm->total_vm);
         |                ^
   include/linux/minmax.h:112:19: note: expanded from macro 'max'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^
   include/linux/minmax.h:98:2: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^
   include/linux/minmax.h:93:2: note: expanded from macro '__careful_cmp_once'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:565:2: note: expanded from macro 'compiletime_assert'
     565 |         __compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:547:4: note: expanded from macro '__compiletime_assert'
     547 |                         __compiletime_error(msg);                       \
         |                         ^
   include/linux/compiler_attributes.h:138:56: note: expanded from macro '__compiletime_error'
     138 | # define __compiletime_error(msg)       __attribute__((__error__(msg)))
         |                                                        ^
>> crypto/krb5/rfc8009_aes2.c:209:3: error: call to undeclared function 'get_random_bytes'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     209 |                 get_random_bytes(buffer, krb5->conf_len);
         |                 ^
   27 warnings and 1 error generated.


vim +/get_random_bytes +209 crypto/krb5/rfc8009_aes2.c

6c3c0e86c2acf5 David Howells 2025-02-03  167  
6c3c0e86c2acf5 David Howells 2025-02-03  168  /*
6c3c0e86c2acf5 David Howells 2025-02-03  169   * Apply encryption and checksumming functions to a message.  Unlike for
6c3c0e86c2acf5 David Howells 2025-02-03  170   * RFC3961, for RFC8009, we have to chuck the starting IV into the hash first.
6c3c0e86c2acf5 David Howells 2025-02-03  171   */
6c3c0e86c2acf5 David Howells 2025-02-03  172  static ssize_t rfc8009_encrypt(const struct krb5_enctype *krb5,
6c3c0e86c2acf5 David Howells 2025-02-03  173  			       struct crypto_aead *aead,
6c3c0e86c2acf5 David Howells 2025-02-03  174  			       struct scatterlist *sg, unsigned int nr_sg, size_t sg_len,
6c3c0e86c2acf5 David Howells 2025-02-03  175  			       size_t data_offset, size_t data_len,
6c3c0e86c2acf5 David Howells 2025-02-03  176  			       bool preconfounded)
6c3c0e86c2acf5 David Howells 2025-02-03  177  {
6c3c0e86c2acf5 David Howells 2025-02-03  178  	struct aead_request *req;
6c3c0e86c2acf5 David Howells 2025-02-03  179  	struct scatterlist bsg[2];
6c3c0e86c2acf5 David Howells 2025-02-03  180  	ssize_t ret, done;
6c3c0e86c2acf5 David Howells 2025-02-03  181  	size_t bsize, base_len, secure_offset, secure_len, pad_len, cksum_offset;
6c3c0e86c2acf5 David Howells 2025-02-03  182  	void *buffer;
6c3c0e86c2acf5 David Howells 2025-02-03  183  	u8 *iv, *ad;
6c3c0e86c2acf5 David Howells 2025-02-03  184  
6c3c0e86c2acf5 David Howells 2025-02-03  185  	if (WARN_ON(data_offset != krb5->conf_len))
6c3c0e86c2acf5 David Howells 2025-02-03  186  		return -EINVAL; /* Data is in wrong place */
6c3c0e86c2acf5 David Howells 2025-02-03  187  
6c3c0e86c2acf5 David Howells 2025-02-03  188  	secure_offset	= 0;
6c3c0e86c2acf5 David Howells 2025-02-03  189  	base_len	= krb5->conf_len + data_len;
6c3c0e86c2acf5 David Howells 2025-02-03  190  	pad_len		= 0;
6c3c0e86c2acf5 David Howells 2025-02-03  191  	secure_len	= base_len + pad_len;
6c3c0e86c2acf5 David Howells 2025-02-03  192  	cksum_offset	= secure_len;
6c3c0e86c2acf5 David Howells 2025-02-03  193  	if (WARN_ON(cksum_offset + krb5->cksum_len > sg_len))
6c3c0e86c2acf5 David Howells 2025-02-03  194  		return -EFAULT;
6c3c0e86c2acf5 David Howells 2025-02-03  195  
6c3c0e86c2acf5 David Howells 2025-02-03  196  	bsize = krb5_aead_size(aead) +
6c3c0e86c2acf5 David Howells 2025-02-03  197  		krb5_aead_ivsize(aead) * 2;
6c3c0e86c2acf5 David Howells 2025-02-03  198  	buffer = kzalloc(bsize, GFP_NOFS);
6c3c0e86c2acf5 David Howells 2025-02-03  199  	if (!buffer)
6c3c0e86c2acf5 David Howells 2025-02-03  200  		return -ENOMEM;
6c3c0e86c2acf5 David Howells 2025-02-03  201  
6c3c0e86c2acf5 David Howells 2025-02-03  202  	req = buffer;
6c3c0e86c2acf5 David Howells 2025-02-03  203  	iv = buffer + krb5_aead_size(aead);
6c3c0e86c2acf5 David Howells 2025-02-03  204  	ad = buffer + krb5_aead_size(aead) + krb5_aead_ivsize(aead);
6c3c0e86c2acf5 David Howells 2025-02-03  205  
6c3c0e86c2acf5 David Howells 2025-02-03  206  	/* Insert the confounder into the buffer */
6c3c0e86c2acf5 David Howells 2025-02-03  207  	ret = -EFAULT;
6c3c0e86c2acf5 David Howells 2025-02-03  208  	if (!preconfounded) {
6c3c0e86c2acf5 David Howells 2025-02-03 @209  		get_random_bytes(buffer, krb5->conf_len);
6c3c0e86c2acf5 David Howells 2025-02-03  210  		done = sg_pcopy_from_buffer(sg, nr_sg, buffer, krb5->conf_len,
6c3c0e86c2acf5 David Howells 2025-02-03  211  					    secure_offset);
6c3c0e86c2acf5 David Howells 2025-02-03  212  		if (done != krb5->conf_len)
6c3c0e86c2acf5 David Howells 2025-02-03  213  			goto error;
6c3c0e86c2acf5 David Howells 2025-02-03  214  	}
6c3c0e86c2acf5 David Howells 2025-02-03  215  
6c3c0e86c2acf5 David Howells 2025-02-03  216  	/* We may need to pad out to the crypto blocksize. */
6c3c0e86c2acf5 David Howells 2025-02-03  217  	if (pad_len) {
6c3c0e86c2acf5 David Howells 2025-02-03  218  		done = sg_zero_buffer(sg, nr_sg, pad_len, data_offset + data_len);
6c3c0e86c2acf5 David Howells 2025-02-03  219  		if (done != pad_len)
6c3c0e86c2acf5 David Howells 2025-02-03  220  			goto error;
6c3c0e86c2acf5 David Howells 2025-02-03  221  	}
6c3c0e86c2acf5 David Howells 2025-02-03  222  
6c3c0e86c2acf5 David Howells 2025-02-03  223  	/* We need to include the starting IV in the hash. */
6c3c0e86c2acf5 David Howells 2025-02-03  224  	sg_init_table(bsg, 2);
6c3c0e86c2acf5 David Howells 2025-02-03  225  	sg_set_buf(&bsg[0], ad, krb5_aead_ivsize(aead));
6c3c0e86c2acf5 David Howells 2025-02-03  226  	sg_chain(bsg, 2, sg);
6c3c0e86c2acf5 David Howells 2025-02-03  227  
6c3c0e86c2acf5 David Howells 2025-02-03  228  	/* Hash and encrypt the message. */
6c3c0e86c2acf5 David Howells 2025-02-03  229  	aead_request_set_tfm(req, aead);
6c3c0e86c2acf5 David Howells 2025-02-03  230  	aead_request_set_callback(req, 0, NULL, NULL);
6c3c0e86c2acf5 David Howells 2025-02-03  231  	aead_request_set_ad(req, krb5_aead_ivsize(aead));
6c3c0e86c2acf5 David Howells 2025-02-03  232  	aead_request_set_crypt(req, bsg, bsg, secure_len, iv);
6c3c0e86c2acf5 David Howells 2025-02-03  233  	ret = crypto_aead_encrypt(req);
6c3c0e86c2acf5 David Howells 2025-02-03  234  	if (ret < 0)
6c3c0e86c2acf5 David Howells 2025-02-03  235  		goto error;
6c3c0e86c2acf5 David Howells 2025-02-03  236  
6c3c0e86c2acf5 David Howells 2025-02-03  237  	ret = secure_len + krb5->cksum_len;
6c3c0e86c2acf5 David Howells 2025-02-03  238  
6c3c0e86c2acf5 David Howells 2025-02-03  239  error:
6c3c0e86c2acf5 David Howells 2025-02-03  240  	kfree_sensitive(buffer);
6c3c0e86c2acf5 David Howells 2025-02-03  241  	return ret;
6c3c0e86c2acf5 David Howells 2025-02-03  242  }
6c3c0e86c2acf5 David Howells 2025-02-03  243  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
