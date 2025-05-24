Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE26C63CF
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 04:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748061011; cv=none; b=Pd7QGOxwGVlduZZ57zFwE9/ZPU3Q3nmoWIOxGVjysWS7+PrRTLg4jTtlqMz762ZVYzRGCi4oWlcEmSaYSfsWx+rqpPOlvjsElaXmZ8L5wkysFKaL2JCAvAvTrNeRlhmrNanX11UYDRGCMRKoS0SFc3ZY9cF5mhPx3r3+GZscrrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748061011; c=relaxed/simple;
	bh=lmioRTC+vWdchSKwww8oJ8zM6TW/i18Dpt27s0mNqB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cnkBiRV/J4F4ky86bKnQdqihTfu/Utqli581TxnsH74kB1JlYlMLpHnZjtwTgalDMtMQT89mjjXkoNd/QTi+WQcvOHP+x/utf71TdkjOvvUfV0VCwnZVA5imk4hiTKTnyt+q+bRozuQ/nPexFDAV99lQxVGn4Zkn8JVaWh5Yz8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMjHREVn; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMjHREVn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748061009; x=1779597009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lmioRTC+vWdchSKwww8oJ8zM6TW/i18Dpt27s0mNqB4=;
  b=MMjHREVnhmsM7rLQDSjG29rfLYESjsAjgYodAb9kWwpM2+AJMAFfuTLx
   W/i7uESyT5+LcKaCLaPnUMOaa1v3vMFpTnqvi7uMDMTilakzZG0tzU7jm
   IgGL0Cu2lGn5RvP1/Fh8H0+kZgQhkjqe8vrEmKs2t65Pu6DXouSEucilv
   mLZOo58ahxYEgH4Y7kRereQEfSe64EEtmmUUiwRvFT81AK7btM+xBaoLO
   BaFK/wlLB2OrpE+JZsT90DJusRkAAV8fQ9lBNG3tGpiuTZxb8UX7Xp/7s
   gXEXaV/eDQzGktSW+TnSdB8BLsVzU6e2sDxNKKvYH0Qe6GZUqN3SCo0St
   w==;
X-CSE-ConnectionGUID: 3baE+FOxR7KcuqjRNbOwfw==
X-CSE-MsgGUID: KjFV3kKnTYWX/Cc7LC0RJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53924050"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="53924050"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 21:30:09 -0700
X-CSE-ConnectionGUID: ZQ2VdN/YSCaZIOgrxE4LGQ==
X-CSE-MsgGUID: 8xuFLMeuRy+ygcN15LXCYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="142370336"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa008.jf.intel.com with ESMTP; 23 May 2025 21:30:07 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIgWL-0001bM-1C;
	Sat, 24 May 2025 04:30:05 +0000
Date: Sat, 24 May 2025 12:30:01 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
Subject: drivers/gpu/drm/vc4/vc4_drv.c:303:8: warning: cast to smaller
 integer type 'enum vc4_gen' from 'const void *'
Message-ID: <202505241244.A9oll6Fa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4856ebd997159f198e3177e515bda01143727463
commit: 56aa4c374dbf86d90b7c5aabdc8facbdd3321477 drm/vc4: Use of_device_get_match_data to set generation
date:   6 months ago
config: x86_64-buildonly-randconfig-2001-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241244.A9oll6Fa-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241244.A9oll6Fa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241244.A9oll6Fa-lkp@intel.com/

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
