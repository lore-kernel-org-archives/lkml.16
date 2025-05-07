Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF592676F9
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620386; cv=none; b=ofBAD+3YR4kybG2WtmL0BcMITwBsDs2Uak+FGFsdGlrajJ/050lYXoucQ5UFzhnha2n8o5+j7CHQCTZrC+PIcN8D5LuO5Ee+R2j4FppRPZpJ9117FrZMQclO7Xy/nzqMSvPr3z2+BvJLRJw5gv6HyaMP9ryVrm1npYUcKuQOOMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620386; c=relaxed/simple;
	bh=8j39bWyb9uVVAz08W3I2qYhnlhcc79hAb95yitzrSD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngW8K95O6RDnustdp3s0ATlNWS3JD0iocfrWLjAOBCIXgnkf6RYSKs6otMyR8+/3y8p//+HfFOwRuGV/pE1/yefK0YGdnmvs5XrwUbzRw/MzgnP689y6xRF2EaPGaMoNzaSvpZ0eRqP9xOz3chX2q7FqFgPcptvBNEI/8lFaVSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiegJaQ8; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiegJaQ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746620385; x=1778156385;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8j39bWyb9uVVAz08W3I2qYhnlhcc79hAb95yitzrSD4=;
  b=DiegJaQ8vB1tD9xLSGiG6dAvNUoMPKrex+uB+3qmw2gIxBRqfqdrW0Z8
   IajS1C5sgC4ASyN2CpHLkC3N+67hQoEn2VM0OqWnMNqoBfZznlAvk9gal
   VO6h82B/3a1M5t3L7/aHzgbnu5ltE0yN8q5UChleUPlUbNqtgU8i21g8U
   LgYv/2lAQ1VUmIVqC2yPKpjRNbBjcdoiQEtbDnZVaUA6i+iH8fq0eoQxZ
   9Zbqmnw7g7KWSoaaQEEbGTNJYxsOK6jnCDE8n2odRhZfrlnXHpP8eB66c
   bpzrO8ZBTnW13sh5cOJycJol6tJYEr3r7pQ4wTVWknTZVA3owtnrsjmXr
   g==;
X-CSE-ConnectionGUID: wbinizmlTmKQMpX8/xjdRg==
X-CSE-MsgGUID: 8Ia3fNx9RXKXu+Xo2vLarw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48361241"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48361241"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:19:45 -0700
X-CSE-ConnectionGUID: ++rTbFTeQ8ONub8yGm5hDQ==
X-CSE-MsgGUID: HHo4MBs2S0GvySho/XDvIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135802177"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 May 2025 05:19:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCdkS-0007lZ-17;
	Wed, 07 May 2025 12:19:40 +0000
Date: Wed, 7 May 2025 20:19:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rujra Bhatt <braker.noob.kernel@gmail.com>, dpenkler@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, braker.noob.kernel@gmail.com
Subject: Re: [FIRST-PATCH] staging : gpib : agilent_82350b : agilent_82350b.c
 : fixes checks on the file
Message-ID: <202505071942.wmYV0pa2-lkp@intel.com>
References: <Z_-nR5Vt2A5kvbro@brak3rDesk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_-nR5Vt2A5kvbro@brak3rDesk>

Hi Rujra,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]
[also build test WARNING on staging/staging-next staging/staging-linus linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rujra-Bhatt/staging-gpib-agilent_82350b-agilent_82350b-c-fixes-checks-on-the-file/20250416-205032
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/Z_-nR5Vt2A5kvbro%40brak3rDesk
patch subject: [FIRST-PATCH] staging : gpib : agilent_82350b : agilent_82350b.c : fixes checks on the file
config: x86_64-randconfig-002-20250424 (https://download.01.org/0day-ci/archive/20250507/202505071942.wmYV0pa2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071942.wmYV0pa2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071942.wmYV0pa2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/percpu.h:5,
                    from include/linux/radix-tree.h:16,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from drivers/staging/gpib/include/gpib_types.h:18,
                    from drivers/staging/gpib/include/gpibP.h:12,
                    from drivers/staging/gpib/agilent_82350b/agilent_82350b.h:7,
                    from drivers/staging/gpib/agilent_82350b/agilent_82350b.c:11:
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c: In function 'agilent_82350b_allocate_private':
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:482:53: error: expected '{' before '*' token
     482 |         board->private_data = kzalloc(sizeof(struct * board->private_data), GFP_KERNEL);
         |                                                     ^
   include/linux/alloc_tag.h:227:16: note: in definition of macro 'alloc_hooks_tag'
     227 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   include/linux/slab.h:1041:49: note: in expansion of macro 'alloc_hooks'
    1041 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:482:31: note: in expansion of macro 'kzalloc'
     482 |         board->private_data = kzalloc(sizeof(struct * board->private_data), GFP_KERNEL);
         |                               ^~~~~~~
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:482:53: error: expected '{' before '*' token
     482 |         board->private_data = kzalloc(sizeof(struct * board->private_data), GFP_KERNEL);
         |                                                     ^
   include/linux/alloc_tag.h:231:24: note: in definition of macro 'alloc_hooks_tag'
     231 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1041:49: note: in expansion of macro 'alloc_hooks'
    1041 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:482:31: note: in expansion of macro 'kzalloc'
     482 |         board->private_data = kzalloc(sizeof(struct * board->private_data), GFP_KERNEL);
         |                               ^~~~~~~
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:482:53: error: expected '{' before '*' token
     482 |         board->private_data = kzalloc(sizeof(struct * board->private_data), GFP_KERNEL);
         |                                                     ^
   include/linux/alloc_tag.h:234:24: note: in definition of macro 'alloc_hooks_tag'
     234 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   include/linux/slab.h:1041:49: note: in expansion of macro 'alloc_hooks'
    1041 | #define kzalloc(...)                            alloc_hooks(kzalloc_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:482:31: note: in expansion of macro 'kzalloc'
     482 |         board->private_data = kzalloc(sizeof(struct * board->private_data), GFP_KERNEL);
         |                               ^~~~~~~
>> drivers/staging/gpib/agilent_82350b/agilent_82350b.c:482:29: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     482 |         board->private_data = kzalloc(sizeof(struct * board->private_data), GFP_KERNEL);
         |                             ^


vim +482 drivers/staging/gpib/agilent_82350b/agilent_82350b.c

   479	
   480	static int agilent_82350b_allocate_private(struct gpib_board *board)
   481	{
 > 482		board->private_data = kzalloc(sizeof(struct * board->private_data), GFP_KERNEL);
   483		if (!board->private_data)
   484			return -ENOMEM;
   485		return 0;
   486	}
   487	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
