Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC881D5CE3
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919800; cv=none; b=HA34GytON/p9Zi41sN1vYFTSP8kfHIRzBAgzPsISTLRj6X5HoDsVXGGfmkPYG9Pob0Nu428SE5GN56JamOcFNbv7ihmgRyj4ghE74ZNhlddMPDXHT/xcTZMXzpO1fYbNO/tJL8NG7QX4hpQb95nSke8zf9PxPdkQlrNH1hNarfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919800; c=relaxed/simple;
	bh=5F/aIOtw2kA9q/iBfmLwbVWdZWN0pxGTJ/C69NEa3Kg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZrkUs9llLlOuRD25BJcVLSnDwWl6N8ifB4biEJjjgLZL3MEEAICHyu3yfCdlIjPgRscliXxJmnHUrzb8yP9EPd/Wb5XghGTicMVaFigPfE0d2xnJBalWtcyh0qzwtHn4rDJ0p7iRPQFHOU8heSMBitbgaAUGtTwc3moit9hkPcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lz+nboNs; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lz+nboNs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738919798; x=1770455798;
  h=date:from:to:cc:subject:message-id;
  bh=5F/aIOtw2kA9q/iBfmLwbVWdZWN0pxGTJ/C69NEa3Kg=;
  b=lz+nboNsjphWQG6tiRvSf+FLFtROQLH3sSffbarFt+2j2mrG1UOGgWiG
   wUFo6yR3UaQkJSaJsJHEvKxO9P3Ksl7Dt2E79qdh1mN9BOkzJhFzbdfn1
   GHlJQTmsmm8BvY2jemDk/axTwDmLJbBv/jusxJ1d11YERaMSipJNX2AEu
   4i5pz687sPmG5ArZ6Y7ojRlPzvnpEgFyt0dGljHacUpN4tPgVR/5+tVrk
   8VKKWom6mERMnoBRZdxMxtcbEVLriGG8wbendUYJDuc4qHqbJQ8Rg5RDt
   eFqi8Oe/vWygcNU6fU06me76U0JMxih2MvbASry6zdwTIDoiqOUcN1YaC
   Q==;
X-CSE-ConnectionGUID: sWHtwPxdRDmGwJTmw0qOgg==
X-CSE-MsgGUID: 7dT1K3/ZRkizJotRnJOjCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39582626"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="39582626"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 01:16:37 -0800
X-CSE-ConnectionGUID: fp0fc6q+RhOSRAm+whTCHA==
X-CSE-MsgGUID: XX3isyn2T7O/R8kY6MkKFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="111674025"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Feb 2025 01:16:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgKTS-000y2l-1V;
	Fri, 07 Feb 2025 09:16:34 +0000
Date: Fri, 07 Feb 2025 17:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250203] BUILD REGRESSION
 c8a61127eedf61fcbf8d3f34301d29a782b9eeb0
Message-ID: <202502071758.EJe3fFDb-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250203
branch HEAD: c8a61127eedf61fcbf8d3f34301d29a782b9eeb0  net/mlx5: Avoid a couple hundred -Wflex-array-member-not-at-end warnings

Error/Warning (recently discovered and may have been fixed):

    https://lore.kernel.org/oe-kbuild-all/202502070233.NyU0027S-lkp@intel.com
    https://lore.kernel.org/oe-kbuild-all/202502070257.jcD8sqxT-lkp@intel.com

    drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:71:10: error: offsetof of incomplete type 'struct mlx5_ifc_menu_resource_dump_response_bits'
    drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:72:36: error: incomplete definition of type 'struct mlx5_ifc_resource_dump_menu_segment_bits'
    drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:72:36: error: offsetof of incomplete type 'struct mlx5_ifc_resource_dump_menu_segment_bits'
    drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:74:10: error: invalid application of 'sizeof' to an incomplete type 'struct mlx5_ifc_resource_dump_command_segment_bits'
    drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:74:10: error: invalid application of 'sizeof' to an incomplete type 'struct mlx5_ifc_resource_dump_info_segment_bits'
    drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:74:10: error: invalid application of 'sizeof' to an incomplete type 'struct mlx5_ifc_resource_dump_menu_segment_bits'
    include/linux/mlx5/device.h:51:57: error: invalid use of undefined type 'struct mlx5_ifc_resource_dump_menu_segment_bits'
    include/linux/mlx5/device.h:65:39: error: invalid application of 'sizeof' to incomplete type 'struct mlx5_ifc_resource_dump_command_segment_bits'
    include/linux/mlx5/device.h:65:39: error: invalid application of 'sizeof' to incomplete type 'struct mlx5_ifc_resource_dump_info_segment_bits'
    include/linux/mlx5/device.h:65:39: error: invalid application of 'sizeof' to incomplete type 'struct mlx5_ifc_resource_dump_menu_segment_bits'
    include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct mlx5_ifc_menu_resource_dump_response_bits'
    include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct mlx5_ifc_resource_dump_menu_segment_bits'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- arc-allmodconfig
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_menu_resource_dump_response_bits
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|-- arc-allyesconfig
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_menu_resource_dump_response_bits
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|-- arm-allmodconfig
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_menu_resource_dump_response_bits
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|-- arm-allyesconfig
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_menu_resource_dump_response_bits
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|-- arm64-allmodconfig
|   |-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:incomplete-definition-of-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:invalid-application-of-sizeof-to-an-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
|   |-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:invalid-application-of-sizeof-to-an-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
|   |-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:invalid-application-of-sizeof-to-an-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:offsetof-of-incomplete-type-struct-mlx5_ifc_menu_resource_dump_response_bits
|   `-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:offsetof-of-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|-- loongarch-allmodconfig
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_menu_resource_dump_response_bits
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|-- loongarch-allyesconfig
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_menu_resource_dump_response_bits
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|-- mips-allyesconfig
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_menu_resource_dump_response_bits
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|-- openrisc-allyesconfig
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_menu_resource_dump_response_bits
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|-- parisc-allmodconfig
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_menu_resource_dump_response_bits
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|-- parisc-allyesconfig
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_menu_resource_dump_response_bits
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|-- powerpc-allmodconfig
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_menu_resource_dump_response_bits
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|-- powerpc-allyesconfig
|   |-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:incomplete-definition-of-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:invalid-application-of-sizeof-to-an-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
|   |-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:invalid-application-of-sizeof-to-an-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
|   |-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:invalid-application-of-sizeof-to-an-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:offsetof-of-incomplete-type-struct-mlx5_ifc_menu_resource_dump_response_bits
|   `-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:offsetof-of-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|-- s390-allyesconfig
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-mlx5-device.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_menu_resource_dump_response_bits
|   `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|-- x86_64-allyesconfig
|   |-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:incomplete-definition-of-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:invalid-application-of-sizeof-to-an-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
|   |-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:invalid-application-of-sizeof-to-an-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
|   |-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:invalid-application-of-sizeof-to-an-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
|   |-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:offsetof-of-incomplete-type-struct-mlx5_ifc_menu_resource_dump_response_bits
|   `-- drivers-net-ethernet-mellanox-mlx5-core-diag-rsc_dump.c:error:offsetof-of-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
`-- xtensa-allyesconfig
    |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_command_segment_bits
    |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_info_segment_bits
    |-- include-linux-mlx5-device.h:error:invalid-application-of-sizeof-to-incomplete-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
    |-- include-linux-mlx5-device.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits
    |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_menu_resource_dump_response_bits
    `-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-mlx5_ifc_resource_dump_menu_segment_bits

elapsed time: 1454m

configs tested: 105
configs skipped: 2

tested configs:
alpha                             allnoconfig    gcc-14.2.0
alpha                            allyesconfig    gcc-14.2.0
arc                              allmodconfig    gcc-13.2.0
arc                               allnoconfig    gcc-13.2.0
arc                              allyesconfig    gcc-13.2.0
arc                   randconfig-001-20250206    gcc-13.2.0
arc                   randconfig-002-20250206    gcc-13.2.0
arm                              alldefconfig    gcc-14.2.0
arm                              allmodconfig    gcc-14.2.0
arm                               allnoconfig    clang-17
arm                              allyesconfig    gcc-14.2.0
arm                         mv78xx0_defconfig    clang-21
arm                       netwinder_defconfig    gcc-14.2.0
arm                   randconfig-001-20250206    clang-21
arm                   randconfig-002-20250206    clang-19
arm                   randconfig-003-20250206    clang-21
arm                   randconfig-004-20250206    gcc-14.2.0
arm64                            allmodconfig    clang-18
arm64                             allnoconfig    gcc-14.2.0
arm64                 randconfig-001-20250206    clang-21
arm64                 randconfig-002-20250206    clang-21
arm64                 randconfig-003-20250206    clang-15
arm64                 randconfig-004-20250206    gcc-14.2.0
csky                              allnoconfig    gcc-14.2.0
csky                  randconfig-001-20250206    gcc-14.2.0
csky                  randconfig-002-20250206    gcc-14.2.0
hexagon                          allmodconfig    clang-21
hexagon                           allnoconfig    clang-21
hexagon                          allyesconfig    clang-18
hexagon               randconfig-001-20250206    clang-21
hexagon               randconfig-002-20250206    clang-18
i386                             allmodconfig    gcc-12
i386                              allnoconfig    gcc-12
i386                             allyesconfig    gcc-12
i386        buildonly-randconfig-001-20250206    clang-19
i386        buildonly-randconfig-002-20250206    gcc-12
i386        buildonly-randconfig-003-20250206    clang-19
i386        buildonly-randconfig-004-20250206    clang-19
i386        buildonly-randconfig-005-20250206    clang-19
i386        buildonly-randconfig-006-20250206    gcc-12
i386                                defconfig    clang-19
loongarch                        allmodconfig    gcc-14.2.0
loongarch                         allnoconfig    gcc-14.2.0
loongarch             randconfig-001-20250206    gcc-14.2.0
loongarch             randconfig-002-20250206    gcc-14.2.0
m68k                             allmodconfig    gcc-14.2.0
m68k                              allnoconfig    gcc-14.2.0
m68k                             allyesconfig    gcc-14.2.0
m68k                          hp300_defconfig    gcc-14.2.0
microblaze                        allnoconfig    gcc-14.2.0
mips                              allnoconfig    gcc-14.2.0
mips                          ath79_defconfig    gcc-14.2.0
nios2                             allnoconfig    gcc-14.2.0
nios2                 randconfig-001-20250206    gcc-14.2.0
nios2                 randconfig-002-20250206    gcc-14.2.0
openrisc                         allyesconfig    gcc-14.2.0
parisc                           allmodconfig    gcc-14.2.0
parisc                           allyesconfig    gcc-14.2.0
parisc                randconfig-001-20250206    gcc-14.2.0
parisc                randconfig-002-20250206    gcc-14.2.0
powerpc                          allmodconfig    gcc-14.2.0
powerpc                          allyesconfig    clang-16
powerpc               randconfig-001-20250206    clang-21
powerpc               randconfig-002-20250206    clang-19
powerpc               randconfig-003-20250206    clang-21
powerpc64             randconfig-001-20250206    clang-15
powerpc64             randconfig-002-20250206    clang-17
powerpc64             randconfig-003-20250206    clang-19
riscv                 randconfig-001-20250206    clang-19
riscv                 randconfig-002-20250206    clang-17
s390                             allmodconfig    clang-19
s390                             allyesconfig    gcc-14.2.0
s390                  randconfig-001-20250206    clang-21
s390                  randconfig-002-20250206    gcc-14.2.0
sh                               allmodconfig    gcc-14.2.0
sh                                allnoconfig    gcc-14.2.0
sh                               allyesconfig    gcc-14.2.0
sh                    randconfig-001-20250206    gcc-14.2.0
sh                    randconfig-002-20250206    gcc-14.2.0
sh                          rsk7264_defconfig    gcc-14.2.0
sh                     sh7710voipgw_defconfig    gcc-14.2.0
sparc                            allmodconfig    gcc-14.2.0
sparc                             allnoconfig    gcc-14.2.0
sparc                 randconfig-001-20250206    gcc-14.2.0
sparc                 randconfig-002-20250206    gcc-14.2.0
sparc                       sparc32_defconfig    gcc-14.2.0
sparc64               randconfig-001-20250206    gcc-14.2.0
sparc64               randconfig-002-20250206    gcc-14.2.0
um                               allmodconfig    clang-21
um                               allyesconfig    gcc-12
um                    randconfig-001-20250206    clang-15
um                    randconfig-002-20250206    gcc-12
x86_64                           alldefconfig    gcc-12
x86_64                            allnoconfig    clang-19
x86_64                           allyesconfig    clang-19
x86_64      buildonly-randconfig-001-20250206    clang-19
x86_64      buildonly-randconfig-002-20250206    clang-19
x86_64      buildonly-randconfig-003-20250206    clang-19
x86_64      buildonly-randconfig-004-20250206    clang-19
x86_64      buildonly-randconfig-005-20250206    clang-19
x86_64      buildonly-randconfig-006-20250206    gcc-12
x86_64                              defconfig    gcc-11
xtensa                            allnoconfig    gcc-14.2.0
xtensa                randconfig-001-20250206    gcc-14.2.0
xtensa                randconfig-002-20250206    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
