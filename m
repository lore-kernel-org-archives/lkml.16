Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19831EF396
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 10:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745749356; cv=none; b=PWWV7LmoEhsNevB8bY9iKReXtiNaLDj1Nsqm0dqptoSG+IYZTM3cVGwWd4oxnM4JJ76BfV8LAIUcxYVyyppb4lBZ+TlDk36R8OAwNo0KTr4Rrw9sF8z5nZMxteP/FhicX2BnnJu0eru7okLytejjpXv8YEwG6gwD15GuZTTyl04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745749356; c=relaxed/simple;
	bh=wWeiUfIu7WBUlDRFnFPlieoNxj0f6cEU4fu1RaK7Tuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ih1G7zqkY6aA5rR5n8gb+GyT+QPbY2YiCpybf5khE4Ua0bLi8/mpkIELv4ImpkidHlaY8flY+BgJBy/Kbnxl6DgJ7SpQqzpQGKYSXf+BlcuD5ir63Im5t7oeg0vz4j2jpH7sFa5i0tQO/CgidBJyUT5NJnNLB9fUojy1mixJQAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C64Iidw8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C64Iidw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745749355; x=1777285355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wWeiUfIu7WBUlDRFnFPlieoNxj0f6cEU4fu1RaK7Tuk=;
  b=C64Iidw8+QcuCRr/Gc13nNfntfpwELEqxGS0F1AnzfGJCWPuCOobyTQF
   tA03M08YLffsu4aBj4feA8f1PiMS0eLGEd6wGB8dWzh6rsqEBV2VC5Wtk
   AMNkv5ov86oABcRRhmegFskoKVxcGN1ajneHFQVssLIyjztUVhrSbPRil
   wwGSfwnsV0X5RmdZEalRfqthetSJb8P0GC+szvpYOvLpcaRyvdNlGT3PB
   9e5bblvv/bUDtvndgNzVHgq5T1Gxzh+tth9GYX8/s+lk91bFb7XUHp5Z9
   B5+S4iuTjnculkUMA5mGnirUfOA2m2URhlIokLTW+zkDCqyfpYuwj8g+o
   w==;
X-CSE-ConnectionGUID: QiFTt9NmSqmy6kecbK74wg==
X-CSE-MsgGUID: PUXwQudhTcKa9MWuKYOpQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="34966754"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="34966754"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 03:22:34 -0700
X-CSE-ConnectionGUID: 7c45Uxn+QUWlAmiQQJCZ9A==
X-CSE-MsgGUID: QUKDlXb1RBaI3LjdD8b0YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="133252974"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Apr 2025 03:22:33 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8z9a-0006Er-1o;
	Sun, 27 Apr 2025 10:22:30 +0000
Date: Sun, 27 Apr 2025 18:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2168: warning: Function
 parameter or struct member 'AMDGPU_RAS_BLOCK__ANY' not described in 'if'
Message-ID: <202504271826.xy2fFO28-lkp@intel.com>
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
commit: e1ee2111ca48169a9fdc5075f7863f5d4d591e2f drm/amdgpu: Prefer RAS recovery for scheduler hang
date:   5 months ago
config: sparc-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250427/202504271826.xy2fFO28-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 10.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504271826.xy2fFO28-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504271826.xy2fFO28-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2168: warning: Function parameter or struct member 'AMDGPU_RAS_BLOCK__ANY' not described in 'if'
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2168: warning: expecting prototype for If the current interrupt is caused by a non(). Prototype was for if() instead


vim +2168 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c

  2148	
  2149	/* For the hardware that cannot enable bif ring for both ras_controller_irq
  2150	 * and ras_err_evnet_athub_irq ih cookies, the driver has to poll status
  2151	 * register to check whether the interrupt is triggered or not, and properly
  2152	 * ack the interrupt if it is there
  2153	 */
  2154	void amdgpu_ras_interrupt_fatal_error_handler(struct amdgpu_device *adev)
  2155	{
  2156		/* Fatal error events are handled on host side */
  2157		if (amdgpu_sriov_vf(adev))
  2158			return;
  2159		/**
  2160		 * If the current interrupt is caused by a non-fatal RAS error, skip
  2161		 * check for fatal error. For fatal errors, FED status of all devices
  2162		 * in XGMI hive gets set when the first device gets fatal error
  2163		 * interrupt. The error gets propagated to other devices as well, so
  2164		 * make sure to ack the interrupt regardless of FED status.
  2165		 */
  2166		if (!amdgpu_ras_get_fed_status(adev) &&
  2167		    amdgpu_ras_is_err_state(adev, AMDGPU_RAS_BLOCK__ANY))
> 2168			return;
  2169	
  2170		if (adev->nbio.ras &&
  2171		    adev->nbio.ras->handle_ras_controller_intr_no_bifring)
  2172			adev->nbio.ras->handle_ras_controller_intr_no_bifring(adev);
  2173	
  2174		if (adev->nbio.ras &&
  2175		    adev->nbio.ras->handle_ras_err_event_athub_intr_no_bifring)
  2176			adev->nbio.ras->handle_ras_err_event_athub_intr_no_bifring(adev);
  2177	}
  2178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
