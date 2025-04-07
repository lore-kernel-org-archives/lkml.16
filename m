Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6DD224FD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025615; cv=none; b=UH9R3KWx5lhO0B0ZfL4TON340v3ND6NeLw7snOLyiA8En1HlJXAsGznvRWNG33PnSPo77m4EF8Nz9taZZXYDVHxjlgXKAbfnlBO9FES/f4bD/rXpun4mSy+4EFlwJHYsSdnYAfPB8SIw4fzxz7zcsHkz4JUGGdsG9B0M8Y4gwXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025615; c=relaxed/simple;
	bh=Q1eMsGD77kqSuzN8Pl36F2hS9uVTPWcv09IiLoIqkAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRbW9lMo/HTSaYaLKiAmwc6lt1C/8uJMSya+dJneWwRxIa6TmDQ2qzRojRy/tZqUKJR43Lqh/KjHvNf2Sf5yRz2ZBPeBOq+a100MFMJ54sltpmqKMrbUgOXC1132ZEncGjXZri4duaDtrjdTRj12ttck134ud9W85ppGSsb1iTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HmAZReJw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HmAZReJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744025614; x=1775561614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q1eMsGD77kqSuzN8Pl36F2hS9uVTPWcv09IiLoIqkAE=;
  b=HmAZReJwuUeik0OSWxezIdOxamZjYTJeYFb6jDLlg6qaMWrgxwQx/mWM
   DHtY2y4HeA0TCtuH8Tvd+LScemjR+d3OYTlI+EoXiMHZwCJlwf8rKksH7
   sHLmkVvrZgvy0NUaNdoAnoZ0sJX1HvTVJ9nIaCD02TKemjmNv5tnU9Hn0
   gpaftkw+esN7heEifTstJbneKgPW2XaxM+jTMOaJ7DveK/5JMssxzZREk
   TEaO+dRpWKh+7jar5XY6o7Zt8lc+QO75EmKKgW5VQ8Rk/7NBobVW8YLs+
   cgO6i6ljXuSzgSfbmUAVpnGALrTfAgbMa+przOfWeVYvXU/4XCU5GxSWh
   Q==;
X-CSE-ConnectionGUID: gQ8i+l/TQjC+T+uEa0JiQQ==
X-CSE-MsgGUID: tW8fGQ8dS0yfOcj++GEtag==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45296089"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45296089"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 04:33:33 -0700
X-CSE-ConnectionGUID: 9oTHmomUTcStGqEGwEdmdg==
X-CSE-MsgGUID: CmnV3hNEQcK7kLRdDpBDUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127683970"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Apr 2025 04:33:28 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1kjF-0003M3-0O;
	Mon, 07 Apr 2025 11:33:25 +0000
Date: Mon, 7 Apr 2025 19:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, gregkh@linuxfoundation.org,
	david.m.ertman@intel.com, ira.weiny@intel.com, lee@kernel.org,
	andriy.shevchenko@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v2] mfd: core: Support auxiliary device
Message-ID: <202504071910.eL0mjen2-lkp@intel.com>
References: <20250407074614.1665575-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407074614.1665575-1-raag.jadav@intel.com>

Hi Raag,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on lee-mfd/for-mfd-fixes linus/master v6.15-rc1 next-20250407]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/mfd-core-Support-auxiliary-device/20250407-154807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250407074614.1665575-1-raag.jadav%40intel.com
patch subject: [PATCH v2] mfd: core: Support auxiliary device
config: arm-socfpga_defconfig (https://download.01.org/0day-ci/archive/20250407/202504071910.eL0mjen2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504071910.eL0mjen2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504071910.eL0mjen2-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/mfd/mfd-core.o: in function `mfd_add_auxiliary_device':
>> drivers/mfd/mfd-core.c:209:(.text+0x360): undefined reference to `auxiliary_device_init'
>> arm-linux-gnueabi-ld: drivers/mfd/mfd-core.c:213:(.text+0x3d0): undefined reference to `__auxiliary_device_add'


vim +209 drivers/mfd/mfd-core.c

   156	
   157	static int mfd_add_auxiliary_device(struct device *parent, int id, const struct mfd_cell *cell,
   158					    struct resource *mem_base, int irq_base,
   159					    struct irq_domain *domain)
   160	{
   161		struct mfd_aux_device *mfd_aux;
   162		struct auxiliary_device *auxdev;
   163		int r, ret;
   164	
   165		mfd_aux = kzalloc(sizeof(*mfd_aux), GFP_KERNEL);
   166		if (!mfd_aux)
   167			return -ENOMEM;
   168	
   169		for (r = 0; r < cell->num_resources; r++) {
   170			/* Find out base to use */
   171			if ((cell->resources[r].flags & IORESOURCE_MEM) && mem_base) {
   172				mfd_aux->mem.name = cell->resources[r].name;
   173				mfd_aux->mem.flags = cell->resources[r].flags;
   174	
   175				mfd_aux->mem.parent = mem_base;
   176				mfd_aux->mem.start = mem_base->start + cell->resources[r].start;
   177				mfd_aux->mem.end = mem_base->start + cell->resources[r].end;
   178			} else if (cell->resources[r].flags & IORESOURCE_IRQ) {
   179				mfd_aux->irq.name = cell->resources[r].name;
   180				mfd_aux->irq.flags = cell->resources[r].flags;
   181	
   182				if (domain) {
   183					/* Unable to create mappings for IRQ ranges */
   184					WARN_ON(cell->resources[r].start != cell->resources[r].end);
   185					mfd_aux->irq.start = mfd_aux->irq.end = irq_create_mapping(
   186							domain, cell->resources[r].start);
   187				} else {
   188					mfd_aux->irq.start = irq_base + cell->resources[r].start;
   189					mfd_aux->irq.end = irq_base + cell->resources[r].end;
   190				}
   191			} else {
   192				mfd_aux->ext.name = cell->resources[r].name;
   193				mfd_aux->ext.flags = cell->resources[r].flags;
   194				mfd_aux->ext.parent = cell->resources[r].parent;
   195				mfd_aux->ext.start = cell->resources[r].start;
   196				mfd_aux->ext.end = cell->resources[r].end;
   197			}
   198		}
   199	
   200		auxdev = &mfd_aux->auxdev;
   201		auxdev->name = cell->name;
   202		/* Use parent id for discoverable devices */
   203		auxdev->id = dev_is_pci(parent) ? pci_dev_id(to_pci_dev(parent)) : cell->id;
   204	
   205		auxdev->dev.parent = parent;
   206		auxdev->dev.type = &mfd_dev_type[MFD_AUX_DEV];
   207		auxdev->dev.release = mfd_release_auxiliary_device;
   208	
 > 209		ret = auxiliary_device_init(auxdev);
   210		if (ret)
   211			goto fail_aux_init;
   212	
 > 213		ret = __auxiliary_device_add(auxdev, parent->driver->name);
   214		if (ret)
   215			goto fail_aux_add;
   216	
   217		return 0;
   218	
   219	fail_aux_add:
   220		/* auxdev will be freed with the put_device() and .release sequence */
   221		auxiliary_device_uninit(auxdev);
   222	fail_aux_init:
   223		kfree(mfd_aux);
   224		return ret;
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
