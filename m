Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F9F223DC5;
	Fri, 16 May 2025 06:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747377317; cv=none; b=FutoGa6IS4XuwCbHfPEFRI+GZHIa2vK8CnrTuBfDXJtnGVPQsUhCFiRVduo4bixeWZMQ79omxIH4Sz0FTebeYHJ0OXnoLtRH0DON2eRT0wQde1Hzz1Xn+EbSNN5jcN3SPrNBIz+7EJHN5gQKJ/BWg/Tru5V2puX2H2K4s37XwYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747377317; c=relaxed/simple;
	bh=EWO6CZzwsD8bIRRFpNMF4OS0mHTBB1Wpe5eviDCIk8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoelOqJvMVuUx8Gxupes25mDOBQR/uluzh1vJo798GIT8RN5PYA6+eCSXVyIolKjXu8Qh71g1P7WVyNnjG7RCEHReNOpJh2HiB0xC0NNHhvu8yD2kZfZLsRdWakflF9cOu33ha10VUg+BoOkYX41waWt0HdS40uUSie2s094G28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Phrsj/DR; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Phrsj/DR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747377316; x=1778913316;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EWO6CZzwsD8bIRRFpNMF4OS0mHTBB1Wpe5eviDCIk8E=;
  b=Phrsj/DRgzc7qmMvEHL/x38r1X2T2R+6Yf86oyOdYN2DjWBo9FCKzkbo
   YfZihoYvO1CfFva81fV5nBY3jKmxWNlmrcari3oj1Z183Iw/LyoA0tte6
   VIkTaSPb5bjwQzLvYz2HHEzxYEtgfmyad5UT0KMw46SvPBKvv7o7N2fqi
   7IVb0g+qfs1CZ5SUYkrA5tbGp3BVmBIY42flWtmHC9yE9lCdHTuXSpdpP
   h4jxqYAsaZwXE+vrai5A2o9EYg/M5sRM9dhtxkyegDjFjpZnxadM4qhLx
   qiaWTpcro4quaDZILIZU3CE9Rbrrt7NKMAvsCYS1hZ2TkJFPYFS45ia21
   Q==;
X-CSE-ConnectionGUID: Fe+2de0HTGu7pnLwRt46Zw==
X-CSE-MsgGUID: 5/R8HrB5SZek0NdlE3/knA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49323335"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="49323335"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 23:35:14 -0700
X-CSE-ConnectionGUID: FdBqF5OARzSE8VaoJNoetw==
X-CSE-MsgGUID: 4TNMa49+RSqU+LxFVGFPHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="138990800"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 23:35:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFoew-000J3N-2g;
	Fri, 16 May 2025 06:35:06 +0000
Date: Fri, 16 May 2025 14:34:47 +0800
From: kernel test robot <lkp@intel.com>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org,
	angelogioacchino.delregno@collabora.com
Cc: oe-kbuild-all@lists.linux.dev, matthias.bgg@gmail.com,
	p.zabel@pengutronix.de, jason-jh.lin@mediatek.com,
	nancy.lin@mediatek.com, singo.chang@mediatek.com,
	xiandong.wang@mediatek.com, sirius.wang@mediatek.com,
	paul-pl.chen@mediatek.com, sunny.shen@mediatek.com,
	fshao@chromium.org, treapking@chromium.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 15/17] drm/mediatek: add ovlsys_adaptor support for
 MT8196
Message-ID: <202505161422.JeAeW3Pd-lkp@intel.com>
References: <20250515093454.1729720-16-paul-pl.chen@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515093454.1729720-16-paul-pl.chen@mediatek.com>

Hi paul-pl.chen,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc6 next-20250515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/paul-pl-chen/dt-bindings-soc-mediatek-add-mutex-yaml-for-MT8196/20250515-173733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250515093454.1729720-16-paul-pl.chen%40mediatek.com
patch subject: [PATCH v3 15/17] drm/mediatek: add ovlsys_adaptor support for MT8196
config: arm64-randconfig-001-20250516 (https://download.01.org/0day-ci/archive/20250516/202505161422.JeAeW3Pd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161422.JeAeW3Pd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161422.JeAeW3Pd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_drm_drv.c: In function 'mtk_drm_ovl_adaptor_probe':
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:1071:32: error: storage size of 'ovlsys_priv' isn't known
    1071 |  struct mtk_drm_ovlsys_private ovlsys_priv;
         |                                ^~~~~~~~~~~
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:1071:32: warning: unused variable 'ovlsys_priv' [-Wunused-variable]
   drivers/gpu/drm/mediatek/mtk_drm_drv.c: In function 'mtk_drm_probe':
   drivers/gpu/drm/mediatek/mtk_drm_drv.c:1145:50: error: 'DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2' undeclared (first use in this function); did you mean 'DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0'?
    1145 |  mtk_drm_ovl_adaptor_probe(dev, private, &match, DDP_COMPONENT_DRM_OVLSYS_ADAPTOR2);
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                  DDP_COMPONENT_DRM_OVLSYS_ADAPTOR0
   drivers/gpu/drm/mediatek/mtk_drm_drv.c:1145:50: note: each undeclared identifier is reported only once for each function it appears in


vim +1071 drivers/gpu/drm/mediatek/mtk_drm_drv.c

  1066	
  1067	static void mtk_drm_ovl_adaptor_probe(struct device *dev, struct mtk_drm_private *private,
  1068					      struct component_match **match, enum mtk_ddp_comp_id id)
  1069	{
  1070		struct platform_device *ovl_adaptor;
> 1071		struct mtk_drm_ovlsys_private ovlsys_priv;
  1072		bool is_ovlsys = (id != DDP_COMPONENT_DRM_OVL_ADAPTOR);
  1073		char *dev_name = is_ovlsys ? "mediatek-disp-ovlsys-adaptor" : "mediatek-disp-ovl-adaptor";
  1074		void *drv_data = is_ovlsys ? (void *)&ovlsys_priv : (void *)private->mmsys_dev;
  1075		size_t data_size = is_ovlsys ? sizeof(ovlsys_priv) : sizeof(*private->mmsys_dev);
  1076	
  1077		if (mtk_drm_find_mmsys_comp(private, id, &ovlsys_priv.use_path)) {
  1078			ovlsys_priv.mmsys_dev = private->mmsys_dev;
  1079			ovl_adaptor = platform_device_register_data(dev, dev_name, PLATFORM_DEVID_AUTO,
  1080								    drv_data, data_size);
  1081			private->ddp_comp[id].dev = &ovl_adaptor->dev;
  1082			mtk_ddp_comp_init(NULL, &private->ddp_comp[id], id);
  1083			component_match_add(dev, match, compare_dev, &ovl_adaptor->dev);
  1084		}
  1085	}
  1086	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
