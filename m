Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026D5228CA9
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745743170; cv=none; b=aT6NTSRESMsMcdNm4zx9wemkHyaUwAbHwQmtpX/Ary/KIeCQVYq3E8fBLx8r+IAiHoo037Y5O/4BfW3QRByrBcAQao6lhBHJHwL6QHNQifMC94alw9+aqXhu/zgu2YGsJzwk5vhM7deDjvFIXrndLpSrxlmLCkcZHNuV2qR/Nuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745743170; c=relaxed/simple;
	bh=3JJDGurve+hRagJydOAH5F2IgPnuoUcTq5M/7yzwLbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u64YwHr7LLp/ZPTjbBXyPgb2qTLc3PXoPXZh0V7LRPF2ZLplpsXFV1j3nBOr7iPqtS7noNtpQHv360lvu0Qh2JtO/f6qe4JExBOH9+zygmTiL9st74rDpD221Xq67QlRGkZ3LyrB3AWZ/KNCHyxtiit73sE3BIgYOzzxng6+y30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGYfzLQg; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGYfzLQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745743169; x=1777279169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3JJDGurve+hRagJydOAH5F2IgPnuoUcTq5M/7yzwLbQ=;
  b=FGYfzLQgtjvTw8y9rn3hwzSRObqLrvY9Fxa4RmOVHde1rgI+leHNylHp
   8DsmJKwmhqIwMcInIudHObeUUMajWy7wdFC4HbHi5x19ic5rgg6Rxywv3
   jevcmkxgMaVki5MFQItu0QNIVcziqxWJQJ/kEgu+RspHyqJda51sTyjgS
   94kzk+YxqQn4zEp/QmVIIAia0mSV8XDr21W31SkeTToyWGJWe3ajQG/VN
   +jXyYiEQ1SAWPT+ku+A79oVGy9S5SpIm3pvVSmD0k90NAwHGDaZV84YS5
   Vu0fhinaeB6ia8eOEAjNPe81A68ZzlDND1MJKRyODxSXoRRH9n3jvBZW1
   g==;
X-CSE-ConnectionGUID: wS0T4QMuS7iPeC2TnPLh3w==
X-CSE-MsgGUID: vz0KzbxrRSSkPjunk8fNMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="51019955"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="51019955"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 01:39:28 -0700
X-CSE-ConnectionGUID: X/0Q7e+NRPCHQlG2RMExcA==
X-CSE-MsgGUID: +s39nTQgSrOmKR05DHz2wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="134199044"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 Apr 2025 01:39:26 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8xXo-0006CP-0j;
	Sun, 27 Apr 2025 08:39:24 +0000
Date: Sun, 27 Apr 2025 16:38:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jianhua Lin <jianhua.lin@mediatek.com>
Subject: Re: [PATCH 1/1] media: mediatek: jpeg: add compatible for MT8188 SoC
Message-ID: <202504271638.9nCgQcOR-lkp@intel.com>
References: <20250426081928.27351-1-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426081928.27351-1-jianhua.lin@mediatek.com>

Hi Jianhua,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on linus/master v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianhua-Lin/media-mediatek-jpeg-add-compatible-for-MT8188-SoC/20250426-162259
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250426081928.27351-1-jianhua.lin%40mediatek.com
patch subject: [PATCH 1/1] media: mediatek: jpeg: add compatible for MT8188 SoC
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20250427/202504271638.9nCgQcOR-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504271638.9nCgQcOR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504271638.9nCgQcOR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1948:10: error: 'const struct mtk_jpeg_variant' has no member named 'support_34bit'
    1948 |         .support_34bit = true,
         |          ^~~~~~~~~~~~~
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1964:10: error: 'const struct mtk_jpeg_variant' has no member named 'support_34bit'
    1964 |         .support_34bit = true,
         |          ^~~~~~~~~~~~~


vim +1948 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

  1934	
  1935	static const struct mtk_jpeg_variant mtk8188_jpegenc_drvdata = {
  1936		.clks = mtk_jpeg_clocks,
  1937		.num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
  1938		.formats = mtk_jpeg_enc_formats,
  1939		.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
  1940		.qops = &mtk_jpeg_enc_qops,
  1941		.irq_handler = mtk_jpeg_enc_irq,
  1942		.hw_reset = mtk_jpeg_enc_reset,
  1943		.m2m_ops = &mtk_jpeg_enc_m2m_ops,
  1944		.dev_name = "mtk-jpeg-enc",
  1945		.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
  1946		.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
  1947		.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
> 1948		.support_34bit = true,
  1949	};
  1950	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
