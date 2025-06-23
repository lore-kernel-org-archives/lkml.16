Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CB72D4B68
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750711400; cv=none; b=qa3LdxndwZBrjg2G9JLg8v04ieqSTDMYfgSfcCruJpULZn+Q95jtoykR69Vz9UegIQqVc5n04zvB3/PQvA32mucplAlytpTgOGYOysvYy/eXyziIdpSE1uVbDKChCo3TIT9KRfHQnG7s1xtvsJcv+O8U6PJ9iJTCVjlvW2jzA4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750711400; c=relaxed/simple;
	bh=6qWV4n/s+Ygofk7+59+ZVlVkXNAfE9cXC/Y/ph37odU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZpsCOMju2WvW2caqqd8vb11BHxv5dJx77TeeYMa/fnBbatKhDfeAIWmrVI+RrTWO48jY8YamO4GQJLT4in6ouvgcgl9ypMy6H1Ayo4g3Ps9Gx6PIZKtWonLkrPc6pEeWR1UxhgL+1DZn/RKR3nvpHvxqFCl0GKiAsp0CgbmemBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXfm0txO; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXfm0txO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750711398; x=1782247398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6qWV4n/s+Ygofk7+59+ZVlVkXNAfE9cXC/Y/ph37odU=;
  b=HXfm0txO5vQ7VYfXh5YGipXL/Bk83WmYm6+Zu3fQdKxSFunbtf5i/2Np
   9TMY1ZOk0LPDx2SCrass1E1CBJ7b+uDeN9nNuPMrge2KFAf2HO57owG+F
   v+fUV7qiBPdypmnXzFt2p8vMtC6+x8aXebNiZbfat3Ey4EC+EXnJd+/xq
   DHxguXaWHWvMHslmd0gUxxs9tMs0VDBg0WRUYpihvHkSGI8satgAlACit
   B3L3IFWd7eDx7lvbGrNyiTVd2pdHHKucoiwNA4LkU0uon8UrP6INNZl0x
   5rp7wcQickABEyiYlIHsoA8LoQcpbw96GNc+3v5eRXuzx43TV/i5OC8ZJ
   Q==;
X-CSE-ConnectionGUID: iuFwHei0R5qJY7gf9LuF8A==
X-CSE-MsgGUID: AiWDIk2FSqGSEF7L08kkzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="40547169"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="40547169"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 13:43:18 -0700
X-CSE-ConnectionGUID: XmGKx6MDQeKWnpxnO3YN/w==
X-CSE-MsgGUID: xD9/NftyS22OUREWbVR8Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; 
   d="scan'208";a="152218073"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Jun 2025 13:43:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTo0X-000PJw-0c;
	Mon, 23 Jun 2025 20:43:13 +0000
Date: Tue, 24 Jun 2025 04:43:01 +0800
From: kernel test robot <lkp@intel.com>
To: Junfeng Guo <junfeng.guo@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Marcin Szycik <marcin.szycik@linux.intel.com>,
	Qi Zhang <qi.z.zhang@intel.com>, Ahmed Zaki <ahmed.zaki@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_parser.c:1231:34: warning: stack
 frame size (1040) exceeds limit (1024) in 'ice_bst_tcam_table_get'
Message-ID: <202506240437.yrXLeKyv-lkp@intel.com>
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
commit: 68add288189a5490868ccf8cbed273320568928d ice: add debugging functions for the parser sections
date:   10 months ago
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250624/202506240437.yrXLeKyv-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240437.yrXLeKyv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240437.yrXLeKyv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/ice/ice_parser.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice_common.h:9:
   In file included from drivers/net/ethernet/intel/ice/ice.h:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/net/ethernet/intel/ice/ice_parser.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice_common.h:9:
   In file included from drivers/net/ethernet/intel/ice/ice.h:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/net/ethernet/intel/ice/ice_parser.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice_common.h:9:
   In file included from drivers/net/ethernet/intel/ice/ice.h:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/net/ethernet/intel/ice/ice_parser.c:1231:34: warning: stack frame size (1040) exceeds limit (1024) in 'ice_bst_tcam_table_get' [-Wframe-larger-than]
    1231 | static struct ice_bst_tcam_item *ice_bst_tcam_table_get(struct ice_hw *hw)
         |                                  ^
   13 warnings generated.


vim +/ice_bst_tcam_table_get +1231 drivers/net/ethernet/intel/ice/ice_parser.c

75b4a938a94778 Junfeng Guo 2024-07-25  1224  
75b4a938a94778 Junfeng Guo 2024-07-25  1225  /**
75b4a938a94778 Junfeng Guo 2024-07-25  1226   * ice_bst_tcam_table_get - create a boost tcam table
75b4a938a94778 Junfeng Guo 2024-07-25  1227   * @hw: pointer to the hardware structure
75b4a938a94778 Junfeng Guo 2024-07-25  1228   *
75b4a938a94778 Junfeng Guo 2024-07-25  1229   * Return: a pointer to the allocated Boost TCAM table.
75b4a938a94778 Junfeng Guo 2024-07-25  1230   */
75b4a938a94778 Junfeng Guo 2024-07-25 @1231  static struct ice_bst_tcam_item *ice_bst_tcam_table_get(struct ice_hw *hw)
75b4a938a94778 Junfeng Guo 2024-07-25  1232  {
75b4a938a94778 Junfeng Guo 2024-07-25  1233  	return ice_parser_create_table(hw, ICE_SID_RXPARSER_BOOST_TCAM,
75b4a938a94778 Junfeng Guo 2024-07-25  1234  				       sizeof(struct ice_bst_tcam_item),
75b4a938a94778 Junfeng Guo 2024-07-25  1235  				       ICE_BST_TCAM_TABLE_SIZE,
75b4a938a94778 Junfeng Guo 2024-07-25  1236  				       ice_bst_parse_item, true);
75b4a938a94778 Junfeng Guo 2024-07-25  1237  }
75b4a938a94778 Junfeng Guo 2024-07-25  1238  

:::::: The code at line 1231 was first introduced by commit
:::::: 75b4a938a947785cdda8908cb700c58e95f8ff69 ice: parse and init various DDP parser sections

:::::: TO: Junfeng Guo <junfeng.guo@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
