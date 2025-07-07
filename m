Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B05279DC4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871427; cv=none; b=lTz/Ua3X5DnFC2yZf08qSuXX1eEFmQlZtGBh7rNN7QJiAieKFqAeEqEa2eTjh4BzkWAI+jUyobw6SjqdXSa9fYuMZJfFGVQvBYrsSY1Z+q5kVj+l5lwbDc63V9rSHB7ZJEmHyvPINhXh1JEcPsBZS5SeinFvXEKfpkpLeuL6QvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871427; c=relaxed/simple;
	bh=QVDPqzvT0WPpZYCs1rnnU3dJHA2wvaiyKgJ3NZ2Kzxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SmQmCdD74r97kSPRbmGU0kY1i35acBq7IJXD6hRGDF+xkfkLFVBRIOwnVAnshBz9W7imwgeY38jYk/xADm6g19FEvz/cBmXdLAPcER8MkvoJClLaL0+MGe594BnuW4EbvrqEo2HFj26GDCwHwjl1x3Dm/yk4wyRmBQsLg1fGiyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYeocq48; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYeocq48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751871425; x=1783407425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QVDPqzvT0WPpZYCs1rnnU3dJHA2wvaiyKgJ3NZ2Kzxw=;
  b=TYeocq48aOFTAu5l9/H/ks5TDzlNa3bdeOmMk32PTedmOYb7ZpIQtBip
   CBD3ggcqvG1cbMimX32gydGUbln+aCP8WqDWXWnoVqAvElj8ahaCqy5Xb
   fdBCZCBZ6F4x2IeMr3v35ht3tC45xyFdl5pvuU2XX8NZxUt4LaZvn2too
   RP9WocZplysPpyCirluOXtAmE5VeUyJAFiAJ3Cfv6GWi0nirGzN5+b+Dh
   8RSLO4UhEAU+BGc+1slOgJ8YR/xVLwxRe7Q/ZtmLie8UeGRu/tdD24kfn
   c2MFh6ec8i61kH2NcPFJeE+abcdlRELGCM6Ye7BR8bxkfZ2L44q0Oes1a
   Q==;
X-CSE-ConnectionGUID: GhxTWz6GTnedfXQPuDJg8Q==
X-CSE-MsgGUID: TsHXG6nmQyubcwgVcEk5QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="64674307"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="64674307"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 23:57:05 -0700
X-CSE-ConnectionGUID: FyWvDGZoQryJXAr6UMkKtg==
X-CSE-MsgGUID: yCQv9D1+TBG868ZXeNqUeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="192323947"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 06 Jul 2025 23:57:03 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYfme-0001dl-0h;
	Mon, 07 Jul 2025 06:57:00 +0000
Date: Mon, 7 Jul 2025 08:56:43 +0200
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Michael Chan <michael.chan@broadcom.com>
Subject: drivers/net/ethernet/broadcom/bnxt/bnxt.c:10113:22: warning:
 variable 'max_tmo_secs' set but not used
Message-ID: <202507070816.47JRuUeH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d7b8f8e20813f0179d8ef519541a3527e7661d3a
commit: 8ff6175139967cd17b2a62bca4b2de2559942b7e bnxt_en: hide CONFIG_DETECT_HUNG_TASK specific code
date:   2 months ago
config: x86_64-buildonly-randconfig-2001-20250701 (https://download.01.org/0day-ci/archive/20250707/202507070816.47JRuUeH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507070816.47JRuUeH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507070816.47JRuUeH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_hwrm_ver_get':
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:10113:22: warning: variable 'max_tmo_secs' set but not used [-Wunused-but-set-variable]
   10113 |         int rc, len, max_tmo_secs;
         |                      ^~~~~~~~~~~~
   drivers/net/ethernet/broadcom/bnxt/bnxt.c: In function 'bnxt_request_irq':
   drivers/net/ethernet/broadcom/bnxt/bnxt.c:11537:16: warning: variable 'j' set but not used [-Wunused-but-set-variable]
   11537 |         int i, j, rc = 0;
         |                ^


vim +/max_tmo_secs +10113 drivers/net/ethernet/broadcom/bnxt/bnxt.c

ba642ab773db97 Michael Chan        2019-08-29  10106  
ba642ab773db97 Michael Chan        2019-08-29  10107  static int bnxt_hwrm_ver_get(struct bnxt *bp)
ba642ab773db97 Michael Chan        2019-08-29  10108  {
bbf33d1d9805fc Edwin Peer          2021-08-29  10109  	struct hwrm_ver_get_output *resp;
bbf33d1d9805fc Edwin Peer          2021-08-29  10110  	struct hwrm_ver_get_input *req;
d0ad2ea2bc1858 Michael Chan        2020-06-23  10111  	u16 fw_maj, fw_min, fw_bld, fw_rsv;
b7a444f0785929 Vasundhara Volam    2020-03-27  10112  	u32 dev_caps_cfg, hwrm_ver;
0fcad44a86bdc2 Michael Chan        2025-04-17 @10113  	int rc, len, max_tmo_secs;
ba642ab773db97 Michael Chan        2019-08-29  10114  
bbf33d1d9805fc Edwin Peer          2021-08-29  10115  	rc = hwrm_req_init(bp, req, HWRM_VER_GET);
bbf33d1d9805fc Edwin Peer          2021-08-29  10116  	if (rc)
bbf33d1d9805fc Edwin Peer          2021-08-29  10117  		return rc;
bbf33d1d9805fc Edwin Peer          2021-08-29  10118  
bbf33d1d9805fc Edwin Peer          2021-08-29  10119  	hwrm_req_flags(bp, req, BNXT_HWRM_FULL_WAIT);
ba642ab773db97 Michael Chan        2019-08-29  10120  	bp->hwrm_max_req_len = HWRM_MAX_REQ_LEN;
bbf33d1d9805fc Edwin Peer          2021-08-29  10121  	req->hwrm_intf_maj = HWRM_VERSION_MAJOR;
bbf33d1d9805fc Edwin Peer          2021-08-29  10122  	req->hwrm_intf_min = HWRM_VERSION_MINOR;
bbf33d1d9805fc Edwin Peer          2021-08-29  10123  	req->hwrm_intf_upd = HWRM_VERSION_UPDATE;
7b370ad7739245 Edwin Peer          2021-08-29  10124  
bbf33d1d9805fc Edwin Peer          2021-08-29  10125  	resp = hwrm_req_hold(bp, req);
bbf33d1d9805fc Edwin Peer          2021-08-29  10126  	rc = hwrm_req_send(bp, req);
c0c050c58d8409 Michael Chan        2015-10-22  10127  	if (rc)
c0c050c58d8409 Michael Chan        2015-10-22  10128  		goto hwrm_ver_get_exit;
c0c050c58d8409 Michael Chan        2015-10-22  10129  
c0c050c58d8409 Michael Chan        2015-10-22  10130  	memcpy(&bp->ver_resp, resp, sizeof(struct hwrm_ver_get_output));
c0c050c58d8409 Michael Chan        2015-10-22  10131  
894aa69a909329 Michael Chan        2018-01-17  10132  	bp->hwrm_spec_code = resp->hwrm_intf_maj_8b << 16 |
894aa69a909329 Michael Chan        2018-01-17  10133  			     resp->hwrm_intf_min_8b << 8 |
894aa69a909329 Michael Chan        2018-01-17  10134  			     resp->hwrm_intf_upd_8b;
894aa69a909329 Michael Chan        2018-01-17  10135  	if (resp->hwrm_intf_maj_8b < 1) {
c193554ecd050e Michael Chan        2015-12-27  10136  		netdev_warn(bp->dev, "HWRM interface %d.%d.%d is older than 1.0.0.\n",
894aa69a909329 Michael Chan        2018-01-17  10137  			    resp->hwrm_intf_maj_8b, resp->hwrm_intf_min_8b,
894aa69a909329 Michael Chan        2018-01-17  10138  			    resp->hwrm_intf_upd_8b);
c193554ecd050e Michael Chan        2015-12-27  10139  		netdev_warn(bp->dev, "Please update firmware with HWRM interface 1.0.0 or newer.\n");
c0c050c58d8409 Michael Chan        2015-10-22  10140  	}
b7a444f0785929 Vasundhara Volam    2020-03-27  10141  
b7a444f0785929 Vasundhara Volam    2020-03-27  10142  	hwrm_ver = HWRM_VERSION_MAJOR << 16 | HWRM_VERSION_MINOR << 8 |
b7a444f0785929 Vasundhara Volam    2020-03-27  10143  			HWRM_VERSION_UPDATE;
b7a444f0785929 Vasundhara Volam    2020-03-27  10144  
b7a444f0785929 Vasundhara Volam    2020-03-27  10145  	if (bp->hwrm_spec_code > hwrm_ver)
b7a444f0785929 Vasundhara Volam    2020-03-27  10146  		snprintf(bp->hwrm_ver_supp, FW_VER_STR_LEN, "%d.%d.%d",
b7a444f0785929 Vasundhara Volam    2020-03-27  10147  			 HWRM_VERSION_MAJOR, HWRM_VERSION_MINOR,
b7a444f0785929 Vasundhara Volam    2020-03-27  10148  			 HWRM_VERSION_UPDATE);
b7a444f0785929 Vasundhara Volam    2020-03-27  10149  	else
b7a444f0785929 Vasundhara Volam    2020-03-27  10150  		snprintf(bp->hwrm_ver_supp, FW_VER_STR_LEN, "%d.%d.%d",
b7a444f0785929 Vasundhara Volam    2020-03-27  10151  			 resp->hwrm_intf_maj_8b, resp->hwrm_intf_min_8b,
b7a444f0785929 Vasundhara Volam    2020-03-27  10152  			 resp->hwrm_intf_upd_8b);
b7a444f0785929 Vasundhara Volam    2020-03-27  10153  
d0ad2ea2bc1858 Michael Chan        2020-06-23  10154  	fw_maj = le16_to_cpu(resp->hwrm_fw_major);
d0ad2ea2bc1858 Michael Chan        2020-06-23  10155  	if (bp->hwrm_spec_code > 0x10803 && fw_maj) {
d0ad2ea2bc1858 Michael Chan        2020-06-23  10156  		fw_min = le16_to_cpu(resp->hwrm_fw_minor);
d0ad2ea2bc1858 Michael Chan        2020-06-23  10157  		fw_bld = le16_to_cpu(resp->hwrm_fw_build);
d0ad2ea2bc1858 Michael Chan        2020-06-23  10158  		fw_rsv = le16_to_cpu(resp->hwrm_fw_patch);
d0ad2ea2bc1858 Michael Chan        2020-06-23  10159  		len = FW_VER_STR_LEN;
d0ad2ea2bc1858 Michael Chan        2020-06-23  10160  	} else {
d0ad2ea2bc1858 Michael Chan        2020-06-23  10161  		fw_maj = resp->hwrm_fw_maj_8b;
d0ad2ea2bc1858 Michael Chan        2020-06-23  10162  		fw_min = resp->hwrm_fw_min_8b;
d0ad2ea2bc1858 Michael Chan        2020-06-23  10163  		fw_bld = resp->hwrm_fw_bld_8b;
d0ad2ea2bc1858 Michael Chan        2020-06-23  10164  		fw_rsv = resp->hwrm_fw_rsvd_8b;
d0ad2ea2bc1858 Michael Chan        2020-06-23  10165  		len = BC_HWRM_STR_LEN;
d0ad2ea2bc1858 Michael Chan        2020-06-23  10166  	}
d0ad2ea2bc1858 Michael Chan        2020-06-23  10167  	bp->fw_ver_code = BNXT_FW_VER_CODE(fw_maj, fw_min, fw_bld, fw_rsv);
d0ad2ea2bc1858 Michael Chan        2020-06-23  10168  	snprintf(bp->fw_ver_str, len, "%d.%d.%d.%d", fw_maj, fw_min, fw_bld,
d0ad2ea2bc1858 Michael Chan        2020-06-23  10169  		 fw_rsv);
c0c050c58d8409 Michael Chan        2015-10-22  10170  
691aa62045c2b2 Vasundhara Volam    2019-05-05  10171  	if (strlen(resp->active_pkg_name)) {
691aa62045c2b2 Vasundhara Volam    2019-05-05  10172  		int fw_ver_len = strlen(bp->fw_ver_str);
691aa62045c2b2 Vasundhara Volam    2019-05-05  10173  
691aa62045c2b2 Vasundhara Volam    2019-05-05  10174  		snprintf(bp->fw_ver_str + fw_ver_len,
691aa62045c2b2 Vasundhara Volam    2019-05-05  10175  			 FW_VER_STR_LEN - fw_ver_len - 1, "/pkg %s",
691aa62045c2b2 Vasundhara Volam    2019-05-05  10176  			 resp->active_pkg_name);
691aa62045c2b2 Vasundhara Volam    2019-05-05  10177  		bp->fw_cap |= BNXT_FW_CAP_PKG_VER;
691aa62045c2b2 Vasundhara Volam    2019-05-05  10178  	}
691aa62045c2b2 Vasundhara Volam    2019-05-05  10179  
ff4fe81d2d49e3 Michael Chan        2016-02-26  10180  	bp->hwrm_cmd_timeout = le16_to_cpu(resp->def_req_timeout);
ff4fe81d2d49e3 Michael Chan        2016-02-26  10181  	if (!bp->hwrm_cmd_timeout)
ff4fe81d2d49e3 Michael Chan        2016-02-26  10182  		bp->hwrm_cmd_timeout = DFLT_HWRM_CMD_TIMEOUT;
bce9a0b7900836 Edwin Peer          2022-01-09  10183  	bp->hwrm_cmd_max_timeout = le16_to_cpu(resp->max_req_timeout) * 1000;
bce9a0b7900836 Edwin Peer          2022-01-09  10184  	if (!bp->hwrm_cmd_max_timeout)
bce9a0b7900836 Edwin Peer          2022-01-09  10185  		bp->hwrm_cmd_max_timeout = HWRM_CMD_MAX_TIMEOUT;
0fcad44a86bdc2 Michael Chan        2025-04-17  10186  	max_tmo_secs = bp->hwrm_cmd_max_timeout / 1000;
8ff6175139967c Arnd Bergmann       2025-04-23  10187  #ifdef CONFIG_DETECT_HUNG_TASK
0fcad44a86bdc2 Michael Chan        2025-04-17  10188  	if (bp->hwrm_cmd_max_timeout > HWRM_CMD_MAX_TIMEOUT ||
0fcad44a86bdc2 Michael Chan        2025-04-17  10189  	    max_tmo_secs > CONFIG_DEFAULT_HUNG_TASK_TIMEOUT) {
0fcad44a86bdc2 Michael Chan        2025-04-17  10190  		netdev_warn(bp->dev, "Device requests max timeout of %d seconds, may trigger hung task watchdog (kernel default %ds)\n",
0fcad44a86bdc2 Michael Chan        2025-04-17  10191  			    max_tmo_secs, CONFIG_DEFAULT_HUNG_TASK_TIMEOUT);
0fcad44a86bdc2 Michael Chan        2025-04-17  10192  	}
8ff6175139967c Arnd Bergmann       2025-04-23  10193  #endif
ff4fe81d2d49e3 Michael Chan        2016-02-26  10194  
1dfddc41ae4990 Michael Chan        2018-10-14  10195  	if (resp->hwrm_intf_maj_8b >= 1) {
e6ef26991a46e2 Michael Chan        2016-03-28  10196  		bp->hwrm_max_req_len = le16_to_cpu(resp->max_req_win_len);
1dfddc41ae4990 Michael Chan        2018-10-14  10197  		bp->hwrm_max_ext_req_len = le16_to_cpu(resp->max_ext_req_len);
1dfddc41ae4990 Michael Chan        2018-10-14  10198  	}
1dfddc41ae4990 Michael Chan        2018-10-14  10199  	if (bp->hwrm_max_ext_req_len < HWRM_MAX_REQ_LEN)
1dfddc41ae4990 Michael Chan        2018-10-14  10200  		bp->hwrm_max_ext_req_len = HWRM_MAX_REQ_LEN;
e6ef26991a46e2 Michael Chan        2016-03-28  10201  
659c805cc01b3c Michael Chan        2016-06-13  10202  	bp->chip_num = le16_to_cpu(resp->chip_num);
5313845f491f22 Michael Chan        2020-01-27  10203  	bp->chip_rev = resp->chip_rev;
3e8060fa837630 Prashant Sreedharan 2016-07-18  10204  	if (bp->chip_num == CHIP_NUM_58700 && !resp->chip_rev &&
3e8060fa837630 Prashant Sreedharan 2016-07-18  10205  	    !resp->chip_metal)
3e8060fa837630 Prashant Sreedharan 2016-07-18  10206  		bp->flags |= BNXT_FLAG_CHIP_NITRO_A0;
659c805cc01b3c Michael Chan        2016-06-13  10207  
e605db801bdeb9 Deepak Khungar      2017-05-29  10208  	dev_caps_cfg = le32_to_cpu(resp->dev_caps_cfg);
e605db801bdeb9 Deepak Khungar      2017-05-29  10209  	if ((dev_caps_cfg & VER_GET_RESP_DEV_CAPS_CFG_SHORT_CMD_SUPPORTED) &&
e605db801bdeb9 Deepak Khungar      2017-05-29  10210  	    (dev_caps_cfg & VER_GET_RESP_DEV_CAPS_CFG_SHORT_CMD_REQUIRED))
97381a1831124c Michael Chan        2018-08-05  10211  		bp->fw_cap |= BNXT_FW_CAP_SHORT_CMD;
e605db801bdeb9 Deepak Khungar      2017-05-29  10212  
760b6d33410cda Venkat Duvvuru      2018-12-20  10213  	if (dev_caps_cfg & VER_GET_RESP_DEV_CAPS_CFG_KONG_MB_CHNL_SUPPORTED)
760b6d33410cda Venkat Duvvuru      2018-12-20  10214  		bp->fw_cap |= BNXT_FW_CAP_KONG_MB_CHNL;
760b6d33410cda Venkat Duvvuru      2018-12-20  10215  
abd43a13525db7 Venkat Duvvuru      2018-12-20  10216  	if (dev_caps_cfg &
abd43a13525db7 Venkat Duvvuru      2018-12-20  10217  	    VER_GET_RESP_DEV_CAPS_CFG_FLOW_HANDLE_64BIT_SUPPORTED)
abd43a13525db7 Venkat Duvvuru      2018-12-20  10218  		bp->fw_cap |= BNXT_FW_CAP_OVS_64BIT_HANDLE;
abd43a13525db7 Venkat Duvvuru      2018-12-20  10219  
2a516444434ffa Michael Chan        2019-02-19  10220  	if (dev_caps_cfg &
2a516444434ffa Michael Chan        2019-02-19  10221  	    VER_GET_RESP_DEV_CAPS_CFG_TRUSTED_VF_SUPPORTED)
2a516444434ffa Michael Chan        2019-02-19  10222  		bp->fw_cap |= BNXT_FW_CAP_TRUSTED_VF;
2a516444434ffa Michael Chan        2019-02-19  10223  
e969ae5bbfcf48 Michael Chan        2019-05-05  10224  	if (dev_caps_cfg &
e969ae5bbfcf48 Michael Chan        2019-05-05  10225  	    VER_GET_RESP_DEV_CAPS_CFG_CFA_ADV_FLOW_MGNT_SUPPORTED)
e969ae5bbfcf48 Michael Chan        2019-05-05  10226  		bp->fw_cap |= BNXT_FW_CAP_CFA_ADV_FLOW;
e969ae5bbfcf48 Michael Chan        2019-05-05  10227  
c0c050c58d8409 Michael Chan        2015-10-22  10228  hwrm_ver_get_exit:
bbf33d1d9805fc Edwin Peer          2021-08-29  10229  	hwrm_req_drop(bp, req);
c0c050c58d8409 Michael Chan        2015-10-22  10230  	return rc;
c0c050c58d8409 Michael Chan        2015-10-22  10231  }
c0c050c58d8409 Michael Chan        2015-10-22  10232  

:::::: The code at line 10113 was first introduced by commit
:::::: 0fcad44a86bdc2b5f202d91ba1eeeee6fceb7b25 bnxt_en: Change FW message timeout warning

:::::: TO: Michael Chan <michael.chan@broadcom.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
