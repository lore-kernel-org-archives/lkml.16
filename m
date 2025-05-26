Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8404414E2F2
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 11:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516608; cv=none; b=ZeT6abA8chFT87J8kC0b7X2s1ygsf8c5dKgz4UPQTchazer68vAxb33dp8lFfvbD68VNYCvB3wOdVQSG+Jz6lNN/fh7eOGYQZl0z2/Dif5SbRW2qCLwBJLO0qlwHn/CNbdgc7vOUOPD5s3fGtMhNlavC3K6infI7CfDulQ5oNok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516608; c=relaxed/simple;
	bh=/stWEU1M5xMsel0DVEH/3rDV1xTg8quwkql1AlCioF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cYruiN7cX3k2+CfcXhqd/U4oqzabF4xThzTcvccu7LXtwK1gSpOKdi2iAcFEEVplNLVQjvl6+GLaqMjd//T6EsFNx+bXZPXFCj/Bmv3WaFiyG+tNG3zv+EAlNXdv/+hI4cNg1dho0UkiB46BO57cgc0eHrVjyW84Ywcq1+6jcC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RniHxwme; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RniHxwme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748516607; x=1780052607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/stWEU1M5xMsel0DVEH/3rDV1xTg8quwkql1AlCioF8=;
  b=RniHxwmeFTfWj2Esy/NR9OKm+fwr9VSW63ErshYVvc92uykwg73NjxzJ
   N0r2qeJukFrHrsQ2kCRaB8ObOsqkaZdZ4Kl1dIUvUIqMIs5tnxjQdbgdn
   CZTkqHv9t2llAV5+CW/EvQPyqzA6dofAXLvBQ9LnpHKtrenHbOWXdXZkD
   0Fv7skhG0l5FBN32xsNEVtUAiwelVId5aoSdCPVKimJKiMc4CoSdLbRA+
   zWYyIYWj+qhdcjSCacwFxDxbVnB2Qk8FIOjmaP7suzmwyZlM2JdSA0OEy
   Yr50auYufH39/D5ZegpSP5Xo5DkGCgyDHBjH8hxP486AoUBKFVigT77Sl
   w==;
X-CSE-ConnectionGUID: NTqaNeXKTbu52a/5o7+kiA==
X-CSE-MsgGUID: g7QT7tp9Qp2xYcN2ezGaZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54369622"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="54369622"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:03:25 -0700
X-CSE-ConnectionGUID: SriC7r1zSWGIHeF/DOvcZA==
X-CSE-MsgGUID: dR3/MQTYSQ6AfUmxxQJeiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="148303908"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2025 04:03:23 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKb2f-0000gZ-0G;
	Thu, 29 May 2025 11:03:21 +0000
Date: Tue, 27 May 2025 04:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Kurapati <quic_kriskura@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: drivers/usb/dwc3/core.c:1499:47: warning: '%u' directive output may
 be truncated writing between 1 and 10 bytes into a region of size 4
Message-ID: <202505270420.gUbVlmLg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   49fffac983ac52aea0ab94914be3f56bcf92d5dc
commit: 3f12222a4bebeb13ce06ddecc1610ad32fa835dd usb: dwc3: core: Fix compile warning on s390 gcc in dwc3_get_phy call
date:   1 year, 1 month ago
config: microblaze-randconfig-2005-20250514 (https://download.01.org/0day-ci/archive/20250527/202505270420.gUbVlmLg-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270420.gUbVlmLg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270420.gUbVlmLg-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/dwc3/core.c: In function 'dwc3_core_init':
>> drivers/usb/dwc3/core.c:1499:47: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 4 [-Wformat-truncation=]
       snprintf(phy_name, sizeof(phy_name), "usb3-%u", i);
                                                  ^~
   drivers/usb/dwc3/core.c:1499:41: note: directive argument in the range [0, 2147483647]
       snprintf(phy_name, sizeof(phy_name), "usb3-%u", i);
                                            ^~~~~~~~~
   drivers/usb/dwc3/core.c:1499:4: note: 'snprintf' output between 7 and 16 bytes into a destination of size 9
       snprintf(phy_name, sizeof(phy_name), "usb3-%u", i);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/core.c:1482:48: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 4 [-Wformat-truncation=]
       snprintf(phy_name, sizeof(phy_name),  "usb2-%u", i);
                                                   ^~
   drivers/usb/dwc3/core.c:1482:42: note: directive argument in the range [0, 2147483647]
       snprintf(phy_name, sizeof(phy_name),  "usb2-%u", i);
                                             ^~~~~~~~~
   drivers/usb/dwc3/core.c:1482:4: note: 'snprintf' output between 7 and 16 bytes into a destination of size 9
       snprintf(phy_name, sizeof(phy_name),  "usb2-%u", i);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1499 drivers/usb/dwc3/core.c

  1445	
  1446	static int dwc3_core_get_phy(struct dwc3 *dwc)
  1447	{
  1448		struct device		*dev = dwc->dev;
  1449		struct device_node	*node = dev->of_node;
  1450		char phy_name[9];
  1451		int ret;
  1452		u8 i;
  1453	
  1454		if (node) {
  1455			dwc->usb2_phy = devm_usb_get_phy_by_phandle(dev, "usb-phy", 0);
  1456			dwc->usb3_phy = devm_usb_get_phy_by_phandle(dev, "usb-phy", 1);
  1457		} else {
  1458			dwc->usb2_phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB2);
  1459			dwc->usb3_phy = devm_usb_get_phy(dev, USB_PHY_TYPE_USB3);
  1460		}
  1461	
  1462		if (IS_ERR(dwc->usb2_phy)) {
  1463			ret = PTR_ERR(dwc->usb2_phy);
  1464			if (ret == -ENXIO || ret == -ENODEV)
  1465				dwc->usb2_phy = NULL;
  1466			else
  1467				return dev_err_probe(dev, ret, "no usb2 phy configured\n");
  1468		}
  1469	
  1470		if (IS_ERR(dwc->usb3_phy)) {
  1471			ret = PTR_ERR(dwc->usb3_phy);
  1472			if (ret == -ENXIO || ret == -ENODEV)
  1473				dwc->usb3_phy = NULL;
  1474			else
  1475				return dev_err_probe(dev, ret, "no usb3 phy configured\n");
  1476		}
  1477	
  1478		for (i = 0; i < dwc->num_usb2_ports; i++) {
  1479			if (dwc->num_usb2_ports == 1)
  1480				snprintf(phy_name, sizeof(phy_name), "usb2-phy");
  1481			else
  1482				snprintf(phy_name, sizeof(phy_name),  "usb2-%u", i);
  1483	
  1484			dwc->usb2_generic_phy[i] = devm_phy_get(dev, phy_name);
  1485			if (IS_ERR(dwc->usb2_generic_phy[i])) {
  1486				ret = PTR_ERR(dwc->usb2_generic_phy[i]);
  1487				if (ret == -ENOSYS || ret == -ENODEV)
  1488					dwc->usb2_generic_phy[i] = NULL;
  1489				else
  1490					return dev_err_probe(dev, ret, "failed to lookup phy %s\n",
  1491								phy_name);
  1492			}
  1493		}
  1494	
  1495		for (i = 0; i < dwc->num_usb3_ports; i++) {
  1496			if (dwc->num_usb3_ports == 1)
  1497				snprintf(phy_name, sizeof(phy_name), "usb3-phy");
  1498			else
> 1499				snprintf(phy_name, sizeof(phy_name), "usb3-%u", i);
  1500	
  1501			dwc->usb3_generic_phy[i] = devm_phy_get(dev, phy_name);
  1502			if (IS_ERR(dwc->usb3_generic_phy[i])) {
  1503				ret = PTR_ERR(dwc->usb3_generic_phy[i]);
  1504				if (ret == -ENOSYS || ret == -ENODEV)
  1505					dwc->usb3_generic_phy[i] = NULL;
  1506				else
  1507					return dev_err_probe(dev, ret, "failed to lookup phy %s\n",
  1508								phy_name);
  1509			}
  1510		}
  1511	
  1512		return 0;
  1513	}
  1514	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
