Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A46F19E96A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643376; cv=none; b=cYouw0BGWh5FCnPf4LNlcevjDPrIpJhErEIqYRpnI6M5n4kesNFQA5s6Fl8K2ya44oVF2dRRDOO5Y/c4nBbyeLib042kvUzW3ue6nZmksEDga1/QOo7pUfUbx5p3mqVAZUFy973h9IRTOdPryhN1flQ59WhAhLLJmN9qpA8yxwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643376; c=relaxed/simple;
	bh=SWttKQL4FkWzc6MgsldmYN3kVwwpFN2mg/MdqGHZizY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqYoQhmtUqsGcZQHmEMn0ClpaNZaN62FhsKTVqZzy5CBiRn1aZM9oPTAOwq9IBF11QS2c/VAfXF5nJqu2veux0/SgSv+/gMxfKJ2WcjYFhe1twkRETQ1a3g7W9lvTuRKAgC4ojN+Ht2WhQpCpUXi75OCJ4WSnodISVoOj5CNt9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJJgN3SO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJJgN3SO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751643376; x=1783179376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SWttKQL4FkWzc6MgsldmYN3kVwwpFN2mg/MdqGHZizY=;
  b=OJJgN3SOy4xJxe6bxVx3XCE8BYUx9FAJcUXNfZNV3THjrO7KOSI5bxJM
   rTLYrkqkh7ehYGV0QXzB9acNGqIIGzbGfZikpIEBe62e501lKxUHV8vDc
   gQ9Y1a7UqVy8QlSxSny6n3lp08FjOIKAzHlzegPWjzouUqLdA1CYS5jgz
   yCToTFvEu79Fioyw+Ns8dLB8WxPInMEsPqAxv2dA/G3TI2rCWhkyaJM+y
   zEVH0e4kT4nWxmVtCEHyzWCoK1e2PzLvWE0xCbJU2rkFy8YbDKyqQZeD6
   yfZMI8BuHLl8terGSmDnyfIAbrBH3/qi8pK8XCxvFtbGexVsZ+6ZDzbYs
   Q==;
X-CSE-ConnectionGUID: gqjfpB6MQzKJ/6aA2uHouA==
X-CSE-MsgGUID: KkyXoSf3Snq2Nd5l7yuZCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53951509"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="53951509"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 08:36:15 -0700
X-CSE-ConnectionGUID: 8Wuv05NdRTiiT1w3N26BHA==
X-CSE-MsgGUID: IL7TXyDfRxq0Y0POh56owg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="158697099"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jul 2025 08:36:09 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXiSN-0003q7-1l;
	Fri, 04 Jul 2025 15:36:07 +0000
Date: Fri, 4 Jul 2025 23:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: Balbir Singh <balbirs@nvidia.com>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Hildenbrand <david@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>,
	Zi Yan <ziy@nvidia.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
	Jane Chu <jane.chu@oracle.com>,
	Alistair Popple <apopple@nvidia.com>,
	Donet Tom <donettom@linux.ibm.com>
Subject: Re: [v1 resend 04/12] mm/migrate_device: THP migration of zone
 device pages
Message-ID: <202507042336.o2mutGeh-lkp@intel.com>
References: <20250703233511.2028395-5-balbirs@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703233511.2028395-5-balbirs@nvidia.com>

Hi Balbir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20250704]
[cannot apply to akpm-mm/mm-nonmm-unstable shuah-kselftest/next shuah-kselftest/fixes linus/master v6.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Balbir-Singh/mm-zone_device-support-large-zone-device-private-folios/20250704-073807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250703233511.2028395-5-balbirs%40nvidia.com
patch subject: [v1 resend 04/12] mm/migrate_device: THP migration of zone device pages
config: x86_64-randconfig-075-20250704 (https://download.01.org/0day-ci/archive/20250704/202507042336.o2mutGeh-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507042336.o2mutGeh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507042336.o2mutGeh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/migrate_device.c:89 function parameter 'fault_folio' not described in 'migrate_vma_collect_huge_pmd'
>> Warning: mm/migrate_device.c:707 function parameter 'page' not described in 'migrate_vma_insert_huge_pmd_page'
   Warning: mm/migrate_device.c:707 Excess function parameter 'folio' description in 'migrate_vma_insert_huge_pmd_page'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
