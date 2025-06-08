Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4471372
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 05:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749361888; cv=none; b=gNi+kaFYy+aw8oYtPt9tWhNhqtVNfLdiT/af/whiJj1U0o/5j0KKz/NiRH0dR2Ec92l6G7vLXjZpUoicKJWi3xKewZ9PoRkoHVNDjHCNdFZpc/dbBjo9mhfdKcaLpEIc2pf/qZ9KvB5Zx83CEeYH/Wbex5Im4ph3HFpMPYaIzXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749361888; c=relaxed/simple;
	bh=cxA2E8w4UeykoRcWwBtEVq8eBYAYpbFqh3Kq708kl0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hAJSshgONccK2zi3WQ83fRLYwCA8JJBfwYtuUZ3Z9VoOyYHGVdgFtfJrnCduC9/qgNcrwCdMuEZ1DSTZlXVNidOAXcHCQAPNA42Ls5llNTMomYFlaW32z/iizWw/xy+ESuaUm7rgvA/B5amwLf5wsQVkWS8EZOzvU6dKIaDjKXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaBseFxV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaBseFxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749361885; x=1780897885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cxA2E8w4UeykoRcWwBtEVq8eBYAYpbFqh3Kq708kl0o=;
  b=AaBseFxVE+d8SnXUQdF/O1fA/f2zjXDeDxXSTngYQpwcCQmU9TeFOqHj
   2EIvqZ6LAS1GszsFpfMiN6h72+Z4rELkmWDLLsKnYx1Eksqn1c4GnhwK7
   Wp1VNrVZ7swBSg9YmbTfm9aYN7dVFue7hy+CumEi5BnZWlRglDS1E0PtO
   8VPDtD2TM0aDhhqM8Kd94LmzMVQe1t+wkNxTs7STlPeBblw9oDsGKJcKE
   LxB1p5HIudyp85apPQJUs7GpvopF9n1zHaXj7ZT6u5MDbcKApwsCWG96d
   Vor/B91ZHmD40VEALaggYqh4N1BAT1PokPbPPw8fUgIMYud2oNyOFNlJM
   g==;
X-CSE-ConnectionGUID: 7zWftkC5QL6nb8AAINniSg==
X-CSE-MsgGUID: vJ7UJZUlSKe/bQhRAve72w==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="39094605"
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="39094605"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 22:51:25 -0700
X-CSE-ConnectionGUID: OKilKF35RjW5FqtRDv6FeA==
X-CSE-MsgGUID: 2fZfM4mEQymoN3OoW2O/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="151022924"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Jun 2025 22:51:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uO8wC-0006DV-2M;
	Sun, 08 Jun 2025 05:51:20 +0000
Date: Sun, 8 Jun 2025 13:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>
Subject: drivers/net/ethernet/airoha/airoha_ppe.c:425
 airoha_ppe_foe_get_flow_stats_index() warn: always true condition '(hash >=
 (2 * 0)) => (0-u32max >= 0)'
Message-ID: <202506081343.4g7Ip73n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8630c59e99363c4b655788fd01134aef9bcd9264
commit: b81e0f2b58be37628b2e12f8dffdd63c84573e75 net: airoha: Add FLOW_CLS_STATS callback support
date:   3 weeks ago
config: powerpc-randconfig-r071-20250608 (https://download.01.org/0day-ci/archive/20250608/202506081343.4g7Ip73n-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506081343.4g7Ip73n-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/airoha/airoha_ppe.c:425 airoha_ppe_foe_get_flow_stats_index() warn: always true condition '(hash >= (2 * 0)) => (0-u32max >= 0)'
drivers/net/ethernet/airoha/airoha_ppe.c:442 airoha_ppe_foe_flow_stats_reset() warn: we never enter this loop
drivers/net/ethernet/airoha/airoha_ppe.c:456 airoha_ppe_foe_flow_stats_update() warn: always true condition '(index >= (2 * 0)) => (0-u32max >= 0)'
drivers/net/ethernet/airoha/airoha_ppe.c:1075 airoha_ppe_foe_entry_get_stats() warn: always true condition '(index >= (2 * 0)) => (0-u32max >= 0)'

vim +425 drivers/net/ethernet/airoha/airoha_ppe.c

   419	
   420	static u32 airoha_ppe_foe_get_flow_stats_index(struct airoha_ppe *ppe, u32 hash)
   421	{
   422		if (!airoha_ppe2_is_enabled(ppe->eth))
   423			return hash;
   424	
 > 425		return hash >= PPE_STATS_NUM_ENTRIES ? hash - PPE1_STATS_NUM_ENTRIES
   426						     : hash;
   427	}
   428	
   429	static void airoha_ppe_foe_flow_stat_entry_reset(struct airoha_ppe *ppe,
   430							 struct airoha_npu *npu,
   431							 int index)
   432	{
   433		memset_io(&npu->stats[index], 0, sizeof(*npu->stats));
   434		memset(&ppe->foe_stats[index], 0, sizeof(*ppe->foe_stats));
   435	}
   436	
   437	static void airoha_ppe_foe_flow_stats_reset(struct airoha_ppe *ppe,
   438						    struct airoha_npu *npu)
   439	{
   440		int i;
   441	
 > 442		for (i = 0; i < PPE_STATS_NUM_ENTRIES; i++)
   443			airoha_ppe_foe_flow_stat_entry_reset(ppe, npu, i);
   444	}
   445	
   446	static void airoha_ppe_foe_flow_stats_update(struct airoha_ppe *ppe,
   447						     struct airoha_npu *npu,
   448						     struct airoha_foe_entry *hwe,
   449						     u32 hash)
   450	{
   451		int type = FIELD_GET(AIROHA_FOE_IB1_BIND_PACKET_TYPE, hwe->ib1);
   452		u32 index, pse_port, val, *data, *ib2, *meter;
   453		u8 nbq;
   454	
   455		index = airoha_ppe_foe_get_flow_stats_index(ppe, hash);
 > 456		if (index >= PPE_STATS_NUM_ENTRIES)
   457			return;
   458	
   459		if (type == PPE_PKT_TYPE_BRIDGE) {
   460			data = &hwe->bridge.data;
   461			ib2 = &hwe->bridge.ib2;
   462			meter = &hwe->bridge.l2.meter;
   463		} else if (type >= PPE_PKT_TYPE_IPV6_ROUTE_3T) {
   464			data = &hwe->ipv6.data;
   465			ib2 = &hwe->ipv6.ib2;
   466			meter = &hwe->ipv6.meter;
   467		} else {
   468			data = &hwe->ipv4.data;
   469			ib2 = &hwe->ipv4.ib2;
   470			meter = &hwe->ipv4.l2.meter;
   471		}
   472	
   473		airoha_ppe_foe_flow_stat_entry_reset(ppe, npu, index);
   474	
   475		val = FIELD_GET(AIROHA_FOE_CHANNEL | AIROHA_FOE_QID, *data);
   476		*data = (*data & ~AIROHA_FOE_ACTDP) |
   477			FIELD_PREP(AIROHA_FOE_ACTDP, val);
   478	
   479		val = *ib2 & (AIROHA_FOE_IB2_NBQ | AIROHA_FOE_IB2_PSE_PORT |
   480			      AIROHA_FOE_IB2_PSE_QOS | AIROHA_FOE_IB2_FAST_PATH);
   481		*meter |= FIELD_PREP(AIROHA_FOE_TUNNEL_MTU, val);
   482	
   483		pse_port = FIELD_GET(AIROHA_FOE_IB2_PSE_PORT, *ib2);
   484		nbq = pse_port == 1 ? 6 : 5;
   485		*ib2 &= ~(AIROHA_FOE_IB2_NBQ | AIROHA_FOE_IB2_PSE_PORT |
   486			  AIROHA_FOE_IB2_PSE_QOS);
   487		*ib2 |= FIELD_PREP(AIROHA_FOE_IB2_PSE_PORT, 6) |
   488			FIELD_PREP(AIROHA_FOE_IB2_NBQ, nbq);
   489	}
   490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
