Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AA1199E88
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 10:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452179; cv=none; b=VCHQEEjjR05VWOpsIe9m+KQJRH9DN3yAf+wnVGMuDhlQSKVpbs/VYDWhYdf0Y9mzVMs7FxnoIXguD5Y8q6zWnjGBiRZFiasK1BVlomFWfmFtgXJuGufuyJkKlRyUwBPF5v5eBmuExM2tIBfPGrFC/9kF7eaUD59aBaO82tmODLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452179; c=relaxed/simple;
	bh=bYNMaUcTaxVeQIQrK9mq0X+nu/PXGnCTu3CupLR1SE4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HboFn9A4axmNJ67hFSeG95VPa6Sdln+xcz28LKInOoJh8HszVR+Tc3EdMYcpypIOURzXpavS4GsWIJpQRcv4Mr5nATHuZfqe/b60W4vKbbziTm3Crq+5/3atDX+UHnzKNXpp+//WlA1yiub0kzpLqY22GoSuR9DVdzA7j5yX+A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9Ok5q+N; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9Ok5q+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744452178; x=1775988178;
  h=date:from:to:cc:subject:message-id;
  bh=bYNMaUcTaxVeQIQrK9mq0X+nu/PXGnCTu3CupLR1SE4=;
  b=j9Ok5q+NdA2kHiPxg2sUQxrSFOeCX3yPkuTw5Q9pgIzxaKYInUoxlbxy
   GC7IrV4DAP6eaVIKs/WoTrBrteo9CI4nBr+QakCajmhR0VAoO6LhboCzp
   uVZLaieo+HQO4zEPFdDgXzXoFaaLk+qjeoi5Ea4CvZYhBjTO3PivGvq7m
   qMx/uB1ZW6nGfCuh2VwacqOo/bbqaxCHoY50qo/rqG3gTx1Qk4oUMKZfw
   6plbVN+U9haiBeizMZUoXChAeo/znIyyV7mbrHgPE2qfnOmkF9D2fUCXM
   Qz5QpQo9GWiW5B5skFLuuqgAJtR4wPhYNWemG/UQlQKqWIrBFwfkO5YBB
   A==;
X-CSE-ConnectionGUID: KQ7Ya48HR2eVfRsxaEYoYA==
X-CSE-MsgGUID: zdujSN+QQLyxresHG4E1VA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="57372503"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="57372503"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 03:02:57 -0700
X-CSE-ConnectionGUID: YpeuIbeYSl+QmIKm8LVjdw==
X-CSE-MsgGUID: anVd4G7eQHihp5eNwM143g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="129402343"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Apr 2025 03:02:56 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3XhO-000Bi1-10;
	Sat, 12 Apr 2025 10:02:54 +0000
Date: Sat, 12 Apr 2025 18:01:57 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 164a9f712fa53e4c92b2a435bb071a5be0c31dbc
Message-ID: <202504121851.WujOiILu-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 164a9f712fa53e4c92b2a435bb071a5be0c31dbc  x86/xen: Fix __xen_hypercall_setfunc()

elapsed time: 1443m

configs tested: 17
configs skipped: 128

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250411    gcc-12
i386    buildonly-randconfig-002-20250411    gcc-12
i386    buildonly-randconfig-003-20250411    gcc-12
i386    buildonly-randconfig-004-20250411    clang-20
i386    buildonly-randconfig-005-20250411    gcc-11
i386    buildonly-randconfig-006-20250411    gcc-12
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250411    gcc-11
x86_64  buildonly-randconfig-002-20250411    gcc-11
x86_64  buildonly-randconfig-004-20250411    gcc-12
x86_64  buildonly-randconfig-006-20250411    gcc-12
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
