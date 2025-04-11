Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85F227CCD0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 06:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744353100; cv=none; b=qsEuZNUywjGARtBVu20Zw/ZoZeCJ19rhIY/c6bFSrwjMUQH2m0KJEZ3YdNHNPuwOtn8tThvRO1QDsmdSD2S8iTR+3S/b6Aa4NP8EmIPwCwUdqweOGHnjTonuvPlQpsSnL5FMlW5zQT1vHNmtJWzKwPzQiGU/1Rlw3on/w75hoJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744353100; c=relaxed/simple;
	bh=gPbW4hxtFr5Vb/hEwyhC++dCtSsKBgR/5ZNQcAMJ4IQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LV9Xl9qNNb54DG+2hUAikPVsPjra/S83rlnoA0WFxYYHXrVhpahDnpR/BB/0/G/8j6sa5Qqz54G3BAJMGGmVhQMcnpoopFiF23P+ilD5UGDQwrJzVM5dUsI4c5rTE7P1+zduTUbx3EeGDpbRsZw17+Uo56yCDFI2EY+lGx40q3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTRj6Biy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTRj6Biy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744353099; x=1775889099;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gPbW4hxtFr5Vb/hEwyhC++dCtSsKBgR/5ZNQcAMJ4IQ=;
  b=fTRj6Biy3JZHbBJ3XEYDtX9IXKaxtnon9P9o10uFG6UpNlBP2ft7IhTp
   4g/UAfTKreCCxU2iK3Wi+67JrNF4LiwcHmSLjY5GDVe8L9A1vtG4tMYgi
   90dwijRIMUysD1S+VlOepz1Iy6crsWmjhX9LKmJnlE9sGjsxl29zct3L6
   +eQ+pIw6nt4yVEgPYXbDFaGvs6wJZ/OLfb31qVl71dq/O+l6Ik0V5+erM
   6XpuScDrQsKrL0IbsHNBZE9utCKzSjh0KeYh/IefJKha8gF3PN/0sJ1Pk
   HVn0rYckCaWDk1RIVg0p+UOe650dQu+r4eh2Bc6CUPN5ZvVezoOigZeso
   g==;
X-CSE-ConnectionGUID: E/vbdaPsSlmQ0ERONx99vQ==
X-CSE-MsgGUID: J/hEKRybQtefACwyeg9tSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="68380988"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="68380988"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 23:31:38 -0700
X-CSE-ConnectionGUID: wMz7CBueRzm/tXRadmdZxg==
X-CSE-MsgGUID: P495+6TITKaP+RPdOXk7hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134272881"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Apr 2025 23:31:36 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u37vK-000Ati-0N;
	Fri, 11 Apr 2025 06:31:34 +0000
Date: Fri, 11 Apr 2025 14:30:46 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Liu <liubo03@inspur.com>, xiang@kernel.org, chao@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Bo Liu <liubo03@inspur.com>
Subject: Re: [PATCH 2/2] erofs: support deflate decompress by using Intel QAT
Message-ID: <202504111440.2DIupC2G-lkp@intel.com>
References: <20250410042048.3044-3-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410042048.3044-3-liubo03@inspur.com>

Hi Bo,

kernel test robot noticed the following build errors:

[auto build test ERROR on xiang-erofs/dev-test]
[also build test ERROR on xiang-erofs/dev linus/master v6.15-rc1 next-20250410]
[cannot apply to xiang-erofs/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Liu/erofs-remove-duplicate-code/20250410-122442
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20250410042048.3044-3-liubo03%40inspur.com
patch subject: [PATCH 2/2] erofs: support deflate decompress by using Intel QAT
config: arc-randconfig-001-20250411 (https://download.01.org/0day-ci/archive/20250411/202504111440.2DIupC2G-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250411/202504111440.2DIupC2G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504111440.2DIupC2G-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/erofs/sysfs.c: In function 'erofs_attr_show':
>> fs/erofs/sysfs.c:136:24: error: 'struct erofs_sb_info' has no member named 'erofs_tfm'
     136 |                 if (sbi->erofs_tfm)
         |                        ^~
   fs/erofs/sysfs.c:138:59: error: 'struct erofs_sb_info' has no member named 'erofs_tfm'
     138 |                                 crypto_comp_alg_common(sbi->erofs_tfm)->base.cra_driver_name);
         |                                                           ^~


vim +136 fs/erofs/sysfs.c

   115	
   116	static ssize_t erofs_attr_show(struct kobject *kobj,
   117					struct attribute *attr, char *buf)
   118	{
   119		struct erofs_sb_info *sbi = container_of(kobj, struct erofs_sb_info,
   120							s_kobj);
   121		struct erofs_attr *a = container_of(attr, struct erofs_attr, attr);
   122		unsigned char *ptr = __struct_ptr(sbi, a->struct_type, a->offset);
   123	
   124		switch (a->attr_id) {
   125		case attr_feature:
   126			return sysfs_emit(buf, "supported\n");
   127		case attr_pointer_ui:
   128			if (!ptr)
   129				return 0;
   130			return sysfs_emit(buf, "%u\n", *(unsigned int *)ptr);
   131		case attr_pointer_bool:
   132			if (!ptr)
   133				return 0;
   134			return sysfs_emit(buf, "%d\n", *(bool *)ptr);
   135		case attr_comp_crypto:
 > 136			if (sbi->erofs_tfm)
   137				return sysfs_emit(buf, "%s\n",
   138					crypto_comp_alg_common(sbi->erofs_tfm)->base.cra_driver_name);
   139			else
   140				return sysfs_emit(buf, "NONE\n");
   141		}
   142		return 0;
   143	}
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
