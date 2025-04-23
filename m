Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF811EB5DB;
	Wed, 23 Apr 2025 01:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745370154; cv=none; b=lHjvQ+ugS3KEZ6ZvAARiAriZuP2sW1nfkPG51mI4iFrnsNYoLg45oKSu4OvjGkEvIznY8NpDwocyDD4uv/acKLA5Ux8RY3ljm/Gu/7HDN+9OPJb5kmvHZswn3jjincC6/0pGtf3xpDoMZsew2O35MGLpUuJlXLfOjUIdJQQJEgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745370154; c=relaxed/simple;
	bh=V5z5E5+X3Jf2jY7+WG1Lr+g/krh0x4f/dkIPVzE6Zsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLMn6R05B30puP/SzQ3ZFabAgNQABIvTvLccDNfWV7oz5k/bsuSA/pMmP9pop0Fv2jcSX4fkTOVF+FAzWrAS2AnBpQj1NKp90vlSOquUyTgRrzrwM7WJh04puWVm0sgGaxiCHzJsEfSuOUNlu8JJoloU2Axcy0HZoCIqpW2YkNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4zVrS96; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4zVrS96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745370152; x=1776906152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V5z5E5+X3Jf2jY7+WG1Lr+g/krh0x4f/dkIPVzE6Zsw=;
  b=B4zVrS96NXFI6G1kDT8RPsQQ80L9dV+eFZyuMnPPsCOie0/d9doE176q
   Uum4w75MebUxBjuTKTVOsRI02lpoqmShrxQI9OPnWj/DFStreqeRc5ume
   Vt+6itCjGPs5nDCFvkVVgPl+WhfBNBnbdoM5VzQaeZ6XxUa82UFxSUEkr
   HAiWFd74GUNB7gtKHeFKwLUCF1yLJjAivTg39D9jjAOngX1b64Y0vjgki
   23BzdPWNqOYoz1ee9m0OnvazMlOhtf5vCO1XKyU+14l6gLZ7xFEw1Py41
   FHA66evrQl/xDRiT+khNgKQF6bSkBnK7qPUvBwHzy7Amu3dSTH3NBpVZD
   w==;
X-CSE-ConnectionGUID: bI9chdc9Rp+KzjlseM5KyA==
X-CSE-MsgGUID: ddoC15lmShKCGGIKn0QUBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="69439437"
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="69439437"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 18:02:31 -0700
X-CSE-ConnectionGUID: 3KLY5xfjSJCF2TMuhEQFlA==
X-CSE-MsgGUID: s7ej81ZcQcCQytNIvEW19Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,232,1739865600"; 
   d="scan'208";a="169376875"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Apr 2025 18:02:27 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7OVL-0001S7-2x;
	Wed, 23 Apr 2025 01:02:23 +0000
Date: Wed, 23 Apr 2025 09:02:01 +0800
From: kernel test robot <lkp@intel.com>
To: Zongmin Zhou <min_halo@163.com>, skhan@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, i@zenithal.me,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	shuah@kernel.org, valentina.manea.m@gmail.com,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] usbip: set the dma mask to 64bit default for vhci-driver
Message-ID: <202504230805.MkmxQyas-lkp@intel.com>
References: <20250422063409.607859-1-min_halo@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422063409.607859-1-min_halo@163.com>

Hi Zongmin,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v6.15-rc3 next-20250422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zongmin-Zhou/usbip-set-the-dma-mask-to-64bit-default-for-vhci-driver/20250422-143646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250422063409.607859-1-min_halo%40163.com
patch subject: [PATCH] usbip: set the dma mask to 64bit default for vhci-driver
config: arm-randconfig-004-20250423 (https://download.01.org/0day-ci/archive/20250423/202504230805.MkmxQyas-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504230805.MkmxQyas-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504230805.MkmxQyas-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/usbip/vhci_hcd.c:1349:2: error: call to undeclared function 'dma_set_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1349 |         dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
         |         ^
   drivers/usb/usbip/vhci_hcd.c:1349:2: note: did you mean 'xa_set_mark'?
   include/linux/xarray.h:361:6: note: 'xa_set_mark' declared here
     361 | void xa_set_mark(struct xarray *, unsigned long index, xa_mark_t);
         |      ^
>> drivers/usb/usbip/vhci_hcd.c:1349:27: error: call to undeclared function 'DMA_BIT_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1349 |         dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
         |                                  ^
   2 errors generated.


vim +/dma_set_mask +1349 drivers/usb/usbip/vhci_hcd.c

  1338	
  1339	static int vhci_hcd_probe(struct platform_device *pdev)
  1340	{
  1341		struct vhci             *vhci = *((void **)dev_get_platdata(&pdev->dev));
  1342		struct usb_hcd		*hcd_hs;
  1343		struct usb_hcd		*hcd_ss;
  1344		int			ret;
  1345	
  1346		usbip_dbg_vhci_hc("name %s id %d\n", pdev->name, pdev->id);
  1347	
  1348		/* Set the dma mask to support 64bit for vhci-hcd driver. */
> 1349		dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
  1350	
  1351		/*
  1352		 * Allocate and initialize hcd.
  1353		 * Our private data is also allocated automatically.
  1354		 */
  1355		hcd_hs = usb_create_hcd(&vhci_hc_driver, &pdev->dev, dev_name(&pdev->dev));
  1356		if (!hcd_hs) {
  1357			pr_err("create primary hcd failed\n");
  1358			return -ENOMEM;
  1359		}
  1360		hcd_hs->has_tt = 1;
  1361	
  1362		/*
  1363		 * Finish generic HCD structure initialization and register.
  1364		 * Call the driver's reset() and start() routines.
  1365		 */
  1366		ret = usb_add_hcd(hcd_hs, 0, 0);
  1367		if (ret != 0) {
  1368			pr_err("usb_add_hcd hs failed %d\n", ret);
  1369			goto put_usb2_hcd;
  1370		}
  1371	
  1372		hcd_ss = usb_create_shared_hcd(&vhci_hc_driver, &pdev->dev,
  1373					       dev_name(&pdev->dev), hcd_hs);
  1374		if (!hcd_ss) {
  1375			ret = -ENOMEM;
  1376			pr_err("create shared hcd failed\n");
  1377			goto remove_usb2_hcd;
  1378		}
  1379	
  1380		ret = usb_add_hcd(hcd_ss, 0, 0);
  1381		if (ret) {
  1382			pr_err("usb_add_hcd ss failed %d\n", ret);
  1383			goto put_usb3_hcd;
  1384		}
  1385	
  1386		usbip_dbg_vhci_hc("bye\n");
  1387		return 0;
  1388	
  1389	put_usb3_hcd:
  1390		usb_put_hcd(hcd_ss);
  1391	remove_usb2_hcd:
  1392		usb_remove_hcd(hcd_hs);
  1393	put_usb2_hcd:
  1394		usb_put_hcd(hcd_hs);
  1395		vhci->vhci_hcd_hs = NULL;
  1396		vhci->vhci_hcd_ss = NULL;
  1397		return ret;
  1398	}
  1399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
