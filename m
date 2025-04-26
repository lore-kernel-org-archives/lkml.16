Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F5441C71
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 21:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745701241; cv=none; b=qWyFKdXhd3nMvjZX4q822f7Fx3FC+/bZ1QvVNaJWI7D5b6+3dDKlfjE0FnuB5/Pp2d125iNcjueoNwO0j4Dk/+G/ebpm54/gmigYRyMqIml4CenmIcL3I5HDTqlpo/Xoox/3/AQi8a85apB9sicn8U64t5j2nUEIbQFO0FDHoa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745701241; c=relaxed/simple;
	bh=33Wf2PI+zGPvkZcomFlBU/xgf0HsrI1SLw/lHLdvQgw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oZ3Z0GecdooctPT5tX9qZIKI+6GbBgyJ0eGv8jJNHMJUg1f53agCq+tRk3ZnXR1VL/gysjcPxckLcieMMN9MIfmGwN9Xaup0/0QKadgaWBGlvPV6d8qZ43kriGtf2KBCxsj1HhUTMmHBxrPFiqVYPUp++iRh82b0hjj4ULDDqtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rb3H/Opj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rb3H/Opj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745701239; x=1777237239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=33Wf2PI+zGPvkZcomFlBU/xgf0HsrI1SLw/lHLdvQgw=;
  b=Rb3H/OpjZvaYXj44hbORFjx/kTpskgLWU39nNS0Xa2lrwrHJWGaJXxv7
   lq6jMN4tnm3g00aHfpVg1bHBe2ERRd3wGZfwDftLbU0bWPtkDXuHVHndL
   fHKYjyfUyq8KkGt31ZJ9WWgdmvFPuBil/3pxiqkSbuCyc9ypaZWlmXr5a
   YgHYp1Lw3mVopfNzmJCku4aqS065lJcTcND9TsH08IMsSYYXhZmqOpkIL
   v6MdOwg/o7oBI2oTKKwi1xMFMcNOS22U73gGUvzMZXrvgt603u9dvGiKL
   RyIbADbLaNRoGfOvSUK4PgoO0QhIIhUKsMwXQwabjCZMEfEo5/V1Iwwj3
   w==;
X-CSE-ConnectionGUID: ntSiJwjjQlCXDX2mtxKaWA==
X-CSE-MsgGUID: cttAfhIKTBOzE/wh4qVbVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="51001168"
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="51001168"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 14:00:39 -0700
X-CSE-ConnectionGUID: B4AjNn02TCWNWxXFsYGbCw==
X-CSE-MsgGUID: n66orxfuT7+Hd7ZlSOHqmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,242,1739865600"; 
   d="scan'208";a="137227638"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Apr 2025 14:00:36 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8mdW-0005zV-19;
	Sat, 26 Apr 2025 21:00:34 +0000
Date: Sun, 27 Apr 2025 04:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: drivers/gpu/drm/panel/panel-himax-hx83102.c:67: warning: Cannot
 understand          * @width_mm: width of the panel's active display area
Message-ID: <202504270445.BKZnZEmV-lkp@intel.com>
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
commit: 0ef94554dc40fbdb7e57ff90cd1e7fa71e1e89fd drm/panel: himax-hx83102: Break out as separate driver
date:   12 months ago
config: sparc-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250427/202504270445.BKZnZEmV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 10.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270445.BKZnZEmV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270445.BKZnZEmV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-himax-hx83102.c:67: warning: Cannot understand          * @width_mm: width of the panel's active display area
    on line 67 - I thought it was a doc line


vim +67 drivers/gpu/drm/panel/panel-himax-hx83102.c

    62	
    63	struct hx83102_panel_desc {
    64		const struct drm_display_mode *modes;
    65	
    66		/**
  > 67		 * @width_mm: width of the panel's active display area
    68		 * @height_mm: height of the panel's active display area
    69		 */
    70		struct {
    71			unsigned int width_mm;
    72			unsigned int height_mm;
    73		} size;
    74	
    75		int (*init)(struct hx83102 *ctx);
    76	};
    77	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
