Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6828A22DFB5
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 12:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748696055; cv=none; b=kCXoqvwXPCMHObCVFIo0ZTO8jb4wZ4gPiLQVcRow5DzEwyCizp148FGi8eX3HZEHqrlwQMvL0D8F66VrNLytwjDMCQ0QS1zrZzuO++bu9NiEmmGQ4+z0n3Y1OqpvacP56Uhs09qbwFtMHBWmf/LSyrdMvLeJwBsLyhC3I13lAtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748696055; c=relaxed/simple;
	bh=+EmJmBR4BbbJOaqh99VTAFfhrshaX7fqFFRRNgGBdFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHQcoxz4AGgDMQW6f20b3kI2dq+cW5X+6nlz7h9sAwD4J0l7Z+h7KYqKtEl4nk0uQzsKgqQrJSyXxDtrZCi2ODxe5SjbkAr8fvGURn3hPM6Uqkv93x/DBMFNckHoHWTRnIF+uwyTfIdOvGwDQOdQL/Cq0MRvr5YFKCnp2nubHyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6E0wcYt; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6E0wcYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748696053; x=1780232053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+EmJmBR4BbbJOaqh99VTAFfhrshaX7fqFFRRNgGBdFs=;
  b=C6E0wcYtyZorg1gtXDrLXta+9pJZkyYOyLSE3B8/+ZadxnVUH2ZUD7Ap
   UlKEE7k39lOBWatX6ObP1QBf+2I3vOdyBmAlwa9O5U+F0r59CmsaKFvs9
   izcHpM6PltMu7sN8b164/hSRbXasnYwKf+EerJRj1utpccf+ws1wt5gYQ
   6K9osRPJmzKSF17HgSS/xBwiVtQheasQogRpdc6ofCc/3+PqWTmqQPMfR
   uq0ocUs9ChfjrM49fIo2w9c2ALClBIdqDsRhZVI9fiw4WHzeHBCcgPcKF
   GCAro3Q00eUoYW6JOdeXRw2bpVD59wleY6IMq/Q6zH3tUx301To4YCqaE
   Q==;
X-CSE-ConnectionGUID: GcrjoB4qQaO7tmMp2SEwqg==
X-CSE-MsgGUID: jI2ozdRLQqWzh+QQgmJD2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="61398425"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="61398425"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 05:54:13 -0700
X-CSE-ConnectionGUID: CBk3yu9jQiKyfvTpCjuIcg==
X-CSE-MsgGUID: ByTmpPphRiSlFVKyMFfvbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="145093181"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 31 May 2025 05:54:10 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLLix-000YPY-2T;
	Sat, 31 May 2025 12:54:07 +0000
Date: Sat, 31 May 2025 20:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Lee Jones <lee@kernel.org>,
	Corey Minyard <minyard@acm.org>
Cc: oe-kbuild-all@lists.linux.dev, Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io,
	kexybiscuit@aosc.io, wangyao@lemote.com,
	Chong Qiao <qiaochong@loongson.cn>
Subject: Re: [PATCH v3 2/3] ipmi: Add Loongson-2K BMC support
Message-ID: <202505312022.QmFmGE1F-lkp@intel.com>
References: <01805f8d1b9c8e6564a2d6d83964f78ed29b8f1f.1748505446.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01805f8d1b9c8e6564a2d6d83964f78ed29b8f1f.1748505446.git.zhoubinbin@loongson.cn>

Hi Binbin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 08effa6b77f7dbb4727f811daef0f6085c0d63c8]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/mfd-ls2kbmc-Introduce-Loongson-2K-BMC-core-driver/20250529-202628
base:   08effa6b77f7dbb4727f811daef0f6085c0d63c8
patch link:    https://lore.kernel.org/r/01805f8d1b9c8e6564a2d6d83964f78ed29b8f1f.1748505446.git.zhoubinbin%40loongson.cn
patch subject: [PATCH v3 2/3] ipmi: Add Loongson-2K BMC support
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20250531/202505312022.QmFmGE1F-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505312022.QmFmGE1F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505312022.QmFmGE1F-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/ipmi/ipmi_si_ls2k.c:180:6: error: redefinition of 'ipmi_si_ls2k_init'
     180 | void ipmi_si_ls2k_init(void)
         |      ^~~~~~~~~~~~~~~~~
   In file included from drivers/char/ipmi/ipmi_si_ls2k.c:17:
   drivers/char/ipmi/ipmi_si.h:108:20: note: previous definition of 'ipmi_si_ls2k_init' with type 'void(void)'
     108 | static inline void ipmi_si_ls2k_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~
>> drivers/char/ipmi/ipmi_si_ls2k.c:186:6: error: redefinition of 'ipmi_si_ls2k_shutdown'
     186 | void ipmi_si_ls2k_shutdown(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_si.h:109:20: note: previous definition of 'ipmi_si_ls2k_shutdown' with type 'void(void)'
     109 | static inline void ipmi_si_ls2k_shutdown(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~


vim +/ipmi_si_ls2k_init +180 drivers/char/ipmi/ipmi_si_ls2k.c

   179	
 > 180	void ipmi_si_ls2k_init(void)
   181	{
   182		platform_driver_register(&ipmi_ls2k_platform_driver);
   183		ls2k_registered = true;
   184	}
   185	
 > 186	void ipmi_si_ls2k_shutdown(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
