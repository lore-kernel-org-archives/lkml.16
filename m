Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892221B6556
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236467; cv=none; b=icV78ir5iMsFcY/sxfR3vXNd0aoWj+Aw4QT2yzHFc++KByCnspQRmYKo7lwBw9lEj5qXYW1C9MjoPUFHN9vO+6WhTNb7AtKnL+2XDWTCixbCQMbZgVI/OYLDo907uLwmlSub9UpoobfYe/fWId2PoNpSWD85vIJUcvGItbynybE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236467; c=relaxed/simple;
	bh=O/vQ2euWN4DCd8CTZw87lWzwQaYAUMvWVWcukkW4a+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYxFYg3X/B6cnzGj31SIMbCc11Nq3HBNKpduXvUTKWOrDlz98yZ80+vCKVrIjogFv+gdYN8NGEg+7wIryVtHH2wQaC2V+zUne41sKgHAkQHvqHBrSKwUYmRzvMu46dwyE6rVW8DocngQBgOSha1gIbucj7q27mn+VMLdT16acyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KnCvuQqJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KnCvuQqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747236466; x=1778772466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O/vQ2euWN4DCd8CTZw87lWzwQaYAUMvWVWcukkW4a+E=;
  b=KnCvuQqJlp3zBorXELPytH2i/kA5fZ+vwd/3Pz2nvT3BLJUy4VaFsgtx
   ZKTChnMJqEv3RAL/puNzpNl/H5rZAbFEeOlWy/oVh5DbOTTBG62rTQ5ee
   cg2uWyGtxY6qSuZt1SV57Doam30iTkqw2hM4PGM0w4SZatli1BhBxyao/
   M6I4CUh9lUwovQgRqhFmj+1EkPXk/rACbcfpwlErPIkB+my4Q6zLVu32J
   McOtkXnhf3jUxTkn8I5lp3GsjdI39Bq4+iQm0nodEHmZvZGaFlI90zBwa
   7p238sOi7fV7u4LuoClzsKNMFHq5NBZ4SehJMPVPZvOnxFo8vAnDrEn/K
   A==;
X-CSE-ConnectionGUID: Gfda8nM2S8uBWJ5uwYntmg==
X-CSE-MsgGUID: xnNOmtHURi27eTAESejKaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49011860"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49011860"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 08:27:43 -0700
X-CSE-ConnectionGUID: t+PQ/0+kQqW7Kcr9S3CwCg==
X-CSE-MsgGUID: a3wI3M/WQymOaletw6Fepg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="138597889"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2025 08:27:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFE1C-000HHB-0d;
	Wed, 14 May 2025 15:27:38 +0000
Date: Wed, 14 May 2025 23:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: Raag Jadav <raag.jadav@intel.com>, gregkh@linuxfoundation.org,
	david.m.ertman@intel.com, ira.weiny@intel.com, lee@kernel.org,
	andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
	heikki.krogerus@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v5 1/2] driver core: auxiliary bus: Introduce auxiliary
 device resource management
Message-ID: <202505142347.7wqzaBvR-lkp@intel.com>
References: <20250514122432.4019606-2-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514122432.4019606-2-raag.jadav@intel.com>

Hi Raag,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus staging/staging-testing staging/staging-next staging/staging-linus linus/master v6.15-rc6 next-20250514]
[cannot apply to lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raag-Jadav/driver-core-auxiliary-bus-Introduce-auxiliary-device-resource-management/20250514-202748
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20250514122432.4019606-2-raag.jadav%40intel.com
patch subject: [PATCH v5 1/2] driver core: auxiliary bus: Introduce auxiliary device resource management
config: arm-randconfig-003-20250514 (https://download.01.org/0day-ci/archive/20250514/202505142347.7wqzaBvR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505142347.7wqzaBvR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142347.7wqzaBvR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/bridge/ti-sn65dsi86.c:8:0:
   include/linux/auxiliary_bus.h: In function 'auxiliary_device_uninit':
   include/linux/auxiliary_bus.h:246:3: error: implicit declaration of function 'kfree'; did you mean '__free'? [-Werror=implicit-function-declaration]
      kfree(auxdev->resource);
      ^~~~~
      __free
   In file included from arch/arm/include/asm/pgtable-nommu.h:13:0,
                    from arch/arm/include/asm/pgtable.h:25,
                    from arch/arm/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:34,
                    from include/linux/debugfs.h:15,
                    from drivers/gpu/drm/bridge/ti-sn65dsi86.c:12:
   include/linux/slab.h: At top level:
>> include/linux/slab.h:472:6: warning: conflicting types for 'kfree'
    void kfree(const void *objp);
         ^~~~~
   In file included from drivers/gpu/drm/bridge/ti-sn65dsi86.c:8:0:
   include/linux/auxiliary_bus.h:246:3: note: previous implicit declaration of 'kfree' was here
      kfree(auxdev->resource);
      ^~~~~
   cc1: some warnings being treated as errors


vim +/kfree +472 include/linux/slab.h

7bd230a26648ac Suren Baghdasaryan 2024-03-21  471  
72d67229f522e3 Kees Cook          2021-11-05 @472  void kfree(const void *objp);
72d67229f522e3 Kees Cook          2021-11-05  473  void kfree_sensitive(const void *objp);
72d67229f522e3 Kees Cook          2021-11-05  474  size_t __ksize(const void *objp);
05a940656e1eb2 Kees Cook          2022-09-23  475  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
