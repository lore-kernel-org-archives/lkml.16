Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB52A272E62;
	Fri,  9 May 2025 08:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778250; cv=none; b=lBv5hEcQesLRxtHUHFpOdJEfZhNQUuxoLzIY1k3AfBrXVUrg9d3iPcL8BlQ8lDmhDVa2FPJ1njzWw0r3sPuCNqmMy6joWo2CeZIdmBWpo1x0uJYHCymD9k4UFlIoiRUAmaGnY3aVAJGA9vKCppIyrYU4JbOtNNVN6sgUzzvKpPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778250; c=relaxed/simple;
	bh=2DNmR+TH1qCCjaE1/SbrS25VNh8cE1emAmNfpETHcGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdQrImdJHxAE5S1/CEd/F8mAjbiar46MiW0pYQtLtyNRUSNpY4YMRVQYrSJuGvbIXGT7dFIYJxxD1zOhSd1lHWfGrr6XNsaiKw3OwEl6n//Hz3iqKISMTWdaQ562XuQHD4klXU9lXCZDxoD0xd1EWMOpYANZlsK3UksFNl32sh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/MB8reB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/MB8reB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746778248; x=1778314248;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2DNmR+TH1qCCjaE1/SbrS25VNh8cE1emAmNfpETHcGI=;
  b=c/MB8reBvjcwEIq2xzRdaRMf2dgGIXv+PXw/IIQFw1HXxtVuqd2m/Tmi
   GB4JAOPRm6XGle3V3U2BnbDMNIV3DX0Vhv+7sJWjQ7LbHBO/qsV3P0Pf+
   5MIzx+ziZzLGB9wzi3f5ghm+xy/EiAznZpLfpDrVQ1EoEVPyL15uOop+Y
   Wd71lr9oWbLfJMc8ruTKokXoPmuo8mr5DPrgw7TdOhsDgGfZKZG83VOrK
   8vXKG4G/pjFFaQVtRj9/zuWLc/UuGJ6lr0gQkLACDc+CuFwr3AvGMOQOE
   htmsBCsqvYa65kh3/+zzS5+pGHO9AlE0aZrJfAWhjwlNEQtlIyJhdK6K6
   A==;
X-CSE-ConnectionGUID: op01IbdkSRuwrzc/T+y52Q==
X-CSE-MsgGUID: pH59NvPwSEywCvkCNeQqCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59259373"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="59259373"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 01:10:47 -0700
X-CSE-ConnectionGUID: fP9FKv08S2SiqoXFGLqCkA==
X-CSE-MsgGUID: 6yFUYbK6SJqE5Q0LoR/IYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141325389"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 May 2025 01:10:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDIob-000Bo7-1E;
	Fri, 09 May 2025 08:10:41 +0000
Date: Fri, 9 May 2025 16:10:39 +0800
From: kernel test robot <lkp@intel.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com,
	Frank.Li@nxp.com, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
Message-ID: <202505091515.KKkEYL9A-lkp@intel.com>
References: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>

Hi Aman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15-rc5 next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/drivers-i3c-Add-driver-for-NXP-P3H2x4x-i3c-hub-device/20250508-125929
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250508045711.2810207-1-aman.kumarpandey%40nxp.com
patch subject: [PATCH v2 1/2] dt-bindings: i3c: Add NXP P3H2x4x i3c-hub support
reproduce: (https://download.01.org/0day-ci/archive/20250509/202505091515.KKkEYL9A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091515.KKkEYL9A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/i3c/p3h2x4x_i3c_hub.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1801: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'htmldocs' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
