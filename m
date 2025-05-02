Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25613EEA8;
	Fri,  2 May 2025 02:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746151513; cv=none; b=GptLaz9k6ac1DetW6F8T+YnIF+18M/sLbz4Njs2wK6yB1dY2W0sM1Eo64lc9Et7FZSR+zQPUyGl+8cWh0OFn72sUUtJOHxJFFZyiL01dRUzK0s0eyUDlePu8go2kIceDi2WA8dxHgWD6SouiOqiKozkejcDY/KikHQ6SSSdJnH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746151513; c=relaxed/simple;
	bh=/yF8kcn+v95yqfwAfHX+ghDjf2LWtZweUCg4gNHbCxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+5AF+oTywaRzATuVLgmAri5Iu6CUwX9rHgIb/k92EFVNSBkmSf5KGBEJOGviOvx3fOSzyikLOm4FO7T/gGwF/Q/bEyaGra0Yy1Zu03RTeXCfRuE/LOvBfMQcd4qa/z4FDYIYxR0Sc3Zr7NeVHSsjNYoKAiJTQxF9JrvEtutNxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DoJPWIYj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DoJPWIYj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746151512; x=1777687512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/yF8kcn+v95yqfwAfHX+ghDjf2LWtZweUCg4gNHbCxo=;
  b=DoJPWIYjA4PTJGYHbGVt/pd7mAOaKDefCvnzIlove/win7T4SMraV06k
   gKkfCiXLGnOoy7J2w0Uv/WrMsHxrl7Cu5kSk5EXrToBReVZGpzItCo8/H
   6MxLWGaH0+aHgx+97n76MGWSoZwB52OWKMXNS4gSiu8sn4sgOhGwbL+P+
   gXKIBEdb+aoQpppKjb1egvenwG1iLyBGx5aCh53998Ja3TESkdAL6nsYf
   W7vp9azJ2F5EpJ0arhltRu7tZO//FCketBNDXh+rYuWBQRwl9eKZWFLmo
   7W9kwny9GWYhDfoS4CMf9uaj3u7r5rpx40kI1ss+42yGNNgNUglbsS8ZM
   g==;
X-CSE-ConnectionGUID: lmi781f1TVOJt/wIFimccg==
X-CSE-MsgGUID: QuEzOavWS7qEhQPzi/Kwmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47718416"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="47718416"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 19:05:12 -0700
X-CSE-ConnectionGUID: qdJ8JRw5QySAgt1tBZiViA==
X-CSE-MsgGUID: L19U8F8/Se6AJA2eBdsjNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="139676218"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 May 2025 19:05:07 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAflx-0004Uv-1o;
	Fri, 02 May 2025 02:05:05 +0000
Date: Fri, 2 May 2025 10:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: Paresh Bhagat <p-bhagat@ti.com>, nm@ti.com, vigneshr@ti.com,
	praneeth@ti.com
Cc: oe-kbuild-all@lists.linux.dev, kristo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, khasim@ti.com, v-singh1@ti.com,
	afd@ti.com
Subject: Re: [PATCH 3/3] arm64: dts: ti: Add support for AM62D2-EVM
Message-ID: <202505020921.tGSgIFVU-lkp@intel.com>
References: <20250501072923.1262414-4-p-bhagat@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501072923.1262414-4-p-bhagat@ti.com>

Hi Paresh,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.15-rc4 next-20250501]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paresh-Bhagat/dt-bindings-arm-ti-Add-bindings-for-AM62D2-SoC/20250501-153150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250501072923.1262414-4-p-bhagat%40ti.com
patch subject: [PATCH 3/3] arm64: dts: ti: Add support for AM62D2-EVM
config: arm64-randconfig-003-20250502 (https://download.01.org/0day-ci/archive/20250502/202505020921.tGSgIFVU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020921.tGSgIFVU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020921.tGSgIFVU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/boot/dts/ti/k3-am62d2-evm.dts:15:10: fatal error: k3-timesync-router.h: No such file or directory
      15 | #include "k3-timesync-router.h"
         |          ^~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +15 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts

    14	
  > 15	#include "k3-timesync-router.h"
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
