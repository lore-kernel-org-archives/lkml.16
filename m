Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B333139D0A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 03:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751686046; cv=none; b=HexN6LW0Nwhnv4LWOJJRcSk1yJ/0QabWLjIgG8q2ZcYj9hBsQjDelNfJ3PuLZU+9oUrXSe1oIyC61SPRIwrHiVgC4CC9W0XxuTJWT6VlF+WoaaDxFi32yBEdQIXvTEaToMva1rCOfwzBp3RMQQFZlWgiaiArWmxW+uDM3hja9T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751686046; c=relaxed/simple;
	bh=rz1YPfn+Xyf97OsN+1k8HXgq3rfV0JI8jj2cnO+tzg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iMXrh05E+edEJD7pVQOc6PZkCAaCqMSyITUA03uVykhPqT5v0kPN1jgXMrnR5pwhP0vg5HOuM25CtZ8T4iiCErh2rtszqzKtxU9hb0qgeLwpFdS5T6szkZR0ZZyEG0JpSbGJwtKt5H3nY4eS2nxWX54rrjyAtLkCjmZhSjcQcQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dCY2LoA8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dCY2LoA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751686045; x=1783222045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rz1YPfn+Xyf97OsN+1k8HXgq3rfV0JI8jj2cnO+tzg8=;
  b=dCY2LoA8XfQSqx3oUwo0P97Ep1mdCWlYZQx29DF52JEppfSVwxdmdjcV
   K6CjbUZmHYyTBcfdjuoh0mimLrCLYi+CArl7x6C+/yZrRIPGWcO8/BdsI
   0V5IBx5AB3QMmFBQE4ucBPpUoRleZ102uptoC83me7lNVgYcp1KBl715E
   7+7hazgecmiSBalAR8MpSSCh3/xWpjOkdkrCZ1JHY9F/cDhY/w+qZvfFb
   n5VWephGwDMfFw0+oDeSMbhTl9O/2jre2dV0KZOMwJ2GaWZo2fVCTmWjf
   nrwEgjItRWyJEJyJ90kVMXBHRt7j2jRCmvOGSpcYvSozxfP25A+ZbS/+Q
   w==;
X-CSE-ConnectionGUID: qTbIRxLlQcOg21gdy5hYkg==
X-CSE-MsgGUID: hHTssmoPR+Gw5liNkIW1hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53866595"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="53866595"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 20:27:25 -0700
X-CSE-ConnectionGUID: YzEkqh/bRsiuAtOhpEsjAg==
X-CSE-MsgGUID: eh3wVBO0QpuriMgRp2TlYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="155237758"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 04 Jul 2025 20:27:23 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXtYe-0000lV-27;
	Sat, 05 Jul 2025 03:27:20 +0000
Date: Sat, 5 Jul 2025 05:26:31 +0200
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
Subject: drivers/gpu/drm/vc4/vc4_drv.c:303:8: warning: cast to smaller
 integer type 'enum vc4_gen' from 'const void *'
Message-ID: <202507050513.zh0Xm13T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a79a588fc1761dc12a3064fc2f648ae66cea3c5a
commit: 56aa4c374dbf86d90b7c5aabdc8facbdd3321477 drm/vc4: Use of_device_get_match_data to set generation
date:   7 months ago
config: x86_64-buildonly-randconfig-2001-20250705 (https://download.01.org/0day-ci/archive/20250705/202507050513.zh0Xm13T-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507050513.zh0Xm13T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507050513.zh0Xm13T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/vc4/vc4_drv.c:27:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/vc4/vc4_drv.c:303:8: warning: cast to smaller integer type 'enum vc4_gen' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     303 |         gen = (enum vc4_gen)of_device_get_match_data(dev);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +303 drivers/gpu/drm/vc4/vc4_drv.c

   288	
   289	static int vc4_drm_bind(struct device *dev)
   290	{
   291		struct platform_device *pdev = to_platform_device(dev);
   292		const struct drm_driver *driver;
   293		struct rpi_firmware *firmware = NULL;
   294		struct drm_device *drm;
   295		struct vc4_dev *vc4;
   296		struct device_node *node;
   297		struct drm_crtc *crtc;
   298		enum vc4_gen gen;
   299		int ret = 0;
   300	
   301		dev->coherent_dma_mask = DMA_BIT_MASK(32);
   302	
 > 303		gen = (enum vc4_gen)of_device_get_match_data(dev);
   304	
   305		if (gen > VC4_GEN_4)
   306			driver = &vc5_drm_driver;
   307		else
   308			driver = &vc4_drm_driver;
   309	
   310		node = of_find_matching_node_and_match(NULL, vc4_dma_range_matches,
   311						       NULL);
   312		if (node) {
   313			ret = of_dma_configure(dev, node, true);
   314			of_node_put(node);
   315	
   316			if (ret)
   317				return ret;
   318		}
   319	
   320		vc4 = devm_drm_dev_alloc(dev, driver, struct vc4_dev, base);
   321		if (IS_ERR(vc4))
   322			return PTR_ERR(vc4);
   323		vc4->gen = gen;
   324		vc4->dev = dev;
   325	
   326		drm = &vc4->base;
   327		platform_set_drvdata(pdev, drm);
   328	
   329		if (gen == VC4_GEN_4) {
   330			ret = drmm_mutex_init(drm, &vc4->bin_bo_lock);
   331			if (ret)
   332				goto err;
   333	
   334			ret = vc4_bo_cache_init(drm);
   335			if (ret)
   336				goto err;
   337		}
   338	
   339		ret = drmm_mode_config_init(drm);
   340		if (ret)
   341			goto err;
   342	
   343		if (gen == VC4_GEN_4) {
   344			ret = vc4_gem_init(drm);
   345			if (ret)
   346				goto err;
   347		}
   348	
   349		node = of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-firmware");
   350		if (node) {
   351			firmware = rpi_firmware_get(node);
   352			of_node_put(node);
   353	
   354			if (!firmware) {
   355				ret = -EPROBE_DEFER;
   356				goto err;
   357			}
   358		}
   359	
   360		ret = aperture_remove_all_conflicting_devices(driver->name);
   361		if (ret)
   362			goto err;
   363	
   364		if (firmware) {
   365			ret = rpi_firmware_property(firmware,
   366						    RPI_FIRMWARE_NOTIFY_DISPLAY_DONE,
   367						    NULL, 0);
   368			if (ret)
   369				drm_warn(drm, "Couldn't stop firmware display driver: %d\n", ret);
   370	
   371			rpi_firmware_put(firmware);
   372		}
   373	
   374		ret = component_bind_all(dev, drm);
   375		if (ret)
   376			goto err;
   377	
   378		ret = devm_add_action_or_reset(dev, vc4_component_unbind_all, vc4);
   379		if (ret)
   380			goto err;
   381	
   382		ret = vc4_plane_create_additional_planes(drm);
   383		if (ret)
   384			goto err;
   385	
   386		ret = vc4_kms_load(drm);
   387		if (ret < 0)
   388			goto err;
   389	
   390		drm_for_each_crtc(crtc, drm)
   391			vc4_crtc_disable_at_boot(crtc);
   392	
   393		ret = drm_dev_register(drm, 0);
   394		if (ret < 0)
   395			goto err;
   396	
   397		drm_client_setup_with_fourcc(drm, DRM_FORMAT_RGB565);
   398	
   399		return 0;
   400	
   401	err:
   402		platform_set_drvdata(pdev, NULL);
   403		return ret;
   404	}
   405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
