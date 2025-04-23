Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D79F26C385;
	Wed, 23 Apr 2025 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394662; cv=none; b=OSnImpTYkmrs6e7nSabrdzSjgdC0MPhAP+fh/VwvXvXtP1d2bL9f73mUSYoK0vwVHM6NmUJc4bds9wgEhyAhlUd4uY4suxSdfhwiXJ2I3aJaTQjNtrGAnIpjIX8XUDlIErew5ZKdBs4ZCLIsZvIIeQSVxTj72esm+zBldIpmTcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394662; c=relaxed/simple;
	bh=eSDL4UD3GxUACgoaJ3ojaja+aDcRGwvgui4UfPswGxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hU8IaOPV8N8n/XpKD+DkB62IkaO+bQ3FN0No5D/nsG7gRwB+xAY8QSipphX2HHg0PrGITz53s3wb2HAO/sO0ppYYXXc7Xio0sQtFiel5ZVJhBzSS2QyFPMPBInLGC1HLzHltCt5xCMBQKuP2aXjXux6KsOmP3IgWrnL0PbBJMyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=marZN6GE; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="marZN6GE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745394660; x=1776930660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eSDL4UD3GxUACgoaJ3ojaja+aDcRGwvgui4UfPswGxk=;
  b=marZN6GEBbIq8/aAk5n9MU2AIOs64qIcJhde7frjVxjMRYsek69hAUuk
   A1U607RBcm2aUc3Ti39OhZ4l1XzvHtOG0sbH/JGwoq+pmcH7wD99QoX9T
   +PDNPFCgqkWoUT2SBi/uZ+gCzTNTQjuC8wIyGfs/mtRmpDkJyMKm6QVDo
   F/SStd1fa4WJaHw9ylp+Wsu/yZ9fIapUdWAEAOkfzB/MXL8xzNSMxUgNX
   u0BEdYcBis3WZH3e3qObjOhzU0KzgoVCeaOS8i3qkUoKT0MNigMNDAWHw
   VKbPxebnkXS9rGG5ustWmCVlQ/g4v4J2Nfc+fiDzLgw4GrkmfTBbbYA8o
   g==;
X-CSE-ConnectionGUID: ENirpNcdTIa7BFkRGHHGww==
X-CSE-MsgGUID: xtjUpMjERD2l2JR41tzvBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="57633090"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="57633090"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 00:50:59 -0700
X-CSE-ConnectionGUID: Vpx8VSe3T52/aLM84GJF1w==
X-CSE-MsgGUID: 2l55tajLT6KfLUi5J1KMcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137027839"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Apr 2025 00:50:57 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7Ush-0001hT-0H;
	Wed, 23 Apr 2025 07:50:55 +0000
Date: Wed, 23 Apr 2025 15:50:40 +0800
From: kernel test robot <lkp@intel.com>
To: Zongmin Zhou <min_halo@163.com>, skhan@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	i@zenithal.me, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, shuah@kernel.org,
	valentina.manea.m@gmail.com, Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] usbip: set the dma mask to 64bit default for vhci-driver
Message-ID: <202504231526.8kjh2iap-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250423/202504231526.8kjh2iap-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250423/202504231526.8kjh2iap-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504231526.8kjh2iap-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/usbip/vhci_hcd.c: In function 'vhci_hcd_probe':
>> drivers/usb/usbip/vhci_hcd.c:1349:9: error: implicit declaration of function 'dma_set_mask'; did you mean 'xa_set_mark'? [-Wimplicit-function-declaration]
    1349 |         dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
         |         ^~~~~~~~~~~~
         |         xa_set_mark
>> drivers/usb/usbip/vhci_hcd.c:1349:34: error: implicit declaration of function 'DMA_BIT_MASK'; did you mean 'BIT_MASK'? [-Wimplicit-function-declaration]
    1349 |         dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
         |                                  ^~~~~~~~~~~~
         |                                  BIT_MASK

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_AUX_HPD_BRIDGE
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n] && DRM_BRIDGE [=n] && OF [=y]
   Selected by [m]:
   - UCSI_HUAWEI_GAOKUN [=m] && USB_SUPPORT [=y] && TYPEC [=m] && TYPEC_UCSI [=m] && EC_HUAWEI_GAOKUN [=m]


vim +1349 drivers/usb/usbip/vhci_hcd.c

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
