Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9665182D7;
	Wed, 25 Jun 2025 01:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750814134; cv=none; b=UFbcFPto9fFiaLppPv95LM1dyRAEoXS0aVntl53cfe5Z7bWTerfu5thD9hTug2j2Utw91hLwfLjLHcqmVRurBtPCpfEP9nedFgfjjSsoHYrPc+YMZUgBaZNSMlfIykT9CRj6UP88sylRv3Os7YEs1TFkrUVri/EJkUBY2vz5iC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750814134; c=relaxed/simple;
	bh=kS3ORGHMAm1WSArCy9GZIu9x7Ni3+9c8myn5vEq4Uaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/Ui/ts12BBee2JPIZkuI3opaqotDmlr0yvm1Jm+Oiq2hji3JZzmcxoaa9jXS9FTX74WAhfTaXhibolq/hN1hOV5HgeAE9sgGOC8tJFka78LblDTYG/xNyF1uN7mjOmwydd96LoDXCmyD7ATbCh8cTICQ/VtHTvfW43mgQxUQgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haOIeRav; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haOIeRav"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750814133; x=1782350133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kS3ORGHMAm1WSArCy9GZIu9x7Ni3+9c8myn5vEq4Uaw=;
  b=haOIeRavWUPt38z05E+jwDzUm95k3TKieyVRIhAqk18R49aj9wCs/BWm
   ZnHszlIpPUgQoNRQQ2LQmm7cUZsvLPoahoV9hajWTuBkBPEoTXDLA6jnr
   fqITfOV88JhIhiVRPT4hCQGIzCqbzH033C+Lq9jSuB1Q9KeudfmqjQE9e
   gLx3VEwwKHlOJ2hJE+UHeW73SmvqZAW1FdJq8knev8okLmmr3kzZ0Xl+L
   IYkHq4NHkPaYeYx4d7vVJN6rWYOkf+3xFQYUh7DAOnc58uwH8VoE2sqeg
   YjbyNUfMhlh3YbLdCmqwN+GtuK9anXLNavOwpwCJEbvk6d/yElNoB7CLu
   A==;
X-CSE-ConnectionGUID: sxmBzvUIQw+zHCoQxiuVHA==
X-CSE-MsgGUID: B6WnXgbZSaGcNMV5JAj9Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52186027"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="52186027"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 18:15:32 -0700
X-CSE-ConnectionGUID: K0CGdRIhRn2u+rZKk+0HDQ==
X-CSE-MsgGUID: uOrbc5G/QPGzRZU3elknYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="151816874"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Jun 2025 18:15:27 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUEjV-000SeM-12;
	Wed, 25 Jun 2025 01:15:25 +0000
Date: Wed, 25 Jun 2025 09:14:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yao Zi <ziyao@disroot.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>, Jonas Karlman <jonas@kwiboo.se>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: rockchip: Add naneng-combphy for
 RK3528
Message-ID: <202506250816.aR1dRh1e-lkp@intel.com>
References: <20250624033733.50197-7-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624033733.50197-7-ziyao@disroot.org>

Hi Yao,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on rockchip/for-next linus/master v6.16-rc3 next-20250624]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yao-Zi/dt-bindings-soc-rockchip-Add-RK3528-pipe-phy-GRF-syscon/20250624-114238
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250624033733.50197-7-ziyao%40disroot.org
patch subject: [PATCH v4 6/6] arm64: dts: rockchip: Add naneng-combphy for RK3528
config: arm64-randconfig-001-20250624 (https://download.01.org/0day-ci/archive/20250625/202506250816.aR1dRh1e-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506250816.aR1dRh1e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506250816.aR1dRh1e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/rockchip/rk3528.dtsi:952.28-29 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
