Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1BE17BA9;
	Fri,  9 May 2025 00:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751690; cv=none; b=HN03bVgsLAR4QLat/jSduswUlPj3SzCqrJZoTX+kCH/6/CzMsEzOAhWRrTOd0TEYbMlgWG4YBEQak1njoW1eLHWK5ypxytybcZkwQwi96eg82/fJs2ByAO0yXm2qhJ+TTaAUdKUd3/Ru9ysxovRJYeJjIaBTTrauhFE/AbbUx68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751690; c=relaxed/simple;
	bh=9l4UtHuSQviUswa9qLhvtxA1wFY9WmoH5OETvZtJ/+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVxtEGEY+UzxKcrsLd9IrQ7PxUOQmGk+G+vs1+sFRk9khXSBX6V1lpCPNHUw1ClhO5OJttnkakyG2vL+nokZ3urfqJaU5taIsFVNosxCYQMLAWI2Ymducon9yQ6U7KGvyHXTjYqHQtnHrSJbscZ1s2qTHVZxpcgp+n+DVEowlss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vb/MblTj; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vb/MblTj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746751688; x=1778287688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9l4UtHuSQviUswa9qLhvtxA1wFY9WmoH5OETvZtJ/+o=;
  b=Vb/MblTjRqdlZTHZchd5cE71NZOidMT7c2xCU2u78yQzjQwrZNZbmhgD
   SLiKhDr4jluUjaSD5w94pFGwtKwxjCi0UAvNjOcGa6Xs4zftN7cO2mBFa
   ASww8pUM117KDbHeh4uaQHyg86je/ZVDfEv/gr6cZzToqlxq99OSw4BNH
   rPtydZ6YF4+0UarSbwbvysdxAqrSjXHfxM2GoP2StNxTuS4/kuAaL6Y85
   rzTN/+KbMOziyTL1s1B7zSxYFKkl1JRP8v0EDf2nTfKiGTObxPZ2knzl+
   dyIoqcos0fA7l2KuuPMEGnTMfky0y0X8H8czOxUi8EWWciHwThePrWJFH
   A==;
X-CSE-ConnectionGUID: qij3FJ03SUyzs5Tn7nS+Nw==
X-CSE-MsgGUID: 9j2viXX1Tnqvw65UXyjTMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48471302"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="48471302"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 17:48:08 -0700
X-CSE-ConnectionGUID: puZOYG22Q1q76b9afePLiA==
X-CSE-MsgGUID: 4Tb1fB3hSKWfSBG8Pmij3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="141372306"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 May 2025 17:48:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDBuE-000BVr-0Y;
	Fri, 09 May 2025 00:48:02 +0000
Date: Fri, 9 May 2025 08:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v3 24/25] irqchip/gic-v5: Add GICv5 ITS support
Message-ID: <202505090857.dvSPkqHI-lkp@intel.com>
References: <20250506-gicv5-host-v3-24-6edd5a92fd09@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-gicv5-host-v3-24-6edd5a92fd09@kernel.org>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0af2f6be1b4281385b618cb86ad946eded089ac8]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Pieralisi/dt-bindings-interrupt-controller-Add-Arm-GICv5/20250506-203528
base:   0af2f6be1b4281385b618cb86ad946eded089ac8
patch link:    https://lore.kernel.org/r/20250506-gicv5-host-v3-24-6edd5a92fd09%40kernel.org
patch subject: [PATCH v3 24/25] irqchip/gic-v5: Add GICv5 ITS support
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090857.dvSPkqHI-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/irqchip/arm-gic-v5.h: linux/iopoll.h is included more than once.

vim +8 include/linux/irqchip/arm-gic-v5.h

     7	
   > 8	#include <linux/iopoll.h>
     9	
    10	#include <asm/cacheflush.h>
  > 11	#include <linux/iopoll.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
