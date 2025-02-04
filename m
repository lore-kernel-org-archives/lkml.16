Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FF42163BE
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690658; cv=none; b=AcSqteos0OAilT7WWJuBLtnhBff6hwmgKN/BGDrQ9HLjB0/6lJEecliAr2CYUZoBDFQjSuDHP0U5t2/eTVzONPno0C9+fFKkEW1D0alKgTI1OsbsVXQlIqXyFr75OLJiRSHwZjVTlJ3K8JvqQRqfhSqAY6njtcf0TnSccZLbI4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690658; c=relaxed/simple;
	bh=cFhW+HpoBr+7r9nw1AZd0Mo4cWC38oRKalx+p4MgK3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oeMWMr8jPSct9sE1SqE0GARpChlb8FxSHSqG7DkG3CBQ/xrjvdxvgACLTwaJQLluT+zeAxE/IhS/GDC5mTDhqGPSbw+gdejmPY17ekXQDnd0qC8jwt6gejHagi1SrnR5s1MNSzVYn02TttcpvF7sPHNzLoQvIUTvTBVVP20CoKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9jvZ7in; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9jvZ7in"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690657; x=1770226657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cFhW+HpoBr+7r9nw1AZd0Mo4cWC38oRKalx+p4MgK3M=;
  b=K9jvZ7in3uBr6JfMDEeUT2VBj9rQ9GAlhVTPj9p68JaYGancsHeetYI7
   KfUG/M9JvSrk3QUlgJ9OGQf09KAxvLaGLSZ8asMztAfMVlMGlKHydz9RB
   qfFP5gVpC1kTGoz+zluboeoXwOi7OW1lloric2n+/5ru0akhJQP1Ce39+
   6vDf1u1Mud3zc9DURofVY+6/aOEbDfFUd88Ym4zICB2Pm/5HzReLx5BnG
   HZMrq74FA64q2PyfbKuc0wquGvFyPVD2Jr12oU9gWsx1YuRrMSkInf4yG
   p1zA6wnfFiJ6DkrUy2B5nMS5uiarF/WPhNlwa2O9HuNROdR14eCHkIJrI
   Q==;
X-CSE-ConnectionGUID: 5ifxiBrOTdCLMbhJF1gLng==
X-CSE-MsgGUID: ymtc5zH/QOmpSgxXFKzBrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39384574"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="39384574"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:37:36 -0800
X-CSE-ConnectionGUID: XQwSIomrQyaoPSiFTA3wNA==
X-CSE-MsgGUID: TIdzbrvpSY6xsRv+6TseRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="115643234"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Feb 2025 09:37:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfMrc-000so7-09;
	Tue, 04 Feb 2025 17:37:32 +0000
Date: Wed, 5 Feb 2025 01:37:28 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>
Subject: ld.lld: warning:
 src/consumer/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6269:0:
 stack frame size (4048) exceeds limit (3072) in function
 'dml_prefetch_check'
Message-ID: <202502050105.2A6kZvev-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0de63bb7d91975e73338300a57c54b93d3cc151c
commit: a8d42cd228ec41ad99c50a270db82f0dd9127a28 drm/amd/display: mark static functions noinline_for_stack
date:   11 days ago
config: x86_64-randconfig-075-20250203 (https://download.01.org/0day-ci/archive/20250205/202502050105.2A6kZvev-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502050105.2A6kZvev-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050105.2A6kZvev-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ld.lld: warning: src/consumer/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1725:0: stack frame size (3496) exceeds limit (3072) in function 'dml32_ModeSupportAndSystemConfigurationFull'
   ld.lld: warning: src/consumer/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6714:0: stack frame size (3416) exceeds limit (3072) in function 'dml_core_mode_support'
>> ld.lld: warning: src/consumer/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6269:0: stack frame size (4048) exceeds limit (3072) in function 'dml_prefetch_check'
   ld.lld: warning: src/consumer/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:8290:0: stack frame size (3584) exceeds limit (3072) in function 'dml_core_mode_programming'
   ld.lld: warning: src/consumer/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:7308:0: stack frame size (4944) exceeds limit (3072) in function 'dml_core_mode_support.46549'
   ld.lld: warning: src/consumer/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:10360:0: stack frame size (3744) exceeds limit (3072) in function 'dml_core_mode_programming.46571'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
