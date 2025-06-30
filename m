Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB74238C0A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751271803; cv=none; b=mujWq8B9hk8NlAIl3kr5L0NfJcrhNYcJGFpVZEyv1Rc0gOy0J1Fe/bQMk3ryR6Jwsl2bpmZr82A/aeiG6zACZpjvO3UCS/daZE0J07zM/2TUzpHBBz4hPeRKkI5AhKo+q6k0E769tCmabFbfI4zpDkqIVS6yxLikFVVmmInO7Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751271803; c=relaxed/simple;
	bh=Q6D5MzdCA8NN8Vg1b/dzgkgSk5Zf1159c72ztY1PILM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g8bjaRvvK3idGo465muMsroBL+kSW/ZmuFMdrYuJmmOJpony11u8oFx+Df0HH+969+33aGM6OjA4N/pVucIWyqcfrTeS3DEfyDYtBLK2Df6M2/5PVJssEsrFrpbHpM49s5caaryh6Oi0+21x+FG7Q4yllYG/eJr4Kvbcoa81Tf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BGBkE9hl; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BGBkE9hl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751271802; x=1782807802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q6D5MzdCA8NN8Vg1b/dzgkgSk5Zf1159c72ztY1PILM=;
  b=BGBkE9hlooXDsJIW+oeSFJrxs9gr+xwVu94yPyjcfOpbyRptsktqaTRb
   Z0NJkj2XbFZSGD+N/EJ1VotNx3Wj0PpdvS9WYtfLzWTEf2z/YaOkR2ps/
   SsdpWrWJmNrOY7Jvg1XW7+b3zcQp0GoN1QmjI5RpjZPA+fBP82Ve0wOrS
   +Eqq8iz6q7EANv023D8jlCE43DgV0VLAVR91EvEfFJtywQ0WY0iIsxIBW
   HYWuL9Fe22LOUBvHnPPijQmLJyFx5v57LbFKtZdGxwrEsPb20khoaClld
   4+0sBOuVaPX3tWPDu9gVgzHaQNYVeqOKPnvLA5r2/8fTjmGEqRyA9/eK1
   A==;
X-CSE-ConnectionGUID: ak4pxFDzTx2C6Bm1QViPIA==
X-CSE-MsgGUID: PMDQN+rBQEqRCmVRP1fF7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="52720150"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="52720150"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 01:23:22 -0700
X-CSE-ConnectionGUID: /tcSHL/xSK+axME0iUPprQ==
X-CSE-MsgGUID: iJDiodVtQqSn2dsBzyqHGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="159124610"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 30 Jun 2025 01:23:20 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uW9nI-00016v-2M;
	Mon, 30 Jun 2025 08:23:16 +0000
Date: Mon, 30 Jun 2025 10:23:08 +0200
From: kernel test robot <lkp@intel.com>
To: Peichen Huang <PeiChen.Huang@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Cruise Hung <cruise.hung@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:6396
 function parameter 'link' not described in 'dc_get_host_router_index'
Message-ID: <202506301044.hmaOBDHw-lkp@intel.com>
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
commit: 3251b69b7efb82eba24c9e168a6142a3078de72f drm/amd/display: Add dc cap for dp tunneling
date:   12 days ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250630/202506301044.hmaOBDHw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506301044.hmaOBDHw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506301044.hmaOBDHw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:6383 Cannot find identifier on line:
    ***********************************************************************************************
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:6396 function parameter 'link' not described in 'dc_get_host_router_index'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:6396 function parameter 'host_router_index' not described in 'dc_get_host_router_index'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
