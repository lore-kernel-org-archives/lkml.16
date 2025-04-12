Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9EF24B29
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 02:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744423523; cv=none; b=C2wHQ4mxemmHGOo/9fYRWfsp60jqoRzKiMznP59k0SXC13YzQkmh5Rpnk6Q2Wshnvm6FMXMKHI1jRCHn+onWVnU8qNL81GE8WT3vK1Xsh47MmOUuqrp4uhKkl+z9E7Y6DCveGUNGcm3OxR3/WFq/SRQ8cNc9AlvZyXNie4yUeOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744423523; c=relaxed/simple;
	bh=utvZXLciGWhNmw2eqkHBxtGSypxdMozxIqZjxv3FOfY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GcBE9iGRRzC7Dd9hy81zN9APAav9pKz2cyEhHg78FBPYO/+Sv0+qqH27PAvaTCXTBTSPLQawonQU19HTSDe8XjcS/dIN4o6GZ6WXdeaDbnwpMSeshwLNhS4i/6dmSe1s6Szl7P69qwQQ/tYbTLOBmdwOGjfyIV5o5AZl1P94HLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ro/sHm9e; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ro/sHm9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744423519; x=1775959519;
  h=date:from:to:cc:subject:message-id;
  bh=utvZXLciGWhNmw2eqkHBxtGSypxdMozxIqZjxv3FOfY=;
  b=Ro/sHm9eWMoPMl6X9ohAUqKEEoDk9sxcemQ4QlZ25dD0VRDBRwpyW/TD
   iAY4Ek3xBIOfAEd/rcgFrLY4UXZhOKVVRwcaVXxgSkK1NpPftj9L7Z6bB
   gNt2x/4+1u+LrX2gvhXxdDyLh1qMCZ/cPKBuVELLgh8K3X9yU5K8tyfwn
   qR95Zy4xoWVaSUl5qMEx0wIM74eu+lj4Z+vw432+4CjHglRoGsO/eem1R
   boxuEwaF9G+gp6jtI8cZ0SqOuhSegZRqponCcr2D4SBcmB9AenEcd2KyH
   HEVqaHHzUrLJcCSS73EC3L8VMz+A+fB5Xf6Vr8g8+P5JkV1kV0lxkQSSj
   Q==;
X-CSE-ConnectionGUID: hU/w63BBQhyUFVFzddfv9Q==
X-CSE-MsgGUID: Yxeh0cqSQi+TMUFUJL7Mug==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="57349524"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="57349524"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 19:05:18 -0700
X-CSE-ConnectionGUID: pVSQ294ZSnqoCn2kfXgSWw==
X-CSE-MsgGUID: R7qMv24SRZ6Ab7YILWF+CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="129897785"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Apr 2025 19:05:18 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3QF9-000BVq-17;
	Sat, 12 Apr 2025 02:05:15 +0000
Date: Sat, 12 Apr 2025 10:04:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev] BUILD SUCCESS
 c649e820f1c25a89c3ac33c1a0b1dbbed6d15de2
Message-ID: <202504121046.qt7L3FYh-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
branch HEAD: c649e820f1c25a89c3ac33c1a0b1dbbed6d15de2  Revert "rcutorture: Perform more frequent testing of ->gpwrap"

elapsed time: 1449m

configs tested: 16
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
arc        randconfig-001-20250412    gcc-14.2.0
arc        randconfig-002-20250412    gcc-14.2.0
arm        randconfig-001-20250412    clang-21
arm        randconfig-002-20250412    gcc-7.5.0
arm        randconfig-003-20250412    clang-21
arm        randconfig-004-20250412    clang-21
csky       randconfig-001-20250412    gcc-14.2.0
csky       randconfig-002-20250412    gcc-14.2.0
hexagon    randconfig-001-20250412    clang-21
hexagon    randconfig-002-20250412    clang-21
loongarch  randconfig-001-20250412    gcc-14.2.0
loongarch  randconfig-002-20250412    gcc-14.2.0
nios2      randconfig-001-20250412    gcc-8.5.0
nios2      randconfig-002-20250412    gcc-10.5.0
parisc     randconfig-001-20250412    gcc-7.5.0
parisc     randconfig-002-20250412    gcc-9.3.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
