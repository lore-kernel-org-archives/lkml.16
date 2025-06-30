Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCC021D59F;
	Mon, 30 Jun 2025 22:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751321360; cv=none; b=X3l5UmfmlJAsY9Dl/gvpQL7D6dqSEoonTo7kkscIpSczLmhiLlwLi18H9thdTA/ycgt3gxsW0LuLYCQaQ/ews/MTGocsaoZdrMjoAc0cjabo4isY01nVTANn0B8qsMGq5QPM9XIEELiDp/xdjcP37vAyJur3bo9jHtzPxgjb2n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751321360; c=relaxed/simple;
	bh=CWF8K0+JEFix5jRu+JNhGBEpCZPOlQ8Ny5a89ql8Tlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=STjXOw+a5pmDYNLviIU0KN25VWEkQPPmPeQ60Feu2phgrXBHnJ8fAnmSt8r9HAFEIVr3R6FAoNQ9r1u58a/hfAcVFOGGQ0LNOlH7rAUOUZpoUVYMa6oVZI9tDh/4dg1dkbtxl8wf+f8HgV70dhVV3kA7fHlbHTmLGdUWiTTcNic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bcvh4UYE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bcvh4UYE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751321359; x=1782857359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CWF8K0+JEFix5jRu+JNhGBEpCZPOlQ8Ny5a89ql8Tlw=;
  b=Bcvh4UYEJEi5IuzPlumsFFGnZuAE7x0+ctg94P0oXg7Hexu3V/suE0SE
   /Dq+ONUZ/pdX/YdaNlgdR6mJUTFhB3U8oRtQbyhxV3iqlRu1vbokRQlwC
   5eM4IpfOFAhm6UAP8rmJrEDd2kLVd4ubWcTGmFa9zqw019QxyuWEn0sMa
   nOzF/6ocZt6hvH9cKttJuvDPE+s1aGVVYIYGoJfuzsUsqqt0KAq84qN1+
   qy+3YCo7yF2I57dsLxwKOy6OBmUR+75Rn+Dxa+ZaS+N/km07b27tcL9AD
   T5MhwB4IcyUAeaM6QoNGm2alHWNSdeHbt7CqJHodv9+QGic0oXsvoVBnp
   A==;
X-CSE-ConnectionGUID: sWHWhzk0SYCILXw0FGx+JA==
X-CSE-MsgGUID: axsakdRHRbSBzV2VoBa/GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52676696"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="52676696"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 15:09:18 -0700
X-CSE-ConnectionGUID: 9nz+v2rvRQmegypfaMeFXg==
X-CSE-MsgGUID: m5ujfXIKTwek1eo9LxXxbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="152965787"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 30 Jun 2025 15:09:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWMgZ-000ZQ2-39;
	Mon, 30 Jun 2025 22:09:11 +0000
Date: Tue, 1 Jul 2025 06:08:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kurt Borja <kuurtb@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Joshua Grisham <josh@joshuagrisham.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Antheas Kapenekakis <lkml@antheas.dev>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com, Kurt Borja <kuurtb@gmail.com>
Subject: Re: [PATCH v4 1/6] platform/x86: firmware_attributes_class: Add
 device initialization methods
Message-ID: <202507010553.vgtA0xlb-lkp@intel.com>
References: <20250630-fw-attrs-api-v4-1-1a04952b255f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630-fw-attrs-api-v4-1-1a04952b255f@gmail.com>

Hi Kurt,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 73f0f2b52c5ea67b3140b23f58d8079d158839c8]

url:    https://github.com/intel-lab-lkp/linux/commits/Kurt-Borja/platform-x86-firmware_attributes_class-Add-device-initialization-methods/20250630-160549
base:   73f0f2b52c5ea67b3140b23f58d8079d158839c8
patch link:    https://lore.kernel.org/r/20250630-fw-attrs-api-v4-1-1a04952b255f%40gmail.com
patch subject: [PATCH v4 1/6] platform/x86: firmware_attributes_class: Add device initialization methods
config: x86_64-randconfig-073-20250701 (https://download.01.org/0day-ci/archive/20250701/202507010553.vgtA0xlb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010553.vgtA0xlb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507010553.vgtA0xlb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/platform/x86/firmware_attributes_class.c:39 function parameter 'drvdata' not described in 'fwat_device_register'
>> Warning: drivers/platform/x86/firmware_attributes_class.c:39 Excess function parameter 'data' description in 'fwat_device_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
