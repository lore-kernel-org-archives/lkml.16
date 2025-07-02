Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941AC275851
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461205; cv=none; b=D6HoIZTDo2Z908qv+XrQoEsRvRMBWX+W0+vXt8Ld3HlTwZDoZVmJu7qNInYJD3HnHyroe4cAmV2q8l7GIdxKgPkFrYrmPH/+FuuGkuWVmd3u/FR7N4cPW/XdS6E29X+c8xLYtDcMe8eWL5vLL9X2OV8GY6tnZl48JUAjCC6xteY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461205; c=relaxed/simple;
	bh=1XQY2y1nQnHhezrjkMBlLaRc5RG+HJsC077eRt6Totg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZGxUC2/399HhqhfQTyi5bQlEzpqDDOE3PXVO5RgZ5A6JDhF2SvXMosAhkLtw8TDqB74/tpKAfDZCbLWgB6TsgHuqGUO0KvpbcduJ5miJBj/AkFFcj7Pa66wcioTSqd/R6HzE3FR2Wcktd2D4Y965tC9TR9PeBcN7h7CHw1Kop4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29C121424;
	Wed,  2 Jul 2025 05:59:48 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67B023F58B;
	Wed,  2 Jul 2025 06:00:02 -0700 (PDT)
Date: Wed, 2 Jul 2025 14:00:00 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: kernel test robot <lkp@intel.com>
Cc: x86-ml <x86@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [tip:master] BUILD REGRESSION
 104f02a7798f7e8aba25545f9d485035532260b2
Message-ID: <aGUtUH3eVE_T7IVa@J2N7QTR9R3.cambridge.arm.com>
References: <202507022036.gBgIDWyi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507022036.gBgIDWyi-lkp@intel.com>

On Wed, Jul 02, 2025 at 08:47:51PM +0800, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git master
> branch HEAD: 104f02a7798f7e8aba25545f9d485035532260b2  Merge core/entry into tip/master
> 
> Error/Warning (recently discovered and may have been fixed):
> 
>     https://lore.kernel.org/oe-kbuild-all/202507020528.N0LtekXt-lkp@intel.com
> 
>     drivers/net/ethernet/intel/iavf/iavf_main.c:2399:2: error: unexpected token
>     include/linux/irq-entry-common.h:201:2: error: unexpected token
> 
> Error/Warning ids grouped by kconfigs:
> 
> recent_errors
> `-- s390-allmodconfig
>     |-- drivers-net-ethernet-intel-iavf-iavf_main.c:error:unexpected-token
>     `-- include-linux-irq-entry-common.h:error:unexpected-token

For the sake of the archive, this is the same issue being discussed at:

  https://lore.kernel.org/oe-kbuild-all/202507020528.N0LtekXt-lkp@intel.com/#t

Mark.

> 
> elapsed time: 1444m
> 
> configs tested: 117
> configs skipped: 3
> 
> tested configs:
> alpha                             allnoconfig    gcc-15.1.0
> alpha                            allyesconfig    gcc-15.1.0
> arc                               allnoconfig    gcc-15.1.0
> arc                   randconfig-001-20250701    gcc-13.3.0
> arc                   randconfig-002-20250701    gcc-15.1.0
> arm                               allnoconfig    clang-21
> arm                          pxa3xx_defconfig    clang-21
> arm                   randconfig-001-20250701    clang-17
> arm                   randconfig-002-20250701    gcc-8.5.0
> arm                   randconfig-003-20250701    clang-21
> arm                   randconfig-004-20250701    clang-21
> arm                           tegra_defconfig    gcc-15.1.0
> arm                         vf610m4_defconfig    gcc-15.1.0
> arm64                             allnoconfig    gcc-15.1.0
> arm64                 randconfig-001-20250701    clang-21
> arm64                 randconfig-002-20250701    gcc-15.1.0
> arm64                 randconfig-003-20250701    clang-18
> arm64                 randconfig-004-20250701    gcc-8.5.0
> csky                              allnoconfig    gcc-15.1.0
> csky                  randconfig-001-20250701    gcc-11.5.0
> csky                  randconfig-002-20250701    gcc-10.5.0
> hexagon                          allmodconfig    clang-17
> hexagon                           allnoconfig    clang-21
> hexagon                          allyesconfig    clang-21
> hexagon               randconfig-001-20250701    clang-21
> hexagon               randconfig-002-20250701    clang-21
> i386                             allmodconfig    gcc-12
> i386                              allnoconfig    gcc-12
> i386        buildonly-randconfig-001-20250701    gcc-12
> i386        buildonly-randconfig-002-20250701    gcc-12
> i386        buildonly-randconfig-003-20250701    gcc-12
> i386        buildonly-randconfig-004-20250701    gcc-12
> i386        buildonly-randconfig-005-20250701    gcc-12
> i386        buildonly-randconfig-006-20250701    clang-20
> i386                                defconfig    clang-20
> loongarch                        allmodconfig    gcc-15.1.0
> loongarch                         allnoconfig    gcc-15.1.0
> loongarch             randconfig-001-20250701    gcc-13.3.0
> loongarch             randconfig-002-20250701    gcc-15.1.0
> m68k                             allmodconfig    gcc-15.1.0
> m68k                              allnoconfig    gcc-15.1.0
> m68k                             allyesconfig    gcc-15.1.0
> microblaze                       allmodconfig    gcc-15.1.0
> microblaze                        allnoconfig    gcc-15.1.0
> microblaze                       allyesconfig    gcc-15.1.0
> mips                              allnoconfig    gcc-15.1.0
> mips                          eyeq6_defconfig    clang-21
> mips                           gcw0_defconfig    clang-21
> mips                            gpr_defconfig    clang-18
> nios2                             allnoconfig    gcc-14.2.0
> nios2                 randconfig-001-20250701    gcc-14.2.0
> nios2                 randconfig-002-20250701    gcc-13.3.0
> openrisc                          allnoconfig    gcc-15.1.0
> openrisc                         allyesconfig    gcc-15.1.0
> openrisc                            defconfig    gcc-15.1.0
> parisc                           allmodconfig    gcc-15.1.0
> parisc                            allnoconfig    gcc-15.1.0
> parisc                           allyesconfig    gcc-15.1.0
> parisc                              defconfig    gcc-15.1.0
> parisc                randconfig-001-20250701    gcc-14.3.0
> parisc                randconfig-002-20250701    gcc-10.5.0
> parisc64                         alldefconfig    gcc-15.1.0
> powerpc                          allmodconfig    gcc-15.1.0
> powerpc                           allnoconfig    gcc-15.1.0
> powerpc                          allyesconfig    clang-21
> powerpc               randconfig-001-20250701    gcc-13.3.0
> powerpc               randconfig-002-20250701    clang-21
> powerpc               randconfig-003-20250701    clang-21
> powerpc                     sequoia_defconfig    clang-17
> powerpc64             randconfig-001-20250701    clang-21
> powerpc64             randconfig-002-20250701    clang-21
> powerpc64             randconfig-003-20250701    gcc-10.5.0
> riscv                            allmodconfig    clang-21
> riscv                             allnoconfig    gcc-15.1.0
> riscv                            allyesconfig    clang-16
> riscv                               defconfig    clang-21
> riscv                 randconfig-001-20250701    gcc-14.3.0
> riscv                 randconfig-002-20250701    gcc-10.5.0
> s390                             allmodconfig    clang-18
> s390                              allnoconfig    clang-21
> s390                             allyesconfig    gcc-15.1.0
> s390                  randconfig-001-20250701    gcc-9.3.0
> s390                  randconfig-002-20250701    clang-17
> sh                               allmodconfig    gcc-15.1.0
> sh                                allnoconfig    gcc-15.1.0
> sh                               allyesconfig    gcc-15.1.0
> sh                         apsh4a3a_defconfig    gcc-15.1.0
> sh                         ecovec24_defconfig    gcc-15.1.0
> sh                             espt_defconfig    gcc-15.1.0
> sh                    randconfig-001-20250701    gcc-15.1.0
> sh                    randconfig-002-20250701    gcc-13.3.0
> sh                   secureedge5410_defconfig    gcc-15.1.0
> sh                        sh7757lcr_defconfig    gcc-15.1.0
> sparc                            allmodconfig    gcc-15.1.0
> sparc                             allnoconfig    gcc-15.1.0
> sparc                 randconfig-001-20250701    gcc-10.3.0
> sparc                 randconfig-002-20250701    gcc-15.1.0
> sparc64               randconfig-001-20250701    gcc-8.5.0
> sparc64               randconfig-002-20250701    gcc-12.4.0
> um                               allmodconfig    clang-19
> um                                allnoconfig    clang-21
> um                               allyesconfig    gcc-12
> um                    randconfig-001-20250701    gcc-12
> um                    randconfig-002-20250701    gcc-12
> x86_64                            allnoconfig    clang-20
> x86_64                           allyesconfig    clang-20
> x86_64      buildonly-randconfig-001-20250701    gcc-12
> x86_64      buildonly-randconfig-002-20250701    gcc-12
> x86_64      buildonly-randconfig-003-20250701    gcc-12
> x86_64      buildonly-randconfig-004-20250701    gcc-12
> x86_64      buildonly-randconfig-005-20250701    clang-20
> x86_64      buildonly-randconfig-006-20250701    clang-20
> x86_64                              defconfig    gcc-11
> x86_64                          rhel-9.4-rust    clang-18
> xtensa                            allnoconfig    gcc-15.1.0
> xtensa                randconfig-001-20250701    gcc-15.1.0
> xtensa                randconfig-002-20250701    gcc-13.3.0
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
