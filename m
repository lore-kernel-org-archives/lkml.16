Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175F2229B38;
	Sat, 26 Apr 2025 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745686163; cv=none; b=au4RdSLukwOYN1qawkZwtp1f58H+ZhEnG0XgAHLMKYK5ilAz6iJBUuYO09begXNTCX/jOspy9BentzPcHFeBKsSP3dJuhTGxF/j3EG74c5KdW1Z+ax4hxOXsTa/5ym7ll3Ca+9gOZQVGbdAmv4tMrU6U0MGGqeCWR9Ht7knApOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745686163; c=relaxed/simple;
	bh=V4+TZl8fcr9Q0wXgQgzoLtvYSlv5lmsMYdpJdBEhc/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I1nRynisEfHg6Gm705ZyFml1GrU6SpEETXBYu0kUb6pQGLddWHwqjgjR0/pRkuFRnblLJkQG1q9qkjsp10Bprsy+rg9xFKGVk5WunX97vfS/JqBTKfiPCrglv6pqqrqeJN/9IMd1OX8/c9Jfbv0Q9wfCOuHxBXtWml0XHcEL8qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RuorZh3o; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RuorZh3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745686162; x=1777222162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V4+TZl8fcr9Q0wXgQgzoLtvYSlv5lmsMYdpJdBEhc/M=;
  b=RuorZh3o4TfG/BvoBnj8WtSR1WmfPrRHVyei58S3MDxpbwria70bEVvy
   7wH5Ig2u59ET2rujYJjI8bHFLpa55iW1h59jgjwZPpsgkaD9X731/lSXI
   JC4ijHpiLoRZHyZgW0tYvMYg6NE3gKOoZGRjG70M2sQxcIX3CwH87+y+P
   vaBtzD4Hh4wBrgaDIAnb1wlbSaC1MTiXxjAjh9W09zWCAU0MI1JigE4J/
   sIE6X7SLokhUdKPkCMCjYn1g2MVtPH7YOZA/TGgxZouLUsp7cTDYW2DwE
   BigO05Dk+xS+dJX6U1Dok1vGrT/pUjvdOisVNrZ3jsWc2DKGn6LoEF9Ue
   w==;
X-CSE-ConnectionGUID: uazPRBJcS0uz9amC6v/THQ==
X-CSE-MsgGUID: usijDLeyRsKyOvr66pOcmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="64854290"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="64854290"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 09:49:21 -0700
X-CSE-ConnectionGUID: bYDClL1sR8SOZNQYjUs6zg==
X-CSE-MsgGUID: YgHuZT8sQRCcqJfiOMRTTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="164212010"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Apr 2025 09:49:20 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8iiL-0005vP-38;
	Sat, 26 Apr 2025 16:49:17 +0000
Date: Sun, 27 Apr 2025 00:48:52 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
	linux-doc@vger.kernel.org
Subject: drivers/net/ethernet/ti/cpsw_ale.c:1360: warning: This comment
 starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202504270023.hRD576RW-lkp@intel.com>
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
commit: eb41dd76abce6a13bd7ad9c779dd560136caf60a net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields
date:   8 months ago
config: arm64-randconfig-001-20250426 (https://download.01.org/0day-ci/archive/20250427/202504270023.hRD576RW-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270023.hRD576RW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270023.hRD576RW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/ti/cpsw_ale.c:1360: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
            * REG_FIELDS not defined for this as fields cannot be correctly


vim +1360 drivers/net/ethernet/ti/cpsw_ale.c

  1319	
  1320	static const struct reg_field ale_fields_cpsw_nu[] = {
  1321		/* CPSW_ALE_IDVER_REG */
  1322		[MINOR_VER]	= REG_FIELD(ALE_IDVER, 0, 7),
  1323		[MAJOR_VER]	= REG_FIELD(ALE_IDVER, 8, 10),
  1324		/* CPSW_ALE_STATUS_REG */
  1325		[ALE_ENTRIES]	= REG_FIELD(ALE_STATUS, 0, 7),
  1326		[ALE_POLICERS]	= REG_FIELD(ALE_STATUS, 8, 15),
  1327		/* CPSW_ALE_POLICER_PORT_OUI_REG */
  1328		[POL_PORT_MEN]	= REG_FIELD(ALE_POLICER_PORT_OUI, 31, 31),
  1329		[POL_TRUNK_ID]	= REG_FIELD(ALE_POLICER_PORT_OUI, 30, 30),
  1330		[POL_PORT_NUM]	= REG_FIELD(ALE_POLICER_PORT_OUI, 25, 25),
  1331		[POL_PRI_MEN]	= REG_FIELD(ALE_POLICER_PORT_OUI, 19, 19),
  1332		[POL_PRI_VAL]	= REG_FIELD(ALE_POLICER_PORT_OUI, 16, 18),
  1333		[POL_OUI_MEN]	= REG_FIELD(ALE_POLICER_PORT_OUI, 15, 15),
  1334		[POL_OUI_INDEX]	= REG_FIELD(ALE_POLICER_PORT_OUI, 0, 5),
  1335	
  1336		/* CPSW_ALE_POLICER_DA_SA_REG */
  1337		[POL_DST_MEN]	= REG_FIELD(ALE_POLICER_DA_SA, 31, 31),
  1338		[POL_DST_INDEX]	= REG_FIELD(ALE_POLICER_DA_SA, 16, 21),
  1339		[POL_SRC_MEN]	= REG_FIELD(ALE_POLICER_DA_SA, 15, 15),
  1340		[POL_SRC_INDEX]	= REG_FIELD(ALE_POLICER_DA_SA, 0, 5),
  1341	
  1342		/* CPSW_ALE_POLICER_VLAN_REG */
  1343		[POL_OVLAN_MEN]		= REG_FIELD(ALE_POLICER_VLAN, 31, 31),
  1344		[POL_OVLAN_INDEX]	= REG_FIELD(ALE_POLICER_VLAN, 16, 21),
  1345		[POL_IVLAN_MEN]		= REG_FIELD(ALE_POLICER_VLAN, 15, 15),
  1346		[POL_IVLAN_INDEX]	= REG_FIELD(ALE_POLICER_VLAN, 0, 5),
  1347	
  1348		/* CPSW_ALE_POLICER_ETHERTYPE_IPSA_REG */
  1349		[POL_ETHERTYPE_MEN]	= REG_FIELD(ALE_POLICER_ETHERTYPE_IPSA, 31, 31),
  1350		[POL_ETHERTYPE_INDEX]	= REG_FIELD(ALE_POLICER_ETHERTYPE_IPSA, 16, 21),
  1351		[POL_IPSRC_MEN]		= REG_FIELD(ALE_POLICER_ETHERTYPE_IPSA, 15, 15),
  1352		[POL_IPSRC_INDEX]	= REG_FIELD(ALE_POLICER_ETHERTYPE_IPSA, 0, 5),
  1353	
  1354		/* CPSW_ALE_POLICER_IPDA_REG */
  1355		[POL_IPDST_MEN]		= REG_FIELD(ALE_POLICER_IPDA, 31, 31),
  1356		[POL_IPDST_INDEX]	= REG_FIELD(ALE_POLICER_IPDA, 16, 21),
  1357	
  1358		/* CPSW_ALE_POLICER_TBL_CTL_REG */
  1359		/**
> 1360		 * REG_FIELDS not defined for this as fields cannot be correctly
  1361		 * used independently
  1362		 */
  1363	
  1364		/* CPSW_ALE_POLICER_CTL_REG */
  1365		[POL_EN]		= REG_FIELD(ALE_POLICER_CTL, 31, 31),
  1366		[POL_RED_DROP_EN]	= REG_FIELD(ALE_POLICER_CTL, 29, 29),
  1367		[POL_YELLOW_DROP_EN]	= REG_FIELD(ALE_POLICER_CTL, 28, 28),
  1368		[POL_YELLOW_THRESH]	= REG_FIELD(ALE_POLICER_CTL, 24, 26),
  1369		[POL_POL_MATCH_MODE]	= REG_FIELD(ALE_POLICER_CTL, 22, 23),
  1370		[POL_PRIORITY_THREAD_EN] = REG_FIELD(ALE_POLICER_CTL, 21, 21),
  1371		[POL_MAC_ONLY_DEF_DIS]	= REG_FIELD(ALE_POLICER_CTL, 20, 20),
  1372	
  1373		/* CPSW_ALE_POLICER_TEST_CTL_REG */
  1374		[POL_TEST_CLR]		= REG_FIELD(ALE_POLICER_TEST_CTL, 31, 31),
  1375		[POL_TEST_CLR_RED]	= REG_FIELD(ALE_POLICER_TEST_CTL, 30, 30),
  1376		[POL_TEST_CLR_YELLOW]	= REG_FIELD(ALE_POLICER_TEST_CTL, 29, 29),
  1377		[POL_TEST_CLR_SELECTED]	= REG_FIELD(ALE_POLICER_TEST_CTL, 28, 28),
  1378		[POL_TEST_ENTRY]	= REG_FIELD(ALE_POLICER_TEST_CTL, 0, 4),
  1379	
  1380		/* CPSW_ALE_POLICER_HIT_STATUS_REG */
  1381		[POL_STATUS_HIT]	= REG_FIELD(ALE_POLICER_HIT_STATUS, 31, 31),
  1382		[POL_STATUS_HIT_RED]	= REG_FIELD(ALE_POLICER_HIT_STATUS, 30, 30),
  1383		[POL_STATUS_HIT_YELLOW]	= REG_FIELD(ALE_POLICER_HIT_STATUS, 29, 29),
  1384	
  1385		/* CPSW_ALE_THREAD_DEF_REG */
  1386		[ALE_DEFAULT_THREAD_EN]		= REG_FIELD(ALE_THREAD_DEF, 15, 15),
  1387		[ALE_DEFAULT_THREAD_VAL]	= REG_FIELD(ALE_THREAD_DEF, 0, 5),
  1388	
  1389		/* CPSW_ALE_THREAD_CTL_REG */
  1390		[ALE_THREAD_CLASS_INDEX] = REG_FIELD(ALE_THREAD_CTL, 0, 4),
  1391	
  1392		/* CPSW_ALE_THREAD_VAL_REG */
  1393		[ALE_THREAD_ENABLE]	= REG_FIELD(ALE_THREAD_VAL, 15, 15),
  1394		[ALE_THREAD_VALUE]	= REG_FIELD(ALE_THREAD_VAL, 0, 5),
  1395	};
  1396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
