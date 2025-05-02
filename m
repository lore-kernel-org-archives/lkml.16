Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1376D22A7ED
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746174911; cv=none; b=LMSyOyA8izncjbTbLe7BTnSsawu1XGDrgoiqIfNou/rScqQnw95PDvS8mDMpI3DI4jitqBXO2C5zAADGVRocyLQn71Pi3ep2UWZD9IMwPvnws66XDd4WfpgWLeBLNdBEr3fTwIjViHoAuANaavaIS98wmzPXMHD0WBbmdGZICGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746174911; c=relaxed/simple;
	bh=WgaG5HEwDg1hR1FxgLdW1ysgzjnL/9WPjU9+4FX24jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frTdmAryKS0CaaQ419DjzyGI+P1WryQtDT1of8AVtf2LBnaFSo8c3xCB+Chkq89t9mbl052uvehKIb2M06ruiZck8HZqmFHDDvCrI32uXGSKJN4GqGzdu7ciWMMbk28EOxfBMa2OHDy9dK/hd9Ruig6f/CEvSYEsxFDSoewcMEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gaLd6RGh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gaLd6RGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746174909; x=1777710909;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WgaG5HEwDg1hR1FxgLdW1ysgzjnL/9WPjU9+4FX24jU=;
  b=gaLd6RGhRrRwu9D4gg1aqcJc7AhBtDDbALvHIUzACrfvUezVhhLl5Gvr
   s60fVjBO8W6KqBWG6wWfLIlMElMEseoqjWnKU0i/GIcyd2elK3xr9QhUy
   kW68YmXQ8cS20i1o+1CxFOjzuP4qQyNWGDmXq5AAvGzb6xPcTCNJf4XjT
   oew5y6iml+T/RxZRs5GwfNblihrQdRFXTAsfnN380PVzAPVWXGlBo97ia
   anNq4NKy/KDo8yeTBdSWvhqbV4Rw/8/Rau0bh9naCOveSkZ+7I9T3CBfS
   0xIwGCQJ+JABIiE3yDE/Iq4cwbr+zwU8ayUNV4t+SfK+JsJw6AAFqwCpl
   g==;
X-CSE-ConnectionGUID: tDgXGzVVTeyPUzHaRFPNtQ==
X-CSE-MsgGUID: gqa8IawbSMaTefI2RM0H6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58480220"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58480220"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 01:35:08 -0700
X-CSE-ConnectionGUID: 4WcVytTxSVKEgFb+l1ugkw==
X-CSE-MsgGUID: uCwUYYhITauOkBxWL2hN1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="165511540"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 May 2025 01:34:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAlr7-0004cj-0U;
	Fri, 02 May 2025 08:34:49 +0000
Date: Fri, 2 May 2025 16:33:58 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>, dpenkler@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: Re: [PATCH 2/8] Staging: gpib: Updated return type
 `request_system_control`
Message-ID: <202505021518.8HGGOavD-lkp@intel.com>
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
config: arm64-randconfig-003-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021518.8HGGOavD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021518.8HGGOavD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505021518.8HGGOavD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/gpib/eastwood/fluke_gpib.c:710:28: error: initialization of 'int (*)(struct gpib_board *, int)' from incompatible pointer type 'void (*)(struct gpib_board *, int)' [-Werror=incompatible-pointer-types]
     .request_system_control = fluke_request_system_control,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/eastwood/fluke_gpib.c:710:28: note: (near initialization for 'fluke_unaccel_interface.request_system_control')
   drivers/staging/gpib/eastwood/fluke_gpib.c:745:28: error: initialization of 'int (*)(struct gpib_board *, int)' from incompatible pointer type 'void (*)(struct gpib_board *, int)' [-Werror=incompatible-pointer-types]
     .request_system_control = fluke_request_system_control,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/eastwood/fluke_gpib.c:745:28: note: (near initialization for 'fluke_hybrid_interface.request_system_control')
   drivers/staging/gpib/eastwood/fluke_gpib.c:772:28: error: initialization of 'int (*)(struct gpib_board *, int)' from incompatible pointer type 'void (*)(struct gpib_board *, int)' [-Werror=incompatible-pointer-types]
     .request_system_control = fluke_request_system_control,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/eastwood/fluke_gpib.c:772:28: note: (near initialization for 'fluke_interface.request_system_control')
   cc1: some warnings being treated as errors
--
>> drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1023:28: error: initialization of 'int (*)(struct gpib_board *, int)' from incompatible pointer type 'void (*)(struct gpib_board *, int)' [-Werror=incompatible-pointer-types]
     .request_system_control = fmh_gpib_request_system_control,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1023:28: note: (near initialization for 'fmh_gpib_unaccel_interface.request_system_control')
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1051:28: error: initialization of 'int (*)(struct gpib_board *, int)' from incompatible pointer type 'void (*)(struct gpib_board *, int)' [-Werror=incompatible-pointer-types]
     .request_system_control = fmh_gpib_request_system_control,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1051:28: note: (near initialization for 'fmh_gpib_interface.request_system_control')
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1079:28: error: initialization of 'int (*)(struct gpib_board *, int)' from incompatible pointer type 'void (*)(struct gpib_board *, int)' [-Werror=incompatible-pointer-types]
     .request_system_control = fmh_gpib_request_system_control,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1079:28: note: (near initialization for 'fmh_gpib_pci_interface.request_system_control')
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1107:28: error: initialization of 'int (*)(struct gpib_board *, int)' from incompatible pointer type 'void (*)(struct gpib_board *, int)' [-Werror=incompatible-pointer-types]
     .request_system_control = fmh_gpib_request_system_control,
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1107:28: note: (near initialization for 'fmh_gpib_pci_unaccel_interface.request_system_control')
   cc1: some warnings being treated as errors


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
