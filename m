Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C56191F66
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745287177; cv=none; b=EcuMhK8r4cew2WHdfpiBAX+goulfSR2zJlclAptxC3fMwQ+figFwT75m/bM2OocHUMB7yzEfromLRhkrgIYcYX4E2wJEBaGR7lTaWOb0M5lyRJuv2S3q3jZSJE2SvTtpxQibyVVXF5QzUFQvLC5f/Yh+GjSd52lX2C8TH8pmbAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745287177; c=relaxed/simple;
	bh=Xd64fh8MqRRrEwKvO6QbDLV/7uoXAP084da/t7pSODo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=unp0xg1N13UOrQZXvkO+xcTKKzrz959/UGPCai9dSOu+sLKrLjE/inBPUhmnmOPEVOY1TJTYfma/lcx4cVpVLf5gbKqfG53H1Z54qF+qQ1UStS8mlSD0NSJgLTf3ZQFDpxGQQ5nQcjwfeevSLkWzAmKldmaBEP4ABRtT5UFWVmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqtvNTi0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqtvNTi0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745287176; x=1776823176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xd64fh8MqRRrEwKvO6QbDLV/7uoXAP084da/t7pSODo=;
  b=hqtvNTi0qiv5QKN2hbZOiO/oq3pis0K+Tho3JTvSToBWQWhIef/ksY7u
   YCcIDFoRkNVINO1GTMO5tuZpl35rIy8xgkwjn2HU859jqOTNgap2hAfoQ
   wYa/vJJD05VZM68ugFlLJB03Ox5v4yPDhQ503nDJC6+ek9h0+MkqHhrDT
   SggxsbySPZTzBaLq6kjLp47L3fFN/JAzdP0UdH7TYHykE4yXDF78a9aFn
   VQ/yyAJeXhlMQkqr8B4PutprFH8mQVnjp1TlEzOsQ076MjwrS6smuRZs+
   FObsR9FclhDvq+1epUMAY60weeYlsfYFJtYOGgfg5ot1l+/ujiO3+teq1
   g==;
X-CSE-ConnectionGUID: izWhga8QSjWFxzTEa0IuWQ==
X-CSE-MsgGUID: w4UiweBDQZCYL05TOLPCXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57479141"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="57479141"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 18:59:35 -0700
X-CSE-ConnectionGUID: /DxbFNOfTqO24Z8wBe1cYQ==
X-CSE-MsgGUID: OPDvtGt0Spe8cbSYtACBHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="132421031"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Apr 2025 18:59:34 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u72v5-0000WV-0L;
	Tue, 22 Apr 2025 01:59:31 +0000
Date: Tue, 22 Apr 2025 09:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: drivers/media/i2c/lt6911uxe.c:446:14: error: use of undeclared
 identifier 'v4l2_subdev_s_stream_helper'; did you mean
 'v4l2_subdev_is_streaming'?
Message-ID: <202504220916.ikwkHJgy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d7a0577c9db35c4cc52db90bc415ea248446472
commit: e49563c3be09d4639ccff8ca68ef63b6f6c8456d media: i2c: add lt6911uxe hdmi bridge driver
date:   7 weeks ago
config: i386-randconfig-015-20250422 (https://download.01.org/0day-ci/archive/20250422/202504220916.ikwkHJgy-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220916.ikwkHJgy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220916.ikwkHJgy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/lt6911uxe.c:446:14: error: use of undeclared identifier 'v4l2_subdev_s_stream_helper'; did you mean 'v4l2_subdev_is_streaming'?
     446 |         .s_stream = v4l2_subdev_s_stream_helper,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                     v4l2_subdev_is_streaming
   include/media/v4l2-subdev.h:2018:6: note: 'v4l2_subdev_is_streaming' declared here
    2018 | bool v4l2_subdev_is_streaming(struct v4l2_subdev *sd);
         |      ^
>> drivers/media/i2c/lt6911uxe.c:446:14: error: incompatible function pointer types initializing 'int (*)(struct v4l2_subdev *, int)' with an expression of type 'bool (struct v4l2_subdev *)' (aka '_Bool (struct v4l2_subdev *)') [-Wincompatible-function-pointer-types]
     446 |         .s_stream = v4l2_subdev_s_stream_helper,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/lt6911uxe.c:456:13: error: use of undeclared identifier 'v4l2_subdev_get_fmt'; did you mean 'v4l2_subdev_notify'?
     456 |         .get_fmt = v4l2_subdev_get_fmt,
         |                    ^~~~~~~~~~~~~~~~~~~
         |                    v4l2_subdev_notify
   include/media/v4l2-device.h:238:20: note: 'v4l2_subdev_notify' declared here
     238 | static inline void v4l2_subdev_notify(struct v4l2_subdev *sd,
         |                    ^
>> drivers/media/i2c/lt6911uxe.c:460:24: error: use of undeclared identifier 'v4l2_subdev_get_frame_interval'
     460 |         .get_frame_interval = v4l2_subdev_get_frame_interval,
         |                               ^
>> drivers/media/i2c/lt6911uxe.c:703:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     703 | module_i2c_driver(lt6911uxe_i2c_driver);
         | ^
         | int
>> drivers/media/i2c/lt6911uxe.c:703:19: error: a parameter list without types is only allowed in a function definition
     703 | module_i2c_driver(lt6911uxe_i2c_driver);
         |                   ^
   6 errors generated.


vim +446 drivers/media/i2c/lt6911uxe.c

   444	
   445	static const struct v4l2_subdev_video_ops lt6911uxe_video_ops = {
 > 446		.s_stream = v4l2_subdev_s_stream_helper,
   447	};
   448	
   449	/*
   450	 * lt6911uxe provides editable EDID for customers, but only can be edited like
   451	 * updating flash. Due to this limitation, it is not possible to implement
   452	 * EDID support.
   453	 */
   454	static const struct v4l2_subdev_pad_ops lt6911uxe_pad_ops = {
   455		.set_fmt = lt6911uxe_set_format,
 > 456		.get_fmt = v4l2_subdev_get_fmt,
   457		.enable_streams = lt6911uxe_enable_streams,
   458		.disable_streams = lt6911uxe_disable_streams,
   459		.enum_mbus_code = lt6911uxe_enum_mbus_code,
 > 460		.get_frame_interval = v4l2_subdev_get_frame_interval,
   461		.s_dv_timings = lt6911uxe_s_dv_timings,
   462		.g_dv_timings = lt6911uxe_g_dv_timings,
   463		.query_dv_timings = lt6911uxe_query_dv_timings,
   464		.enum_dv_timings = lt6911uxe_enum_dv_timings,
   465		.dv_timings_cap = lt6911uxe_dv_timings_cap,
   466		.get_mbus_config = lt6911uxe_get_mbus_config,
   467	};
   468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
