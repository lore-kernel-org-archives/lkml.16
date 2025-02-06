Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0341F5FA
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 20:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738873036; cv=none; b=eWW98gVVjhED39Wwfy7a2OtqUwLYzn8w5chMUwiR3eD6Hc04OITwlbzCIjZyyaI2rhMl0DtLU/NxSUmuJNbcHAjwH7UoEeuw/Z/E3Aak6j44P+yHDp21VyeQNQeBfueNE09M2HU0UpfJfLSghOtLndHfwTrEKiM35lX0c7o9lq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738873036; c=relaxed/simple;
	bh=RQPvCWsY/BQguRfUzo+fpG8pR53URrLFzf89Pab/HXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kb9vX3fUoPIdPtRej3LICxLUAGhUvjarQ7q0dKQXf/otXA/EgXY5DVrjvZDlKYgoe2WNeHXHRPGydNlg6tNaBUpNNhLgTBpzHOrfxaYJWYK9h4rQ6pMQ0lMx/QdQe1ft/cG6GGxF+W3uOdQB8xp1JNYsogXmXjNnUr/V1q0ClSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtqZIiry; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtqZIiry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738873035; x=1770409035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RQPvCWsY/BQguRfUzo+fpG8pR53URrLFzf89Pab/HXw=;
  b=NtqZIirypvdzdN7f6rtT/gLNn+iG1LOUpjqAoZUONNhj5HTLdW8Xt0Lf
   PQCkJuwhW5UFEhtglEo93RM2uaAq/lk1/FhUjpyVFVAzZrzMNlWga5q2a
   O5CbwCVmXqaabIOIr08E3oFdWS3jT1gKp/jOQ3dONmk382A589CWDIMBa
   964UpMnKU0x4O35yh92y/MDBbpzqVKstdAKttPJ73zE/i/5qHIRNhkUwT
   wqLB2zCkvYRXNCLBzgonnZ5PKjrdFsSWMs/Bcuk2tT8evcWhgevsU++1i
   PHfEbGUe1dEK4sc9TOKimhQCLuULlkrX43+Ssv0HjfcMULIc45Fq7peFc
   w==;
X-CSE-ConnectionGUID: izUKoMXvSJ+0My7alNIqUQ==
X-CSE-MsgGUID: lvYczGx2TlSQ2+yZwVaqHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56916264"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="56916264"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 12:17:15 -0800
X-CSE-ConnectionGUID: 5SEnKldTReuLMMfamp8bEg==
X-CSE-MsgGUID: Yyt/L7V6Ti6BaqvcooCXcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="111515726"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2025 12:17:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg8J8-000xI5-0d;
	Thu, 06 Feb 2025 20:17:06 +0000
Date: Fri, 7 Feb 2025 04:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: undefined reference to `gen_pool_size'
Message-ID: <202502070436.5MKqMPJW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Grygorii,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92514ef226f511f2ca1fb1b8752966097518edc0
commit: 99f629718272974405e8d180d2fa70c03c06d61f net: ethernet: ti: cpsw: drop TI_DAVINCI_CPDMA config option
date:   6 years ago
config: alpha-randconfig-r004-20230123 (https://download.01.org/0day-ci/archive/20250207/202502070436.5MKqMPJW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070436.5MKqMPJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070436.5MKqMPJW-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: warning: arch/alpha/lib/styncpy.o: missing .note.GNU-stack section implies executable stack
   alpha-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   alpha-linux-ld: warning: arch/alpha/lib/styncpy.o: missing .note.GNU-stack section implies executable stack
   alpha-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   alpha-linux-ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   alpha-linux-ld: drivers/net/ethernet/ti/davinci_cpdma.o: in function `cpdma_desc_pool_destroy':
>> (.text+0x34): undefined reference to `gen_pool_size'
>> alpha-linux-ld: (.text+0x38): undefined reference to `gen_pool_size'
>> alpha-linux-ld: (.text+0x48): undefined reference to `gen_pool_avail'
   alpha-linux-ld: (.text+0x50): undefined reference to `gen_pool_avail'
   alpha-linux-ld: (.text+0xb4): undefined reference to `gen_pool_size'
   alpha-linux-ld: (.text+0xb8): undefined reference to `gen_pool_size'
   alpha-linux-ld: (.text+0xc8): undefined reference to `gen_pool_avail'
   alpha-linux-ld: (.text+0xd0): undefined reference to `gen_pool_avail'
   alpha-linux-ld: drivers/net/ethernet/ti/davinci_cpdma.o: in function `cpdma_desc_pool_create.constprop.0':
>> (.text+0x3f4): undefined reference to `devm_gen_pool_create'
>> alpha-linux-ld: (.text+0x428): undefined reference to `devm_gen_pool_create'
   alpha-linux-ld: (.text+0x4a4): undefined reference to `gen_pool_add_virt'
   alpha-linux-ld: (.text+0x4ac): undefined reference to `gen_pool_add_virt'
   alpha-linux-ld: drivers/net/ethernet/ti/davinci_cpdma.o: in function `__cpdma_chan_free':
>> (.text+0x714): undefined reference to `gen_pool_free'
   alpha-linux-ld: (.text+0x71c): undefined reference to `gen_pool_free'
   alpha-linux-ld: drivers/net/ethernet/ti/davinci_cpdma.o: in function `cpdma_chan_submit':
>> (.text+0x1bcc): undefined reference to `gen_pool_alloc'
   alpha-linux-ld: (.text+0x1bd8): undefined reference to `gen_pool_alloc'
   alpha-linux-ld: (.text+0x205c): undefined reference to `gen_pool_free'
   alpha-linux-ld: (.text+0x206c): undefined reference to `gen_pool_free'
   alpha-linux-ld: drivers/net/ethernet/ti/davinci_cpdma.o: in function `cpdma_check_free_tx_desc':
>> (.text+0x20f4): undefined reference to `gen_pool_avail'
   alpha-linux-ld: (.text+0x20f8): undefined reference to `gen_pool_avail'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
