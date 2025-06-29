Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53E5625;
	Sun, 29 Jun 2025 00:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751157210; cv=none; b=FmjoU6cemjXbbVIwBmIHDQdAlUC5nb6xN+4SwHFDISCJxXUN14iUX7I+yuEYOYy+rmZthAMOBJZlKqPQ1b/0krVUt2nFhZ8U62A/qM/yKNleGD34KkKRrzmqcXoxf653xD++Qw4Mq7jOYVFzMcryZfTKIvAHwhQOOqUJyC3GcXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751157210; c=relaxed/simple;
	bh=AolaRGjJTaifs7f9V7/iIwPTII8Eu6lCuQv6L5dV754=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoML1cUfm72ni7qO09WQ8ghDg6gWs5a4v4qg65UOPbOKxycfNOkv245/SMo0UgelnTqKGh0X68xNpjg868vXDy8qnNjPc1sorcOl4QGcYl+iMyO6IWnCrljGDltyrtSwobr1dSEa0VnnGpiSJPG+hLnanQ/MMJP29/LZazbk6Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nM06v3hO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nM06v3hO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751157209; x=1782693209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AolaRGjJTaifs7f9V7/iIwPTII8Eu6lCuQv6L5dV754=;
  b=nM06v3hOqnJFk2/N2cSyPH1bA+dAGAZNA+yOXsyvRKDjiFIBS4XBhhZq
   R9GNGlREilgpBiV9E17lOXmjUBJULD6ft9G7WAJSupS45GCoduBuKEmqp
   PNCgwPHIgu1zJXVx9vqq4UIuLY8eKeaasTh2RySxplBFmhGf+YOeF/j4r
   CO16dwz+jKzWxm9xhP1NrN1Pu/yI+U1lUl5EOpBgNaDaN69mpNlvD/tvC
   zcffnzGypT9iHFh+BgK7whhm7eiXAkAj4D7oX7ixvNUs6lkbEJY83ZbeE
   ghZMPm8XDqqn0romCiXDK1tEaFc7T0QUkw41/DbK//cjGei3ZTn4PoX1g
   Q==;
X-CSE-ConnectionGUID: C8WyjYqVSqaobJlASn6VxQ==
X-CSE-MsgGUID: LAU1jmPJSKmuCNsUkqx0wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53286975"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="53286975"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 17:33:28 -0700
X-CSE-ConnectionGUID: XZi4Py13R+Ok+7qSxSkg8Q==
X-CSE-MsgGUID: SiYl6Y9lSYOAL5Mz/TgZkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="153598075"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Jun 2025 17:33:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVfz0-000XXK-2l;
	Sun, 29 Jun 2025 00:33:22 +0000
Date: Sun, 29 Jun 2025 08:32:40 +0800
From: kernel test robot <lkp@intel.com>
To: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH 2/8] arm64: dts: rockchip: Refactor DSI nodes on rk3399
 boards
Message-ID: <202506290852.bWro2lBe-lkp@intel.com>
References: <20250627152645.740981-3-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627152645.740981-3-didi.debian@cknow.org>

Hi Diederik,

kernel test robot noticed the following build errors:

[auto build test ERROR on rockchip/for-next]
[also build test ERROR on next-20250627]
[cannot apply to robh/for-next krzk/for-next krzk-dt/for-next linus/master v6.16-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Diederik-de-Haas/arm64-dts-rockchip-Refactor-DSI-nodes-on-px30-boards/20250627-233300
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250627152645.740981-3-didi.debian%40cknow.org
patch subject: [PATCH 2/8] arm64: dts: rockchip: Refactor DSI nodes on rk3399 boards
config: arm64-randconfig-002-20250629 (https://download.01.org/0day-ci/archive/20250629/202506290852.bWro2lBe-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290852.bWro2lBe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290852.bWro2lBe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso:75.1-6 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
