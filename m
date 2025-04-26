Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED102253F3D
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 15:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745680037; cv=none; b=jgf9s+qmdIAzDUrcfWNXlg6ii4tqvEtU/iNIWYsNdGqdJ0AveEOg05JOJ6Qb01+hdtdbAYqQdxekwkemaK9ijBH1Y4MV+FEdv9qlYTRFJK+i06ETOakAXqgWmN5aAHrVC91OnvWVgJwqNiR7ll/cKbAxQ8gGYPue7rQCTpW6PwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745680037; c=relaxed/simple;
	bh=PEQwD/lQ5ZSizz+elzJnGm+DT2hvILIDJK0qmqPIWXI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SZbeAaBLEQhVh+l8H90NLNO/TQTVkfYK5j9U1YjMkzpqjEOH/o0nxHA+r98ggyRjQhXDZLF8YHoWskBhf/eS/FbKwkuHfy9FTGcIWkPirTGxgLeIKoJS5BiuprNzmaaUCgGH4+Z+ldSmSPim5LYG48vfLdH7t+n0f2tbBu7G/Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIMuig6N; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIMuig6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745680035; x=1777216035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PEQwD/lQ5ZSizz+elzJnGm+DT2hvILIDJK0qmqPIWXI=;
  b=WIMuig6NrKRh0+dFb+KZZHiFaleAl9wVlLAyknc9pYdgr3ToHR8oCqRw
   OlObapDfrBYNNj93gRgjzql/pyQDqv5eKcH5r2e7dE/IC/94wiCoLDRTd
   LFN3ObhRSy6tzy1LT9Ea0dtjldctQ5wOyuJLBiKXmKHcbXlUc4xq4MY+q
   aGrbw3RftRZrBBBeojifqjUns3YyAA334XGP6Yxn5lDUkEM1c7d+zj7xt
   UZ5L6l+uqlkeTXw+jyec6XYgRUKM6elaya7nmy0zHYPIf0WxhJnv9WyLs
   UUGLA4DmqlAS1SYYzWgklvnZUa1+N3eDEzVDxxwG+Lorj7i7GHSSkE9du
   Q==;
X-CSE-ConnectionGUID: NkcoR4L0SbayFr0RV7tXEw==
X-CSE-MsgGUID: 1jtP1/5iT5al/IQ9iTQijw==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47029502"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="47029502"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 08:07:14 -0700
X-CSE-ConnectionGUID: FBOfz7P1T9i/0NA3tSAZAQ==
X-CSE-MsgGUID: 7Y1EePHHQq+a1QOPPdcWPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="138116515"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Apr 2025 08:07:12 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8h7W-0005sJ-15;
	Sat, 26 Apr 2025 15:07:10 +0000
Date: Sat, 26 Apr 2025 23:06:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: drivers/gpu/drm/msm/dp/dp_link.c:1144: warning: Function parameter
 or struct member 'DP_TRAIN_LEVEL_MAX' not described in 'if'
Message-ID: <202504262322.aKhjr99H-lkp@intel.com>
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
commit: 22578178e5dd6d3aa4490879df8b6c2977d980be drm/msm/dp: allow voltage swing / pre emphasis of 3
date:   1 year, 1 month ago
config: arm64-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250426/202504262322.aKhjr99H-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504262322.aKhjr99H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504262322.aKhjr99H-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/msm/dp/dp_link.c:641: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * Read the device service IRQ vector (Byte 0x201) to determine
   drivers/gpu/drm/msm/dp/dp_link.c:659: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * Read the link request byte (Byte 0x218) to determine what type
   drivers/gpu/drm/msm/dp/dp_link.c:852: warning: Function parameter or struct member 'link->drm_dev' not described in 'drm_dbg_dp'
   drivers/gpu/drm/msm/dp/dp_link.c:852: warning: Function parameter or struct member '0x%x' not described in 'drm_dbg_dp'
   drivers/gpu/drm/msm/dp/dp_link.c:852: warning: Function parameter or struct member '0x%x\n"' not described in 'drm_dbg_dp'
   drivers/gpu/drm/msm/dp/dp_link.c:852: warning: expecting prototype for Update the voltage and pre(). Prototype was for drm_dbg_dp() instead
>> drivers/gpu/drm/msm/dp/dp_link.c:1144: warning: Function parameter or struct member 'DP_TRAIN_LEVEL_MAX' not described in 'if'
   drivers/gpu/drm/msm/dp/dp_link.c:1144: warning: expecting prototype for Adjust the voltage swing and pre(). Prototype was for if() instead


vim +1144 drivers/gpu/drm/msm/dp/dp_link.c

  1108	
  1109	int dp_link_adjust_levels(struct dp_link *dp_link, u8 *link_status)
  1110	{
  1111		int i;
  1112		u8 max_p_level;
  1113		int v_max = 0, p_max = 0;
  1114		struct dp_link_private *link;
  1115	
  1116		if (!dp_link) {
  1117			DRM_ERROR("invalid input\n");
  1118			return -EINVAL;
  1119		}
  1120	
  1121		link = container_of(dp_link, struct dp_link_private, dp_link);
  1122	
  1123		/* use the max level across lanes */
  1124		for (i = 0; i < dp_link->link_params.num_lanes; i++) {
  1125			u8 data_v = drm_dp_get_adjust_request_voltage(link_status, i);
  1126			u8 data_p = drm_dp_get_adjust_request_pre_emphasis(link_status,
  1127										 i);
  1128			drm_dbg_dp(link->drm_dev,
  1129					"lane=%d req_vol_swing=%d req_pre_emphasis=%d\n",
  1130					i, data_v, data_p);
  1131			if (v_max < data_v)
  1132				v_max = data_v;
  1133			if (p_max < data_p)
  1134				p_max = data_p;
  1135		}
  1136	
  1137		dp_link->phy_params.v_level = v_max >> DP_TRAIN_VOLTAGE_SWING_SHIFT;
  1138		dp_link->phy_params.p_level = p_max >> DP_TRAIN_PRE_EMPHASIS_SHIFT;
  1139	
  1140		/**
  1141		 * Adjust the voltage swing and pre-emphasis level combination to within
  1142		 * the allowable range.
  1143		 */
> 1144		if (dp_link->phy_params.v_level > DP_TRAIN_LEVEL_MAX) {
  1145			drm_dbg_dp(link->drm_dev,
  1146				"Requested vSwingLevel=%d, change to %d\n",
  1147				dp_link->phy_params.v_level,
  1148				DP_TRAIN_LEVEL_MAX);
  1149			dp_link->phy_params.v_level = DP_TRAIN_LEVEL_MAX;
  1150		}
  1151	
  1152		if (dp_link->phy_params.p_level > DP_TRAIN_LEVEL_MAX) {
  1153			drm_dbg_dp(link->drm_dev,
  1154				"Requested preEmphasisLevel=%d, change to %d\n",
  1155				dp_link->phy_params.p_level,
  1156				DP_TRAIN_LEVEL_MAX);
  1157			dp_link->phy_params.p_level = DP_TRAIN_LEVEL_MAX;
  1158		}
  1159	
  1160		max_p_level = DP_TRAIN_LEVEL_MAX - dp_link->phy_params.v_level;
  1161		if (dp_link->phy_params.p_level > max_p_level) {
  1162			drm_dbg_dp(link->drm_dev,
  1163				"Requested preEmphasisLevel=%d, change to %d\n",
  1164				dp_link->phy_params.p_level,
  1165				max_p_level);
  1166			dp_link->phy_params.p_level = max_p_level;
  1167		}
  1168	
  1169		drm_dbg_dp(link->drm_dev, "adjusted: v_level=%d, p_level=%d\n",
  1170			dp_link->phy_params.v_level, dp_link->phy_params.p_level);
  1171	
  1172		return 0;
  1173	}
  1174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
