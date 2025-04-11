Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BF029614E;
	Fri, 11 Apr 2025 21:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744408625; cv=none; b=Byue7GwopnlPPB4rrTyWWC0OWhmNiCoH2jSWhy3DW4gl5bEMnws4ZexPEUfgfLLIFSM1DSUiDC9STSUtw8K0grjP27eILBL5JPshEXtmOjNZaIM9t056FabpgQngQojKOB8ZBjrc8wEjVT9VM/YfJGNodPfQIaj8Z6kSx0mDrtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744408625; c=relaxed/simple;
	bh=9lqL6w8ioJBIb400JDr1aMOA+gQyuzdy50q+tNYdS9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lb34KiPOu/inX1x1/TEs8Zm2Ebr+yjyEYPBBcmEY/9gsiIjxxMALExTWW9rK3CjjeT2gsMoUGhWQm6k1fAAfubsIfXs4OYmmmCGwzD7iFm///34kev6B/T8H6Qt0D0Uk6MQYaVX+RnD2l6aYzmFf7EZCKNP3nJNsLbrVELNhpd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9J451W6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9J451W6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744408624; x=1775944624;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9lqL6w8ioJBIb400JDr1aMOA+gQyuzdy50q+tNYdS9s=;
  b=K9J451W6bxM2Uxmu05u+SGuUkLFmrBZuiG1ms+PElP6/gQSroVcXZ23/
   2Ug+fqrPxDMmpl2VtB2oVsgICUhmUeps4Qax3DbFyp82nCUAg/STMz1ux
   nCIAw8/Rhu9TAfDpycNpgWkJ3peI2RPqDbXmJhVD5Nf5f5I1PV8tqkVL+
   bfNxg9ax8EA4Q8EX5bxK1bLb/WxeSvT8d03AtDQ+EA3hZvHQym+bqCic0
   FFoOYBrYKFfvfERoNrx++vaF3g/wOf0eHrXN1+NKax4vSbxH6Ff7A2luW
   4cgMELG+5vpJs41AUijV4L8hRdTd4sbv7VTcj6V017ir7bQ9MgOi/mmga
   g==;
X-CSE-ConnectionGUID: Vf/VCCovQ4Sa1pPV1Cs/PA==
X-CSE-MsgGUID: /fSyAxPNRGOO75sQxcLpbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="63372554"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="63372554"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:57:03 -0700
X-CSE-ConnectionGUID: zd6gV9HCTKGZWCbJY6KlFA==
X-CSE-MsgGUID: J7/chT6BQx2vpqcsea1xQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="129867334"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Apr 2025 14:56:59 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3MMr-000BPO-0i;
	Fri, 11 Apr 2025 21:56:57 +0000
Date: Sat, 12 Apr 2025 05:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <superm1@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
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
Message-ID: <202504120558.sq3IpWdH-lkp@intel.com>
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
config: arm64-randconfig-003-20250412 (https://download.01.org/0day-ci/archive/20250412/202504120558.sq3IpWdH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504120558.sq3IpWdH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504120558.sq3IpWdH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-piix4.c:24:10: fatal error: asm/amd_node.h: No such file or directory
    #include <asm/amd_node.h>
             ^~~~~~~~~~~~~~~~
   compilation terminated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m] && HAS_IOPORT [=y]


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
