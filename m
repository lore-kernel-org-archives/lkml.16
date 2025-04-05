Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CAC2E62C0
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 10:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743847991; cv=none; b=G2fft21Bp0Qpo+fqkbt+QX6EjdGdw7E/N+OxAsrjt5cbsakFt3yr99HD9uNzD7I0OSY+FzusnCLhUuMsTCPbL5SIe4UOnHUEERPjoRG7zOYAM26wOCe73OjQoaxi6gmzWAbBCj7vA6F/d/Joddrh9rZqcF/+bK1i/L/dR+Mm/Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743847991; c=relaxed/simple;
	bh=vuKg0kQG9FzmlaNnussdId4Pja5BBMgazg3NwxiqamU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RAydpkca8E4HkYG4dtMt1j5oUiD/KpkQHPSw1yNEuAZWMEpMtrjgQ38ZzjYW/FXz6rvCG/5qcKJOUyZZj7wN6xADul69JXKOKH79SyPEI+qHcFN+g4OHc0KxZnrUeq4G7cJ1XfDYH6wqsaeTKwGPfyn+zfDHoBRcUxkPAhGQ/sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EpnWcDjI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EpnWcDjI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743847989; x=1775383989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vuKg0kQG9FzmlaNnussdId4Pja5BBMgazg3NwxiqamU=;
  b=EpnWcDjIoUWy+5J1H2bl6WFnC8amVzuxXGzar8DuV8Gppd/KrTwqXp1S
   HKCyx2HTz/UTzNjX6KZQ/JC9WRIWx6rIID3FUDcUCE+snYcG2c2jqtu2Z
   FBobFiR2Zysby3PCkuOgS7qU3O4NcVdK0hGczBUI/LPpu0ElsPQKTdZXt
   UDcq9IpJKbl6RCPjmAVgAyD7n2wMMDiAKBy6I7ojbvxv3Gd0zr+p2HJXj
   0vu5iFVvK8owURso2yH+gD1lZmoaJlkfu3SuKWZM5FNYFEZlNv5Gnn8E2
   vb/i9O/E7VdhITAPdEe0jegzuSEr5po3lGdLmR2C8d2hYU+UckUkX1oYF
   A==;
X-CSE-ConnectionGUID: pCU+1lFwSKO5NIPwu3z3Cw==
X-CSE-MsgGUID: AB4JdobvQXm61fTr3ejhpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="32890042"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="32890042"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 03:13:09 -0700
X-CSE-ConnectionGUID: WRVFEOCzSGeczICWi3HQ6g==
X-CSE-MsgGUID: 1P+m9mB4RWmnvnO+g0x5mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="132652339"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Apr 2025 03:13:07 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u10WP-0001xQ-0S;
	Sat, 05 Apr 2025 10:13:05 +0000
Date: Sat, 5 Apr 2025 18:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: kismet: WARNING: unmet direct dependencies detected for
 PPC_RADIX_BROADCAST_TLBIE when selected by PPC_PSERIES
Message-ID: <202504051857.jRqxM60c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a8662bcd2ff152bfbc751cab20f33053d74d0963
commit: 3d45a3d0d2e6b5cf47c6f0ab890f6ce762d9fd23 powerpc: Define config option for processors with broadcast TLBIE
date:   5 weeks ago
config: powerpc-kismet-CONFIG_PPC_RADIX_BROADCAST_TLBIE-CONFIG_PPC_PSERIES-0-0 (https://download.01.org/0day-ci/archive/20250405/202504051857.jRqxM60c-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250405/202504051857.jRqxM60c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051857.jRqxM60c-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for PPC_RADIX_BROADCAST_TLBIE when selected by PPC_PSERIES
   WARNING: unmet direct dependencies detected for PPC_RADIX_BROADCAST_TLBIE
     Depends on [n]: PPC_RADIX_MMU [=n]
     Selected by [y]:
     - PPC_PSERIES [=y] && PPC64 [=y] && PPC_BOOK3S [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
