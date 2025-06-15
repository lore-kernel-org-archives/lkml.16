Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7624C2E11CF
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 04:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749962476; cv=none; b=Ofn9JpGrt9gPRz92Dq0xGBGHMRn50tTNr/ArVvWoYL24Rb/evmjN5sDiuicjEF7yPLc1DCBYwnDWWwdtexCpRqWD4+qMWf6c5+cpXOQZP50qes/0xfojEF12ETdja9aLXu2/xlRLA4EI56j+nnhnntkzndp7p9tRj2eEvhKFxIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749962476; c=relaxed/simple;
	bh=uAJ4QgkwFFGOKo6ABM/6pQ8iv1h3bR2Ci7AlGNWib/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUU3tiDQM73NO6m+JB2Q4vfqCv9aydLcT18zP7Iw6Fxdpno4Y58xZzq/0VXuOwjdn2xvmzmyM4F2KKsi0oyVxTaPwbhraFQDIYY2rNdDpSvA3xxiec5+xiKiDgNkcuCept8H/zswnm3NK38dTL/2oaGPNhs44y6yx0O+wKAFTU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hV/dBsQf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hV/dBsQf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749962475; x=1781498475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uAJ4QgkwFFGOKo6ABM/6pQ8iv1h3bR2Ci7AlGNWib/0=;
  b=hV/dBsQfZhbWm1fqmfgK2D/ge11Yx0qmawhrO3LPy6SFozvufvGV+jB1
   AGsj90uvf0Aa4xXwshY9ppPKivzjVVvZNg2ZcGsu5FEpr7J3D0TjO7fpd
   XLS8G/g8VzJxgFtJE27UVRPguuibWRyftbg0vhpObIvDXLg8f8webxing
   wYxsZY6OgZY5nFHdbIcMOEEd6sQvWyImRauTuKDtf0oHdv5CjMUUdppGs
   MgEokowSfoefzShoAA7x/9C8YaKH4xHD4d24ydKVWUYb0Brcn/SMulv1z
   uWI3CnWbsUTnYvtEi1sBWNyAhIaKrE9xe2Qjs3dZkcdYtPGw2cjH2W3s6
   g==;
X-CSE-ConnectionGUID: FbaeSMZVTG6JBM5EWZzWlA==
X-CSE-MsgGUID: A7Arl8qUQFmy6nJyMdxjrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52005030"
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="52005030"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 21:41:14 -0700
X-CSE-ConnectionGUID: m8XS1YMMTY+Af9smRSozMQ==
X-CSE-MsgGUID: HxQRaCY5RtueyQJLMJ5LMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="148029888"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Jun 2025 21:41:12 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQfB8-000E7Y-02;
	Sun, 15 Jun 2025 04:41:10 +0000
Date: Sun, 15 Jun 2025 12:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	linux1394-devel@lists.sourceforge.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] firewire: core: allocate workqueue for AR/AT
 request/response contexts
Message-ID: <202506151242.vncWEzlc-lkp@intel.com>
References: <20250614113449.388758-2-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614113449.388758-2-o-takashi@sakamocchi.jp>

Hi Takashi,

kernel test robot noticed the following build errors:

[auto build test ERROR on ieee1394-linux1394/for-next]
[also build test ERROR on linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Sakamoto/firewire-core-allocate-workqueue-for-AR-AT-request-response-contexts/20250614-194424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git for-next
patch link:    https://lore.kernel.org/r/20250614113449.388758-2-o-takashi%40sakamocchi.jp
patch subject: [PATCH 1/3] firewire: core: allocate workqueue for AR/AT request/response contexts
config: x86_64-buildonly-randconfig-004-20250615 (https://download.01.org/0day-ci/archive/20250615/202506151242.vncWEzlc-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506151242.vncWEzlc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506151242.vncWEzlc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firewire/core-card.c:611:3: error: cannot jump from this goto statement to its label
     611 |                 goto err_isoc;
         |                 ^
   drivers/firewire/core-card.c:618:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     618 |         guard(mutex)(&card_mutex);
         |         ^
   include/linux/cleanup.h:338:15: note: expanded from macro 'guard'
     338 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:71:1: note: expanded from here
      71 | __UNIQUE_ID_guard795
         | ^
   1 error generated.


vim +611 drivers/firewire/core-card.c

   573	
   574	int fw_card_add(struct fw_card *card, u32 max_receive, u32 link_speed, u64 guid,
   575			unsigned int supported_isoc_contexts)
   576	{
   577		int ret;
   578	
   579		// This workqueue should be:
   580		//  * != WQ_BH			Sleepable.
   581		//  * == WQ_UNBOUND		Any core can process data for isoc context. The
   582		//				implementation of unit protocol could consumes the core
   583		//				longer somehow.
   584		//  * != WQ_MEM_RECLAIM		Not used for any backend of block device.
   585		//  * == WQ_FREEZABLE		Isochronous communication is at regular interval in real
   586		//				time, thus should be drained if possible at freeze phase.
   587		//  * == WQ_HIGHPRI		High priority to process semi-realtime timestamped data.
   588		//  * == WQ_SYSFS		Parameters are available via sysfs.
   589		//  * max_active == n_it + n_ir	A hardIRQ could notify events for multiple isochronous
   590		//				contexts if they are scheduled to the same cycle.
   591		card->isoc_wq = alloc_workqueue("firewire-isoc-card%u",
   592						WQ_UNBOUND | WQ_FREEZABLE | WQ_HIGHPRI | WQ_SYSFS,
   593						supported_isoc_contexts, card->index);
   594		if (!card->isoc_wq)
   595			return -ENOMEM;
   596	
   597		// This workqueue should be:
   598		//  * != WQ_BH			Sleepable.
   599		//  * == WQ_UNBOUND		Any core can process data for asynchronous context.
   600		//  * == WQ_MEM_RECLAIM		Used for any backend of block device.
   601		//  * == WQ_FREEZABLE		The target device would not be available when being freezed.
   602		//  * == WQ_HIGHPRI		High priority to process semi-realtime timestamped data.
   603		//  * == WQ_SYSFS		Parameters are available via sysfs.
   604		//  * max_active == 4		A hardIRQ could notify events for a pair of requests and
   605		//				response AR/AT contexts.
   606		card->async_wq = alloc_workqueue("firewire-async-card%u",
   607						 WQ_UNBOUND | WQ_MEM_RECLAIM | WQ_FREEZABLE | WQ_HIGHPRI | WQ_SYSFS,
   608						 4, card->index);
   609		if (!card->async_wq) {
   610			ret = -ENOMEM;
 > 611			goto err_isoc;
   612		}
   613	
   614		card->max_receive = max_receive;
   615		card->link_speed = link_speed;
   616		card->guid = guid;
   617	
   618		guard(mutex)(&card_mutex);
   619	
   620		generate_config_rom(card, tmp_config_rom);
   621		ret = card->driver->enable(card, tmp_config_rom, config_rom_length);
   622		if (ret < 0)
   623			goto err_async;
   624	
   625		list_add_tail(&card->link, &card_list);
   626	
   627		return 0;
   628	err_async:
   629		destroy_workqueue(card->async_wq);
   630	err_isoc:
   631		destroy_workqueue(card->isoc_wq);
   632		return ret;
   633	}
   634	EXPORT_SYMBOL(fw_card_add);
   635	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
