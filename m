Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57DD24BD18
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202340; cv=none; b=TkuLaqYlJkovb9DU6jQPMNS/PdUNHm/t3BkghZjt/aBi4m0POlBa/OTyfPBxydRl925jJsBZjy+TaEwyMH3I7wHehcMT6Sgcn4sOnbKxunUIjljJ7fz4pNlUI+9bzO+xG1MbZ93GVoTWpPuam7uZmys1u/rUn8SW2/flyPtOmHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202340; c=relaxed/simple;
	bh=UUjKrez83wi/5Y0smhJ/qK967xlrmuFXA+yORjES1w0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SBWStu5Gh7vAq1SWvNMxz0xYgNeLqTtTeOp/8BV2Vr/QfN+cQy6BO5eWnynpXT2jIMk8M37BhlfWfX2RCqocbAipiLisOWzAYqDgWHzTrOZmVpDNOIRvELgb3azxdz2t5RjGHeaoRjhD4KQZC8pITzrj4NXH37u+bRcSX3sTF4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tk+FsO0f; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tk+FsO0f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739202339; x=1770738339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UUjKrez83wi/5Y0smhJ/qK967xlrmuFXA+yORjES1w0=;
  b=Tk+FsO0fX/RIFCTyMEOzp3hDsawx0317iKQ3mnyhuMXD6ImbQOzO05cf
   Cs3lctU/24CherNiaasZtf8niRudniso39NKwZZVDfCST5dDaGWeM2LT1
   KX3Cw44GsuYdrSqob8NuWO6aWln6UCpFtVBXqCSdw2hn6Lfgs0G6e8IUd
   c4PO4oH2v4+L9vo3QBKPb8YkQCAeC7oB0MX4QfUV1vfwXpjYEEY8wqEJ1
   qFb/IIJcBy+3RJXgn6OtKxCVXfT2XFDjOqdtlAakhjGr7dJSgpkpNPjFU
   InXuP7+nPP1+1PtTjLW+HpLqRTGwdxIezmFa2P0V4BkMo9aP1QPq5kvpc
   w==;
X-CSE-ConnectionGUID: etratfSKTWO4Gjs4KuEFXg==
X-CSE-MsgGUID: sgkbZAZ8RYC1cnSJfm8iJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50419256"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="50419256"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 07:45:38 -0800
X-CSE-ConnectionGUID: q+UuFAnERyWDSo1d9OmAaQ==
X-CSE-MsgGUID: /cjp3IqGTv2R4itLYAbHtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143120729"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2025 07:45:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thVyY-0012yn-2O;
	Mon, 10 Feb 2025 15:45:34 +0000
Date: Mon, 10 Feb 2025 23:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Maftei (amaftei)" <amaftei@solarflare.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/net/ethernet/sfc/ethtool_common.c:170:32: warning: '%-24s'
 directive output may be truncated writing between 24 and 31 bytes into a
 region of size 25
Message-ID: <202502102316.8R6hTLsF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a64dcfb451e254085a7daee5fe51bf22959d52d3
commit: 3653954da498fc80c5da3642ae3f8d8168d7f820 sfc: move some ethtool code
date:   5 years ago
config: x86_64-randconfig-001-20241126 (https://download.01.org/0day-ci/archive/20250210/202502102316.8R6hTLsF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502102316.8R6hTLsF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502102316.8R6hTLsF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/sfc/ethtool_common.c:150:6: warning: no previous prototype for 'efx_fill_test' [-Wmissing-prototypes]
     150 | void efx_fill_test(unsigned int test_index, u8 *strings, u64 *data,
         |      ^~~~~~~~~~~~~
   drivers/net/ethernet/sfc/ethtool_common.c:192:5: warning: no previous prototype for 'efx_fill_loopback_test' [-Wmissing-prototypes]
     192 | int efx_fill_loopback_test(struct efx_nic *efx,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/ethtool_common.c:296:8: warning: no previous prototype for 'efx_describe_per_queue_stats' [-Wmissing-prototypes]
     296 | size_t efx_describe_per_queue_stats(struct efx_nic *efx, u8 *strings)
         |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/sfc/ethtool_common.c: In function 'efx_fill_test':
>> drivers/net/ethernet/sfc/ethtool_common.c:170:32: warning: '%-24s' directive output may be truncated writing between 24 and 31 bytes into a region of size 25 [-Wformat-truncation=]
     170 |                          "%-6s %-24s", unit_str, test_str);
         |                                ^~~~~             ~~~~~~~~
   drivers/net/ethernet/sfc/ethtool_common.c:168:17: note: 'snprintf' output 32 or more bytes (assuming 39) into a destination of size 32
     168 |                 snprintf(strings + test_index * ETH_GSTRING_LEN,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     169 |                          ETH_GSTRING_LEN,
         |                          ~~~~~~~~~~~~~~~~
     170 |                          "%-6s %-24s", unit_str, test_str);
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +170 drivers/net/ethernet/sfc/ethtool_common.c

   136	
   137	/**
   138	 * efx_fill_test - fill in an individual self-test entry
   139	 * @test_index:		Index of the test
   140	 * @strings:		Ethtool strings, or %NULL
   141	 * @data:		Ethtool test results, or %NULL
   142	 * @test:		Pointer to test result (used only if data != %NULL)
   143	 * @unit_format:	Unit name format (e.g. "chan\%d")
   144	 * @unit_id:		Unit id (e.g. 0 for "chan0")
   145	 * @test_format:	Test name format (e.g. "loopback.\%s.tx.sent")
   146	 * @test_id:		Test id (e.g. "PHYXS" for "loopback.PHYXS.tx_sent")
   147	 *
   148	 * Fill in an individual self-test entry.
   149	 */
   150	void efx_fill_test(unsigned int test_index, u8 *strings, u64 *data,
   151			   int *test, const char *unit_format, int unit_id,
   152			   const char *test_format, const char *test_id)
   153	{
   154		char unit_str[ETH_GSTRING_LEN], test_str[ETH_GSTRING_LEN];
   155	
   156		/* Fill data value, if applicable */
   157		if (data)
   158			data[test_index] = *test;
   159	
   160		/* Fill string, if applicable */
   161		if (strings) {
   162			if (strchr(unit_format, '%'))
   163				snprintf(unit_str, sizeof(unit_str),
   164					 unit_format, unit_id);
   165			else
   166				strcpy(unit_str, unit_format);
   167			snprintf(test_str, sizeof(test_str), test_format, test_id);
   168			snprintf(strings + test_index * ETH_GSTRING_LEN,
   169				 ETH_GSTRING_LEN,
 > 170				 "%-6s %-24s", unit_str, test_str);
   171		}
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
