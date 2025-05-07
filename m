Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD7520E703
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614966; cv=none; b=lj0wEx/dICTwMEU+LfWiKd6u3gEhuBgKqpLaDoKSIwWl4tSqKvPcBIYr5V8m1kTNAVMppx5SqDWwknGuQdOHxiH6EwQhldAIq/MLKWq5mJZCq5fUOoBxpr5wOGj8Fdu6LE2ZAptd94b8AlXhknlan4n1ydkJJ2pHlaRBumY5wGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614966; c=relaxed/simple;
	bh=EaQLm/18zqp2g3Ts6r0JH+BLe1TiNJ5zMltPned8co8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E17LcS1Pol0VyX31ENiMCajU9w8p2VyxqQbF9wg+P8vPZhYFEAeLcnisu0VhAjx7FM9Gks/ppjyE8DbKGuzCcXNKpMCUPNzWECS2oxPmLLtCbDmDCgyKBbJ3lhDkbgidSADCLK6tn5VpQ1Aqi6qzMIsC2y0LD73M9NvbUrZ0YZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fb5N9R7K; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fb5N9R7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746614965; x=1778150965;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EaQLm/18zqp2g3Ts6r0JH+BLe1TiNJ5zMltPned8co8=;
  b=Fb5N9R7KPcDYOL1wnX6hSR51yfgbuYQfRxLFWnaZfK2ENjcGhR8hQAUZ
   NV1skcc81/eWtNteke9g1MnxTsbKoBCUETOA3uSMk3oAsZFGQZPaJIs70
   jKdXd9U3fjVNNxAgx6B0pyIhl8IkO3u/t2od4YQdjMi3n6ADfxpWUGuq2
   vd0cIqJZV0ANw07OvHPMTKtfkMDccWH+87mhJhX4hCS9GJZVQ2pI2D7xL
   E7ikJdxhA72ju1C2YAPHKqtQX6i626YFa/DBkblNy+QQ8UIoRo4SCYYRd
   G7JuOTo5353+TXp2gfmhYO/YlhqQuhoaOW8LJVgKD9zdgGjr29Jq+bwZr
   A==;
X-CSE-ConnectionGUID: l8brNAVHRh+IwpFuBN/ogw==
X-CSE-MsgGUID: YtK8HPk4TLamsO4XEcbwNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59689741"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59689741"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:49:24 -0700
X-CSE-ConnectionGUID: oQ3XKjOGR0Snh74Td8oS/w==
X-CSE-MsgGUID: QMNFj8zyTc2FS47nqQuxuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="141043207"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 May 2025 03:49:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCcL0-0007dN-0d;
	Wed, 07 May 2025 10:49:18 +0000
Date: Wed, 7 May 2025 18:48:48 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Wagner <wagi@kernel.org>, James Smart <james.smart@broadcom.com>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Hannes Reinecke <hare@suse.de>,
	Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, Daniel Wagner <wagi@kernel.org>
Subject: Re: [PATCH v5 09/14] nvmet-fcloop: allocate/free fcloop_lsreq
 directly
Message-ID: <202505071848.zYLh3Kvb-lkp@intel.com>
References: <20250423-nvmet-fcloop-v5-9-3d7f968728a5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-nvmet-fcloop-v5-9-3d7f968728a5@kernel.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3d7aa0c7b4e96cd460826d932e44710cdeb3378b]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Wagner/nvmet-fcloop-track-ref-counts-for-nports/20250423-212643
base:   3d7aa0c7b4e96cd460826d932e44710cdeb3378b
patch link:    https://lore.kernel.org/r/20250423-nvmet-fcloop-v5-9-3d7f968728a5%40kernel.org
patch subject: [PATCH v5 09/14] nvmet-fcloop: allocate/free fcloop_lsreq directly
config: x86_64-randconfig-r131-20250426 (https://download.01.org/0day-ci/archive/20250507/202505071848.zYLh3Kvb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071848.zYLh3Kvb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071848.zYLh3Kvb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/fcloop.c:297:19: sparse: sparse: symbol 'lsreq_cache' was not declared. Should it be static?

vim +/lsreq_cache +297 drivers/nvme/target/fcloop.c

   295	
   296	/* SLAB cache for fcloop_lsreq structures */
 > 297	struct kmem_cache *lsreq_cache;
   298	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
