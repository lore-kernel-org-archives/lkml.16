Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA4E2264BA
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 23:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750981386; cv=none; b=VkpMN3AoD5HIXJpCaVZz8EXHNognUz/4oLZgtftswIZmmpbHSQmdR44DEHbbzH+eNzxEQm5tGc3BaV1P7/LDb84UsOl9d7VKamXusRdx2EsG71bzZ+7WvAQuf3hgF7eySCtui583imbixkvGZItnEfivOVx1anuy9Uns7Dn/GFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750981386; c=relaxed/simple;
	bh=urZl6JTvJf0apVJYt9mU6sqER8QXulKfZ2pqNl0VDWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKNJFNHeaxK13qzqyOeLTCZSpM04lVOVCy06wOKUfSTiJlfVlkEu/ivuONWTdIQJ0H+pNPe/CEmuk3MO78sBPA8g486YJ3eIO6M+7j2zmg/4hYXkUXwcWi79uVtXCSaqBpmfnpUyPLzbXI692NoafoL4ggVeV3kQOegDjhpzgYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIapqrbI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIapqrbI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750981385; x=1782517385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=urZl6JTvJf0apVJYt9mU6sqER8QXulKfZ2pqNl0VDWg=;
  b=SIapqrbICbV3NHPx+A9A0XKKdAdQm/QWPo9rwDA63alRDCYx4Knz3bpo
   +4tixDDD/EwoEnCCrWu0j67IcJVNm0dGCGn/u8dC6PEZZCesWkCYl/TJx
   30cNyjH5Z8bfjeVT6HkdFlgVZidqPbuemXMaD+HQKtiVqR0fSF7om69lQ
   vozDeCXjcSm1ru5XJ+8UGoeh7KkckSH2ws83K5FWM/+XYvRDpfh6xnwg7
   g18EJglSyQxbBcX5rWQrhtDeqcULFoenYKRY+Shy69dvwvWv5RyzneLa8
   i5Fs5fVVUe7a4u7PqtjhLA93DvoTJ7keOYYP4gdWtxQeapOGtHbCkly9I
   g==;
X-CSE-ConnectionGUID: JzAAXKuQSEC4Tzxk+a+nng==
X-CSE-MsgGUID: WFekVcLcRxKSRLMM+Q9HtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53373329"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="53373329"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 16:43:04 -0700
X-CSE-ConnectionGUID: m2O60cNASlipTnztUvc2bg==
X-CSE-MsgGUID: 4k/IXgdbQv6+NtWf8J3f4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="156946019"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 16:42:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUwF7-000Vde-0V;
	Thu, 26 Jun 2025 23:42:57 +0000
Date: Fri, 27 Jun 2025 07:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Hui Pu <Hui.Pu@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 22/32] drm: renesas: rz-du: rzg2l_mipi_dsi: convert to
 the .attach_new op
Message-ID: <202506270718.iCW6cHYD-lkp@intel.com>
References: <20250625-drm-dsi-host-no-device-ptr-v1-22-e36bc258a7c5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-drm-dsi-host-no-device-ptr-v1-22-e36bc258a7c5@bootlin.com>

Hi Luca,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1174bf15bd601f17556f721798cd9183e169549a]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Ceresoli/drm-mipi-dsi-add-sanity-check-of-lane-number-in-mipi_dsi_attach/20250626-005002
base:   1174bf15bd601f17556f721798cd9183e169549a
patch link:    https://lore.kernel.org/r/20250625-drm-dsi-host-no-device-ptr-v1-22-e36bc258a7c5%40bootlin.com
patch subject: [PATCH 22/32] drm: renesas: rz-du: rzg2l_mipi_dsi: convert to the .attach_new op
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250627/202506270718.iCW6cHYD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506270718.iCW6cHYD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270718.iCW6cHYD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/dma-mapping.h:5,
                    from drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:11:
   drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c: In function 'rzg2l_mipi_dsi_host_attach':
>> drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:712:33: error: 'device' undeclared (first use in this function)
     712 |                                 device->format);
         |                                 ^~~~~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:711:25: note: in expansion of macro 'dev_err'
     711 |                         dev_err(dsi->dev, "Unsupported format 0x%04x\n",
         |                         ^~~~~~~
   drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:712:33: note: each undeclared identifier is reported only once for each function it appears in
     712 |                                 device->format);
         |                                 ^~~~~~
   include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c:711:25: note: in expansion of macro 'dev_err'
     711 |                         dev_err(dsi->dev, "Unsupported format 0x%04x\n",
         |                         ^~~~~~~


vim +/device +712 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c

7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  686  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  687  /* -----------------------------------------------------------------------------
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  688   * Host setting
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  689   */
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  690  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  691  static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  692  				      const struct mipi_dsi_bus_fmt *bus_fmt)
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  693  {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  694  	struct rzg2l_mipi_dsi *dsi = host_to_rzg2l_mipi_dsi(host);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  695  	int ret;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  696  
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  697  	if (bus_fmt->lanes > dsi->num_data_lanes) {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  698  		dev_err(dsi->dev,
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  699  			"Number of lines of device (%u) exceeds host (%u)\n",
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  700  			bus_fmt->lanes, dsi->num_data_lanes);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  701  		return -EINVAL;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  702  	}
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  703  
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  704  	switch (mipi_dsi_pixel_format_to_bpp(bus_fmt->format)) {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  705  	case 24:
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09  706  		break;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  707  	case 18:
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  708  		break;
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09  709  	case 16:
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09  710  		if (!(dsi->info->features & RZ_MIPI_DSI_FEATURE_16BPP)) {
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09  711  			dev_err(dsi->dev, "Unsupported format 0x%04x\n",
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09 @712  				device->format);
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09  713  			return -EINVAL;
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09  714  		}
a56a6b81d80fdf drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Lad Prabhakar 2025-06-09  715  		break;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  716  	default:
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  717  		dev_err(dsi->dev, "Unsupported format 0x%04x\n", bus_fmt->format);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  718  		return -EINVAL;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  719  	}
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  720  
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  721  	dsi->lanes = bus_fmt->lanes;
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  722  	dsi->format = bus_fmt->format;
e8120e232c40c1 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c Luca Ceresoli 2025-06-25  723  	dsi->mode_flags = bus_fmt->mode_flags;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  724  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  725  	dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  726  						  1, 0);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  727  	if (IS_ERR(dsi->next_bridge)) {
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  728  		ret = PTR_ERR(dsi->next_bridge);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  729  		dev_err(dsi->dev, "failed to get next bridge: %d\n", ret);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  730  		return ret;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  731  	}
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  732  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  733  	drm_bridge_add(&dsi->bridge);
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  734  
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  735  	return 0;
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  736  }
7a043f978ed143 drivers/gpu/drm/rcar-du/rzg2l_mipi_dsi.c       Biju Das      2022-09-20  737  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
