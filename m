Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE2B239594
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865341; cv=none; b=Rfw23MPQiDnSVuhRrCqGcS/EVrorDuJFK9rjMmiizqStGivoZ/qQc2Sk/97KJFmCCqzCTMFySE2MuFyTqVq7QEzDvnz3c+/5nm9KAGIRv+hVqjpla/ZSFfVC1z8jV55iIwXHYOs6k1173IRIU39or96gobtNw8B4QsYIHTcy4DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865341; c=relaxed/simple;
	bh=jU49GE7Yn2DEFUqNRySP50xZXS2Z53qmTlH3NhEhr1s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z6cGfO2Pgzj2FkK+tKw8bRv16UOvF8R3vPCbFpL0lqGW/wNefJptoeY/13a2XIzZYcHP/IaiL7A44uQggC4a83GDPfh1jMHE2S2Bu5Mfeeewyapr1KNCbBMNPp4qki55kcD8hYHMnHE/8vS/yZV6uf9LMwEU7T3aPEh1E1zwt9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JO7ctGrD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JO7ctGrD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738865339; x=1770401339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jU49GE7Yn2DEFUqNRySP50xZXS2Z53qmTlH3NhEhr1s=;
  b=JO7ctGrD4CMorAqB6q2Y353pyETjqLnObjfSlv3kNqRpCJC2w8i6XM/d
   pjb5IsVQ7VDzixYsoiAkOuPMbf+piZU0/+m+thyghgTylApE0KtUqa9jY
   dqexrOiVvEQ0T/nAlB9uXKnnNmF/3Y2a69Q25Q5rC4RSB1dc7OvwKiy7Q
   8bFtiKNTXlJUKUW7SBHvwsDBPRKjEW5HvInOjIJjkJ73C6GaYpSFp8B2n
   3+5lzk2JS12vOa77+34o8WoiGmYKZf0JOeJQ1W8AvGFwg36W/fLLbYJV3
   I7s8IVIr/JyyrBHK4dmL8887gliYKY1C+I3CWNmH2qYxfLq+VHHrdohGV
   g==;
X-CSE-ConnectionGUID: ns6GpTuYSmmeB+0ihofq0A==
X-CSE-MsgGUID: D+JY57kRQteOSPQT5BM4qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39379686"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="39379686"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 10:08:58 -0800
X-CSE-ConnectionGUID: CMgp6YGjTyqTHJ6Zf+jttw==
X-CSE-MsgGUID: o0E1v7aTQjmMEFlSz7OObg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148501157"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Feb 2025 10:08:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg6J4-000xBB-0I;
	Thu, 06 Feb 2025 18:08:54 +0000
Date: Fri, 7 Feb 2025 02:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250203 16/16]
 include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct
 mlx5_ifc_menu_resource_dump_response_bits'
Message-ID: <202502070233.NyU0027S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250203
head:   c8a61127eedf61fcbf8d3f34301d29a782b9eeb0
commit: c8a61127eedf61fcbf8d3f34301d29a782b9eeb0 [16/16] net/mlx5: Avoid a couple hundred -Wflex-array-member-not-at-end warnings
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250207/202502070233.NyU0027S-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070233.NyU0027S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070233.NyU0027S-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from arch/s390/include/asm/rwonce.h:29,
                    from include/linux/compiler.h:338,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from include/linux/mlx5/driver.h:36,
                    from include/linux/mlx5/rsc_dump.h:4,
                    from drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:7,
                    from drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:4:
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c: In function 'mlx5_rsc_dump_read_menu_sgmt':
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct mlx5_ifc_menu_resource_dump_response_bits'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:52:35: note: in expansion of macro 'offsetof'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^~~~~~~~
   include/linux/mlx5/device.h:70:34: note: in expansion of macro '__mlx5_bit_off'
      70 | #define MLX5_BYTE_OFF(typ, fld) (__mlx5_bit_off(typ, fld) / 8)
         |                                  ^~~~~~~~~~~~~~
   include/linux/mlx5/device.h:71:57: note: in expansion of macro 'MLX5_BYTE_OFF'
      71 | #define MLX5_ADDR_OF(typ, p, fld) ((void *)((u8 *)(p) + MLX5_BYTE_OFF(typ, fld)))
         |                                                         ^~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:71:24: note: in expansion of macro 'MLX5_ADDR_OF'
      71 |                 menu = MLX5_ADDR_OF(menu_resource_dump_response, data, menu);
         |                        ^~~~~~~~~~~~
   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/s390/include/uapi/asm/byteorder.h:5,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/s390/include/asm/bitops.h:243,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:23:
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct mlx5_ifc_resource_dump_menu_segment_bits'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:41:51: note: in definition of macro '__be32_to_cpu'
      41 | #define __be32_to_cpu(x) ((__force __u32)(__be32)(x))
         |                                                   ^
   include/linux/mlx5/device.h:52:35: note: in expansion of macro 'offsetof'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^~~~~~~~
   include/linux/mlx5/device.h:54:34: note: in expansion of macro '__mlx5_bit_off'
      54 | #define __mlx5_dw_off(typ, fld) (__mlx5_bit_off(typ, fld) / 32)
         |                                  ^~~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:1: note: in expansion of macro '__mlx5_dw_off'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         | ^~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:72:50: note: in expansion of macro 'MLX5_GET'
      72 |                 rsc_dump->number_of_menu_items = MLX5_GET(resource_dump_menu_segment, menu,
         |                                                  ^~~~~~~~
   In file included from include/linux/mlx5/driver.h:53:
>> include/linux/mlx5/device.h:51:57: error: invalid use of undefined type 'struct mlx5_ifc_resource_dump_menu_segment_bits'
      51 | #define __mlx5_bit_sz(typ, fld) sizeof(__mlx5_nullp(typ)->fld)
         |                                                         ^~
   include/linux/mlx5/device.h:57:43: note: in expansion of macro '__mlx5_bit_sz'
      57 | #define __mlx5_dw_bit_off(typ, fld) (32 - __mlx5_bit_sz(typ, fld) - (__mlx5_bit_off(typ, fld) & 0x1f))
         |                                           ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:30: note: in expansion of macro '__mlx5_dw_bit_off'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         |                              ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:72:50: note: in expansion of macro 'MLX5_GET'
      72 |                 rsc_dump->number_of_menu_items = MLX5_GET(resource_dump_menu_segment, menu,
         |                                                  ^~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct mlx5_ifc_resource_dump_menu_segment_bits'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:52:35: note: in expansion of macro 'offsetof'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^~~~~~~~
   include/linux/mlx5/device.h:57:70: note: in expansion of macro '__mlx5_bit_off'
      57 | #define __mlx5_dw_bit_off(typ, fld) (32 - __mlx5_bit_sz(typ, fld) - (__mlx5_bit_off(typ, fld) & 0x1f))
         |                                                                      ^~~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:30: note: in expansion of macro '__mlx5_dw_bit_off'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         |                              ^~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:72:50: note: in expansion of macro 'MLX5_GET'
      72 |                 rsc_dump->number_of_menu_items = MLX5_GET(resource_dump_menu_segment, menu,
         |                                                  ^~~~~~~~
>> include/linux/mlx5/device.h:51:57: error: invalid use of undefined type 'struct mlx5_ifc_resource_dump_menu_segment_bits'
      51 | #define __mlx5_bit_sz(typ, fld) sizeof(__mlx5_nullp(typ)->fld)
         |                                                         ^~
   include/linux/mlx5/device.h:58:47: note: in expansion of macro '__mlx5_bit_sz'
      58 | #define __mlx5_mask(typ, fld) ((u32)((1ull << __mlx5_bit_sz(typ, fld)) - 1))
         |                                               ^~~~~~~~~~~~~
   include/linux/mlx5/device.h:98:1: note: in expansion of macro '__mlx5_mask'
      98 | __mlx5_mask(typ, fld))
         | ^~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:72:50: note: in expansion of macro 'MLX5_GET'
      72 |                 rsc_dump->number_of_menu_items = MLX5_GET(resource_dump_menu_segment, menu,
         |                                                  ^~~~~~~~
>> include/linux/mlx5/device.h:65:39: error: invalid application of 'sizeof' to incomplete type 'struct mlx5_ifc_resource_dump_info_segment_bits'
      65 | #define MLX5_ST_SZ_BYTES(typ) (sizeof(struct mlx5_ifc_##typ##_bits) / 8)
         |                                       ^~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:54:41: note: in expansion of macro 'MLX5_ST_SZ_BYTES'
      54 | #define MLX5_RSC_DUMP_MENU_HEADER_SIZE (MLX5_ST_SZ_BYTES(resource_dump_info_segment) + \
         |                                         ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:74:24: note: in expansion of macro 'MLX5_RSC_DUMP_MENU_HEADER_SIZE'
      74 |                 size = MLX5_RSC_DUMP_MENU_HEADER_SIZE;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/mlx5/device.h:65:39: error: invalid application of 'sizeof' to incomplete type 'struct mlx5_ifc_resource_dump_command_segment_bits'
      65 | #define MLX5_ST_SZ_BYTES(typ) (sizeof(struct mlx5_ifc_##typ##_bits) / 8)
         |                                       ^~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:55:41: note: in expansion of macro 'MLX5_ST_SZ_BYTES'
      55 |                                         MLX5_ST_SZ_BYTES(resource_dump_command_segment) + \
         |                                         ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:74:24: note: in expansion of macro 'MLX5_RSC_DUMP_MENU_HEADER_SIZE'
      74 |                 size = MLX5_RSC_DUMP_MENU_HEADER_SIZE;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/mlx5/device.h:65:39: error: invalid application of 'sizeof' to incomplete type 'struct mlx5_ifc_resource_dump_menu_segment_bits'
      65 | #define MLX5_ST_SZ_BYTES(typ) (sizeof(struct mlx5_ifc_##typ##_bits) / 8)
         |                                       ^~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:56:41: note: in expansion of macro 'MLX5_ST_SZ_BYTES'
      56 |                                         MLX5_ST_SZ_BYTES(resource_dump_menu_segment))
         |                                         ^~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:74:24: note: in expansion of macro 'MLX5_RSC_DUMP_MENU_HEADER_SIZE'
      74 |                 size = MLX5_RSC_DUMP_MENU_HEADER_SIZE;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +16 include/linux/stddef.h

6e218287432472 Richard Knutsson 2006-09-30  14  
^1da177e4c3f41 Linus Torvalds   2005-04-16  15  #undef offsetof
14e83077d55ff4 Rasmus Villemoes 2022-03-23 @16  #define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)
3876488444e712 Denys Vlasenko   2015-03-09  17  

:::::: The code at line 16 was first introduced by commit
:::::: 14e83077d55ff4b88fe39f5e98fb8230c2ccb4fb include: drop pointless __compiler_offsetof indirection

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
