Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCB81FC7D2
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 19:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744918325; cv=none; b=YNFHcdxdjl9UHIjDW3btKbYmjNR7A1vszxN0av8wNC1lBV4r2EboXQ0c1CkgyM5fthcJNdrb5hCNt9L0lDqGAXXOHeOe/XRgFDNg0DNAFdtrTCvndo+doIIFhpSl/lFUJ/eWjaqeuIP6G3z7l7tM475+bmWpd9mc4ZW5JbahQVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744918325; c=relaxed/simple;
	bh=5KWyaEhM3chGwHje/Jn7C2askWRO782UF88DK0yvsfU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rmp7Vrc/Pw7/9mL5B1VVFIpYFgOnt/BnZqs60QlNJgPrgyLe4ZaIYAgHfmwwSdzg8bIkDgkFQPVBks5oNDfZRHAsRWU66HavH4WlP/HI4x5SQiQkTGV4y+hyp9csKbX69ZbcwjXbcMjiB9EOArRxpQLw1A1iKPwbxQYyE6WHbzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S/igF4r0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S/igF4r0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744918324; x=1776454324;
  h=date:from:to:cc:subject:message-id;
  bh=5KWyaEhM3chGwHje/Jn7C2askWRO782UF88DK0yvsfU=;
  b=S/igF4r0NsTpuwKRqNw5vKeWMIH3W4RNNK+8Nisge9kX+A6I85Hu3pNO
   Xo+a/ylThrTtwhH8Tw6dgb1iCFAgMZanYMad+ktqDebEYlV5FM3SCRwG6
   sMarwK1pM2Yv+n/eCa/VGdQazqlP99CsOiDoZWyN2hZJIPbMP6tWh0ENS
   l2cjMTW4kNSmf3vmpk9YjgxvxRb42TP4BCY/xYl/AwQ/WZ1C/M4Pm8bVi
   zpzdcs3HFdLlbwkWNKKlIsLqBCJFispr+zZvxoP9ngmQ4VQ6VRGJJAjYc
   OtuTrU4fjxaQMBtKa/jfBXju5Ktc0jTjnN3gR0U5b9WxHRNSGNs0HXryv
   g==;
X-CSE-ConnectionGUID: LBOL32A7SoWs3DYJrLi+HA==
X-CSE-MsgGUID: nYFJNa3MQ2qrWKXfO0trug==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="71918328"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="71918328"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 12:32:04 -0700
X-CSE-ConnectionGUID: YsR2+vkJTBef/1OH3hE23Q==
X-CSE-MsgGUID: EReT2kd5SdyjPHRsV3uzRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="130677091"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Apr 2025 12:32:03 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5Uxs-0001zH-0m;
	Thu, 17 Apr 2025 19:32:00 +0000
Date: Fri, 18 Apr 2025 03:31:14 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/bugs] BUILD SUCCESS
 d9b79111fd9945931b7a2b2a3e7db7625dd953fe
Message-ID: <202504180306.cBJGYtV5-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/bugs
branch HEAD: d9b79111fd9945931b7a2b2a3e7db7625dd953fe  x86/bugs: Rename mmio_stale_data_clear to cpu_buf_vm_clear

elapsed time: 1453m

configs tested: 19
configs skipped: 127

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250417    clang-20
i386    buildonly-randconfig-002-20250417    gcc-12
i386    buildonly-randconfig-003-20250417    gcc-12
i386    buildonly-randconfig-004-20250417    gcc-12
i386    buildonly-randconfig-005-20250417    clang-20
i386    buildonly-randconfig-006-20250417    gcc-12
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250417    clang-20
x86_64  buildonly-randconfig-002-20250417    clang-20
x86_64  buildonly-randconfig-003-20250417    gcc-12
x86_64  buildonly-randconfig-004-20250417    clang-20
x86_64  buildonly-randconfig-005-20250417    clang-20
x86_64  buildonly-randconfig-006-20250417    clang-20
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
