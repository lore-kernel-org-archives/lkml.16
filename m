Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EDA1F0E55
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751232520; cv=none; b=aj7uyylgTQtwumacr/jwBPHH/0JRyEE5nXhuwqKmlfVWeOerYF5iN/E9trJY3lR4mcaHmZhtkRV4oMwS63n+Jg/t/QcEJYBUBUYXquf/kZYLdM0Hw1tfUJ0oPy51U/KwqDK5QCo4dkpOHyZGOztgOmvRG6kk7EM3WkIkv2lX1s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751232520; c=relaxed/simple;
	bh=slX9fChmUoL5l9nvF+ZMylk+SnKP5UtGpkfN0xJ+NZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDDyxnhHCcfIc+FY9t2WMMkXXxMrNFe2mvHHlFpCGbmeTbyYiTTHrevIKxojgBCVbddzVoK7+mwfLhSncZ96kTPE8Mrh2AZqPyI9cD3UHDYFOwpJdZZ+zuPbHEr+R3FZ4zJIOyd4JVdopKA16v9bvvY8zr0nzDXBfp+0deW6/T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BONlcnQl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BONlcnQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751232519; x=1782768519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=slX9fChmUoL5l9nvF+ZMylk+SnKP5UtGpkfN0xJ+NZs=;
  b=BONlcnQlEZtZcQtreh9eJWTSVYCNA6Jb4RneZyU00qr3+DmVtoMf3XNt
   MWvl6Ol6gAEeyrkbK8RT3bOc0qoK+3smgDyNWO4DeyX4VmKvxN0uM2TCk
   lS3RwKc2btRZaJjCwZFTYwFwfSm2zyTLXR3HCleJsCHlP1lJy6ED87sZM
   ldzd9wYaSOF0w5x5NT+m2gMOZjAeYQoKneQQUqUGFuL+K3lY2SaWWhF4I
   5stzCpoytkFytip/5wBWxKUqyahiMP0LOkTGl49mI49ES32KqQxRI3wtS
   INH2pbFHCELmraHT0ls/A7fONf9wASMtv9xpcNq9/05uUl81p8qUhGtdo
   g==;
X-CSE-ConnectionGUID: FXciCS5nRyW5m+tRb2iMEA==
X-CSE-MsgGUID: wZ+Ks2gVRl2lIgnfsHLXcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="57261636"
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="57261636"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 14:28:36 -0700
X-CSE-ConnectionGUID: 6WMCJYmKRu+jB6KsrlCtww==
X-CSE-MsgGUID: qdWMCtPQQsmFYRdXgAHS5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,276,1744095600"; 
   d="scan'208";a="153026179"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Jun 2025 14:28:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVzZd-000YFC-2f;
	Sun, 29 Jun 2025 21:28:29 +0000
Date: Mon, 30 Jun 2025 05:27:59 +0800
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
Subject: Re: [PATCH v6 7/8] drm/vkms: Create helper macro for YUV formats
Message-ID: <202506300528.vxGyGV82-lkp@intel.com>
References: <20250628-b4-new-color-formats-v6-7-2125b193f91a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628-b4-new-color-formats-v6-7-2125b193f91a@bootlin.com>

Hi Louis,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bb8aa27eff6f3376242da37c2d02b9dcc66934b1]

url:    https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-vkms-Create-helpers-macro-to-avoid-code-duplication-in-format-callbacks/20250628-065148
base:   bb8aa27eff6f3376242da37c2d02b9dcc66934b1
patch link:    https://lore.kernel.org/r/20250628-b4-new-color-formats-v6-7-2125b193f91a%40bootlin.com
patch subject: [PATCH v6 7/8] drm/vkms: Create helper macro for YUV formats
config: x86_64-randconfig-073-20250630 (https://download.01.org/0day-ci/archive/20250630/202506300528.vxGyGV82-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250630/202506300528.vxGyGV82-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506300528.vxGyGV82-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/gpu/drm/vkms/vkms_formats.c:317 Excess function parameter '__VA_ARGS__' description in 'READ_LINE'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:344 function parameter 'a' not described in 'READ_LINE_ARGB8888'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:344 function parameter 'r' not described in 'READ_LINE_ARGB8888'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:344 function parameter 'g' not described in 'READ_LINE_ARGB8888'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:344 function parameter 'b' not described in 'READ_LINE_ARGB8888'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:354 function parameter 'a' not described in 'READ_LINE_le16161616'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:354 function parameter 'r' not described in 'READ_LINE_le16161616'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:354 function parameter 'g' not described in 'READ_LINE_le16161616'
   Warning: drivers/gpu/drm/vkms/vkms_formats.c:354 function parameter 'b' not described in 'READ_LINE_le16161616'
>> Warning: drivers/gpu/drm/vkms/vkms_formats.c:490 Excess function parameter '__VA_ARGS__' description in 'READ_LINE_YUV_SEMIPLANAR'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
