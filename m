Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A320D27470;
	Sat, 17 May 2025 23:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747524575; cv=none; b=uknsFUVCpIkDDm5UXIg47kAitS71qLZwqKOz4Th/Q4Sbqct8BIDZ2kKe2u6Eiiq4T5BraoykHreesh1jBRHwW9iwy9hfZo6VGcG81NqISusBsvPXuAtSTaaYlCiS27+KW3x1WrfNlymd795lMw9/BSsHahg23s5HInVshDTU4uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747524575; c=relaxed/simple;
	bh=+N5lFSz20yfTznoLYimB/B5/K33oBnBQz4l+F/eNhms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvrRaAuvWqoJbXIna2MWhRl7NBLihmh5P8XX2gNVyd+NTyxK9LWstiJZk8lYcA0oh2OcxEAQJDyNJA8Ij7nXafK01HW/LS85uiMRs7NrJiqhuQtEmAmMmgrP6vSTOvTj9Mgu59pS1jj9OJZb2IqemgnsRE/LvcONKATKDVWfXyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yur6uYCM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yur6uYCM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747524572; x=1779060572;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+N5lFSz20yfTznoLYimB/B5/K33oBnBQz4l+F/eNhms=;
  b=Yur6uYCMbQnP9Y7sng7TKN+UyL83R3hG3Hlz3ESQLxMIC/EO2ASuP0SI
   chGjJjLALu8IpC2C+40yxzfNUqQEJJ1pqx6rJi27lT5U4nxObIJpjVzBi
   mqzjQ4U6f3Dc8tVHp/JEn8t+2X0sAD0vUZm4qpmd7F43EU0JCl7bnOJfl
   m9b8ZuwDhTd+CNYNWu5Pl+qzGMvmykOJGUAP6V5Sddw6d2B+ozAE+DIAq
   s49hOnX85YcdNpweu7tLVVpD0+W4GQEb069sQTj7AdL6m4L9VfXeGhysV
   E/8vPCjx1k0I5IVEePeOtKgioyNRskIMStPi0CHqTWjNVLyNrTYiZBvGB
   g==;
X-CSE-ConnectionGUID: 2zvD0HT8SWOt1nAXVpwAxA==
X-CSE-MsgGUID: 4d/QPnk2R0mzt6rl3haISQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="49601206"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="49601206"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 16:29:31 -0700
X-CSE-ConnectionGUID: O6HBPcOMQyu85uTDRnncEQ==
X-CSE-MsgGUID: Es0LnsFwRWaT+ee1ohzpfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="170061095"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 May 2025 16:29:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGQy6-000KUh-3A;
	Sat, 17 May 2025 23:29:26 +0000
Date: Sun, 18 May 2025 07:28:43 +0800
From: kernel test robot <lkp@intel.com>
To: zhangsenchuan@eswincomputing.com, gregkh@linuxfoundation.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Thinh.Nguyen@synopsys.com,
	p.zabel@pengutronix.de
Cc: oe-kbuild-all@lists.linux.dev, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, yangwei1@eswincomputing.com,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>
Subject: Re: [PATCH v1 2/2] usb: dwc3: eic7700: Add EIC7700 usb driver
Message-ID: <202505180701.e5gwT1y2-lkp@intel.com>
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

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus robh/for-next westeri-thunderbolt/next linus/master v6.15-rc6 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhangsenchuan-eswincomputing-com/dt-bindings-usb-Add-Eswin-EIC7700-Usb-controller/20250516-175800
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250516095408.704-1-zhangsenchuan%40eswincomputing.com
patch subject: [PATCH v1 2/2] usb: dwc3: eic7700: Add EIC7700 usb driver
config: x86_64-randconfig-005-20250518 (https://download.01.org/0day-ci/archive/20250518/202505180701.e5gwT1y2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180701.e5gwT1y2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505180701.e5gwT1y2-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dwc3_gadget_get_link_state" [drivers/usb/dwc3/dwc3-eic7700.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
