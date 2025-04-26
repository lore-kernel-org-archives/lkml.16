Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8450253F30;
	Sat, 26 Apr 2025 14:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745676912; cv=none; b=kcPrsawSjM02+iPAMXoJYl9zaeoG0zDlG/jSu2kEC6hjHk9lwaKs1WI5UOoVxJRUUe/mCB2ZnER4rTxfqgdVTLqyYqt/YHVc7UUYaN7XVmD9hkYZi73TXo8IpKGjFGm94/OjXGquCNXq2eNlICTsu29TaZQbgG3rxSQjrqbLd6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745676912; c=relaxed/simple;
	bh=KyPVCDaDId5iuitE9xSrLGPFmYffFbpjaVFQl6C9C90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=urBjRaG9qp+ggv+CR2DpeqMtKMmdrzj6lAA1DmnLDPBcSVwB0yZE/Po0eA2tO1vqHD4jtGAsUBvMtMdWH5k5SdoXfFeVF5szkMG2lBq2eciRNwIYO73nesRXc0drNr0LIrfXwpzQiVTIxgAqk2qeI93k59cLSBYE1VqKicaHVw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UkcymXCu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UkcymXCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745676911; x=1777212911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KyPVCDaDId5iuitE9xSrLGPFmYffFbpjaVFQl6C9C90=;
  b=UkcymXCuHAH0gkg5Wt2SmUuKIt1yBGY5ynqj+5S1DZqpDcGJaKzeDDqS
   IP6EGFFDTVIq7/BrJ4hRo2Ol6d2ypvNJWe1HuEssQntEdaihCUoP1HGeh
   Smng3To140kaTlSD3Picj9yNuHvD4GABWwlR1ySvOgqEO0SsZ2+oUzX27
   8N31MwkDYONDHvtPtRa8cUF3mvHDZV9rzctAtQihZAJPiJ6yNa6LOidNX
   KdewSEjUJsIHeJ8hpqKuYT4yIEihmHCEwzhwT7gag7uEC8JZeg7yaEjLd
   hKFdDLjWq86zMkmnqem7YGDtEjyTJOG/c+98JVtERXXpNsOk1ItigUae3
   g==;
X-CSE-ConnectionGUID: DPC8BIXjRcuTV1A0a6CrAA==
X-CSE-MsgGUID: 6TKH8BK5SCSYz/kDsedGYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="46437829"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="46437829"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 07:15:10 -0700
X-CSE-ConnectionGUID: 25QIfyFoRGCwRQk8pxa5Qw==
X-CSE-MsgGUID: NxBMU5IwTGGLgnHzZ6qFOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="134066578"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Apr 2025 07:15:08 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8gJ8-0005r3-1L;
	Sat, 26 Apr 2025 14:15:06 +0000
Date: Sat, 26 Apr 2025 22:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>, linux-doc@vger.kernel.org
Subject: drivers/net/phy/aquantia/aquantia_main.c:353: warning: This comment
 starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202504262247.1UBrDBVN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 7e5b547cac7a56515b2838b496923e52ec4eeddd net: phy: aquantia: poll status register
date:   7 months ago
config: riscv-randconfig-002-20250426 (https://download.01.org/0day-ci/archive/20250426/202504262247.1UBrDBVN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504262247.1UBrDBVN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504262247.1UBrDBVN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/aquantia/aquantia_main.c:353: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * The status register is not immediately correct on line side link up.


vim +353 drivers/net/phy/aquantia/aquantia_main.c

   340	
   341	static int aqr107_read_status(struct phy_device *phydev)
   342	{
   343		int val, ret;
   344	
   345		ret = aqr_read_status(phydev);
   346		if (ret)
   347			return ret;
   348	
   349		if (!phydev->link || phydev->autoneg == AUTONEG_DISABLE)
   350			return 0;
   351	
   352		/**
 > 353		 * The status register is not immediately correct on line side link up.
   354		 * Poll periodically until it reflects the correct ON state.
   355		 * Only return fail for read error, timeout defaults to OFF state.
   356		 */
   357		ret = phy_read_mmd_poll_timeout(phydev, MDIO_MMD_PHYXS,
   358						MDIO_PHYXS_VEND_IF_STATUS, val,
   359						(FIELD_GET(MDIO_PHYXS_VEND_IF_STATUS_TYPE_MASK, val) !=
   360						MDIO_PHYXS_VEND_IF_STATUS_TYPE_OFF),
   361						AQR107_OP_IN_PROG_SLEEP,
   362						AQR107_OP_IN_PROG_TIMEOUT, false);
   363		if (ret && ret != -ETIMEDOUT)
   364			return ret;
   365	
   366		switch (FIELD_GET(MDIO_PHYXS_VEND_IF_STATUS_TYPE_MASK, val)) {
   367		case MDIO_PHYXS_VEND_IF_STATUS_TYPE_KR:
   368			phydev->interface = PHY_INTERFACE_MODE_10GKR;
   369			break;
   370		case MDIO_PHYXS_VEND_IF_STATUS_TYPE_KX:
   371			phydev->interface = PHY_INTERFACE_MODE_1000BASEKX;
   372			break;
   373		case MDIO_PHYXS_VEND_IF_STATUS_TYPE_XFI:
   374			phydev->interface = PHY_INTERFACE_MODE_10GBASER;
   375			break;
   376		case MDIO_PHYXS_VEND_IF_STATUS_TYPE_USXGMII:
   377			phydev->interface = PHY_INTERFACE_MODE_USXGMII;
   378			break;
   379		case MDIO_PHYXS_VEND_IF_STATUS_TYPE_XAUI:
   380			phydev->interface = PHY_INTERFACE_MODE_XAUI;
   381			break;
   382		case MDIO_PHYXS_VEND_IF_STATUS_TYPE_SGMII:
   383			phydev->interface = PHY_INTERFACE_MODE_SGMII;
   384			break;
   385		case MDIO_PHYXS_VEND_IF_STATUS_TYPE_RXAUI:
   386			phydev->interface = PHY_INTERFACE_MODE_RXAUI;
   387			break;
   388		case MDIO_PHYXS_VEND_IF_STATUS_TYPE_OCSGMII:
   389			phydev->interface = PHY_INTERFACE_MODE_2500BASEX;
   390			break;
   391		case MDIO_PHYXS_VEND_IF_STATUS_TYPE_OFF:
   392		default:
   393			phydev->link = false;
   394			phydev->interface = PHY_INTERFACE_MODE_NA;
   395			break;
   396		}
   397	
   398		/* Read possibly downshifted rate from vendor register */
   399		return aqr107_read_rate(phydev);
   400	}
   401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
