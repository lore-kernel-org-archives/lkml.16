Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008E822D7AD
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746178007; cv=none; b=VSqvaZD9oRubxnzJks22SPHeyJqgI4CgfBxyohABTSkX5RYLoVO7za5woFNu1qlkKTOneVMoAn7Iibk/v6PX/NYOnFjb72ZmzelXyYvIUfhe9VccXeSCVxhEENxoUr31PcxAZtxwIrL3a55j1I4gaDVGpyFAKzfLzR6wEKIN1p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746178007; c=relaxed/simple;
	bh=6FdHTRx1UiloRdlH6bvvRzKQC8CVFYEozsMwMjInFUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dkw/PflHe7r+6BWPau6i9GMjcR0XBErKPBeTJFgT88OBCaxoLB9jLTzF9PVJSVgjYjT/NL2M5bbMBGRRtz/dFt6+hk4ZTJg+XKAOQ9Gwwolm8dXMw6rNvTeLY66ZXP77MSfHJtsG0wcVzTz9n7IBOWfVOGZWd4irLxVLTGw0RLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CETLTLKZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CETLTLKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746178006; x=1777714006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6FdHTRx1UiloRdlH6bvvRzKQC8CVFYEozsMwMjInFUk=;
  b=CETLTLKZ6TSuxaUMnbqpqpv7ygnCelN3h2hdYggfzqBflDEYyQslKvMo
   Rtaxb0tUnka7gXLcjwTkSg1uSVJ+clZkouHDJ72qgHPcOGCiNeodDRcmn
   naPYn6DIDvbE04WghyCHcp8MqCuEm12EyOEAbI1bySTR5X6L78+olc9/R
   eN6V7LnSLH64/GmPQ3Dc8PCaT/P/JicFcNpRewERoUVHepOfCJfaa1sAZ
   NZhj6tDwOWjXGy9p5hJJ1niWqY/HQKvpr6H+xON6wfr/6mk2CrHXJIEFk
   mXNQKQDBiY1+uGxGpnG+FvhtTARkDCak+Y8nHV4qWZmFAHFvMT7G4xzhQ
   Q==;
X-CSE-ConnectionGUID: nTwuFp2oSXK0Vivtjbi8Ww==
X-CSE-MsgGUID: zHsBrW00SYGigkLHn3L3yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58849703"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58849703"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 02:26:45 -0700
X-CSE-ConnectionGUID: hQ8g4joASo6VeFIcx1oIaQ==
X-CSE-MsgGUID: r77zWQUXS6yP+/2d9K9t3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="139407646"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 May 2025 02:26:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAmfJ-0004dd-0l;
	Fri, 02 May 2025 09:26:41 +0000
Date: Fri, 2 May 2025 17:25:55 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>, dpenkler@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: Re: [PATCH 2/8] Staging: gpib: Updated return type
 `request_system_control`
Message-ID: <202505021632.3PmPalr1-lkp@intel.com>
References: <28632a0bf5275553e929e8699830377069e921fa.1746133676.git.thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28632a0bf5275553e929e8699830377069e921fa.1746133676.git.thomas.andreatta2000@gmail.com>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-linus]
[also build test ERROR on linus/master v6.15-rc4]
[cannot apply to staging/staging-testing staging/staging-next next-20250501]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Andreatta/Staging-gpib-agilent_82357a-changing-return-type-void-in-int/20250502-053306
base:   staging/staging-linus
patch link:    https://lore.kernel.org/r/28632a0bf5275553e929e8699830377069e921fa.1746133676.git.thomas.andreatta2000%40gmail.com
patch subject: [PATCH 2/8] Staging: gpib: Updated return type `request_system_control`
config: arm-randconfig-004-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021632.3PmPalr1-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021632.3PmPalr1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021632.3PmPalr1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/gpib/eastwood/fluke_gpib.c:710:28: error: incompatible function pointer types initializing 'int (*)(struct gpib_board *, int)' with an expression of type 'void (struct gpib_board *, int)' [-Wincompatible-function-pointer-types]
     710 |         .request_system_control = fluke_request_system_control,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/eastwood/fluke_gpib.c:745:28: error: incompatible function pointer types initializing 'int (*)(struct gpib_board *, int)' with an expression of type 'void (struct gpib_board *, int)' [-Wincompatible-function-pointer-types]
     745 |         .request_system_control = fluke_request_system_control,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/eastwood/fluke_gpib.c:772:28: error: incompatible function pointer types initializing 'int (*)(struct gpib_board *, int)' with an expression of type 'void (struct gpib_board *, int)' [-Wincompatible-function-pointer-types]
     772 |         .request_system_control = fluke_request_system_control,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +710 drivers/staging/gpib/eastwood/fluke_gpib.c

55936779f49612 Dave Penkler 2024-09-18  700  
95cfc75234534b Dave Penkler 2025-01-11  701  static gpib_interface_t fluke_unaccel_interface = {
95cfc75234534b Dave Penkler 2025-01-11  702  	.name = "fluke_unaccel",
95cfc75234534b Dave Penkler 2025-01-11  703  	.attach = fluke_attach_holdoff_all,
95cfc75234534b Dave Penkler 2025-01-11  704  	.detach = fluke_detach,
95cfc75234534b Dave Penkler 2025-01-11  705  	.read = fluke_read,
95cfc75234534b Dave Penkler 2025-01-11  706  	.write = fluke_write,
95cfc75234534b Dave Penkler 2025-01-11  707  	.command = fluke_command,
95cfc75234534b Dave Penkler 2025-01-11  708  	.take_control = fluke_take_control,
95cfc75234534b Dave Penkler 2025-01-11  709  	.go_to_standby = fluke_go_to_standby,
95cfc75234534b Dave Penkler 2025-01-11 @710  	.request_system_control = fluke_request_system_control,
95cfc75234534b Dave Penkler 2025-01-11  711  	.interface_clear = fluke_interface_clear,
95cfc75234534b Dave Penkler 2025-01-11  712  	.remote_enable = fluke_remote_enable,
95cfc75234534b Dave Penkler 2025-01-11  713  	.enable_eos = fluke_enable_eos,
95cfc75234534b Dave Penkler 2025-01-11  714  	.disable_eos = fluke_disable_eos,
95cfc75234534b Dave Penkler 2025-01-11  715  	.parallel_poll = fluke_parallel_poll,
95cfc75234534b Dave Penkler 2025-01-11  716  	.parallel_poll_configure = fluke_parallel_poll_configure,
95cfc75234534b Dave Penkler 2025-01-11  717  	.parallel_poll_response = fluke_parallel_poll_response,
95cfc75234534b Dave Penkler 2025-01-11  718  	.line_status = fluke_line_status,
95cfc75234534b Dave Penkler 2025-01-11  719  	.update_status = fluke_update_status,
95cfc75234534b Dave Penkler 2025-01-11  720  	.primary_address = fluke_primary_address,
95cfc75234534b Dave Penkler 2025-01-11  721  	.secondary_address = fluke_secondary_address,
95cfc75234534b Dave Penkler 2025-01-11  722  	.serial_poll_response = fluke_serial_poll_response,
95cfc75234534b Dave Penkler 2025-01-11  723  	.serial_poll_status = fluke_serial_poll_status,
95cfc75234534b Dave Penkler 2025-01-11  724  	.t1_delay = fluke_t1_delay,
95cfc75234534b Dave Penkler 2025-01-11  725  	.return_to_local = fluke_return_to_local,
55936779f49612 Dave Penkler 2024-09-18  726  };
55936779f49612 Dave Penkler 2024-09-18  727  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
