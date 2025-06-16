Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1902A28DB3;
	Mon, 16 Jun 2025 07:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059095; cv=none; b=r9MIf4MIJcBsy9iMt87eweQFEDR3RcNtM4H6bjvIcz4iq2Vr0zi0wK5nQzH9waThMoo4B8gu0BIOaG9JesUUHVJJ7ocwDX0c4z11FKaZT3qqCPUMbMlYXtpmHKKv3qP5GF9SZh/nS2KhcU+s5e442u8ypiAxrRA34TZGcKY8U+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059095; c=relaxed/simple;
	bh=CC2u6t8b2P27zNjKytlH9ljQiyUGr9cS7LkfcKVQLrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gzt92mDxckDQImDccIY4Bi3IJTUfb14HepHLDFPEg0BtM3iW5WDADw4vbgjnYYGqgTA9wLvjdAjutx4gLC9I1kizJ1RpJH7KTheRT3Bqfup+Bc19ua3ldCvYNUvGrW1lYyKLLQfzFqn4ksV7lHxwa6FKC5H7wKw4dVYK9ws/n6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeNopabm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeNopabm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750059094; x=1781595094;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CC2u6t8b2P27zNjKytlH9ljQiyUGr9cS7LkfcKVQLrI=;
  b=SeNopabmqOxK5p/zKuHftEZ8bPrGbBYup5ZskOZlEtUeidrJe4nEV3Dm
   B2W5t5O+tyYCT4yolh1JANFjYxQlVc7BBxbFvtn3yGBwv6tJAigTiFsQw
   0n/Pj5+W2BoLXIY8pzJfToZIML7WzMG3QrZNLcAL6UigCF+Whs2FIEvl1
   Ucfnb7EnofoYpxkjaW1B00t7MYwJQRxKTTzgA5N1bUFlwN5906LkqsrK6
   SqSfht0DsEc6HFKRe4lYecqRuC1T+JrQIFX2OW4aJj72RntdWsYlmIiUd
   l6RGM7VEjrMnT6HesW9MZrXq6j7hdvmabKPZjFiOMm1UnCcLbCTfa0y5B
   w==;
X-CSE-ConnectionGUID: 9P1gil6FRRmuD97Sc0nrOg==
X-CSE-MsgGUID: Fkr5Q5MPRPKcTRI6cOssOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52063957"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="52063957"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 00:31:32 -0700
X-CSE-ConnectionGUID: 2R1HK90pTPyR8ptpWi9rJA==
X-CSE-MsgGUID: lFzR4X3TSY+XV4s9MRfJHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="171614010"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jun 2025 00:31:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR4JT-000EpQ-0u;
	Mon, 16 Jun 2025 07:31:27 +0000
Date: Mon, 16 Jun 2025 15:30:57 +0800
From: kernel test robot <lkp@intel.com>
To: Yunshui Jiang <jiangyunshui@kylinos.cn>, alexander.deucher@amd.com,
	chriistian.koenig@amd.com
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yunshui Jiang <jiangyunshui@kylinos.cn>
Subject: Re: [PATCH] drm/amdgpu: use kmalloc_array() instead of kmalloc()
Message-ID: <202506161547.VMAIYY21-lkp@intel.com>
References: <20250616025559.2766331-1-jiangyunshui@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616025559.2766331-1-jiangyunshui@kylinos.cn>

Hi Yunshui,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc2 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunshui-Jiang/drm-amdgpu-use-kmalloc_array-instead-of-kmalloc/20250616-105830
base:   linus/master
patch link:    https://lore.kernel.org/r/20250616025559.2766331-1-jiangyunshui%40kylinos.cn
patch subject: [PATCH] drm/amdgpu: use kmalloc_array() instead of kmalloc()
config: arm64-randconfig-002-20250616 (https://download.01.org/0day-ci/archive/20250616/202506161547.VMAIYY21-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506161547.VMAIYY21-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506161547.VMAIYY21-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from arch/arm64/include/asm/arch_timer.h:18,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/fs.h:11,
                    from include/linux/debugfs.h:15,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:24:
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c: In function 'amdgpu_ras_realloc_eh_data_space':
>> include/linux/slab.h:911:61: error: too many arguments to function 'kmalloc_noprof'; expected 2, have 3
     911 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                             ^~~~~~~~~~~~~~
   include/linux/alloc_tag.h:239:16: note: in definition of macro 'alloc_hooks_tag'
     239 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:911:49: note: in expansion of macro 'alloc_hooks'
     911 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2722:21: note: in expansion of macro 'kmalloc'
    2722 |         void *bps = kmalloc(align_space, sizeof(*data->bps), GFP_KERNEL);
         |                     ^~~~~~~
   In file included from include/linux/fs.h:46:
   include/linux/slab.h:896:46: note: declared here
     896 | static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
         |                                              ^~~~~~~~~~~~~~
>> include/linux/slab.h:911:61: error: too many arguments to function 'kmalloc_noprof'; expected 2, have 3
     911 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                             ^~~~~~~~~~~~~~
   include/linux/alloc_tag.h:243:24: note: in definition of macro 'alloc_hooks_tag'
     243 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:911:49: note: in expansion of macro 'alloc_hooks'
     911 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2722:21: note: in expansion of macro 'kmalloc'
    2722 |         void *bps = kmalloc(align_space, sizeof(*data->bps), GFP_KERNEL);
         |                     ^~~~~~~
   include/linux/slab.h:896:46: note: declared here
     896 | static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
         |                                              ^~~~~~~~~~~~~~
>> include/linux/slab.h:911:61: error: too many arguments to function 'kmalloc_noprof'; expected 2, have 3
     911 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                             ^~~~~~~~~~~~~~
   include/linux/alloc_tag.h:246:24: note: in definition of macro 'alloc_hooks_tag'
     246 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:911:49: note: in expansion of macro 'alloc_hooks'
     911 | #define kmalloc(...)                            alloc_hooks(kmalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2722:21: note: in expansion of macro 'kmalloc'
    2722 |         void *bps = kmalloc(align_space, sizeof(*data->bps), GFP_KERNEL);
         |                     ^~~~~~~
   include/linux/slab.h:896:46: note: declared here
     896 | static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
         |                                              ^~~~~~~~~~~~~~


vim +/kmalloc_noprof +911 include/linux/slab.h

67f2df3b82d091 Kees Cook             2024-07-01  815  
a0a44d9175b349 Vlastimil Babka       2024-05-27  816  /*
a0a44d9175b349 Vlastimil Babka       2024-05-27  817   * The following functions are not to be used directly and are intended only
a0a44d9175b349 Vlastimil Babka       2024-05-27  818   * for internal use from kmalloc() and kmalloc_node()
a0a44d9175b349 Vlastimil Babka       2024-05-27  819   * with the exception of kunit tests
a0a44d9175b349 Vlastimil Babka       2024-05-27  820   */
a0a44d9175b349 Vlastimil Babka       2024-05-27  821  
a0a44d9175b349 Vlastimil Babka       2024-05-27  822  void *__kmalloc_noprof(size_t size, gfp_t flags)
a0a44d9175b349 Vlastimil Babka       2024-05-27  823  				__assume_kmalloc_alignment __alloc_size(1);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  824  
67f2df3b82d091 Kees Cook             2024-07-01  825  void *__kmalloc_node_noprof(DECL_BUCKET_PARAMS(size, b), gfp_t flags, int node)
a0a44d9175b349 Vlastimil Babka       2024-05-27  826  				__assume_kmalloc_alignment __alloc_size(1);
a0a44d9175b349 Vlastimil Babka       2024-05-27  827  
a0a44d9175b349 Vlastimil Babka       2024-05-27  828  void *__kmalloc_cache_noprof(struct kmem_cache *s, gfp_t flags, size_t size)
a0a44d9175b349 Vlastimil Babka       2024-05-27  829  				__assume_kmalloc_alignment __alloc_size(3);
7bd230a26648ac Suren Baghdasaryan    2024-03-21  830  
a0a44d9175b349 Vlastimil Babka       2024-05-27  831  void *__kmalloc_cache_node_noprof(struct kmem_cache *s, gfp_t gfpflags,
a0a44d9175b349 Vlastimil Babka       2024-05-27  832  				  int node, size_t size)
a0a44d9175b349 Vlastimil Babka       2024-05-27  833  				__assume_kmalloc_alignment __alloc_size(4);
7bd230a26648ac Suren Baghdasaryan    2024-03-21  834  
a0a44d9175b349 Vlastimil Babka       2024-05-27  835  void *__kmalloc_large_noprof(size_t size, gfp_t flags)
a0a44d9175b349 Vlastimil Babka       2024-05-27  836  				__assume_page_alignment __alloc_size(1);
a0c3b940023eef Harry Yoo             2022-08-17  837  
a0a44d9175b349 Vlastimil Babka       2024-05-27  838  void *__kmalloc_large_node_noprof(size_t size, gfp_t flags, int node)
a0a44d9175b349 Vlastimil Babka       2024-05-27  839  				__assume_page_alignment __alloc_size(1);
a0c3b940023eef Harry Yoo             2022-08-17  840  
f1b6eb6e6be149 Christoph Lameter     2013-09-04  841  /**
838de63b101147 Vlastimil Babka       2022-11-10  842   * kmalloc - allocate kernel memory
f1b6eb6e6be149 Christoph Lameter     2013-09-04  843   * @size: how many bytes of memory are required.
838de63b101147 Vlastimil Babka       2022-11-10  844   * @flags: describe the allocation context
f1b6eb6e6be149 Christoph Lameter     2013-09-04  845   *
f1b6eb6e6be149 Christoph Lameter     2013-09-04  846   * kmalloc is the normal method of allocating memory
f1b6eb6e6be149 Christoph Lameter     2013-09-04  847   * for objects smaller than page size in the kernel.
7e3528c3660a2e Randy Dunlap          2013-11-22  848   *
59bb47985c1db2 Vlastimil Babka       2019-10-06  849   * The allocated object address is aligned to at least ARCH_KMALLOC_MINALIGN
59bb47985c1db2 Vlastimil Babka       2019-10-06  850   * bytes. For @size of power of two bytes, the alignment is also guaranteed
ad59baa3169591 Vlastimil Babka       2024-07-03  851   * to be at least to the size. For other sizes, the alignment is guaranteed to
ad59baa3169591 Vlastimil Babka       2024-07-03  852   * be at least the largest power-of-two divisor of @size.
59bb47985c1db2 Vlastimil Babka       2019-10-06  853   *
01598ba6b1a863 Mike Rapoport         2018-11-11  854   * The @flags argument may be one of the GFP flags defined at
e9d198f2be851f Thorsten Scherer      2023-03-12  855   * include/linux/gfp_types.h and described at
01598ba6b1a863 Mike Rapoport         2018-11-11  856   * :ref:`Documentation/core-api/mm-api.rst <mm-api-gfp-flags>`
7e3528c3660a2e Randy Dunlap          2013-11-22  857   *
01598ba6b1a863 Mike Rapoport         2018-11-11  858   * The recommended usage of the @flags is described at
2370ae4b1d5aa7 Mauro Carvalho Chehab 2020-04-10  859   * :ref:`Documentation/core-api/memory-allocation.rst <memory_allocation>`
7e3528c3660a2e Randy Dunlap          2013-11-22  860   *
01598ba6b1a863 Mike Rapoport         2018-11-11  861   * Below is a brief outline of the most useful GFP flags
7e3528c3660a2e Randy Dunlap          2013-11-22  862   *
01598ba6b1a863 Mike Rapoport         2018-11-11  863   * %GFP_KERNEL
01598ba6b1a863 Mike Rapoport         2018-11-11  864   *	Allocate normal kernel ram. May sleep.
7e3528c3660a2e Randy Dunlap          2013-11-22  865   *
01598ba6b1a863 Mike Rapoport         2018-11-11  866   * %GFP_NOWAIT
01598ba6b1a863 Mike Rapoport         2018-11-11  867   *	Allocation will not sleep.
7e3528c3660a2e Randy Dunlap          2013-11-22  868   *
01598ba6b1a863 Mike Rapoport         2018-11-11  869   * %GFP_ATOMIC
01598ba6b1a863 Mike Rapoport         2018-11-11  870   *	Allocation will not sleep.  May use emergency pools.
7e3528c3660a2e Randy Dunlap          2013-11-22  871   *
7e3528c3660a2e Randy Dunlap          2013-11-22  872   * Also it is possible to set different flags by OR'ing
7e3528c3660a2e Randy Dunlap          2013-11-22  873   * in one or more of the following additional @flags:
7e3528c3660a2e Randy Dunlap          2013-11-22  874   *
838de63b101147 Vlastimil Babka       2022-11-10  875   * %__GFP_ZERO
838de63b101147 Vlastimil Babka       2022-11-10  876   *	Zero the allocated memory before returning. Also see kzalloc().
838de63b101147 Vlastimil Babka       2022-11-10  877   *
01598ba6b1a863 Mike Rapoport         2018-11-11  878   * %__GFP_HIGH
01598ba6b1a863 Mike Rapoport         2018-11-11  879   *	This allocation has high priority and may use emergency pools.
7e3528c3660a2e Randy Dunlap          2013-11-22  880   *
01598ba6b1a863 Mike Rapoport         2018-11-11  881   * %__GFP_NOFAIL
01598ba6b1a863 Mike Rapoport         2018-11-11  882   *	Indicate that this allocation is in no way allowed to fail
7e3528c3660a2e Randy Dunlap          2013-11-22  883   *	(think twice before using).
7e3528c3660a2e Randy Dunlap          2013-11-22  884   *
01598ba6b1a863 Mike Rapoport         2018-11-11  885   * %__GFP_NORETRY
01598ba6b1a863 Mike Rapoport         2018-11-11  886   *	If memory is not immediately available,
7e3528c3660a2e Randy Dunlap          2013-11-22  887   *	then give up at once.
7e3528c3660a2e Randy Dunlap          2013-11-22  888   *
01598ba6b1a863 Mike Rapoport         2018-11-11  889   * %__GFP_NOWARN
01598ba6b1a863 Mike Rapoport         2018-11-11  890   *	If allocation fails, don't issue any warnings.
7e3528c3660a2e Randy Dunlap          2013-11-22  891   *
01598ba6b1a863 Mike Rapoport         2018-11-11  892   * %__GFP_RETRY_MAYFAIL
01598ba6b1a863 Mike Rapoport         2018-11-11  893   *	Try really hard to succeed the allocation but fail
dcda9b04713c3f Michal Hocko          2017-07-12  894   *	eventually.
f1b6eb6e6be149 Christoph Lameter     2013-09-04  895   */
7bd230a26648ac Suren Baghdasaryan    2024-03-21  896  static __always_inline __alloc_size(1) void *kmalloc_noprof(size_t size, gfp_t flags)
f1b6eb6e6be149 Christoph Lameter     2013-09-04  897  {
6fa57d78aa7f21 Kees Cook             2022-11-17  898  	if (__builtin_constant_p(size) && size) {
cc252eae85e095 Vlastimil Babka       2018-10-26  899  		unsigned int index;
3bf019334fbbb5 Kees Cook             2022-11-17  900  
f1b6eb6e6be149 Christoph Lameter     2013-09-04  901  		if (size > KMALLOC_MAX_CACHE_SIZE)
a0a44d9175b349 Vlastimil Babka       2024-05-27  902  			return __kmalloc_large_noprof(size, flags);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  903  
cc252eae85e095 Vlastimil Babka       2018-10-26  904  		index = kmalloc_index(size);
a0a44d9175b349 Vlastimil Babka       2024-05-27  905  		return __kmalloc_cache_noprof(
3c615294058429 GONG, Ruiqi           2023-07-14  906  				kmalloc_caches[kmalloc_type(flags, _RET_IP_)][index],
f1b6eb6e6be149 Christoph Lameter     2013-09-04  907  				flags, size);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  908  	}
7bd230a26648ac Suren Baghdasaryan    2024-03-21  909  	return __kmalloc_noprof(size, flags);
f1b6eb6e6be149 Christoph Lameter     2013-09-04  910  }
7bd230a26648ac Suren Baghdasaryan    2024-03-21 @911  #define kmalloc(...)				alloc_hooks(kmalloc_noprof(__VA_ARGS__))
ce6a50263d4dde Christoph Lameter     2013-01-10  912  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
