Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E34623A0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 18:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744138486; cv=none; b=fqqNcliz9U48lD03s3XEVTIkz9Kbw5ZfeXBqsmpdDtcaJxB73rFbJCqQLLTx3bePPI+qwgnFtSpcNexaIwSxrN48VWkVqKlq/S5PkyD7OLvl92iJjBxu0iTXYXgTSEa3ehwKDzYps3nsQkCTFQtG166W4XvtOtWkSwI++nAN9i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744138486; c=relaxed/simple;
	bh=ywjJEmuZPM1iyGk0mIqblxFAdmgkg6pH6xB0IAfcLqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OI25oiy/YsHEQXYimdHjPbEk60+vxFl7rEJmTMSYaAzU4CRW/CMNAYyntrwRgKJ3K66tY9nL7mQuH1d9ZGLKbAoQ31h+U2KRg/kdHxJrNwTG6fWlxjTyQiCy+8rB47SLh14Mkm0P3IyG4Z3o82+OqEnnTJU0Zp+0YMvrHqSoYnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ntzeOuh0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntzeOuh0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744138485; x=1775674485;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ywjJEmuZPM1iyGk0mIqblxFAdmgkg6pH6xB0IAfcLqU=;
  b=ntzeOuh05i8W6IBwxVHYZgVozsRgeFG1yEUsN+4YSzj3tyUnUih9kV9W
   CFqYNppBtgycku46k9qrUg8OCpUjiTMeNoO8lTYMY49hLUnsj9+XllNAv
   svdfI7wo34pcuLkLlJCT64SeE7Huan4ftJHnKTznZHZqkOSeYGosbQC5R
   4LgS9rEQi50N7+UVv5eGpFrQDunIPlDLzU9IzWb/UiZ9jRQAe5xAJ00Zm
   Wbf1728VeENAhJbuMHnGh1TzFzR6kLq0FmgNNGOYYIuyi0hf3mPs+bsbf
   WqBf1hr88S9+Vls23D9RRr/IXSu7lUpFDclUIwTMkA8r7+q/l2ZTcEIQe
   A==;
X-CSE-ConnectionGUID: cuIBBm4yRrGZhqwgMTLxaA==
X-CSE-MsgGUID: UrHKUvLxRBizE5lzWH1mfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45478259"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="45478259"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 11:54:45 -0700
X-CSE-ConnectionGUID: WHWcMP4qSf2hLvbT7spdLg==
X-CSE-MsgGUID: Jx8N1yOPQwSX29lY0yk2EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="132487510"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Apr 2025 11:54:42 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2E5o-0007tR-2U;
	Tue, 08 Apr 2025 18:54:40 +0000
Date: Wed, 9 Apr 2025 02:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: rust/helpers/io.c:12:10: error: passing 'volatile void *' to
 parameter of type 'void *' discards qualifiers
Message-ID: <202504090231.9MRSDPoU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Danilo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0af2f6be1b4281385b618cb86ad946eded089ac8
commit: ce30d94e6855a4f6dc687f658e63c225fcc1d690 rust: add `io::{Io, IoRaw}` base types
date:   4 months ago
config: um-randconfig-002-20250409 (https://download.01.org/0day-ci/archive/20250409/202504090231.9MRSDPoU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090231.9MRSDPoU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090231.9MRSDPoU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from rust/helpers/helpers.c:17:
>> rust/helpers/io.c:12:10: error: passing 'volatile void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           iounmap(addr);
                   ^~~~
   arch/um/include/asm/io.h:19:42: note: passing argument to parameter 'addr' here
   static inline void iounmap(void __iomem *addr)
                                            ^
   1 error generated.
   make[3]: *** [scripts/Makefile.build:194: rust/helpers/helpers.o] Error 1 shuffle=3926512877
>> rust/helpers/io.c:12:10: error: passing 'volatile void *' to parameter of type 'void *' discards qualifiers [-Wincompatible-pointer-types-discards-qualifiers]
   arch/um/include/asm/io.h:19:42: note: passing argument to parameter 'addr' here
   make[3]: *** [rust/Makefile:330: rust/bindings/bindings_helpers_generated.rs] Error 101 shuffle=3926512877
   make[3]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   make[3]: Target 'rust/' not remade because of errors.
   make[2]: *** [Makefile:1269: prepare] Error 2 shuffle=3926512877
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=3926512877
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=3926512877
   make: Target 'prepare' not remade because of errors.


vim +12 rust/helpers/io.c

     9	
    10	void rust_helper_iounmap(volatile void __iomem *addr)
    11	{
  > 12		iounmap(addr);
    13	}
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
