Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5F9284B33;
	Fri, 11 Apr 2025 21:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744406162; cv=none; b=f2gtl2phIyEXcIFxkduMMDr4JT3ck/bmb71PcpZ+Vv691DtMeM3+REbygurA3SucJmWLh/I1jyxlclkjS39cCNMQyWl4EA8k8xxVrngciLZaDEtidalW0fH9Cxzl+UsDCofPCjN0YI+OfkNxXOJM47qIIBhcs4JG6JZCYWyPUQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744406162; c=relaxed/simple;
	bh=2vnAEWZkA42wh2oIp2t/KaSx2CHjm7tWA5x5tdHlG70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfWyNOeT49Fr+9QGizmo8qA+MDpqXsi0oVLAPILsg+u1+d4tTuPJRUH4kwW/JzXOHiyEADqS/09PE8m80Qf9+ItlSRurrPXTan59ToLUukWumqQjHWHAE7gMBvsbrh51PPjIwGmaSsc374wZtpAfTdJ176if0hiNLWK7IzpD3LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VvcJFGQm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VvcJFGQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744406161; x=1775942161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2vnAEWZkA42wh2oIp2t/KaSx2CHjm7tWA5x5tdHlG70=;
  b=VvcJFGQmQ8H0CodMrcXovUSBgJKtf+wBCNNBAxTDM/mYbqcKrHmLTZC/
   nlXfki1G11eUVa51BD5sQYwZCRT4tzs1rP6m/gfkr8raFc6xv+1lqwodC
   JvP12JAK4C5N9Ruaca8tnrgjMusQ6ud+FkEVoySM9AAKB3kIn/sgX6yPp
   t8URurajncv89Jr6crIDJjVNmo0nsmUQ6vXoZVxz5Wd1MIg+D6DHC5EkG
   sjRXXGvoBsjDfgYa0X/kZj8IMv/pZNCIFBjpb984pWPz/Dzx1eh/JES/2
   ZQpNWjlVInIDVBEJoBjY8w4pJah7N/YLTdPh0mxJ2FAuwl6YloDMKsiiB
   A==;
X-CSE-ConnectionGUID: MUs8LDCgTTONAsGIYtF/EQ==
X-CSE-MsgGUID: Gc0gBUKyS7a/TUSZvPhhxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45858068"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="45858068"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:16:01 -0700
X-CSE-ConnectionGUID: cx2nNfxiSY+MhvwZfP+VeA==
X-CSE-MsgGUID: Q2dsqUdWQtqq92q2eTODlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="129150774"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Apr 2025 14:15:56 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3Lj7-000BNy-2s;
	Fri, 11 Apr 2025 21:15:53 +0000
Date: Sat, 12 Apr 2025 05:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <superm1@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"(maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT))" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 2/4] i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR
 definition to amd_node.h
Message-ID: <202504120432.0F8lOF3k-lkp@intel.com>
References: <20250410200202.2974062-3-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410200202.2974062-3-superm1@kernel.org>

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on andi-shyti/i2c/i2c-host tip/master linus/master v6.15-rc1 next-20250411]
[cannot apply to bp/for-next tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/Documentation-Add-AMD-Zen-debugging-document/20250411-040641
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250410200202.2974062-3-superm1%40kernel.org
patch subject: [PATCH v3 2/4] i2c: piix4: Move SB800_PIIX4_FCH_PM_ADDR definition to amd_node.h
config: arm-randconfig-001-20250412 (https://download.01.org/0day-ci/archive/20250412/202504120432.0F8lOF3k-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504120432.0F8lOF3k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504120432.0F8lOF3k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-piix4.c:24:10: fatal error: 'asm/amd_node.h' file not found
      24 | #include <asm/amd_node.h>
         |          ^~~~~~~~~~~~~~~~
   1 error generated.


vim +24 drivers/i2c/busses/i2c-piix4.c

    23	
  > 24	#include <asm/amd_node.h>
    25	#include <linux/module.h>
    26	#include <linux/moduleparam.h>
    27	#include <linux/pci.h>
    28	#include <linux/kernel.h>
    29	#include <linux/delay.h>
    30	#include <linux/stddef.h>
    31	#include <linux/ioport.h>
    32	#include <linux/i2c.h>
    33	#include <linux/i2c-smbus.h>
    34	#include <linux/slab.h>
    35	#include <linux/dmi.h>
    36	#include <linux/acpi.h>
    37	#include <linux/io.h>
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
