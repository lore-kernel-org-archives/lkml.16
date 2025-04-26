Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2271F2192FB;
	Sat, 26 Apr 2025 11:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745665680; cv=none; b=SnNVxEFAs6iqw6iMXnawBBeeoUxvJxbZ7irhU6GpzGPrSlVF2p7ply1COF4eRcTRW/ZiwsxaUeYe4FjVuXGSNdtE42MOWgZlwXWxeNfBRAHakQebf0qJi75K8h0V/0fPZQ8askS2AGvRxSvlHYHZPmq8zp+VWOpjevzNKDui9fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745665680; c=relaxed/simple;
	bh=lgM9lKDA8rXLN2ProkHBJJW87XSvYYwrYohgNWkw4uE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ezWyxTGNRe3FSQIZ27FK7QXS5OAvk8+XbBdXuzhYbW982ThfA6vGV2+j5yr5nRZwSjNfgt2jo1WHZ0EpuWyeQwLSL+diPnFDCBClJhz+87dPQ0TwpCldnxJ2NKVRbab2zJHvM5Acul5PkgVLQYO0461T82l05tyBiL/iqQ7+Adw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+kzRR2C; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+kzRR2C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745665678; x=1777201678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lgM9lKDA8rXLN2ProkHBJJW87XSvYYwrYohgNWkw4uE=;
  b=m+kzRR2CybsShQOCMEQE0G2qvYtE/Um8RDffLdZ9waCXgGunyTM9snu8
   icDAbgvxfUj5M+nKVOu6PZDmIGso86QnNLLjvatGci5pmTjGQXRj8S7TT
   3bOmv0zp9y+mJ4J4ollvA6Gs+LVtaLCbpcqX8iuZ41kzexjNrlhquZvsR
   Q8j2Fmb+CkmNZndtVo7L4q3ZFIM/PDfVd5wrF0Z69iXecYVAq3bPt+tRH
   Rff1kXakxttPp6HTXL/LbODsWgp8+1UaZzDeFqmcMkHwWga3zWYnVnrOK
   I0KjOgCiDCRvYX9T15h54nPiH9b7CR+SXknIXV+t02HySYqmRYmDdjdiF
   A==;
X-CSE-ConnectionGUID: Ha4mb05gS4GlhiuFXNDang==
X-CSE-MsgGUID: 9jW+a1+7RcK8axDM5XXEqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="57959550"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="57959550"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 04:07:58 -0700
X-CSE-ConnectionGUID: 0+p5mDh/RwW0OsJZnsDSSA==
X-CSE-MsgGUID: ++9O1RJFTXuK2JKVTnOT0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="156336886"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Apr 2025 04:07:56 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8dNx-0005oE-2C;
	Sat, 26 Apr 2025 11:07:53 +0000
Date: Sat, 26 Apr 2025 19:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-doc@vger.kernel.org
Subject: sound/soc/codecs/wsa883x.c:1402: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202504261851.TJGZIvtl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 1cf3295bd108abbd7f128071ae9775fd18394ca9 ASoC: codecs: wsa883x: parse port-mapping information
date:   10 months ago
config: sh-randconfig-002-20250426 (https://download.01.org/0day-ci/archive/20250426/202504261851.TJGZIvtl-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504261851.TJGZIvtl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504261851.TJGZIvtl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/wsa883x.c:1402: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * Port map index starts with 0, however the data port for this codec


vim +1402 sound/soc/codecs/wsa883x.c

  1364	
  1365	static int wsa883x_probe(struct sdw_slave *pdev,
  1366				 const struct sdw_device_id *id)
  1367	{
  1368		struct wsa883x_priv *wsa883x;
  1369		struct device *dev = &pdev->dev;
  1370		int ret;
  1371	
  1372		wsa883x = devm_kzalloc(dev, sizeof(*wsa883x), GFP_KERNEL);
  1373		if (!wsa883x)
  1374			return -ENOMEM;
  1375	
  1376		wsa883x->vdd = devm_regulator_get(dev, "vdd");
  1377		if (IS_ERR(wsa883x->vdd))
  1378			return dev_err_probe(dev, PTR_ERR(wsa883x->vdd),
  1379					     "No vdd regulator found\n");
  1380	
  1381		ret = regulator_enable(wsa883x->vdd);
  1382		if (ret)
  1383			return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
  1384	
  1385		wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
  1386							GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
  1387		if (IS_ERR(wsa883x->sd_n)) {
  1388			ret = dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),
  1389					    "Shutdown Control GPIO not found\n");
  1390			goto err;
  1391		}
  1392	
  1393		dev_set_drvdata(dev, wsa883x);
  1394		wsa883x->slave = pdev;
  1395		wsa883x->dev = dev;
  1396		wsa883x->sconfig.ch_count = 1;
  1397		wsa883x->sconfig.bps = 1;
  1398		wsa883x->sconfig.direction = SDW_DATA_DIR_RX;
  1399		wsa883x->sconfig.type = SDW_STREAM_PDM;
  1400	
  1401		/**
> 1402		 * Port map index starts with 0, however the data port for this codec
  1403		 * are from index 1
  1404		 */
  1405		if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
  1406						WSA883X_MAX_SWR_PORTS))
  1407			dev_dbg(dev, "Static Port mapping not specified\n");
  1408	
  1409		pdev->prop.sink_ports = GENMASK(WSA883X_MAX_SWR_PORTS, 0);
  1410		pdev->prop.simple_clk_stop_capable = true;
  1411		pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
  1412		pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
  1413		gpiod_direction_output(wsa883x->sd_n, 0);
  1414	
  1415		wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
  1416		if (IS_ERR(wsa883x->regmap)) {
  1417			gpiod_direction_output(wsa883x->sd_n, 1);
  1418			ret = dev_err_probe(dev, PTR_ERR(wsa883x->regmap),
  1419					    "regmap_init failed\n");
  1420			goto err;
  1421		}
  1422		pm_runtime_set_autosuspend_delay(dev, 3000);
  1423		pm_runtime_use_autosuspend(dev);
  1424		pm_runtime_mark_last_busy(dev);
  1425		pm_runtime_set_active(dev);
  1426		pm_runtime_enable(dev);
  1427	
  1428		ret = devm_snd_soc_register_component(dev,
  1429						      &wsa883x_component_drv,
  1430						       wsa883x_dais,
  1431						       ARRAY_SIZE(wsa883x_dais));
  1432	err:
  1433		if (ret)
  1434			regulator_disable(wsa883x->vdd);
  1435	
  1436		return ret;
  1437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
