Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A9122D78F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744778649; cv=none; b=moFDvTRe8ewGWkCV6WOXhIq4k0+ft4RZ7oI6hnIwGWRSOnFhEK51lA8+p7w3Tlny0Rmsvf9OyIG22Ft1w9z9WVqO0cnedZTAf42AuSeYrCOZjGEfrU7B9Zs6VD8ylx2fehPrUogdP4279NPnYNxnp38JzUs3KLfg7X66jhG8c2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744778649; c=relaxed/simple;
	bh=dpZZMdx5FbY7QwD4nb9lzPhZAryD+kC8ybpY+M3GD+I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZRsnBYISKSnbts9YmVvFhjIrZARSAHw0Ic7kSesZTnvZP9/bOzpDsIgeHEm/jphPWHqOswhEIk18hT8rtlJSv1YJS9t9q99MERJMAl6civT49HDFR4bptF/bFjU2HYRPKTZ4mb/qYpZpyl+deR5VtKwvjW/Vt8fMRTzQg6rsksw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7QaxmfA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7QaxmfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744778648; x=1776314648;
  h=date:from:to:cc:subject:message-id;
  bh=dpZZMdx5FbY7QwD4nb9lzPhZAryD+kC8ybpY+M3GD+I=;
  b=e7QaxmfAg+vgiWBqpYZnUKCvt0YUhGzsklHecWJn09nVvp0tBhDRmkNT
   4a2nmURPXU7RFdQwlkDISNTyNPMbV96FX90vwzrBW9EqDW1Glrwey8e0H
   wUuBP0wMT5e1RVyxawL+P0cSHRoS2W1eEWvwhUWWqNUBd14Ctc9Dm2bjP
   N1zKM6CWyLPhEIe/UwFo8wyWSo6p9M6YDFVPhixW1o0yc7FiIrrHcixs6
   Ku2zPeeY+Nl5w3j6XwTm3+6u5nv4mY6qpBY1cs/dpUp6CruZqmBU5L9gq
   aUPxZKq24IaIyHE3o3H+4lHzTaCTat2unaAUy0eOW/yuHoNEgQn3dnNPr
   A==;
X-CSE-ConnectionGUID: mRTRVnCGTUe42poJ0rG2wQ==
X-CSE-MsgGUID: a/75tLNfRryKa0qMFwYWpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46025588"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46025588"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 21:44:07 -0700
X-CSE-ConnectionGUID: RUmTV55/R4GeFgmVbrxSEw==
X-CSE-MsgGUID: wz6Alh1TSg6qT0dah2iVrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="135313495"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Apr 2025 21:44:07 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4jIC-000Gk0-18;
	Tue, 15 Apr 2025 16:37:48 +0000
Date: Wed, 16 Apr 2025 00:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/urgent] BUILD SUCCESS
 45842b59ec93a5c8f24b4e62f3a5759d3857c08e
Message-ID: <202504160041.Ez2fGjjU-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
branch HEAD: 45842b59ec93a5c8f24b4e62f3a5759d3857c08e  x86/cpu: Add CPU model number for Bartlett Lake CPUs with Raptor Cove cores

elapsed time: 1451m

configs tested: 19
configs skipped: 126

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
i386                         allmodconfig    gcc-12
i386                          allnoconfig    gcc-12
i386                         allyesconfig    gcc-12
i386    buildonly-randconfig-001-20250415    clang-20
i386    buildonly-randconfig-002-20250415    clang-20
i386    buildonly-randconfig-003-20250415    clang-20
i386    buildonly-randconfig-004-20250415    clang-20
i386    buildonly-randconfig-005-20250415    gcc-12
i386    buildonly-randconfig-006-20250415    gcc-12
i386                            defconfig    clang-20
x86_64                        allnoconfig    clang-20
x86_64                       allyesconfig    clang-20
x86_64  buildonly-randconfig-001-20250415    clang-20
x86_64  buildonly-randconfig-002-20250415    gcc-11
x86_64  buildonly-randconfig-003-20250415    gcc-12
x86_64  buildonly-randconfig-004-20250415    clang-20
x86_64  buildonly-randconfig-005-20250415    clang-20
x86_64  buildonly-randconfig-006-20250415    gcc-12
x86_64                          defconfig    gcc-11

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
