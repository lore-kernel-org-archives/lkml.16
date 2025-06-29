Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A3D23771C
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 19:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751226750; cv=none; b=MImC/2aLdzeDrS3Qlx0qELLpo8Y8/l+KJrtJWfh5vqHVFQJRtmTyO1r4BaGEq8sT2sc5HBJConufSu6gTVrgbK7Mf1dwNr2I7rtPeg5LEnu67u0ydOkguAUHeOqUe81hgArMUaHpic3DToJP7sevDs40jza9dBaXUC2OyqZZT/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751226750; c=relaxed/simple;
	bh=WVUAn15qn8pZfFMR72mBNe+d59ohwbj/sreGBPUsMDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U8o0nYJ5T9ECiJRIw14vrR++YdxYrIzRgLn45usJLIg4Fu0+wewnnzARlf+l71MGwnVYHPL7IGTFPhqNJz6vkt27+2PHMjwqAb0fQltv2qNT4crz1g5vkKno10cCXC1wpaattcHRNiHYAVJkh/eer3v0ZzFxTkJ45d+MfyngAuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eV8nivV8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eV8nivV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751226749; x=1782762749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WVUAn15qn8pZfFMR72mBNe+d59ohwbj/sreGBPUsMDA=;
  b=eV8nivV86Bytax7lGDCirR5TXggngGaJk+yMFI8EPJqhcMBeJh95CCra
   VHOR/7LbmOurC0MIq/an5/zGxbUVHn6SeFHXE6CQeen83pEtFdl/4B+zI
   lDCpg6fl8v1p4uV/B/RMKWmvD9Zaq4HDaoLGf6ghuJlp2xH0q1QDqVVUt
   8fPICVwabQUI6AdKEDiVIfVn0aHLu+Uk2XiuOOTmKj9RL/iaBWz2aHl7G
   3NNZirFXR2XjdR8/J0AUnKcUvzvHJK4kxUVDJzUCt0Cct3W/cA7lkYeso
   pBw1avUuoV7wT1N83QSWiV0q7r5v0bq9POW+fi2/eXTx4jmm1NKXA7jT6
   Q==;
X-CSE-ConnectionGUID: aMBAFxWKRK2x/QAiEgDLgw==
X-CSE-MsgGUID: 62Gu7ymDR4KgS4B3wyeQDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="63707414"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="63707414"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 12:52:29 -0700
X-CSE-ConnectionGUID: IWkpNjgoTeW6ympUjaLX1A==
X-CSE-MsgGUID: fGdJyy9dQdmPsFuboUhk1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="153367254"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2025 12:52:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVy4c-000YBW-0t;
	Sun, 29 Jun 2025 19:52:22 +0000
Date: Mon, 30 Jun 2025 03:52:13 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rodrigo Siqueira <siqueira@igalia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
	linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
	miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
	seanpaul@google.com, nicolejadeyee@google.com,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v6 1/8] drm/vkms: Create helpers macro to avoid code
 duplication in format callbacks
Message-ID: <202506300323.LXmrpHFL-lkp@intel.com>
References: <20250628-b4-new-color-formats-v6-1-2125b193f91a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628-b4-new-color-formats-v6-1-2125b193f91a@bootlin.com>

Hi Louis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bb8aa27eff6f3376242da37c2d02b9dcc66934b1]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-vkms-Create-helpers-macro-to-avoid-code-duplication-in-format-callbacks/20250628-065148
base:   bb8aa27eff6f3376242da37c2d02b9dcc66934b1
patch link:    https://lore.kernel.org/r/20250628-b4-new-color-formats-v6-1-2125b193f91a%40bootlin.com
patch subject: [PATCH v6 1/8] drm/vkms: Create helpers macro to avoid code duplication in format callbacks
config: x86_64-randconfig-073-20250630 (https://download.01.org/0day-ci/archive/20250630/202506300323.LXmrpHFL-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506300323.LXmrpHFL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506300323.LXmrpHFL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:306 Excess function parameter '__VA_ARGS__' description in 'READ_LINE'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:333 function parameter 'a' not described in 'READ_LINE_ARGB8888'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:333 function parameter 'r' not described in 'READ_LINE_ARGB8888'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:333 function parameter 'g' not described in 'READ_LINE_ARGB8888'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:333 function parameter 'b' not described in 'READ_LINE_ARGB8888'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:343 function parameter 'a' not described in 'READ_LINE_le16161616'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:343 function parameter 'r' not described in 'READ_LINE_le16161616'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:343 function parameter 'g' not described in 'READ_LINE_le16161616'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:343 function parameter 'b' not described in 'READ_LINE_le16161616'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
