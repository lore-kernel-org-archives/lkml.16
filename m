Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4DE289357
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727238; cv=none; b=ngFWpwQwc9yPnFAY5oQSobfPaxaaynZUK3w1g1izSsI7G8ryPsRRHa392Hpf1UwAhLe05AfrQJBE7rwE1thjhfy1D7tBzLdCWFVivp36NYFYvKzyqThaiVyfyLu0C0imN+iEgYqmtXPMjq8G94iGutoxt3FLCRejknvHylC24aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727238; c=relaxed/simple;
	bh=z63JfSsHpIErknyiCFjXZ6ek1chC5/7Pr7BECXZasXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHgeYma5s9WxuRfeeqZD0HhlKfEhXUPeGoC4ighB11lKGnRccud71yLw/t7jp4g3H0Pi/uMt8BDRCsWzBf92lyuZkhyPTjooBNwheLxYodscJd9uZNidrnBqTbjBjX4sVhEc1BvY/VoRPWUtXx0s9PL5MhWjgsJ7cJ54j4qpPDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoeS8n8O; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoeS8n8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744727237; x=1776263237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z63JfSsHpIErknyiCFjXZ6ek1chC5/7Pr7BECXZasXY=;
  b=HoeS8n8OpaXqPmO9D8eNIkOveqBMBVjC9OiqWdsSuQsU297SmUizrw03
   A9pvxUYBJC2RsiAHhnFqwNSChcsJZyvkFUHbf3kV+fCqXihen7aEUDfoG
   7kdZ9mG35kJ/V+XpBcOXoxKcVOevaYrGEchDDwC80ZyGnWp0qAGB5X23K
   ICuPSC/yovcXyMpKcp3MxYfPT1U+I8jtXdbI48HLXeWtiAYxilj/ynRkj
   Gc/VwULb5WejK/WtMWNRDIXKxRMsGnb9aDgJAXk2fRDiwi+peh59zt+f3
   WkRyeCgiAX1jy/JBjvLkZ5q1z60C1vQJvFZ6xatdBon3iRZQUzGkRJAw4
   g==;
X-CSE-ConnectionGUID: 4QnNUCc0QAOI2I2QXkAUBQ==
X-CSE-MsgGUID: iPklUTxITDi7EMPA2quBJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="45473541"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="45473541"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 07:27:16 -0700
X-CSE-ConnectionGUID: sacFQhjARimp6JlLoAQRFw==
X-CSE-MsgGUID: Ay/bqOuZSU2GocGP1WfIkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="129909049"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Apr 2025 07:27:12 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4hFk-000GHi-2X;
	Tue, 15 Apr 2025 14:27:08 +0000
Date: Tue, 15 Apr 2025 22:26:21 +0800
From: kernel test robot <lkp@intel.com>
To: Xin Ji <xji@analogixsemi.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, bliang@analogixsemi.com,
	qwen@analogixsemi.com, treapking@chromium.org,
	Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] drm/bridge:anx7625: Enable DSC feature
Message-ID: <202504152230.BCIdpiru-lkp@intel.com>
References: <20250414100502.1604717-3-xji@analogixsemi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414100502.1604717-3-xji@analogixsemi.com>

Hi Xin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.15-rc2 next-20250415]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xin-Ji/drm-mipi-dsi-Add-compression-supported-flag-in-drm_mipi_dsi/20250414-181005
base:   linus/master
patch link:    https://lore.kernel.org/r/20250414100502.1604717-3-xji%40analogixsemi.com
patch subject: [PATCH v3 3/3] drm/bridge:anx7625: Enable DSC feature
config: arm64-randconfig-002-20250415 (https://download.01.org/0day-ci/archive/20250415/202504152230.BCIdpiru-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504152230.BCIdpiru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504152230.BCIdpiru-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/gpu/drm/bridge/analogix/anx7625.o: in function `anx7625_bridge_mode_set':
>> anx7625.c:(.text+0x28d4): undefined reference to `drm_dsc_set_rc_buf_thresh'
>> aarch64-linux-ld: anx7625.c:(.text+0x28dc): undefined reference to `drm_dsc_set_const_params'
>> aarch64-linux-ld: anx7625.c:(.text+0x28e4): undefined reference to `drm_dsc_initial_scale_value'
>> aarch64-linux-ld: anx7625.c:(.text+0x2900): undefined reference to `drm_dsc_setup_rc_params'
>> aarch64-linux-ld: anx7625.c:(.text+0x290c): undefined reference to `drm_dsc_compute_rc_parameters'
>> aarch64-linux-ld: anx7625.c:(.text+0x2930): undefined reference to `drm_dsc_pps_payload_pack'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
