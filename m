Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4A617BCE;
	Fri,  9 May 2025 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746787386; cv=none; b=PM7Bs8YB+NVBOLdRiHTS63qliDCka4TNqYUhPMXQttbcAgddnIPRqC+h+Bk1GBrlwJWQGqjxyoMlt5g+JXrmQYq8E4a5ueAFysJ0qvFDZ7Mnpx3sRhZ4hm1Rid/DgqxSi7Xt+lVJbQkEt8v7tQiIQTA9Q4nNCP8s/zf7ZR3BKBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746787386; c=relaxed/simple;
	bh=ahUuwjqGna+vJo0oCKdBCeSVplQwA69T4/kkfII8pms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e5E0JxJaI/IrOBrgQxhXDr7jvFXLbtXXXVAAPZWLVIZh1BwK9E4U6P3Zvr+Rwxbpq+kPAjI/cPXKNcrZsrHrYUvXYTTVM1bRC1Z3stT5H5dVp6oEHd8PU2qTSM0UAeOKjDN3VPTb0AuUvrNuzQ0uy4UypByTXGlOnYCBObitxvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jFsaMByV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jFsaMByV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746787385; x=1778323385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ahUuwjqGna+vJo0oCKdBCeSVplQwA69T4/kkfII8pms=;
  b=jFsaMByVmooNQjZ700lTpeu/B8E8Ggt4oJIvPlCS4Ei6uxUP3k2qPNPs
   dyZda5U8JOZLmcEd3/2QsqRU7McWIEl11pI7FVkTIIXecxaeezCgsbSDK
   57Zg/8nFdTZPiStrc2tOtDLJ+P8tNyiOP672h2gDpTd8gCcPx/foPItaq
   P8JcOtKFzU3ua50dVOxnv6/Em6mTHaYOtRlDKkun4jVdIIdN7CYA6tjVM
   hgpUBbHU3q7/7/I/yVp76l9TkT7JMSqwKC5EAvIGKSme+fMAqNCClRJmG
   oIeLIVKxNEujbuAhb6NS39DWhgGv6QN23L9fvKZnmbsMVf/WtPzeteXMx
   w==;
X-CSE-ConnectionGUID: BO2S6kwDRDSVtuadEO96+Q==
X-CSE-MsgGUID: ojt0IRDARqKJDaMzP8KSTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48524514"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="48524514"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 03:43:04 -0700
X-CSE-ConnectionGUID: hIbvSYa8Q6a0Ki5hm2amaA==
X-CSE-MsgGUID: UUXzAwMPTbeMMK3KQMIW6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="136288448"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 May 2025 03:43:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDLBx-000BxX-2k;
	Fri, 09 May 2025 10:42:57 +0000
Date: Fri, 9 May 2025 18:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Zongmin Zhou <min_halo@163.com>, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, markgross@kernel.org,
	arnd@arndb.de, eric.piel@tremplin-utc.net,
	valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH 2/2] usbip: convert to use faux_device
Message-ID: <202505091836.sxOEZiIt-lkp@intel.com>
References: <2a327b520760271471717fff9b222cdc34967489.1746662386.git.zhouzongmin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a327b520760271471717fff9b222cdc34967489.1746662386.git.zhouzongmin@kylinos.cn>

Hi Zongmin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.15-rc5 next-20250508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zongmin-Zhou/driver-core-add-device-s-platform_data-set-for-faux-device/20250508-171441
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/2a327b520760271471717fff9b222cdc34967489.1746662386.git.zhouzongmin%40kylinos.cn
patch subject: [PATCH 2/2] usbip: convert to use faux_device
config: x86_64-randconfig-002-20250509 (https://download.01.org/0day-ci/archive/20250509/202505091836.sxOEZiIt-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091836.sxOEZiIt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091836.sxOEZiIt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/usbip/vhci_hcd.c:1531:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    1531 |         return ret;
         |                ^~~
   drivers/usb/usbip/vhci_hcd.c:1501:12: note: initialize the variable 'ret' to silence this warning
    1501 |         int i, ret;
         |                   ^
         |                    = 0
   drivers/usb/usbip/vhci_hcd.c:1418:12: warning: unused function 'vhci_hcd_suspend' [-Wunused-function]
    1418 | static int vhci_hcd_suspend(struct faux_device *fdev, pm_message_t state)
         |            ^~~~~~~~~~~~~~~~
   drivers/usb/usbip/vhci_hcd.c:1462:12: warning: unused function 'vhci_hcd_resume' [-Wunused-function]
    1462 | static int vhci_hcd_resume(struct faux_device *fdev)
         |            ^~~~~~~~~~~~~~~
   3 warnings generated.


vim +/ret +1531 drivers/usb/usbip/vhci_hcd.c

04679b3489e048 drivers/staging/usbip/vhci_hcd.c Takahiro Hirofuchi 2008-07-09  1498  
0392bbb6f6af31 drivers/staging/usbip/vhci_hcd.c matt mooney        2011-05-19  1499  static int __init vhci_hcd_init(void)
04679b3489e048 drivers/staging/usbip/vhci_hcd.c Takahiro Hirofuchi 2008-07-09  1500  {
0775a9cbc694e8 drivers/usb/usbip/vhci_hcd.c     Nobuo Iwata        2016-06-13  1501  	int i, ret;
04679b3489e048 drivers/staging/usbip/vhci_hcd.c Takahiro Hirofuchi 2008-07-09  1502  
04679b3489e048 drivers/staging/usbip/vhci_hcd.c Takahiro Hirofuchi 2008-07-09  1503  	if (usb_disabled())
04679b3489e048 drivers/staging/usbip/vhci_hcd.c Takahiro Hirofuchi 2008-07-09  1504  		return -ENODEV;
04679b3489e048 drivers/staging/usbip/vhci_hcd.c Takahiro Hirofuchi 2008-07-09  1505  
0775a9cbc694e8 drivers/usb/usbip/vhci_hcd.c     Nobuo Iwata        2016-06-13  1506  	if (vhci_num_controllers < 1)
0775a9cbc694e8 drivers/usb/usbip/vhci_hcd.c     Nobuo Iwata        2016-06-13  1507  		vhci_num_controllers = 1;
0775a9cbc694e8 drivers/usb/usbip/vhci_hcd.c     Nobuo Iwata        2016-06-13  1508  
89a73d281fa4f5 drivers/usb/usbip/vhci_hcd.c     Yuyang Du          2017-06-08  1509  	vhcis = kcalloc(vhci_num_controllers, sizeof(struct vhci), GFP_KERNEL);
89a73d281fa4f5 drivers/usb/usbip/vhci_hcd.c     Yuyang Du          2017-06-08  1510  	if (vhcis == NULL)
0775a9cbc694e8 drivers/usb/usbip/vhci_hcd.c     Nobuo Iwata        2016-06-13  1511  		return -ENOMEM;
0775a9cbc694e8 drivers/usb/usbip/vhci_hcd.c     Nobuo Iwata        2016-06-13  1512  
0775a9cbc694e8 drivers/usb/usbip/vhci_hcd.c     Nobuo Iwata        2016-06-13  1513  	for (i = 0; i < vhci_num_controllers; i++) {
17d6b82d2d6d46 drivers/usb/usbip/vhci_hcd.c     Hongren Zheng      2023-10-14  1514  		void *vhci = &vhcis[i];
1bcae4465d2818 drivers/usb/usbip/vhci_hcd.c     Zongmin Zhou       2025-05-08  1515  		char vhci_name[16];
1bcae4465d2818 drivers/usb/usbip/vhci_hcd.c     Zongmin Zhou       2025-05-08  1516  
1bcae4465d2818 drivers/usb/usbip/vhci_hcd.c     Zongmin Zhou       2025-05-08  1517  		snprintf(vhci_name, 16, "%s.%d", driver_name, i);
b8aaf639b403f0 drivers/usb/usbip/vhci_hcd.c     Andy Shevchenko    2023-10-06  1518  
1bcae4465d2818 drivers/usb/usbip/vhci_hcd.c     Zongmin Zhou       2025-05-08  1519  		vhcis[i].fdev = faux_device_create_with_groups(vhci_name, NULL, &vhci_driver, NULL, vhci);
1bcae4465d2818 drivers/usb/usbip/vhci_hcd.c     Zongmin Zhou       2025-05-08  1520  		if (!vhcis[i].fdev) {
b8aaf639b403f0 drivers/usb/usbip/vhci_hcd.c     Andy Shevchenko    2023-10-06  1521  			while (i--)
1bcae4465d2818 drivers/usb/usbip/vhci_hcd.c     Zongmin Zhou       2025-05-08  1522  				faux_device_destroy(vhcis[i].fdev);
dff3565b8e1c0b drivers/usb/usbip/vhci_hcd.c     Yuyang Du          2017-06-08  1523  			goto err_add_hcd;
dff3565b8e1c0b drivers/usb/usbip/vhci_hcd.c     Yuyang Du          2017-06-08  1524  		}
0775a9cbc694e8 drivers/usb/usbip/vhci_hcd.c     Nobuo Iwata        2016-06-13  1525  	}
04679b3489e048 drivers/staging/usbip/vhci_hcd.c Takahiro Hirofuchi 2008-07-09  1526  
b8aaf639b403f0 drivers/usb/usbip/vhci_hcd.c     Andy Shevchenko    2023-10-06  1527  	return 0;
04679b3489e048 drivers/staging/usbip/vhci_hcd.c Takahiro Hirofuchi 2008-07-09  1528  
dff3565b8e1c0b drivers/usb/usbip/vhci_hcd.c     Yuyang Du          2017-06-08  1529  err_add_hcd:
89a73d281fa4f5 drivers/usb/usbip/vhci_hcd.c     Yuyang Du          2017-06-08  1530  	kfree(vhcis);
04679b3489e048 drivers/staging/usbip/vhci_hcd.c Takahiro Hirofuchi 2008-07-09 @1531  	return ret;
04679b3489e048 drivers/staging/usbip/vhci_hcd.c Takahiro Hirofuchi 2008-07-09  1532  }
04679b3489e048 drivers/staging/usbip/vhci_hcd.c Takahiro Hirofuchi 2008-07-09  1533  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
