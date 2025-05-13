Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FF01F1518
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122869; cv=none; b=Uf0J8WzFqQ5znsnK+/nKlN9+JgSnHhIMW70pgPduL8rNbOQ9cI403jhSZkUzaKdH/c3rL7N5Uect6id3mMfgE03jM8JEBWMi2LnfVP69symeK/IXMyCEUso0ubCJNIesBY76y5aF2EGRAE/Cv5MYKFSL9CemPI9dokpQPKLRAx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122869; c=relaxed/simple;
	bh=Bj4sbAzmef7XhMmrXpaCbzeRGBE9OXTisqYAmOJ31tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ojNlevLuBNHu+0i5RCfEe7l+9WnvTm1v9s5X+FZHUyOtf3WWG7WGOS8Uk46GYSOe+tf4G4/b90ganOxtS/quDKHH7Ve26AR+VLIA5vOVWo1GZ1Y/PB4RJo+tKGS/JgOCl9LQ2B9SYXs8AtT6MpV0f3AUJ8aFN5bzvkFD6KuT4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqRHYboc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqRHYboc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747122867; x=1778658867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bj4sbAzmef7XhMmrXpaCbzeRGBE9OXTisqYAmOJ31tQ=;
  b=AqRHYbocvJqv4PtKk+i8nVxFEvySbt9aq7ayA4S5aPGSB0dXGbATcQoC
   ZDBRT8P0Rm1wZt2xhgWcSBb8hfWQbWoPF8ybVw/sRNGgw43RjdtVUblRf
   2Kx68Shsjk8Ox1e1v7v+lLL1Rg1V1N01uzw2fXAP0SqL/JKCqMnqgVZKN
   cqupnIRkpadspbYL/HAbmooh7oNaqjENi+IUuVozAAD16Ff/+rSLEdpMD
   kl37Djlep74Z4iaYJOF/HGwIcrupXgx6hzkV5A0W9fsQU8JwqHJeQ6usV
   d4dcNIKPN9JZhye4Y7+bE5CxF1aCO5f+9yXOFm3z5VlzisSN3/+LOOtvv
   Q==;
X-CSE-ConnectionGUID: awmHcyoJRBmxAmU5yMkYQw==
X-CSE-MsgGUID: sWUP9NApQkux+K44Q86zrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48830393"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="48830393"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 00:54:26 -0700
X-CSE-ConnectionGUID: CncMGXX0TK+UmB9KD1k65w==
X-CSE-MsgGUID: glEV/8TISYK2pKA4F0k6AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="137538371"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 May 2025 00:54:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEkT0-000Fpy-19;
	Tue, 13 May 2025 07:54:22 +0000
Date: Tue, 13 May 2025 15:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: kismet: WARNING: unmet direct dependencies detected for HUGETLBFS
 when selected by PPC_8xx
Message-ID: <202505131529.LhPnmz4L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9565e23cd89d4d5cd4388f8742130be1d6f182d
commit: f8142cf94d4737ea0c3baffb3b9bad8addcb9b6b hugetlb: make hugetlb depends on SYSFS or SYSCTL
date:   2 years, 8 months ago
config: powerpc-kismet-CONFIG_HUGETLBFS-CONFIG_PPC_8xx-0-0 (https://download.01.org/0day-ci/archive/20250513/202505131529.LhPnmz4L-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250513/202505131529.LhPnmz4L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131529.LhPnmz4L-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HUGETLBFS when selected by PPC_8xx
   WARNING: unmet direct dependencies detected for HUGETLBFS
     Depends on [n]: (X86 || IA64 || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=y] || BROKEN [=n]) && (SYSFS [=n] || SYSCTL [=n])
     Selected by [y]:
     - PPC_8xx [=y] && <choice>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
