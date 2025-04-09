Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F5B26FDB7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 17:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744220374; cv=none; b=ZuG39ZwXUMzCO7wNWOG4hxjHwKeieLE/nOQpaU0YpRLCe9l3yP5TSEPXWJzLPkpwLXNnlJy2BUTOidkgSKyUTYaBhwg+UqUz3tqdUjKMlU9FJ67UA6GpGRC2AbLNsmGU6qv6Atxq2SGIXIjI0+FO3Rm20J3O8qGTL9ghqR/gAjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744220374; c=relaxed/simple;
	bh=N9rPsmdyTYCJPwhlzHdSu/S9+X++s3kwQh98QhmpvZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8D9cYC61BLG8/ioFSIURRXDKvFAzEGkOsViW4oc52lsOuDYhvMSd6AQNKE6cl2pvuv7np9V0KcUgJM9yJgbdRV7rb2LLeWp5Tu7GfwCKEekP5NdNdHz9EiHNIJSKT1wKzd1iH4iz/L0wWfZTYi1+wwI/oAb/lpekz1yDsIOIJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HimBEwXh; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HimBEwXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744220372; x=1775756372;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N9rPsmdyTYCJPwhlzHdSu/S9+X++s3kwQh98QhmpvZ4=;
  b=HimBEwXhIq6hSkDhQFgfqw98HZNwFZMYvbzQRSVDprI8bi7OXjv9bq5a
   mhD9K5md32FciD9K7SZAS55FZYHFC5aa/1O9Ea9peyhoOlnt2jZBcBNGy
   GZrQy+P0TW5c5s+NpBQKi5Mm5s8N+zJPqF22HFpb9TXC7WPquz0mtpL9l
   eVhNJj8cKq1DkZFPkpGAI53T0YOxpfnQpUHVl3LJGUN5uYsgrsiKL5Y5i
   D99dM9THra7umTkIt+GCvBKqCokRRQKiN0QY2VsfQCcN8bNNN/Z/JXYJ+
   z0F/hq7D1QBcvuWh/+h4tAghGlhBnWeckzEArdB/3eixvTQ+A6vCtctN+
   g==;
X-CSE-ConnectionGUID: eMZLPYNCRp2Qr00zD82QbA==
X-CSE-MsgGUID: qWTeZ53CQsGvwgg1UsmdhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="45882411"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="45882411"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 10:39:31 -0700
X-CSE-ConnectionGUID: JUyz7kLPQeGLbEVtCrP72A==
X-CSE-MsgGUID: Tht2dgwmR6qD1OlwOUgVnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="133864059"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Apr 2025 10:39:30 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2ZOZ-00099r-0A;
	Wed, 09 Apr 2025 17:39:27 +0000
Date: Thu, 10 Apr 2025 01:39:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>
Subject: Re: [PATCH 2/3] vmalloc: Switch to for_each_vmap_node() helper
Message-ID: <202504100130.OjlBJLkQ-lkp@intel.com>
References: <20250408151549.77937-2-urezki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408151549.77937-2-urezki@gmail.com>

Hi Uladzislau,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.15-rc1 next-20250409]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uladzislau-Rezki-Sony/vmalloc-Switch-to-for_each_vmap_node-helper/20250408-231807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250408151549.77937-2-urezki%40gmail.com
patch subject: [PATCH 2/3] vmalloc: Switch to for_each_vmap_node() helper
config: sparc-randconfig-002-20250409 (https://download.01.org/0day-ci/archive/20250410/202504100130.OjlBJLkQ-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250410/202504100130.OjlBJLkQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504100130.OjlBJLkQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmalloc.c: In function 'vmap_init_nodes':
>> mm/vmalloc.c:5087:9: warning: unused variable 'n' [-Wunused-variable]
     int i, n;
            ^


vim +/n +5087 mm/vmalloc.c

7fa8cee003166e Uladzislau Rezki (Sony  2024-01-02  5083) 
d093602919ad59 Uladzislau Rezki (Sony  2024-01-02  5084) static void vmap_init_nodes(void)
d093602919ad59 Uladzislau Rezki (Sony  2024-01-02  5085) {
d093602919ad59 Uladzislau Rezki (Sony  2024-01-02  5086) 	struct vmap_node *vn;
8f33a2ff307248 Uladzislau Rezki (Sony  2024-01-02 @5087) 	int i, n;
8f33a2ff307248 Uladzislau Rezki (Sony  2024-01-02  5088) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
