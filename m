Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7800F43ABC;
	Sun, 27 Apr 2025 06:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734522; cv=none; b=RWX0269BrsCsdK18gKL5iKJBLHrDTomyuOE0HV6Z6Ou+saclmkTd6Fmm+X1EYWeoaREOerHIaq5VgrPYr6oAEuletEjwzWeRJ19Qv+lDZUZb4r3eE1bLz8GTzk1L1ys7icOQQyyPCfiAoPd25GS0HOs7ye7/YfmkIiwOwZnm3HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734522; c=relaxed/simple;
	bh=Spv2kcfLKKvB3c9NmgCG1sn10fxF0SOsf1c+Sb8hYjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gHhT5KZg0jHDFrz2yzC0x0AZuk0nEXfXZBjXPwpKli4yvzC+GiCBdIsGIwHplMcXHUdXG/H9Y4lm8FUNaWiJaTzXsFDBo4O4TfVl/QeoAvDr7gNL4jqgEJ339dKGr+IEY7xWYeP4tDIypDMUWVmgBoDJu9eBdhX1ATNbi8Zdi3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACX3Y4pg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACX3Y4pg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745734520; x=1777270520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Spv2kcfLKKvB3c9NmgCG1sn10fxF0SOsf1c+Sb8hYjM=;
  b=ACX3Y4pgjVqq7uwoILfUjuRA7VVTp3MrszY2CRTv0z1HESkingu8YP7n
   bNvaXRZetYqJMGCgS96J7kJG+Cb2wmUzeEyTTSGmuPF2taIFMqZAgTIbP
   BtCy/eTDtvHBhSD00TkGpiIMTYzBnxOrQsnVWRO7rhI4vosBp8oOp1X/L
   a3LUIuKMjapFVeijOz0llpTJ+CFEys8CRiFotXPaEyS8M9Vj4LRBmpntB
   txpvgZ2M5I3t2J+r6+Cw3eiunJ+DHqcRDX1W1Iy1mIDZnA0ZOSIins2lR
   7G2yhrDJIZ8R8QXiJ8+Po/IUJhgdgIHyHHVA333giHQ4ZSCaIo9TKFIcD
   Q==;
X-CSE-ConnectionGUID: Fxnpy3fbSYaL+v6zeWa6pg==
X-CSE-MsgGUID: br/lO/bPQDKAXM7KCC/RCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="46578507"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="46578507"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 23:15:18 -0700
X-CSE-ConnectionGUID: mRi7tWCUQTGA35hwXdMYIw==
X-CSE-MsgGUID: ZGNuoRJGTOGcBShz+Ebfmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="138331905"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Apr 2025 23:15:16 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8vII-000691-1n;
	Sun, 27 Apr 2025 06:15:14 +0000
Date: Sun, 27 Apr 2025 14:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Kenneth Feng <kenneth.feng@amd.com>, linux-doc@vger.kernel.org
Subject: drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.c:1348:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202504271422.D6cqMlZ0-lkp@intel.com>
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
commit: da868898cf4c5ddbd1f7406e356edce5d7211eb5 drm/amd/pm: Remove arcturus min power limit
date:   5 months ago
config: sparc-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250427/202504271422.D6cqMlZ0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 10.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504271422.D6cqMlZ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504271422.D6cqMlZ0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.c:1348: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * No lower bound is imposed on the limit. Any unreasonable limit set


vim +1348 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.c

  1321	
  1322	static int arcturus_get_power_limit(struct smu_context *smu,
  1323						uint32_t *current_power_limit,
  1324						uint32_t *default_power_limit,
  1325						uint32_t *max_power_limit,
  1326						uint32_t *min_power_limit)
  1327	{
  1328		PPTable_t *pptable = smu->smu_table.driver_pptable;
  1329		uint32_t power_limit;
  1330	
  1331		if (smu_v11_0_get_current_power_limit(smu, &power_limit)) {
  1332			/* the last hope to figure out the ppt limit */
  1333			if (!pptable) {
  1334				dev_err(smu->adev->dev, "Cannot get PPT limit due to pptable missing!");
  1335				return -EINVAL;
  1336			}
  1337			power_limit =
  1338				pptable->SocketPowerLimitAc[PPT_THROTTLER_PPT0];
  1339		}
  1340	
  1341		if (current_power_limit)
  1342			*current_power_limit = power_limit;
  1343		if (default_power_limit)
  1344			*default_power_limit = power_limit;
  1345		if (max_power_limit)
  1346			*max_power_limit = power_limit;
  1347		/**
> 1348		 * No lower bound is imposed on the limit. Any unreasonable limit set
  1349		 * will result in frequent throttling.
  1350		 */
  1351		if (min_power_limit)
  1352			*min_power_limit = 0;
  1353	
  1354		return 0;
  1355	}
  1356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
