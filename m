Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F6A243397
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 23:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739058805; cv=none; b=KsJUUbYTEADBjLsvZ9D6SewGYHmTqopnaHJRdLOH6Veqt7yw6B5qahFCmoRzmfj3rGZ14qjV6Mq2hu5OD6L1MeAjKkR/2HLwq4KKCLpSpBTRKHskoch+sOjliWOyWjmzg1l1ftgOFz1WOKvpcY+T8rMZTySAzagkurHqoSwM3H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739058805; c=relaxed/simple;
	bh=hLqim3sgfebyvWaoYyIOvyZap4dyK7C1QSvW1a7qJM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i8MCRbuWph/t0GRkyqCg2jGxgwVBss0/8Eo2d3daEWkdz3bVM3BvTyU4NS+PZPyb/bgNgVCQ9hd0vYE5t7FgTYTlOoUryY+BdJQ/dDCuhvv1Wq3kAad4REOuisKBZMO1KNcPd2ieOEkD7QplL92AUYs7+nQbclFI92QQE7utS3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKUQCHdK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKUQCHdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739058803; x=1770594803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hLqim3sgfebyvWaoYyIOvyZap4dyK7C1QSvW1a7qJM0=;
  b=LKUQCHdKNqqq5u17TTantvUxLm6f38pK9cXUYbsplkZWkpodWuF7H4dX
   DERMJLavsJXg1aRoAgrxfhJfaA410SblkjrLPs5dcpAhL7OVFvrDqZbF7
   8pI9gAvCMXkxcVvZkkcbyTun/u5m+PB4Jisa2I3e+BgCKnEAqD7zBSybv
   kasGl9Xc0Hc94WlGo/DiJgiJUuoLtojLxUIshkuSZoa5S7n86itu39uIx
   QmzrbqBkWQ08Iuf7wvkyUn0rr1dbsdIc79CvIMU5HmZp0lrvogPG4Tlby
   crps+T9z1H3iOIBjtFGfoj7yU1rsi9JzXlmgzStD9R/DkmBysBoLnjlG7
   Q==;
X-CSE-ConnectionGUID: znXAV1uzTP6CNXt4Xs9/GQ==
X-CSE-MsgGUID: 1WUqZMyNTxGZnxJ2GsXVIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43595089"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="43595089"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 15:53:22 -0800
X-CSE-ConnectionGUID: dR264rSfQTuWYzSgwyT0nQ==
X-CSE-MsgGUID: 62tiPC3sTyGkuBSw8mQBAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112284248"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Feb 2025 15:53:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgudS-0010n1-0C;
	Sat, 08 Feb 2025 23:53:18 +0000
Date: Sun, 9 Feb 2025 07:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: Baihan Li <libaihan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Yongbang Shi <shiyongbang@huawei.com>,
	Tian Tao <tiantao6@hisilicon.com>
Subject: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:87: undefined reference
 to `drm_dp_dpcd_write'
Message-ID: <202502090741.9ypSEryz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   493f3f38da21cf61b25254f7a3dc817179b497c8
commit: 54063d86e0369f53f180137e5e889bc19cd9015b drm/hisilicon/hibmc: add dp link moduel in hibmc drivers
date:   5 weeks ago
config: x86_64-randconfig-r063-20250208 (https://download.01.org/0day-ci/archive/20250209/202502090741.9ypSEryz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090741.9ypSEryz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090741.9ypSEryz-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `hibmc_dp_aux_init':
   drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c:163: undefined reference to `drm_dp_aux_init'
   ld: vmlinux.o: in function `hibmc_dp_link_set_pattern':
>> drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:87: undefined reference to `drm_dp_dpcd_write'
   ld: vmlinux.o: in function `hibmc_dp_link_training_configure':
   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:29: undefined reference to `drm_dp_dpcd_write'
>> ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:38: undefined reference to `drm_dp_dpcd_write'
>> ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:44: undefined reference to `drm_dp_read_dpcd_caps'
   ld: vmlinux.o: in function `hibmc_dp_link_get_adjust_train':
>> drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:129: undefined reference to `drm_dp_get_adjust_request_voltage'
>> ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:130: undefined reference to `drm_dp_get_adjust_request_pre_emphasis'
   ld: vmlinux.o: in function `hibmc_dp_link_training_cr':
>> drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:196: undefined reference to `drm_dp_clock_recovery_ok'
   ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:209: undefined reference to `drm_dp_dpcd_write'
>> ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:188: undefined reference to `drm_dp_link_train_clock_recovery_delay'
>> ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:190: undefined reference to `drm_dp_dpcd_read_link_status'
   ld: vmlinux.o: in function `hibmc_dp_link_training_channel_eq':
>> drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:236: undefined reference to `drm_dp_link_train_channel_eq_delay'
   ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:238: undefined reference to `drm_dp_dpcd_read_link_status'
>> ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:244: undefined reference to `drm_dp_clock_recovery_ok'
>> ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:251: undefined reference to `drm_dp_channel_eq_ok'
   ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:258: undefined reference to `drm_dp_dpcd_write'
   ld: vmlinux.o: in function `hibmc_dp_link_training_cr_pre':
   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c:113: undefined reference to `drm_dp_dpcd_write'


vim +87 drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c

    11	
    12	static int hibmc_dp_link_training_configure(struct hibmc_dp_dev *dp)
    13	{
    14		u8 buf[2];
    15		int ret;
    16	
    17		/* DP 2 lane */
    18		hibmc_dp_reg_write_field(dp, HIBMC_DP_PHYIF_CTRL0, HIBMC_DP_CFG_LANE_DATA_EN,
    19					 dp->link.cap.lanes == 0x2 ? 0x3 : 0x1);
    20		hibmc_dp_reg_write_field(dp, HIBMC_DP_DPTX_GCTL0, HIBMC_DP_CFG_PHY_LANE_NUM,
    21					 dp->link.cap.lanes == 0x2 ? 0x1 : 0);
    22	
    23		/* enhanced frame */
    24		hibmc_dp_reg_write_field(dp, HIBMC_DP_VIDEO_CTRL, HIBMC_DP_CFG_STREAM_FRAME_MODE, 0x1);
    25	
    26		/* set rate and lane count */
    27		buf[0] = dp->link.cap.link_rate;
    28		buf[1] = DP_LANE_COUNT_ENHANCED_FRAME_EN | dp->link.cap.lanes;
    29		ret = drm_dp_dpcd_write(&dp->aux, DP_LINK_BW_SET, buf, sizeof(buf));
    30		if (ret != sizeof(buf)) {
    31			drm_dbg_dp(dp->dev, "dp aux write link rate and lanes failed, ret: %d\n", ret);
    32			return ret >= 0 ? -EIO : ret;
    33		}
    34	
    35		/* set 8b/10b and downspread */
    36		buf[0] = DP_SPREAD_AMP_0_5;
    37		buf[1] = DP_SET_ANSI_8B10B;
  > 38		ret = drm_dp_dpcd_write(&dp->aux, DP_DOWNSPREAD_CTRL, buf, sizeof(buf));
    39		if (ret != sizeof(buf)) {
    40			drm_dbg_dp(dp->dev, "dp aux write 8b/10b and downspread failed, ret: %d\n", ret);
    41			return ret >= 0 ? -EIO : ret;
    42		}
    43	
  > 44		ret = drm_dp_read_dpcd_caps(&dp->aux, dp->dpcd);
    45		if (ret)
    46			drm_err(dp->dev, "dp aux read dpcd failed, ret: %d\n", ret);
    47	
    48		return ret;
    49	}
    50	
    51	static int hibmc_dp_link_set_pattern(struct hibmc_dp_dev *dp, int pattern)
    52	{
    53		int ret;
    54		u8 val;
    55		u8 buf;
    56	
    57		buf = (u8)pattern;
    58		if (pattern != DP_TRAINING_PATTERN_DISABLE && pattern != DP_TRAINING_PATTERN_4) {
    59			buf |= DP_LINK_SCRAMBLING_DISABLE;
    60			hibmc_dp_reg_write_field(dp, HIBMC_DP_PHYIF_CTRL0, HIBMC_DP_CFG_SCRAMBLE_EN, 0x1);
    61		} else {
    62			hibmc_dp_reg_write_field(dp, HIBMC_DP_PHYIF_CTRL0, HIBMC_DP_CFG_SCRAMBLE_EN, 0);
    63		}
    64	
    65		switch (pattern) {
    66		case DP_TRAINING_PATTERN_DISABLE:
    67			val = 0;
    68			break;
    69		case DP_TRAINING_PATTERN_1:
    70			val = 1;
    71			break;
    72		case DP_TRAINING_PATTERN_2:
    73			val = 2;
    74			break;
    75		case DP_TRAINING_PATTERN_3:
    76			val = 3;
    77			break;
    78		case DP_TRAINING_PATTERN_4:
    79			val = 4;
    80			break;
    81		default:
    82			return -EINVAL;
    83		}
    84	
    85		hibmc_dp_reg_write_field(dp, HIBMC_DP_PHYIF_CTRL0, HIBMC_DP_CFG_PAT_SEL, val);
    86	
  > 87		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_PATTERN_SET, &buf, sizeof(buf));
    88		if (ret != sizeof(buf)) {
    89			drm_dbg_dp(dp->dev, "dp aux write training pattern set failed\n");
    90			return ret >= 0 ? -EIO : ret;
    91		}
    92	
    93		return 0;
    94	}
    95	
    96	static int hibmc_dp_link_training_cr_pre(struct hibmc_dp_dev *dp)
    97	{
    98		u8 *train_set = dp->link.train_set;
    99		int ret;
   100		u8 i;
   101	
   102		ret = hibmc_dp_link_training_configure(dp);
   103		if (ret)
   104			return ret;
   105	
   106		ret = hibmc_dp_link_set_pattern(dp, DP_TRAINING_PATTERN_1);
   107		if (ret)
   108			return ret;
   109	
   110		for (i = 0; i < dp->link.cap.lanes; i++)
   111			train_set[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_2;
   112	
   113		ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, train_set, dp->link.cap.lanes);
   114		if (ret != dp->link.cap.lanes) {
   115			drm_dbg_dp(dp->dev, "dp aux write training lane set failed\n");
   116			return ret >= 0 ? -EIO : ret;
   117		}
   118	
   119		return 0;
   120	}
   121	
   122	static bool hibmc_dp_link_get_adjust_train(struct hibmc_dp_dev *dp,
   123						   u8 lane_status[DP_LINK_STATUS_SIZE])
   124	{
   125		u8 train_set[HIBMC_DP_LANE_NUM_MAX] = {0};
   126		u8 lane;
   127	
   128		for (lane = 0; lane < dp->link.cap.lanes; lane++)
 > 129			train_set[lane] = drm_dp_get_adjust_request_voltage(lane_status, lane) |
 > 130					  drm_dp_get_adjust_request_pre_emphasis(lane_status, lane);
   131	
   132		if (memcmp(dp->link.train_set, train_set, HIBMC_DP_LANE_NUM_MAX)) {
   133			memcpy(dp->link.train_set, train_set, HIBMC_DP_LANE_NUM_MAX);
   134			return true;
   135		}
   136	
   137		return false;
   138	}
   139	
   140	static inline int hibmc_dp_link_reduce_rate(struct hibmc_dp_dev *dp)
   141	{
   142		switch (dp->link.cap.link_rate) {
   143		case DP_LINK_BW_2_7:
   144			dp->link.cap.link_rate = DP_LINK_BW_1_62;
   145			return 0;
   146		case DP_LINK_BW_5_4:
   147			dp->link.cap.link_rate = DP_LINK_BW_2_7;
   148			return 0;
   149		case DP_LINK_BW_8_1:
   150			dp->link.cap.link_rate = DP_LINK_BW_5_4;
   151			return 0;
   152		default:
   153			return -EINVAL;
   154		}
   155	}
   156	
   157	static inline int hibmc_dp_link_reduce_lane(struct hibmc_dp_dev *dp)
   158	{
   159		switch (dp->link.cap.lanes) {
   160		case 0x2:
   161			dp->link.cap.lanes--;
   162			break;
   163		case 0x1:
   164			drm_err(dp->dev, "dp link training reduce lane failed, already reach minimum\n");
   165			return -EIO;
   166		default:
   167			return -EINVAL;
   168		}
   169	
   170		return 0;
   171	}
   172	
   173	static int hibmc_dp_link_training_cr(struct hibmc_dp_dev *dp)
   174	{
   175		u8 lane_status[DP_LINK_STATUS_SIZE] = {0};
   176		bool level_changed;
   177		u32 voltage_tries;
   178		u32 cr_tries;
   179		int ret;
   180	
   181		/*
   182		 * DP 1.4 spec define 10 for maxtries value, for pre DP 1.4 version set a limit of 80
   183		 * (4 voltage levels x 4 preemphasis levels x 5 identical voltage retries)
   184		 */
   185	
   186		voltage_tries = 1;
   187		for (cr_tries = 0; cr_tries < 80; cr_tries++) {
 > 188			drm_dp_link_train_clock_recovery_delay(&dp->aux, dp->dpcd);
   189	
 > 190			ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
   191			if (ret != DP_LINK_STATUS_SIZE) {
   192				drm_err(dp->dev, "Get lane status failed\n");
   193				return ret;
   194			}
   195	
 > 196			if (drm_dp_clock_recovery_ok(lane_status, dp->link.cap.lanes)) {
   197				drm_dbg_dp(dp->dev, "dp link training cr done\n");
   198				dp->link.status.clock_recovered = true;
   199				return 0;
   200			}
   201	
   202			if (voltage_tries == 5) {
   203				drm_dbg_dp(dp->dev, "same voltage tries 5 times\n");
   204				dp->link.status.clock_recovered = false;
   205				return 0;
   206			}
   207	
   208			level_changed = hibmc_dp_link_get_adjust_train(dp, lane_status);
   209			ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET, dp->link.train_set,
   210						dp->link.cap.lanes);
   211			if (ret != dp->link.cap.lanes) {
   212				drm_dbg_dp(dp->dev, "Update link training failed\n");
   213				return ret >= 0 ? -EIO : ret;
   214			}
   215	
   216			voltage_tries = level_changed ? 1 : voltage_tries + 1;
   217		}
   218	
   219		drm_err(dp->dev, "dp link training clock recovery 80 times failed\n");
   220		dp->link.status.clock_recovered = false;
   221	
   222		return 0;
   223	}
   224	
   225	static int hibmc_dp_link_training_channel_eq(struct hibmc_dp_dev *dp)
   226	{
   227		u8 lane_status[DP_LINK_STATUS_SIZE] = {0};
   228		u8 eq_tries;
   229		int ret;
   230	
   231		ret = hibmc_dp_link_set_pattern(dp, DP_TRAINING_PATTERN_2);
   232		if (ret)
   233			return ret;
   234	
   235		for (eq_tries = 0; eq_tries < HIBMC_EQ_MAX_RETRY; eq_tries++) {
 > 236			drm_dp_link_train_channel_eq_delay(&dp->aux, dp->dpcd);
   237	
   238			ret = drm_dp_dpcd_read_link_status(&dp->aux, lane_status);
   239			if (ret != DP_LINK_STATUS_SIZE) {
   240				drm_err(dp->dev, "get lane status failed\n");
   241				break;
   242			}
   243	
 > 244			if (!drm_dp_clock_recovery_ok(lane_status, dp->link.cap.lanes)) {
   245				drm_dbg_dp(dp->dev, "clock recovery check failed\n");
   246				drm_dbg_dp(dp->dev, "cannot continue channel equalization\n");
   247				dp->link.status.clock_recovered = false;
   248				break;
   249			}
   250	
 > 251			if (drm_dp_channel_eq_ok(lane_status, dp->link.cap.lanes)) {
   252				dp->link.status.channel_equalized = true;
   253				drm_dbg_dp(dp->dev, "dp link training eq done\n");
   254				break;
   255			}
   256	
   257			hibmc_dp_link_get_adjust_train(dp, lane_status);
   258			ret = drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
   259						dp->link.train_set, dp->link.cap.lanes);
   260			if (ret != dp->link.cap.lanes) {
   261				drm_dbg_dp(dp->dev, "Update link training failed\n");
   262				ret = (ret >= 0) ? -EIO : ret;
   263				break;
   264			}
   265		}
   266	
   267		if (eq_tries == HIBMC_EQ_MAX_RETRY)
   268			drm_err(dp->dev, "channel equalization failed %u times\n", eq_tries);
   269	
   270		hibmc_dp_link_set_pattern(dp, DP_TRAINING_PATTERN_DISABLE);
   271	
   272		return ret < 0 ? ret : 0;
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
