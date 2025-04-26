Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DAD1ADC97;
	Sat, 26 Apr 2025 19:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745697456; cv=none; b=DWuCtDnZHbb/s6O+aBS7Tn46EMGmRE3JdfiJZtwNg5rLJH5xrrh1e50w4YEmS5bfTFFhrqrzRzNrCpDM1L6X5JtTPRj8RROsdjHNqD5gVWCsC5uv9xley3CsEgzKRREYTBu5PSSJNz1xv7eXBJYvDZiQuhROaUqNM6LKX9VHNDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745697456; c=relaxed/simple;
	bh=FFIXkVsLxmxtLTTy8CezDMGvHtsP+Y1HCzLLd8tCQDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WLaNHbxoVhmrHrZPYzbCQdVawSTVE8WVyx/Nltu9rDLxuijilFI7jZAVv88arsqcVuVPp3Xf3ef4Y1CQGjfLeLYyh7CJuZ8kIoD/0xSp95VZEeNcL602Yr3TR+hpsVURdh1tN5EgOcaOHQbd7mjbJ8j1FcR3xyDaeL81Rl3+i5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SBW59NN0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SBW59NN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745697454; x=1777233454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FFIXkVsLxmxtLTTy8CezDMGvHtsP+Y1HCzLLd8tCQDA=;
  b=SBW59NN0GY6UWTIEyz0LLL69zcWYSSKqtFnzzxWOE+KPPNPXcjmGCzob
   KE2Xsy1J0Sob+CgmOxCduRXdVa8gytBB3m/y/QIJdozglaf+uf7reoPc8
   8z5NoDnYR6LX5sKJTbJQCgKO1EMq7HC3pzacS9THYDL91DSCEbMkN969X
   TRjnJFHpLFb8TEhPhEb7ya0rXV1aTSDdwVMOdBl+QgU/nxD1CJn9ivrqy
   YBeBSMU0Z2XuDC+4fH5ym/Rw/MI95g1hIy58oVcUxUhXwnWaE6DhH3s5F
   CbUoKkGIr+GndK65ekSOZTq9n9Y5I9pF7KY8wTRWBjt3NDbETPzbnlovD
   Q==;
X-CSE-ConnectionGUID: iQbzb5BbRD6vfCQKxF/Fhg==
X-CSE-MsgGUID: HblcSZwEQsaG5apNxIQj5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="72703359"
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="72703359"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 12:57:33 -0700
X-CSE-ConnectionGUID: MHBLM3KyR/euUw9zbvZD5A==
X-CSE-MsgGUID: 0fisutOET0ikuYOLAo8qzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="134105739"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Apr 2025 12:57:32 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8leU-0005y9-0V;
	Sat, 26 Apr 2025 19:57:30 +0000
Date: Sun, 27 Apr 2025 03:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Peterson Guo <peterson.guo@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Alvin Lee <alvin.lee2@amd.com>, Wayne Lin <wayne.lin@amd.com>,
	linux-doc@vger.kernel.org
Subject: drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1667:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202504270342.FU9iqFuX-lkp@intel.com>
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
commit: 3c50bf2196aaddcaffe2c7a1a7080470380cbfdd drm/amd/display: Reverse the visual confirm recouts
date:   2 months ago
config: sparc64-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250427/202504270342.FU9iqFuX-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270342.FU9iqFuX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270342.FU9iqFuX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1667: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * Disable the cursor if there's another pipe above this with a
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c:1687: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
                    * There is another half plane on same layer because of


vim +1667 drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_resource.c

  1654	
  1655	bool resource_can_pipe_disable_cursor(struct pipe_ctx *pipe_ctx)
  1656	{
  1657		struct pipe_ctx *test_pipe, *split_pipe;
  1658		struct rect r1 = pipe_ctx->plane_res.scl_data.recout;
  1659		int r1_right, r1_bottom;
  1660		int cur_layer = pipe_ctx->plane_state->layer_index;
  1661	
  1662		reverse_adjust_recout_for_visual_confirm(&r1, pipe_ctx);
  1663		r1_right = r1.x + r1.width;
  1664		r1_bottom = r1.y + r1.height;
  1665	
  1666		/**
> 1667		 * Disable the cursor if there's another pipe above this with a
  1668		 * plane that contains this pipe's viewport to prevent double cursor
  1669		 * and incorrect scaling artifacts.
  1670		 */
  1671		for (test_pipe = pipe_ctx->top_pipe; test_pipe;
  1672		     test_pipe = test_pipe->top_pipe) {
  1673			struct rect r2;
  1674			int r2_right, r2_bottom;
  1675			// Skip invisible layer and pipe-split plane on same layer
  1676			if (!test_pipe->plane_state ||
  1677			    !test_pipe->plane_state->visible ||
  1678			    test_pipe->plane_state->layer_index == cur_layer)
  1679				continue;
  1680	
  1681			r2 = test_pipe->plane_res.scl_data.recout;
  1682			reverse_adjust_recout_for_visual_confirm(&r2, test_pipe);
  1683			r2_right = r2.x + r2.width;
  1684			r2_bottom = r2.y + r2.height;
  1685	
  1686			/**
  1687			 * There is another half plane on same layer because of
  1688			 * pipe-split, merge together per same height.
  1689			 */
  1690			for (split_pipe = pipe_ctx->top_pipe; split_pipe;
  1691			     split_pipe = split_pipe->top_pipe)
  1692				if (split_pipe->plane_state->layer_index == test_pipe->plane_state->layer_index) {
  1693					struct rect r2_half;
  1694	
  1695					r2_half = split_pipe->plane_res.scl_data.recout;
  1696					reverse_adjust_recout_for_visual_confirm(&r2_half, split_pipe);
  1697					r2.x = min(r2_half.x, r2.x);
  1698					r2.width = r2.width + r2_half.width;
  1699					r2_right = r2.x + r2.width;
  1700					r2_bottom = min(r2_bottom, r2_half.y + r2_half.height);
  1701					break;
  1702				}
  1703	
  1704			if (r1.x >= r2.x && r1.y >= r2.y && r1_right <= r2_right && r1_bottom <= r2_bottom)
  1705				return true;
  1706		}
  1707	
  1708		return false;
  1709	}
  1710	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
