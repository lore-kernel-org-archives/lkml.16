Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6C71B4F1F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 06:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438088; cv=none; b=KFL/r5GSJUeL0SxSpz4nszxRPS8vpGVuasaT9u8dl3skL1DYu72gfz5zYAOXKIniyYzjtnr4axb2V5q/oDa8T4I9Ism4nmT2J1pReGVmjPpeqPFKk8jDB7a3xKoWGOkutwbYWuTe1fuL+qF0+JnW0YWb4BAMot2YxchNJX2ptAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438088; c=relaxed/simple;
	bh=hMZ4282zP/9HuvYTYZaNGB5P3n+SJekOKkZamRjOEJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e4Hlyd104k1NDrfyt95XXHe0BW0rqHyXAf34TlrATMWjwGibHFZrEQX8UjDnXrMPQxsPZmAA8zKDz03+/J8JTjp65+Xd+rNddUabF7SBw24g9DllzrH1gBTf6jHjJkXtGyd0arFMnrAp74W7PrvRB0SEXGo4JrUKbLIgv+cUUOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCwkdvfQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCwkdvfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751438086; x=1782974086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hMZ4282zP/9HuvYTYZaNGB5P3n+SJekOKkZamRjOEJw=;
  b=jCwkdvfQaZ7/EXiTrvL33o7cUt4QwieHJCtIF0rh7zAzvBcZF/uJVr/b
   oSd5eWXzkcZbghGK8aJGtShww1OCGNrQMmIH032pnq9/Jma90j5GOO/5y
   qbpNpRbZhckS0UucVQ1xVdpEQZY+rE/ooWV98PzeFYt3bsQ82R+XG9lyP
   1xWKB6zQ1q4xOrZIZ+EjzaWjn4LtWDlC0FULkGQwH4ynU4KPdf33xCbAK
   vX2I9ws/qO7c+kTEhRFAN1O2RYA/dohMNM/V+sTpFzdSEU8NZ70GGzRY/
   JHBf1WvzB3oVXGspW16abUrrFoCX/j/6I5r/uAGX7HJy4YOE7gkeP3nOM
   g==;
X-CSE-ConnectionGUID: Hiu1uldyRNaU2I+/tqimGg==
X-CSE-MsgGUID: VIvciFTUQouwmjD+D3IvFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="52952517"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="52952517"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 23:34:45 -0700
X-CSE-ConnectionGUID: Hn/PqNkoQmKfqs1+lkfu1w==
X-CSE-MsgGUID: yanwPjBFQRCnQ9a08djl4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153390776"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2025 23:34:41 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWr3G-0000G6-2m;
	Wed, 02 Jul 2025 06:34:38 +0000
Date: Wed, 2 Jul 2025 14:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Levi Yun <yeoreum.yun@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
Subject: Re: [PATCH v2 11/28] coresight: Populate CPU ID into the
 coresight_device structure
Message-ID: <202507021422.Zj4Hv0CG-lkp@intel.com>
References: <20250701-arm_cs_pm_fix_v3-v2-11-23ebb864fcc1@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701-arm_cs_pm_fix_v3-v2-11-23ebb864fcc1@arm.com>

Hi Leo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 66701750d5565c574af42bef0b789ce0203e3071]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-Yan/coresight-Change-device-mode-to-atomic-type/20250701-230354
base:   66701750d5565c574af42bef0b789ce0203e3071
patch link:    https://lore.kernel.org/r/20250701-arm_cs_pm_fix_v3-v2-11-23ebb864fcc1%40arm.com
patch subject: [PATCH v2 11/28] coresight: Populate CPU ID into the coresight_device structure
config: arm-randconfig-004-20250702 (https://download.01.org/0day-ci/archive/20250702/202507021422.Zj4Hv0CG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021422.Zj4Hv0CG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021422.Zj4Hv0CG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwtracing/coresight/coresight-dummy.c:182:11: error: incompatible integer to pointer conversion assigning to 'struct device *' from 'int' [-Wint-conversion]
     182 |         desc.dev = -1;
         |                  ^ ~~
   1 error generated.


vim +182 drivers/hwtracing/coresight/coresight-dummy.c

   113	
   114	static int dummy_probe(struct platform_device *pdev)
   115	{
   116		struct device *dev = &pdev->dev;
   117		struct device_node *node = dev->of_node;
   118		struct coresight_platform_data *pdata;
   119		struct dummy_drvdata *drvdata;
   120		struct coresight_desc desc = { 0 };
   121		int ret = 0, trace_id = 0;
   122	
   123		drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
   124		if (!drvdata)
   125			return -ENOMEM;
   126	
   127		if (of_device_is_compatible(node, "arm,coresight-dummy-source")) {
   128	
   129			desc.name = coresight_alloc_device_name(&source_devs, dev);
   130			if (!desc.name)
   131				return -ENOMEM;
   132	
   133			desc.type = CORESIGHT_DEV_TYPE_SOURCE;
   134			desc.subtype.source_subtype =
   135						CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS;
   136			desc.ops = &dummy_source_cs_ops;
   137			desc.groups = coresight_dummy_groups;
   138	
   139			ret = coresight_get_static_trace_id(dev, &trace_id);
   140			if (!ret) {
   141				/* Get the static id if id is set in device tree. */
   142				ret = coresight_trace_id_get_static_system_id(trace_id);
   143				if (ret < 0) {
   144					dev_err(dev, "Fail to get static id.\n");
   145					return ret;
   146				}
   147			} else {
   148				/* Get next available id if id is not set in device tree. */
   149				trace_id = coresight_trace_id_get_system_id();
   150				if (trace_id < 0) {
   151					ret = trace_id;
   152					return ret;
   153				}
   154			}
   155			drvdata->traceid = (u8)trace_id;
   156	
   157		} else if (of_device_is_compatible(node, "arm,coresight-dummy-sink")) {
   158			desc.name = coresight_alloc_device_name(&sink_devs, dev);
   159			if (!desc.name)
   160				return -ENOMEM;
   161	
   162			desc.type = CORESIGHT_DEV_TYPE_SINK;
   163			desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_DUMMY;
   164			desc.ops = &dummy_sink_cs_ops;
   165		} else {
   166			dev_err(dev, "Device type not set\n");
   167			return -EINVAL;
   168		}
   169	
   170		pdata = coresight_get_platform_data(dev);
   171		if (IS_ERR(pdata)) {
   172			ret = PTR_ERR(pdata);
   173			goto free_id;
   174		}
   175		pdev->dev.platform_data = pdata;
   176	
   177		drvdata->dev = &pdev->dev;
   178		platform_set_drvdata(pdev, drvdata);
   179	
   180		desc.pdata = pdev->dev.platform_data;
   181		desc.dev = &pdev->dev;
 > 182		desc.dev = -1;
   183		drvdata->csdev = coresight_register(&desc);
   184		if (IS_ERR(drvdata->csdev)) {
   185			ret = PTR_ERR(drvdata->csdev);
   186			goto free_id;
   187		}
   188	
   189		pm_runtime_enable(dev);
   190		dev_dbg(dev, "Dummy device initialized\n");
   191	
   192		ret = 0;
   193		goto out;
   194	
   195	free_id:
   196		if (IS_VALID_CS_TRACE_ID(drvdata->traceid))
   197			coresight_trace_id_put_system_id(drvdata->traceid);
   198	
   199	out:
   200		return ret;
   201	}
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
