Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739D620B7FF
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738602421; cv=none; b=hOqtruV00g3PFrlLNqdR2V/RhPQNY91M1l2I6Vi+5PUxFBd/oMRsdRCbx4tF+D1NCu2JgsHR27q0rEVB7ZM/a+pMs/9JqjJ3VPfyhPq/afODDc0aBuwa755qSVwTyDj2PnIgN81RTrXgxNoyAphBqLzQY33+ZA+dl/45BgS4kj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738602421; c=relaxed/simple;
	bh=EiQB0sYBQAho8pe6u94W/tfr8rXHV1YpEzUOZK+DVUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcjBJELwLuQ1+M5TIsTnh1vL6Z8BDBWT+jjhIwkxx3kuLp0WYUtBwvR+pyZEaxYKX/pGSN+QVYxotuQmz9mArWcybgTybyZKYqlo382SaAj51Lo1gjMbXmPqSXmZpb8GWI3qtM6ATTOmb2IS+6rrQmeZKDEMtnGnqVKsI81Rf0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XmS7OigK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XmS7OigK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738602420; x=1770138420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EiQB0sYBQAho8pe6u94W/tfr8rXHV1YpEzUOZK+DVUo=;
  b=XmS7OigKOJjwjvVfW9H1r0+bOSvjvolLjxxBY+YaT91TLDFDGtdsUt7z
   6ybaJ+NLX7pejtrXT5MQrmiEKZW8QUsAZlXo2vaxIJGnkWRTytpI4pIQD
   1rfkI/mvmADevukQeaUKqDa2bFz870/N6MVbtlecIH/RYOZYghzKi/Bpe
   E7+iF7gszPdCtRQzRXdKzN2nNVF4CYNJHx6tx1KS6VhXnER7HClXSBSwU
   xEQoWMGsQsDjNbxgl5gQdRUFex/p0pLGn7pXAq5rFUpZAOJE8pkhaX0z1
   mP6lepLgzhrVxGeHhWhFn/LNNrsm+ibCo9ftFyY5TQvMjYlAkJtTxrUt+
   g==;
X-CSE-ConnectionGUID: 7Hc7uZEnR2iwZPC0RMAS9g==
X-CSE-MsgGUID: cyWc//a/R82Z1+T1dvfqdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="26706715"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="26706715"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 09:06:57 -0800
X-CSE-ConnectionGUID: ia0Qpw0DQfCrdKcIAo414Q==
X-CSE-MsgGUID: HrHf0u6URWuyOeJPMYIroQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110150579"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2025 09:06:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tezuO-000rE7-0S;
	Mon, 03 Feb 2025 17:06:52 +0000
Date: Tue, 4 Feb 2025 01:06:51 +0800
From: kernel test robot <lkp@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Pasha Bouzarjomehri <pasha@rivosinc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v4] riscv: Add runtime constant support
Message-ID: <202502040018.8DyjnzNe-lkp@intel.com>
References: <20250130-runtime_const_riscv-v4-1-2d36c41b7b9c@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130-runtime_const_riscv-v4-1-2d36c41b7b9c@rivosinc.com>

Hi Charlie,

kernel test robot noticed the following build errors:

[auto build test ERROR on ffd294d346d185b70e28b1a28abe367bbfe53c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins/riscv-Add-runtime-constant-support/20250131-092950
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250130-runtime_const_riscv-v4-1-2d36c41b7b9c%40rivosinc.com
patch subject: [PATCH v4] riscv: Add runtime constant support
config: riscv-randconfig-002-20250203 (https://download.01.org/0day-ci/archive/20250204/202502040018.8DyjnzNe-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040018.8DyjnzNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040018.8DyjnzNe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/dcache.c:38:
   arch/riscv/include/asm/runtime-const.h: In function '__runtime_fixup_ptr':
   arch/riscv/include/asm/runtime-const.h:167:63: warning: right shift count >= width of type [-Wshift-count-overflow]
     167 |                 __runtime_fixup_32(where + 4, where + 12, val >> 32);
         |                                                               ^~
   fs/dcache.c: In function 'd_hash':
   arch/riscv/include/asm/runtime-const.h:13:28: warning: unused variable '__tmp' [-Wunused-variable]
      13 |         typeof(sym) __ret, __tmp;                               \
         |                            ^~~~~
   fs/dcache.c:112:16: note: in expansion of macro 'runtime_const_ptr'
     112 |         return runtime_const_ptr(dentry_hashtable) +
         |                ^~~~~~~~~~~~~~~~~
   fs/dcache.c: Assembler messages:
>> fs/dcache.c:116: Error: illegal operands `addi a0,-0x211'


vim +116 fs/dcache.c

ceb5bdc2d246f6 Nicholas Piggin 2011-01-07  115  
94bdd655caba20 Al Viro         2016-04-15 @116  #define IN_LOOKUP_SHIFT 10
94bdd655caba20 Al Viro         2016-04-15  117  static struct hlist_bl_head in_lookup_hashtable[1 << IN_LOOKUP_SHIFT];
94bdd655caba20 Al Viro         2016-04-15  118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
