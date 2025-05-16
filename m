Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224DA157A72
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364095; cv=none; b=avYfyBck5kNsUm40cpj18q1TCdtSdjU4DbAl2qVxmxlORLAqx9PFpJ1TbAv1H+fEen2YbOWmZOl7AegL+n1A/K3T7Hch/neR86WnQyfl1pgq0SXdjpyd+nM1n276B38+54DR0sg0eo4pYeWppF4wLt7fi9NF9SJnbzrXwnylYjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364095; c=relaxed/simple;
	bh=RMNCKUywg0PJnEDtLRKQCZMsEbvinJ81L9fP52QY61g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nVcFb97YmlQhRb9/AEsAKNylCzpplztI1fMxTE5yR/x+9g6z0rnMRNEOsJllqEHy+MOU1GTHy62LifkDHQua3UFxDm9kYfwdle0r1OvDH1c+UXSC9d2sT0079K4WgxZ3tuEDUPc0nBQBNQj2B3viygCMpKHGDXtgQ4zO7OtGutc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T71dOpFd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T71dOpFd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747364093; x=1778900093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RMNCKUywg0PJnEDtLRKQCZMsEbvinJ81L9fP52QY61g=;
  b=T71dOpFdF/6+t3RskbWo2VPAJArw88TpuOInwqw4//7EcQYw3NZGaevE
   fclnU/gRhPMNzUYq9C/gHNr80boS2/Qjd6tvHL3amiimjakjKM7/vJ4+Z
   qvM0L6RdjQqEaN+CqgQGCA2pkHHn6rkKm6VP/4IXOyZGN9Zzt75cvu96J
   XqKt6S7eGt9Op4ao3ztfRDyWV6G02AuS47gWW7c3faONZ2TcxWjfuNGO3
   yadFsSTkRTF8Xq4p6ZRmZYtLo5zUOSQu8JZwvv82NIQaEAfaY0Bcf3RPR
   3ZdVaRh+T/PWbcgLJwvOBP02Mpt1KZR/DImbR7DAGI26uUPIol3JkPs2t
   A==;
X-CSE-ConnectionGUID: i+CdDcfPT7aYxqt/ngoDig==
X-CSE-MsgGUID: GPcr0lMbQnSWmMVtE7ZpAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="66729337"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="66729337"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 19:54:52 -0700
X-CSE-ConnectionGUID: IHxwmqsHRgCAMTK4WynkrA==
X-CSE-MsgGUID: 81Rv31NNSB+jXFbxDUyzyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="169625779"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 May 2025 19:54:50 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFlDk-000Ivx-2o;
	Fri, 16 May 2025 02:54:48 +0000
Date: Fri, 16 May 2025 10:54:47 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Chan <michael.chan@broadcom.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Shruti Parab <shruti.parab@broadcom.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>
Subject: drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:2120
 bnxt_get_regs() warn: unsigned 'j' is never less than zero.
Message-ID: <202505161058.QFYrp89W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fee3e843b309444f48157e2188efa6818bae85cf
commit: 02e8be5a032cae0f4ca33c6053c44d83cf4acc93 bnxt_en: Fix ethtool -d byte order for 32-bit values
date:   2 weeks ago
config: x86_64-randconfig-161-20250516 (https://download.01.org/0day-ci/archive/20250516/202505161058.QFYrp89W-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161058.QFYrp89W-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c:2120 bnxt_get_regs() warn: unsigned 'j' is never less than zero.

vim +/j +2120 drivers/net/ethernet/broadcom/bnxt/bnxt_ethtool.c

  2075	
  2076	static void bnxt_get_regs(struct net_device *dev, struct ethtool_regs *regs,
  2077				  void *_p)
  2078	{
  2079		struct pcie_ctx_hw_stats *hw_pcie_stats;
  2080		struct hwrm_pcie_qstats_input *req;
  2081		struct bnxt *bp = netdev_priv(dev);
  2082		dma_addr_t hw_pcie_stats_addr;
  2083		int rc;
  2084	
  2085		regs->version = 0;
  2086		if (!(bp->fw_dbg_cap & DBG_QCAPS_RESP_FLAGS_REG_ACCESS_RESTRICTED))
  2087			bnxt_dbg_hwrm_rd_reg(bp, 0, BNXT_PXP_REG_LEN / 4, _p);
  2088	
  2089		if (!(bp->fw_cap & BNXT_FW_CAP_PCIE_STATS_SUPPORTED))
  2090			return;
  2091	
  2092		if (hwrm_req_init(bp, req, HWRM_PCIE_QSTATS))
  2093			return;
  2094	
  2095		hw_pcie_stats = hwrm_req_dma_slice(bp, req, sizeof(*hw_pcie_stats),
  2096						   &hw_pcie_stats_addr);
  2097		if (!hw_pcie_stats) {
  2098			hwrm_req_drop(bp, req);
  2099			return;
  2100		}
  2101	
  2102		regs->version = 1;
  2103		hwrm_req_hold(bp, req); /* hold on to slice */
  2104		req->pcie_stat_size = cpu_to_le16(sizeof(*hw_pcie_stats));
  2105		req->pcie_stat_host_addr = cpu_to_le64(hw_pcie_stats_addr);
  2106		rc = hwrm_req_send(bp, req);
  2107		if (!rc) {
  2108			u8 *dst = (u8 *)(_p + BNXT_PXP_REG_LEN);
  2109			u8 *src = (u8 *)hw_pcie_stats;
  2110			int i, j;
  2111	
  2112			for (i = 0, j = 0; i < sizeof(*hw_pcie_stats); ) {
  2113				if (i >= bnxt_pcie_32b_entries[j].start &&
  2114				    i <= bnxt_pcie_32b_entries[j].end) {
  2115					u32 *dst32 = (u32 *)(dst + i);
  2116	
  2117					*dst32 = le32_to_cpu(*(__le32 *)(src + i));
  2118					i += 4;
  2119					if (i > bnxt_pcie_32b_entries[j].end &&
> 2120					    j < ARRAY_SIZE(bnxt_pcie_32b_entries) - 1)
  2121						j++;
  2122				} else {
  2123					u64 *dst64 = (u64 *)(dst + i);
  2124	
  2125					*dst64 = le64_to_cpu(*(__le64 *)(src + i));
  2126					i += 8;
  2127				}
  2128			}
  2129		}
  2130		hwrm_req_drop(bp, req);
  2131	}
  2132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
