Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1519A22C35C;
	Fri,  2 May 2025 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180472; cv=none; b=aOz3jN0+wxSSMEm1OjXkaLSEbMXRHoKD1V5905VG75/PKO0YYPQkPe663cLWhHrVnSMqszODiKXrXQgg7Xm3XDOUizODGy/BKTYmXsmIEfcFF0ufpK6nA6L8h33yZHFSsSIAXPBtLLxZKV8l5nBuVyJNen/6JnkXyTs+BplZTBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180472; c=relaxed/simple;
	bh=e8/ynrXSAkfoRLP48zbKeDqIR8w4XEaL0sjJOL1EGrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZ1q85lJKmXyi1nxBAjKTxL9RYurkq6199t5Z1rD+yNJtfyaczHyJOjad7WTwUtk1bJCQptdJymPz6Zom/8pmHk1I7O5bes1dR2ivSPlVzyusJvDU/ueFv4iaDge+wqoAq0x5l6kEHhGd+lOLXC4yZ1gPUPEW+8NmPtNNwJNzgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHVGh1vr; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHVGh1vr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746180471; x=1777716471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e8/ynrXSAkfoRLP48zbKeDqIR8w4XEaL0sjJOL1EGrc=;
  b=nHVGh1vrYNklF81yK9S+e2vLmGLUdjzFZv2uEUGorLc87wtMtOgKLAd8
   aW8hxwMzcVp19cKFz9z/yiFCsFdIKPkoFBjTauqRu9qnB6C3hKSXMgZZx
   QQGqPnePMWlkAhkBOVYTXl5nifiJEDQCjZSd8bD9IwBK/JhRAYuxzMcJ5
   OpdP3z9oRDZo3Ds6/fyBawF3MrTkvF0AHd+EXWTjhFjGqflXsf6GJXC0s
   uRzcM5iyudegYA/aX2j3RTAiS2xAXLnlt49czSaA9y9/LmJhxjV/hMSh7
   lubqoW5HBiyIFZm56siJLDxI9qU/HHtAsS2dv7reSOUJpEignaHoT4Zsj
   w==;
X-CSE-ConnectionGUID: /I4Hjn47T3u8uo/LiBjd5g==
X-CSE-MsgGUID: ZYTdp/ADRy2FVTulWWqWxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47119327"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47119327"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 03:07:50 -0700
X-CSE-ConnectionGUID: daTlk9jhQiGMA7sg/MUotw==
X-CSE-MsgGUID: dhWxgGsLT2+k10nN15ebJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135131130"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 May 2025 03:07:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAnJ2-0004ft-1r;
	Fri, 02 May 2025 10:07:44 +0000
Date: Fri, 2 May 2025 18:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: Paresh Bhagat <p-bhagat@ti.com>, nm@ti.com, vigneshr@ti.com,
	praneeth@ti.com
Cc: oe-kbuild-all@lists.linux.dev, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, khasim@ti.com, v-singh1@ti.com,
	afd@ti.com
Subject: Re: [PATCH 3/3] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <202505021704.jOlZOXSq-lkp@intel.com>
References: <20250501072923.1262414-4-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501072923.1262414-4-p-bhagat@ti.com>

Hi Paresh,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc4 next-20250501]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paresh-Bhagat/dt-bindings-arm-ti-Add-bindings-for-AM62D2-SoC/20250501-153150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250501072923.1262414-4-p-bhagat%40ti.com
patch subject: [PATCH 3/3] arm64: dts: ti: Add support for AM62D2-EVM
config: arm64-randconfig-053-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021704.jOlZOXSq-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021704.jOlZOXSq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021704.jOlZOXSq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:15:10: fatal error: 'k3-timesync-router.h' file not found
      15 | #include "k3-timesync-router.h"
         |          ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +15 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts

    14	
  > 15	#include "k3-timesync-router.h"
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
