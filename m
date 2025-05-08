Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26154262FCA;
	Thu,  8 May 2025 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693582; cv=none; b=IFLlbhOJWPE+ROPrJrU9k1HqkIkp4WcDvXOlfMcQwMTIK4DzYpLcbdHvnPYcL9AGz8ok6Tri1BKehJ7rlfZ6GWlb23ZD1uLOabuZt2+7+2HDxsAZ7jtE2fiA+n6OOE6djWT6Pd2OToMWnm0m/5IFdPR4Cp3KOo9l9vWD5V6RgbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693582; c=relaxed/simple;
	bh=J1quForL1AyV+mxiU/+Tx5j7sIP7VxLUjzVH0JaG5GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MeejwEoU00GlEecbDv7ABmXG4hKbcwEgVyASj1h9BTjp1gWOn6Abew60JnBOd2ovTdExG6/qaBSMbRNArNgfNvB/GXjS7CADH1j1aqyQ/3x8IO381wv2+6U7R59d3OKyII0v+RZ6QyIXVEMlHWrg+zG7bihXyLYT9/tIZIZn76U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSrrnWQS; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSrrnWQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746693581; x=1778229581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J1quForL1AyV+mxiU/+Tx5j7sIP7VxLUjzVH0JaG5GA=;
  b=QSrrnWQSGrInAW3NtGyF6D76MKdc0eXAq4tOuM58MXVCvbwoCkpfnJ0a
   5kfdA8KquZc3JaNNFI9R++53yTniJcyDq/ZqwZ7U64GvKZwuGUsT6NBJd
   7hB7iHRnVvcVexRpp0Qcf80eYww/IHQ5Br+fAwqQyFL6uMNigH9OYqTKT
   yjpHWJvUER6ULDPYGOnuM9wYTFrzfSjJmteEls8zVcoSgh7sURquB/rJQ
   eI3jS+ULYRKC6M5tpYPwwqnWst1rAr0jekBA7ZLhfAU+Y7uwDnhuZXdTX
   8zmHo4lconP/2+SrLI1ojztv0do8+Ldjkgr4Cp8jmqjTZQ0uEAIq73IKL
   w==;
X-CSE-ConnectionGUID: bMF9fXM5Sc6osACjPjPBkw==
X-CSE-MsgGUID: bXwVuhQeR9Wym7qZtrLSqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52273876"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="52273876"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 01:39:40 -0700
X-CSE-ConnectionGUID: oQrkPq5kQgifWHGyg4j/xQ==
X-CSE-MsgGUID: Pw0GmgEXRM65MOnUpmGxqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="135925309"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 May 2025 01:39:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCwn0-000AnH-04;
	Thu, 08 May 2025 08:39:34 +0000
Date: Thu, 8 May 2025 16:39:26 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Schultz <d.schultz@phytec.de>, nm@ti.com, vigneshr@ti.com,
	kristo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	robertcnelson@gmail.com, francesco.dolcini@toradex.com
Cc: oe-kbuild-all@lists.linux.dev, upstream@lists.phytec.de,
	w.egorov@phytec.de, Daniel Schultz <d.schultz@phytec.de>
Subject: Re: [PATCH 4/4] arm64: dts: ti: k3-am62a7-*: Specify Temperature
 Grade
Message-ID: <202505081648.oRdmP2QV-lkp@intel.com>
References: <20250507050847.912756-4-d.schultz@phytec.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507050847.912756-4-d.schultz@phytec.de>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Schultz/arm64-dts-ti-k3-am625-Specify-Temperature-Grade/20250507-131122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250507050847.912756-4-d.schultz%40phytec.de
patch subject: [PATCH 4/4] arm64: dts: ti: k3-am62a7-*: Specify Temperature Grade
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250508/202505081648.oRdmP2QV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081648.oRdmP2QV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081648.oRdmP2QV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dts:14:10: fatal error: k3-am62a-thermal-automative.dtsi: No such file or directory
      14 | #include "k3-am62a-thermal-automative.dtsi"
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +14 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts

     9	
    10	#include <dt-bindings/leds/common.h>
    11	#include <dt-bindings/gpio/gpio.h>
    12	#include <dt-bindings/net/ti-dp83867.h>
    13	#include "k3-am62a7.dtsi"
  > 14	#include "k3-am62a-thermal-automative.dtsi"
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
