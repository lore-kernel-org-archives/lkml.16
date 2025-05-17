Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06C05680;
	Sat, 17 May 2025 01:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747444552; cv=none; b=aQBAzZEaEpBdzDQr7686G3WU8aOqxj48WbyHwR2t6F9bR3IZJQfesbo2djUIs2VhendcdneyyFf+dqeXTlZG/yaqwRTcVGwjKd6iD0vu/kf6USGgb7Sxbn5t9RE8r2KMrJ0QwYLcm8C2uB81lpHEJZJ44+uUJpl2QVaqTTP05/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747444552; c=relaxed/simple;
	bh=XEliipcAij5i/dpOQOsz2I+6Dbet09GKfYxkCjvWp68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bkAcW9BjUZ7dCFosSa/aiQgD5LX72xhIpMia2BwcnUZ5T5b4g+BD0GtJC7JAJdIsyxna+gEseD0HJ3KH1RlGUOq4xJA6FcP72NdzCWX21g9t7Ub5/Ane60Kqo2x6Cqc6C289JhMPXDC1XIuMe9JtGO9MPuabNCXVt5Ojqttdb60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/SBOHUi; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/SBOHUi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747444551; x=1778980551;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XEliipcAij5i/dpOQOsz2I+6Dbet09GKfYxkCjvWp68=;
  b=L/SBOHUipxE1jM/Mgb06s7lcB/gvjiFv08YePH3eYRWpXQ/RfsPTfY8w
   SEF6F3B61+Z75U07tKxwNVmpKTk/70GylO4XUlrs8hV7btqPHqK3AdZN9
   wNAYo1ohh/h4TmNI7dIGna54RBM/l3MeMKzNsngNk9FCKP2yq0Af0uRIm
   JaCSVK2KVB6IGacCBaNMm6TVs/O1ob4fWpjgbTH3xukDTSJFOgIDoOeTe
   T/9jtmNM2v5s7jlqy/sN3TNE9q6FaRCOOW24m13JIbXlsv+w5uzknpKP6
   3pHbxbNKSXet58k/L3fTophpo/txAJ3UDPRczhnSKBG4xFLZPndlCuXzg
   Q==;
X-CSE-ConnectionGUID: ywZ2y5NUTuq1KUHhXnKA1A==
X-CSE-MsgGUID: KZtgTwsKRL+eeV3NNfaphw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49329587"
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="49329587"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 18:15:50 -0700
X-CSE-ConnectionGUID: 65PPEcbGRyiYqMAWDp2HvQ==
X-CSE-MsgGUID: +cHO9/wNSZuZSymM+wcWsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,295,1739865600"; 
   d="scan'208";a="143721661"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 May 2025 18:15:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uG69Q-000Jq3-1a;
	Sat, 17 May 2025 01:15:44 +0000
Date: Sat, 17 May 2025 09:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: zhangsenchuan@eswincomputing.com, gregkh@linuxfoundation.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Thinh.Nguyen@synopsys.com,
	p.zabel@pengutronix.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	yangwei1@eswincomputing.com,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>
Subject: Re: [PATCH v1 2/2] usb: dwc3: eic7700: Add EIC7700 usb driver
Message-ID: <202505170848.MGykwPlY-lkp@intel.com>
References: <20250516095408.704-1-zhangsenchuan@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516095408.704-1-zhangsenchuan@eswincomputing.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus robh/for-next westeri-thunderbolt/next linus/master v6.15-rc6 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhangsenchuan-eswincomputing-com/dt-bindings-usb-Add-Eswin-EIC7700-Usb-controller/20250516-175800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250516095408.704-1-zhangsenchuan%40eswincomputing.com
patch subject: [PATCH v1 2/2] usb: dwc3: eic7700: Add EIC7700 usb driver
config: arm-randconfig-004-20250517 (https://download.01.org/0day-ci/archive/20250517/202505170848.MGykwPlY-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505170848.MGykwPlY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505170848.MGykwPlY-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: dwc3_eswin_probe+0x3c4 (section: .text) -> dwc3_eswin_deassert (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
