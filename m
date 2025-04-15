Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20FB83CC7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744676971; cv=none; b=JzwTM4x6iQAZrMNgwp4mzFAkKUHygR3w0/9gXFLMEpN/rflO9aGrgpJlVs0v7U4xk5FBjZxPGhN3UMK5uP8Z3zegXKtebq9XwrQeNIq5RdJOCpycaH4LqNMBa8KsKZMukfihWO/QY3mYo0EHi/dV5Zrp8CXG0lcCODmJsWaO0hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744676971; c=relaxed/simple;
	bh=8EzOJB+pXPABf5NsMoXXvwMFlpkARh2+jj1gygApY8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pl9kya5a79pPeydR2OiJpve/eaOoGg0EG0YOoyc0UM7NODCt9QHWY69Mz12dQHGNCoNoY4TUCKwOj/tDTy/IxefQKa8Ssg4jHGhx4qYcqeYlpLyBgeh9FDOxsOZYeUVPrlHEHcM3OkwP6z7OcDBDXITFEJjRbz1O7RR8dIsWQEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N386l60s; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N386l60s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744676969; x=1776212969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8EzOJB+pXPABf5NsMoXXvwMFlpkARh2+jj1gygApY8s=;
  b=N386l60siIZdxhy0344Jx0gQNESeXr8+3H9Yoo6qmL+2qZjY8nFZA14H
   I0JT/HQ3fektYCRGsOBVrUAhz9KNAUT2+e5zVXH++tvyyWAC4aD90X3Bj
   kUDk+ZK6nO3du73xDc7RSmZxXIBM91NLw5JcoKi4CNFYn3o6nDUu808cu
   op7hbmyQEmgEJbKkPUxOf37Vnwlu9vVkkWWxrAklz5TBpHY2IOZhcv+wD
   XY5GbRKFXl6Wn9Q2GpR2n7MXZPxtRk1YHxlD51BEUVWI/oSrCbVPfmsAy
   183lif/OP3H4d+yn2xmlyuppZnN5TOf1bynDpd/O9ZEVvE+lggd8A8IPV
   g==;
X-CSE-ConnectionGUID: ciKcJLtGQki8cBYHbUOI+w==
X-CSE-MsgGUID: E3+tPvVRTvORu5uyYTCHtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46047086"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46047086"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 17:29:28 -0700
X-CSE-ConnectionGUID: 5/a/u3FwTnurGGcR2qnqTg==
X-CSE-MsgGUID: GFI7FPUbQLiCEXbQKB0pmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="129921798"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Apr 2025 17:29:24 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4UAz-000Er8-1e;
	Tue, 15 Apr 2025 00:29:21 +0000
Date: Tue, 15 Apr 2025 08:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: Cedric Xing <cedric.xing@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev,
	Dionna Amalie Glaze <dionnaglaze@google.com>,
	Guorui Yu <guorui.yu@linux.alibaba.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Dan Middleton <dan.middleton@linux.intel.com>,
	Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Cedric Xing <cedric.xing@intel.com>
Subject: Re: [PATCH v4 5/5] virt: tdx-guest: Expose TDX MRs as sysfs
 attributes
Message-ID: <202504151006.wDRcAJS7-lkp@intel.com>
References: <20250414-tdx-rtmr-v4-5-7edfa8d98716@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-tdx-rtmr-v4-5-7edfa8d98716@intel.com>

Hi Cedric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8ffd015db85fea3e15a77027fda6c02ced4d2444]

url:    https://github.com/intel-lab-lkp/linux/commits/Cedric-Xing/tsm-mr-Add-TVM-Measurement-Register-support/20250415-060059
base:   8ffd015db85fea3e15a77027fda6c02ced4d2444
patch link:    https://lore.kernel.org/r/20250414-tdx-rtmr-v4-5-7edfa8d98716%40intel.com
patch subject: [PATCH v4 5/5] virt: tdx-guest: Expose TDX MRs as sysfs attributes
reproduce: (https://download.01.org/0day-ci/archive/20250415/202504151006.wDRcAJS7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504151006.wDRcAJS7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest-mr
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1804: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'htmldocs' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
