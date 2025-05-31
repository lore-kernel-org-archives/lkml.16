Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5936279D0
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 13:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748699780; cv=none; b=urappcCCpls+JSiU0FnuHuIp9+g9+tGDAyOTcoINRFwFXP9A2NrPIuyyYORwFu4jXQ0jzOhFPQKr+2HG7+kchy9NJz6d/2szMAkPhCM2wbHQq0JbVYc+42igwnaseYjwKJM+KG+QVCU74duMsUV75ET5fAK2lBsvNjdyGsQztFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748699780; c=relaxed/simple;
	bh=xc/jaFtGUdS9VtsThMr6l64Wu8Kp6Q3DfbpAKtANsIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOWcg/B7jt/jTBgE0HNuWTrNrT2f2KFbMjeCTuKXcZuKk0J6CPc1UiTuMaakzzRAHqqq6V9YZctZaYMj12L1aEQrbxyhiEe/nJQYdnPtfbvur0wM8hkGbLjbo+YKnZ6TJWxNhMb51F59ZfMvCLprZIO/sYlsng07t0QLQIDXM2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gN6kXzDG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gN6kXzDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748699778; x=1780235778;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xc/jaFtGUdS9VtsThMr6l64Wu8Kp6Q3DfbpAKtANsIA=;
  b=gN6kXzDGoglLCsX+VCukvQR2a5ZVIyPoYwJrVL3h3k86B3hYgr++UtSr
   Urz/TLwzk4bHBlZtYaKdVGpyY/AO9EkgLJKohpVcY+K6Pe/jSLdNZem8y
   g+ygH8MZFwTGaruuabhjNx8R9fztqBSnF5gqi8LLv3JtXthEuzxM/Ol86
   jol5Lpdo0FHx9UvebHPXrAcWaGKx+D3/1ibrXobIOm8JqdibvpmsS36IU
   QriFZ8seNI7x2xxQG0z7wN0aOXokqjRYKh4yomRrCsU32fQkEoWwePCSs
   9crxVrc1IuZsKh79/EdzNfHKWfcCj2jWNu2QO0LxoL/2DBLWy0K5StCIN
   A==;
X-CSE-ConnectionGUID: Mv8J/4SjTdWj7P1oYI/nfA==
X-CSE-MsgGUID: evXEn8c4RY+ATmlIrQEmTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="62174504"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="62174504"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 06:56:17 -0700
X-CSE-ConnectionGUID: q7bPbGEoSpyff7xrJgoRbQ==
X-CSE-MsgGUID: PNhqCaQqR/WwEs0XsP3beA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="144034593"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 May 2025 06:56:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLMh2-000YQu-0S;
	Sat, 31 May 2025 13:56:12 +0000
Date: Sat, 31 May 2025 21:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: Qingfang Deng <dqfext@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] riscv: use generic MMIO accessors
Message-ID: <202505312115.47xDnzAe-lkp@intel.com>
References: <20250530032252.3092502-1-dqfext@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530032252.3092502-1-dqfext@gmail.com>

Hi Qingfang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.15]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qingfang-Deng/riscv-use-generic-MMIO-accessors/20250530-112455
base:   linus/master
patch link:    https://lore.kernel.org/r/20250530032252.3092502-1-dqfext%40gmail.com
patch subject: [PATCH] riscv: use generic MMIO accessors
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250531/202505312115.47xDnzAe-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505312115.47xDnzAe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505312115.47xDnzAe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/omapdrm/dss/dispc.c:4720:27: warning: stack frame size (2304) exceeds limit (2048) in 'dispc_runtime_suspend' [-Wframe-larger-than]
    4720 | static __maybe_unused int dispc_runtime_suspend(struct device *dev)
         |                           ^
   drivers/gpu/drm/omapdrm/dss/dispc.c:4735:27: warning: stack frame size (2432) exceeds limit (2048) in 'dispc_runtime_resume' [-Wframe-larger-than]
    4735 | static __maybe_unused int dispc_runtime_resume(struct device *dev)
         |                           ^
   2 warnings generated.


vim +/dispc_runtime_suspend +4720 drivers/gpu/drm/omapdrm/dss/dispc.c

060b6d9cbab03f drivers/video/omap2/dss/dispc.c     Senthilvadivu Guruswamy 2011-01-24  4719  
d6c75c295f67b2 drivers/gpu/drm/omapdrm/dss/dispc.c Arnd Bergmann           2021-12-05 @4720  static __maybe_unused int dispc_runtime_suspend(struct device *dev)
4fbafaf371be78 drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2011-05-27  4721  {
1f6b6b6267ebe6 drivers/gpu/drm/omapdrm/dss/dispc.c Laurent Pinchart        2018-02-13  4722  	struct dispc_device *dispc = dev_get_drvdata(dev);
1f6b6b6267ebe6 drivers/gpu/drm/omapdrm/dss/dispc.c Laurent Pinchart        2018-02-13  4723  
1f6b6b6267ebe6 drivers/gpu/drm/omapdrm/dss/dispc.c Laurent Pinchart        2018-02-13  4724  	dispc->is_enabled = false;
0925afc9a4851c drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2014-04-11  4725  	/* ensure the dispc_irq_handler sees the is_enabled value */
0925afc9a4851c drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2014-04-11  4726  	smp_wmb();
0925afc9a4851c drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2014-04-11  4727  	/* wait for current handler to finish before turning the DISPC off */
1f6b6b6267ebe6 drivers/gpu/drm/omapdrm/dss/dispc.c Laurent Pinchart        2018-02-13  4728  	synchronize_irq(dispc->irq);
0925afc9a4851c drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2014-04-11  4729  
1f6b6b6267ebe6 drivers/gpu/drm/omapdrm/dss/dispc.c Laurent Pinchart        2018-02-13  4730  	dispc_save_context(dispc);
4fbafaf371be78 drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2011-05-27  4731  
4fbafaf371be78 drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2011-05-27  4732  	return 0;
4fbafaf371be78 drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2011-05-27  4733  }
4fbafaf371be78 drivers/video/omap2/dss/dispc.c     Tomi Valkeinen          2011-05-27  4734  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
