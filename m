Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0528A3597A
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751111638; cv=none; b=GCIZSGG5lqbiEJcAWO1UeXnTfKb334B17UsRfDzeMFnG+CKjSVQ8sOrx+7ZesVwOoLQ+e/ihr2/0JiuIMJwHLw6M6tJwPI810cpRkXt9w+Z5P9wFg2FdHbdcdygOqeN9SIaKcfyaSIiIV9QN08zz5L54RdcHMoaUCeea2+sJKFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751111638; c=relaxed/simple;
	bh=xwv5jiy+EXKIkVhrEknvWrLGc+msBCiz7BmfstXnQWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qUtyxV+P3GT5fgfmYJ9Sg4soDLw8uyi630tsinrTLYbJF/gvr8lRSQPuQg0BtmshDNkpq6vO0t3MmqALSPQ7d9exbY3KRwpnkACO0M5KPKZeqeevzvsNNJYlqbyFdYU+iryjcIdCFfiKBu3HWVx3TG3ivhNs23P8MWBTAUgOknQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gB2HFbtX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gB2HFbtX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751111637; x=1782647637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xwv5jiy+EXKIkVhrEknvWrLGc+msBCiz7BmfstXnQWo=;
  b=gB2HFbtXSpYuEeUyPee4Vg8imcrzkpfgPc4+wMANAaYbjsKih08dYyhG
   9cr+kzVXrToQYsGK1JDU+v8iLVLi0DQN8YQqFlX4nBpuG0p3vJbc6GAin
   wa1zCFWd4K/CZX/j3n3Vu+xbvgwJrY+KYmN82OuUlby/Z76mIguU9HCHC
   1UiBUul8LP8SeDx2Hr1DP8HNcuxDYCM1ePUIjgpEzPHwr+ykZuFe0akya
   j1vt6YTQzu+OQmW+vEkX5WvDjtZSElu1tTSh77cUb91ZmRdyhvzJPXTJK
   orDLTP7BaLDnxzy3YESJ5y6ybxqFeFPrfhlRrIfMCgoAwdbyZWVbY7gSu
   A==;
X-CSE-ConnectionGUID: opA21JokS0m7Blmbz6yY8w==
X-CSE-MsgGUID: 2iCZK7lFSt2B2BJn9gMnwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="57208756"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="57208756"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 04:53:56 -0700
X-CSE-ConnectionGUID: IfozoqW/QaKlbrwu7wcHSw==
X-CSE-MsgGUID: 0g5A241UTL+PXoWTdar30g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="184060518"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Jun 2025 04:53:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVU80-000X1a-1d;
	Sat, 28 Jun 2025 11:53:52 +0000
Date: Sat, 28 Jun 2025 19:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: Lijo Lazar <lijo.lazar@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>, Ce Sun <cesun102@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:6088:8-9: Unneeded
 variable: "r". Return "0" on line 6141
Message-ID: <202506281925.HHIpXiO7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aaf724ed69264719550ec4f194d3ab17b886af9a
commit: 785c536c31c0bb057252fddedb30d79ae4979f4b drm/amdgpu: Release reset locks during failures
date:   10 days ago
config: x86_64-randconfig-102-20250628 (https://download.01.org/0day-ci/archive/20250628/202506281925.HHIpXiO7-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506281925.HHIpXiO7-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:6088:8-9: Unneeded variable: "r". Return "0" on line 6141

vim +6088 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

  6080	
  6081	static int amdgpu_device_halt_activities(
  6082		struct amdgpu_device *adev, struct amdgpu_job *job,
  6083		struct amdgpu_reset_context *reset_context,
  6084		struct list_head *device_list, struct amdgpu_hive_info *hive,
  6085		bool need_emergency_restart)
  6086	{
  6087		struct amdgpu_device *tmp_adev = NULL;
> 6088		int i, r = 0;
  6089	
  6090		/* block all schedulers and reset given job's ring */
  6091		list_for_each_entry(tmp_adev, device_list, reset_list) {
  6092			amdgpu_device_set_mp1_state(tmp_adev);
  6093	
  6094			/*
  6095			 * Try to put the audio codec into suspend state
  6096			 * before gpu reset started.
  6097			 *
  6098			 * Due to the power domain of the graphics device
  6099			 * is shared with AZ power domain. Without this,
  6100			 * we may change the audio hardware from behind
  6101			 * the audio driver's back. That will trigger
  6102			 * some audio codec errors.
  6103			 */
  6104			if (!amdgpu_device_suspend_display_audio(tmp_adev))
  6105				tmp_adev->pcie_reset_ctx.audio_suspended = true;
  6106	
  6107			amdgpu_ras_set_error_query_ready(tmp_adev, false);
  6108	
  6109			cancel_delayed_work_sync(&tmp_adev->delayed_init_work);
  6110	
  6111			amdgpu_amdkfd_pre_reset(tmp_adev, reset_context);
  6112	
  6113			/*
  6114			 * Mark these ASICs to be reset as untracked first
  6115			 * And add them back after reset completed
  6116			 */
  6117			amdgpu_unregister_gpu_instance(tmp_adev);
  6118	
  6119			drm_client_dev_suspend(adev_to_drm(tmp_adev), false);
  6120	
  6121			/* disable ras on ALL IPs */
  6122			if (!need_emergency_restart &&
  6123			      (!adev->pcie_reset_ctx.occurs_dpc) &&
  6124			      amdgpu_device_ip_need_full_reset(tmp_adev))
  6125				amdgpu_ras_suspend(tmp_adev);
  6126	
  6127			for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
  6128				struct amdgpu_ring *ring = tmp_adev->rings[i];
  6129	
  6130				if (!amdgpu_ring_sched_ready(ring))
  6131					continue;
  6132	
  6133				drm_sched_stop(&ring->sched, job ? &job->base : NULL);
  6134	
  6135				if (need_emergency_restart)
  6136					amdgpu_job_stop_all_jobs_on_sched(&ring->sched);
  6137			}
  6138			atomic_inc(&tmp_adev->gpu_reset_counter);
  6139		}
  6140	
> 6141		return r;
  6142	}
  6143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
