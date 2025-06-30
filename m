Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881EF23B60B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751274874; cv=none; b=OU10kMMOvhEH+LZLsPxxAfcdDEf7Nn3Tni2nI/XymvIJekQ9mDPGAC/wEKopsi60pF/OzBgGghkbHIOB5UnQ4AKVjBWeOVgkVOm91aMQ71NJX5J5wFprme9K6DLnSoivRsLjW7dCtItrf3BpV2hwupeAjd7q1WjuhQXduVRPWqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751274874; c=relaxed/simple;
	bh=rFayIIMOUYbkVv7zI0CbaHxqK0kRCx/yVJvyT7iPOzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=msIuH+I5wanG7/XLdpqjfahoHSHjDAt0XVhdy9D4+gJEizh9jn41K/s9HZtIMhRsonGoFmZ6clk/YoSb7S6IJTZWMYODkegBnmzbyjHuAP7Oeqmjivhyk+Upk4fs/eKx8dFhO/jwPGpzDOzgzImbItQEgSTDUtokDICTIcweKk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d1FDKbpB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d1FDKbpB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751274873; x=1782810873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rFayIIMOUYbkVv7zI0CbaHxqK0kRCx/yVJvyT7iPOzs=;
  b=d1FDKbpBBiQtcubXwXn36QW3PTX8mA5TWJEbcXA2tLWGF4XztK9mSSOl
   Ymlf1neZV/eAQ1DzjhTYOPqrBDFICGCUaycZShnbTNkPVK3EgX2FP/2wy
   fC/WZ3p8ZYQYlxQCmbVrfWEXWi6EXH0mo0YdxbaTdc6Iuu56RagXL/vR4
   sUMU7RH6q2Yq9tszBE/ncKmoxS64roolxMe5WOi184LwSd6VYMago/mZS
   7jNpL26mecp9q8Nfeu18NBmY8qV6gxKGeBCng+vT7uzIRem9ztvS2QbCw
   zc531LRpZxDL5C0gw3V9PW/4ssWP8uYOH2MY9hxf0OcR1fudIfh6dhMEd
   g==;
X-CSE-ConnectionGUID: QgRu7hoISD60/FKuCv5LaA==
X-CSE-MsgGUID: cdS2mCawSn6NsPy7N+I2ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="41121638"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="41121638"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:14:32 -0700
X-CSE-ConnectionGUID: Qkx+bKF7QoWNF7Mv+c/16Q==
X-CSE-MsgGUID: TUpvql7vRKCTdFXF89tfcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153037322"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jun 2025 02:14:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWAaq-000Yir-1W;
	Mon, 30 Jun 2025 09:14:28 +0000
Date: Mon, 30 Jun 2025 17:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: drivers/gpu/drm/bridge/ti-sn65dsi86.c:1376:2-3: Unneeded semicolon
Message-ID: <202506301704.0SBj6ply-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
commit: 55e8ff842051b1150461d7595d8f1d033c69d66b drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort connector type
date:   5 days ago
config: s390-randconfig-r061-20250630 (https://download.01.org/0day-ci/archive/20250630/202506301704.0SBj6ply-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301704.0SBj6ply-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/bridge/ti-sn65dsi86.c:1376:2-3: Unneeded semicolon

vim +1376 drivers/gpu/drm/bridge/ti-sn65dsi86.c

  1334	
  1335	static int ti_sn_bridge_probe(struct auxiliary_device *adev,
  1336				      const struct auxiliary_device_id *id)
  1337	{
  1338		struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
  1339		struct device_node *np = pdata->dev->of_node;
  1340		int ret;
  1341	
  1342		pdata->next_bridge = devm_drm_of_get_bridge(&adev->dev, np, 1, 0);
  1343		if (IS_ERR(pdata->next_bridge))
  1344			return dev_err_probe(&adev->dev, PTR_ERR(pdata->next_bridge),
  1345					     "failed to create panel bridge\n");
  1346	
  1347		ti_sn_bridge_parse_lanes(pdata, np);
  1348	
  1349		ret = ti_sn_bridge_parse_dsi_host(pdata);
  1350		if (ret)
  1351			return ret;
  1352	
  1353		pdata->bridge.of_node = np;
  1354		pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
  1355				   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
  1356	
  1357		if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort) {
  1358			pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT |
  1359					    DRM_BRIDGE_OP_HPD;
  1360			/*
  1361			 * If comms were already enabled they would have been enabled
  1362			 * with the wrong value of HPD_DISABLE. Update it now. Comms
  1363			 * could be enabled if anyone is holding a pm_runtime reference
  1364			 * (like if a GPIO is in use). Note that in most cases nobody
  1365			 * is doing AUX channel xfers before the bridge is added so
  1366			 * HPD doesn't _really_ matter then. The only exception is in
  1367			 * the eDP case where the panel wants to read the EDID before
  1368			 * the bridge is added. We always consistently have HPD disabled
  1369			 * for eDP.
  1370			 */
  1371			mutex_lock(&pdata->comms_mutex);
  1372			if (pdata->comms_enabled)
  1373				regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
  1374						   HPD_DISABLE, 0);
  1375			mutex_unlock(&pdata->comms_mutex);
> 1376		};
  1377	
  1378		drm_bridge_add(&pdata->bridge);
  1379	
  1380		ret = ti_sn_attach_host(adev, pdata);
  1381		if (ret) {
  1382			dev_err_probe(&adev->dev, ret, "failed to attach dsi host\n");
  1383			goto err_remove_bridge;
  1384		}
  1385	
  1386		return 0;
  1387	
  1388	err_remove_bridge:
  1389		drm_bridge_remove(&pdata->bridge);
  1390		return ret;
  1391	}
  1392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
