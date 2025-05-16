Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C357922617F;
	Fri, 16 May 2025 07:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747381042; cv=none; b=gkldGlB14Z9YGeJaqC8oIb/1T7ipQkP2LdY31c1/RYzB1YV5YicV0Tqu1mPTbwuZa2z0UDSdosVu+2NMNVt/roWrYuQ3jqpi9StJTNsgLsMnqzqpESNMfoP/A/HswzdzMDn0I2JK4jQX3v+bhgeLgVhpatubLuzAQu1Q04gFM+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747381042; c=relaxed/simple;
	bh=iyaARSlxSx2c/DhVMA1ZbxR3nXQesEsxPzJdwibwTGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFKsnvS6J6am+snVMM/VAb0AqS5FLdBzxNsWZURAmbhQITiW3DCa2ZU3VYw7xlHjZs+Qnf22jcfN5NPM+baYwAXYXu+M5A55Is3V1MlbpPqvhzluzLjsgdrhx9+CxlefqVR2OEDEngxhhNKUZ5eHCs25wcyBpJJiXiayJSKRK54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMDD9WaD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMDD9WaD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747381040; x=1778917040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iyaARSlxSx2c/DhVMA1ZbxR3nXQesEsxPzJdwibwTGs=;
  b=mMDD9WaDlshvByc7zfFZem6MuaKIzrWnXpG+VBIjCP4oG+/hl23NGluz
   zTMOO23QYS4tiP//iOWk6m0vOYzSPA8S5Fmt4e4mSG8yGKz97fvHGMOCt
   knUj/PiOx2aKcW1sV34otjRxa22QFR3bSK/hCEk/+lBvpRGO/9eWQSksF
   jcnks/nt2nZ9x8P8Q0Da8mdHoNlMnlPeDMqDwDfNCWnZh0vRZv2XQREQD
   rm+eV+QeARoCuFTLsTTMf7JB7xIFaonKmMvfBdhSKsfoFrhENj436rN+H
   Ww3cgR5joIgOwminoFb3e9OMdCFQ9Y83c8nXOv8hp4t/43QNLth6f019t
   A==;
X-CSE-ConnectionGUID: nqPZRBw6QJCI52vljirn0g==
X-CSE-MsgGUID: tu1B7QfrQ1mj4gTVZeVn2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60681944"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="60681944"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 00:37:19 -0700
X-CSE-ConnectionGUID: EmFEkB4PSAy49RIhzknkRA==
X-CSE-MsgGUID: PCyKqvZVQ1CYMs9BpMsMjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="161920591"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 May 2025 00:37:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFpd2-000J6N-0I;
	Fri, 16 May 2025 07:37:12 +0000
Date: Fri, 16 May 2025 15:36:58 +0800
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
Subject: Re: [PATCH v3 16/17] drm/mediatek: Add support for multiple mmsys in
 the one mediatek-drm driver
Message-ID: <202505161512.PmRwb8Li-lkp@intel.com>
References: <20250515093454.1729720-17-paul-pl.chen@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515093454.1729720-17-paul-pl.chen@mediatek.com>

Hi paul-pl.chen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15-rc6 next-20250515]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/paul-pl-chen/dt-bindings-soc-mediatek-add-mutex-yaml-for-MT8196/20250515-173733
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250515093454.1729720-17-paul-pl.chen%40mediatek.com
patch subject: [PATCH v3 16/17] drm/mediatek: Add support for multiple mmsys in the one mediatek-drm driver
config: arm64-randconfig-001-20250516 (https://download.01.org/0day-ci/archive/20250516/202505161512.PmRwb8Li-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161512.PmRwb8Li-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161512.PmRwb8Li-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/mediatek/mtk_ddp_comp.c: In function 'mtk_find_possible_crtcs':
>> drivers/gpu/drm/mediatek/mtk_ddp_comp.c:670:3: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     670 |   if (found)
         |   ^~
   drivers/gpu/drm/mediatek/mtk_ddp_comp.c:673:4: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     673 |    count++;
         |    ^~~~~


vim +/if +670 drivers/gpu/drm/mediatek/mtk_ddp_comp.c

   622	
   623	int mtk_find_possible_crtcs(struct drm_device *drm, struct device *dev)
   624	{
   625		struct mtk_drm_private *private = drm->dev_private;
   626		const struct mtk_mmsys_driver_data *data;
   627		struct mtk_drm_private *priv_n;
   628		int i, j, count = 0, ret;
   629	
   630		/* search each path in private data */
   631		for (i = 0; i < MAX_CRTC; i++) {
   632			bool found = false;
   633			int avail_mmsys_num = 0;
   634	
   635			for (j = 0; j < private->data->mmsys_dev_num; j++) {
   636				const unsigned int *path = NULL;
   637				unsigned int path_len = 0;
   638	
   639				priv_n = private->all_drm_private[j];
   640				data = priv_n->data;
   641	
   642				if (i == CRTC_MAIN) {
   643					path = data->main_path;
   644					path_len = data->main_len;
   645				} else if (i == CRTC_EXT) {
   646					path = data->ext_path;
   647					path_len = data->ext_len;
   648				} else if (i == CRTC_THIRD) {
   649					path = data->third_path;
   650					path_len = data->third_len;
   651				}
   652	
   653				/* skip if no path data in current mmsys */
   654				if (path_len == 0 || !path) {
   655					avail_mmsys_num++;
   656					continue;
   657				}
   658	
   659				if (mtk_ddp_path_available(path, path_len, priv_n->comp_node))
   660					avail_mmsys_num++;
   661	
   662				if (mtk_ddp_comp_find(dev, path, path_len, priv_n->ddp_comp))
   663					found = true;
   664		}
   665	
   666			/* skip invalid path */
   667			if (avail_mmsys_num != private->data->mmsys_dev_num)
   668				continue;
   669	
 > 670			if (found)
   671				return BIT(count);
   672	
   673				count++;
   674		}
   675	
   676		ret = mtk_ddp_comp_find_in_route(dev,
   677						 private->data->conn_routes,
   678						 private->data->num_conn_routes,
   679						 private->ddp_comp);
   680	
   681		if (ret < 0)
   682			DRM_INFO("Failed to find comp in ddp table, ret = %d\n", ret);
   683	
   684		return ret;
   685	}
   686	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
