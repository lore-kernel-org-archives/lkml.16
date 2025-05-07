Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABB5222574
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746610198; cv=none; b=IElKiuHFRB7w8vYu9TsJjLd8Ujyob+8xICqEONZbSTvbSZej3OzFqDxhTQjUC7SaWgRlMz2lx3NLUX0WVa0uN+/hE0N1U9QNAwBZz7TEVjQA4LiP3IZvQUnFpa5whCLIMweMN6kDgKvrNf+XfGBu5f0cHYOXA6pNE+kaIXHiIDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746610198; c=relaxed/simple;
	bh=+0Q/JhboznQZo1rGKcw6U4n9SViK9yo2ElyuyoLGTaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McdiG44CZi/h34AJjgeY+J+U6kRgC5vXkGjOcXt/cB36tXRbp4UgLKALmHej+BhPhsLMjqX1fyWOLRT7fZx1JLSEvEphPsPDO3Jsw2eGbjkX1ftDGRIv4RXMocliejCURiyRCPGz8W98wKQiMPjNNIUG4rKT5QIGwSMmf98cnvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBHY0aN0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBHY0aN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746610196; x=1778146196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+0Q/JhboznQZo1rGKcw6U4n9SViK9yo2ElyuyoLGTaQ=;
  b=aBHY0aN0Zn/ThgkW49tKKA9Rio2zYC3QumPWDc2Hz4fnKjsvV5pg2Qnb
   +mGSbu67tdhS4wraUyVNxmc9HtmZYIBaDgumouv8i+aeJiVl7ysZXEJEq
   TJCLGCcWBbjIbaa5Dl/KCW5/PbcNIcp+OxsT8xPnVwen9ZgOY++nXRc1C
   JurKy2tjjR9qrghntoiEBxCeqNSVUftCpw8cgJxohgW6XepPJwA63dvj+
   wlOk7cvnISVeQYwxNkb7IlCeCDNXR9WXE7NPqTtXwlv4IVJ2yuIyMTAe7
   oqcr7HnzY1Fx0e//Pf7KBsY4jGgRafHZU6EGZ38jX0yKD8C5lTxLvYkJF
   A==;
X-CSE-ConnectionGUID: UKEEBogTT7OpEETa0SesIA==
X-CSE-MsgGUID: UCXFiZQRRuaZLnaw5grr8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70834520"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="70834520"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 02:29:55 -0700
X-CSE-ConnectionGUID: Cw+4xhxiTIyonVp0hoI9cw==
X-CSE-MsgGUID: 3WuguzWFSae0wZUpNdo44g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140640306"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2025 02:29:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCb67-0007VR-01;
	Wed, 07 May 2025 09:29:51 +0000
Date: Wed, 7 May 2025 17:29:16 +0800
From: kernel test robot <lkp@intel.com>
To: Brahmajit Das <brahmajit.xyz@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, bp@alien8.de,
	dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
	pawan.kumar.gupta@linux.intel.com, tony.luck@intel.com
Subject: Re: [PATCH v2 1/1] regulator: hi6421v530: fix building with GCC 15
Message-ID: <202505071639.PQ4TVkSG-lkp@intel.com>
References: <20250416121305.13469-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416121305.13469-1-listout@listout.xyz>

Hi Brahmajit,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.15-rc5 next-20250506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brahmajit-Das/regulator-hi6421v530-fix-building-with-GCC-15/20250416-211351
base:   linus/master
patch link:    https://lore.kernel.org/r/20250416121305.13469-1-listout%40listout.xyz
patch subject: [PATCH v2 1/1] regulator: hi6421v530: fix building with GCC 15
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20250507/202505071639.PQ4TVkSG-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071639.PQ4TVkSG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071639.PQ4TVkSG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from scripts/mod/file2alias.c:123:
>> scripts/mod/../../include/linux/mod_devicetable.h:608:39: error: expected ':', ',', ';', '}' or '__attribute__' before '__nonstring'
     608 |         char name[PLATFORM_NAME_SIZE] __nonstring;
         |                                       ^~~~~~~~~~~
   scripts/mod/file2alias.c: In function 'do_platform_entry':
>> scripts/mod/file2alias.c:143:35: error: 'struct platform_device_id' has no member named 'name'
     143 |         typeof(((struct devid *)0)->f) *f = ((m) + OFF_##devid##_##f)
         |                                   ^~
   scripts/mod/file2alias.c:932:9: note: in expansion of macro 'DEF_FIELD_ADDR'
     932 |         DEF_FIELD_ADDR(symval, platform_device_id, name);
         |         ^~~~~~~~~~~~~~
   scripts/mod/../../include/linux/mod_devicetable.h:605:33: warning: format '%s' expects argument of type 'char *', but argument 4 has type 'int' [-Wformat=]
     605 | #define PLATFORM_MODULE_PREFIX  "platform:"
         |                                 ^~~~~~~~~~~
   scripts/mod/file2alias.c:934:41: note: in expansion of macro 'PLATFORM_MODULE_PREFIX'
     934 |         module_alias_printf(mod, false, PLATFORM_MODULE_PREFIX "%s", *name);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   scripts/mod/file2alias.c:934:66: note: format string is defined here
     934 |         module_alias_printf(mod, false, PLATFORM_MODULE_PREFIX "%s", *name);
         |                                                                 ~^
         |                                                                  |
         |                                                                  char *
         |                                                                 %d
   make[3]: *** [scripts/Makefile.host:131: scripts/mod/file2alias.o] Error 1
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1279: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +608 scripts/mod/../../include/linux/mod_devicetable.h

   606	
   607	struct platform_device_id {
 > 608		char name[PLATFORM_NAME_SIZE] __nonstring;
   609		kernel_ulong_t driver_data;
   610	};
   611	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
