Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A7A18C004;
	Sat, 19 Apr 2025 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745047211; cv=none; b=pJjzVZne8UgtTwV8myI/Namr6xAicgQAwUJ2FbxPS5PSqpTh7ub07JV9QAmPYFkFmDwbag72fA5WzWE7c9xxYp35jjArD5ubMvS3+2boJyyuvAs+pJsZi4+7+JQaOkR/j+EDM8a1tSmHhJWZuAP5oV4iOC2MEApKP47wQqm/jn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745047211; c=relaxed/simple;
	bh=LCM9rcBiQnj8FfSNnDAtZd+MbtyPlq5KB3By1/gIDRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZIstrY+ST3tDMuma0m4B6P25tAUQbpNrGOyeD00TmAZVNMb+F5EEwcajNUARwZOpbhMplKJ/kvdDwbFQNF1ndEzQUquy2Lsot1EBHa6yzVhblwRYGxvtoo+FE0RObN6Q0dnoiCojMGVKFTpE03BtgTVCWddw0ULo+D3LMzK8k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGvfR6CU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGvfR6CU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745047209; x=1776583209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LCM9rcBiQnj8FfSNnDAtZd+MbtyPlq5KB3By1/gIDRI=;
  b=YGvfR6CU/AhTYZwWhWZDs3ESEQW6e6wSy6CYX6HVYc45H5r2xXU4E4kg
   FGtUhF9Qt5LrP8Cg+MgTYKKr5eLGFhLUX1ZdiqxsIqwCdO8MAedqpVoto
   Ru6pbUjnMDK1Vews6pR980POfBiqAaCuvTZYeUrhrj0wx9JnU6dkiDakX
   E5sucvAN/qTEFw/6XOskflb/pNeLPFK47bM/7HCDJ0FpeOaKDjoLYZDXJ
   AYstCLM2jolNRmDh8u/BZA9gxKzUROZyjytNBvxKZE5qozuhdQdkxBqw2
   7DU526q4yeDerZSPoHv+soJ1hcjI6muq9XA220QVcAexU+i6p/4OJsuIR
   w==;
X-CSE-ConnectionGUID: y373mTZgQdCn7KCo2NOyiA==
X-CSE-MsgGUID: af8iy/c7R4i8wpS3tfPaJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="34282307"
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="34282307"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 00:20:08 -0700
X-CSE-ConnectionGUID: eV3b6fYpTTWiRJQ+acA7Vg==
X-CSE-MsgGUID: EKqWrkPHRKuPxYfGpv6kyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,223,1739865600"; 
   d="scan'208";a="132179622"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Apr 2025 00:20:02 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u62UZ-0003gD-2g;
	Sat, 19 Apr 2025 07:19:59 +0000
Date: Sat, 19 Apr 2025 15:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: Bincai Liu <bincai.liu@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jitao shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	Bincai Liu <bincai.liu@mediatek.com>
Subject: Re: [PATCH 3/5] drm/mediatek: Add dvo driver for mt8196
Message-ID: <202504191551.u0FJoQ3O-lkp@intel.com>
References: <20250418065313.8972-4-bincai.liu@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418065313.8972-4-bincai.liu@mediatek.com>

Hi Bincai,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on pza/reset/next linus/master v6.15-rc2 next-20250417]
[cannot apply to pza/imx-drm/next drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bincai-Liu/dt-bindings-eDP-mediatek-add-eDP-yaml-for-mt8196/20250418-145911
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250418065313.8972-4-bincai.liu%40mediatek.com
patch subject: [PATCH 3/5] drm/mediatek: Add dvo driver for mt8196
config: i386-buildonly-randconfig-006-20250419 (https://download.01.org/0day-ci/archive/20250419/202504191551.u0FJoQ3O-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504191551.u0FJoQ3O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504191551.u0FJoQ3O-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_ddp_comp.c:476:3: error: use of undeclared identifier 'DDP_COMPONENT_DVO0'
     476 |         [DDP_COMPONENT_DVO0]            = { MTK_DVO,                    0, &ddp_dpi },
         |          ^
   1 error generated.


vim +/DDP_COMPONENT_DVO0 +476 drivers/gpu/drm/mediatek/mtk_ddp_comp.c

   456	
   457	static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_DRM_ID_MAX] = {
   458		[DDP_COMPONENT_AAL0]		= { MTK_DISP_AAL,		0, &ddp_aal },
   459		[DDP_COMPONENT_AAL1]		= { MTK_DISP_AAL,		1, &ddp_aal },
   460		[DDP_COMPONENT_BLS]		= { MTK_DISP_BLS,		0, NULL },
   461		[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,		0, &ddp_ccorr },
   462		[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,		0, &ddp_color },
   463		[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,		1, &ddp_color },
   464		[DDP_COMPONENT_DITHER0]		= { MTK_DISP_DITHER,		0, &ddp_dither },
   465		[DDP_COMPONENT_DP_INTF0]	= { MTK_DP_INTF,		0, &ddp_dpi },
   466		[DDP_COMPONENT_DP_INTF1]	= { MTK_DP_INTF,		1, &ddp_dpi },
   467		[DDP_COMPONENT_DPI0]		= { MTK_DPI,			0, &ddp_dpi },
   468		[DDP_COMPONENT_DPI1]		= { MTK_DPI,			1, &ddp_dpi },
   469		[DDP_COMPONENT_DRM_OVL_ADAPTOR]	= { MTK_DISP_OVL_ADAPTOR,	0, &ddp_ovl_adaptor },
   470		[DDP_COMPONENT_DSC0]		= { MTK_DISP_DSC,		0, &ddp_dsc },
   471		[DDP_COMPONENT_DSC1]		= { MTK_DISP_DSC,		1, &ddp_dsc },
   472		[DDP_COMPONENT_DSI0]		= { MTK_DSI,			0, &ddp_dsi },
   473		[DDP_COMPONENT_DSI1]		= { MTK_DSI,			1, &ddp_dsi },
   474		[DDP_COMPONENT_DSI2]		= { MTK_DSI,			2, &ddp_dsi },
   475		[DDP_COMPONENT_DSI3]		= { MTK_DSI,			3, &ddp_dsi },
 > 476		[DDP_COMPONENT_DVO0]            = { MTK_DVO,                    0, &ddp_dpi },
   477		[DDP_COMPONENT_GAMMA]		= { MTK_DISP_GAMMA,		0, &ddp_gamma },
   478		[DDP_COMPONENT_MERGE0]		= { MTK_DISP_MERGE,		0, &ddp_merge },
   479		[DDP_COMPONENT_MERGE1]		= { MTK_DISP_MERGE,		1, &ddp_merge },
   480		[DDP_COMPONENT_MERGE2]		= { MTK_DISP_MERGE,		2, &ddp_merge },
   481		[DDP_COMPONENT_MERGE3]		= { MTK_DISP_MERGE,		3, &ddp_merge },
   482		[DDP_COMPONENT_MERGE4]		= { MTK_DISP_MERGE,		4, &ddp_merge },
   483		[DDP_COMPONENT_MERGE5]		= { MTK_DISP_MERGE,		5, &ddp_merge },
   484		[DDP_COMPONENT_OD0]		= { MTK_DISP_OD,		0, &ddp_od },
   485		[DDP_COMPONENT_OD1]		= { MTK_DISP_OD,		1, &ddp_od },
   486		[DDP_COMPONENT_OVL0]		= { MTK_DISP_OVL,		0, &ddp_ovl },
   487		[DDP_COMPONENT_OVL1]		= { MTK_DISP_OVL,		1, &ddp_ovl },
   488		[DDP_COMPONENT_OVL_2L0]		= { MTK_DISP_OVL_2L,		0, &ddp_ovl },
   489		[DDP_COMPONENT_OVL_2L1]		= { MTK_DISP_OVL_2L,		1, &ddp_ovl },
   490		[DDP_COMPONENT_OVL_2L2]		= { MTK_DISP_OVL_2L,		2, &ddp_ovl },
   491		[DDP_COMPONENT_POSTMASK0]	= { MTK_DISP_POSTMASK,		0, &ddp_postmask },
   492		[DDP_COMPONENT_PWM0]		= { MTK_DISP_PWM,		0, NULL },
   493		[DDP_COMPONENT_PWM1]		= { MTK_DISP_PWM,		1, NULL },
   494		[DDP_COMPONENT_PWM2]		= { MTK_DISP_PWM,		2, NULL },
   495		[DDP_COMPONENT_RDMA0]		= { MTK_DISP_RDMA,		0, &ddp_rdma },
   496		[DDP_COMPONENT_RDMA1]		= { MTK_DISP_RDMA,		1, &ddp_rdma },
   497		[DDP_COMPONENT_RDMA2]		= { MTK_DISP_RDMA,		2, &ddp_rdma },
   498		[DDP_COMPONENT_RDMA4]		= { MTK_DISP_RDMA,		4, &ddp_rdma },
   499		[DDP_COMPONENT_UFOE]		= { MTK_DISP_UFOE,		0, &ddp_ufoe },
   500		[DDP_COMPONENT_WDMA0]		= { MTK_DISP_WDMA,		0, NULL },
   501		[DDP_COMPONENT_WDMA1]		= { MTK_DISP_WDMA,		1, NULL },
   502	};
   503	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
