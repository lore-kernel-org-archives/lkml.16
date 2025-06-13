Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B19221DB9
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749792166; cv=none; b=B/hWuZUCcWgI5SFmOAaTJvB4AdcrvnHcLhIVAWI65QDrC1rWt8QFjnPacix415tHlJWMA3mXPzZpA+N1/Nm4zS8/jen7bjrWtG+vsg73gzkAygqPobUI/1EjQf/2ghnempZmJ5QfNecCU5p6K16A6YhDYAysk/OxSqUbV9/B8hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749792166; c=relaxed/simple;
	bh=Ot0LuWOXY3hgNA8TUsNCgf8KVFraRIfZ3gE7gPx2RUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AopVk+JKag2wgzNlK53wNvLul8ujS2Gj3Js/tw9m+mN0J/G62bEfXno1y49WatC7HdEGjs28ytIpbYaPEFrUJz68YOGKs19rcUGsWVQetbXN4ZOdLP+xWeRAJNL1tq6w4yExnG6HR/VvStd3FhpdX5V80fJXVKg83dLRk+tsyV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAy4Wabj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAy4Wabj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749792165; x=1781328165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ot0LuWOXY3hgNA8TUsNCgf8KVFraRIfZ3gE7gPx2RUI=;
  b=eAy4WabjuErmiQ4GygVI61xWwKhvieEJJq1HNLdSo5oQmo/M7QX11qOk
   QfJCLqJD4yRFgivRiBTdrIxoN8XeljxfHLBrQt5Dyf10O+XHHJsqRPDxZ
   +957y+LKYdI2DTLj5UhnD+MAzkBzBrckeT8K1mVZfG+UAJAZmmqFmvqCD
   UAxhIThRshN22OtyRI1sNAvRduKSSjOG0udpmD6kBcbCwJhM/rpAAzpZl
   hGfMaNjBI9xnHk3S3YBBD1/kIJ1PiI8o2P/VjC7EnECteC26+eS18QpyO
   fxeCd2cAFyDpu7tY4XQ4p9VPSSaqzu3MHRYml1GLZ1AYA0TVmRYNIbd1A
   g==;
X-CSE-ConnectionGUID: sZuSeK8ZQU2BSG3A6nWqNQ==
X-CSE-MsgGUID: ftm48a/BTwe0b5vk+5JB/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52093934"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="52093934"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 22:22:44 -0700
X-CSE-ConnectionGUID: UyblrBbJSbmEE+zhfjHWsw==
X-CSE-MsgGUID: OZD75BHpSEWlm7dsoZV6MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="147572138"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jun 2025 22:22:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPwsB-000CG2-2c;
	Fri, 13 Jun 2025 05:22:39 +0000
Date: Fri, 13 Jun 2025 13:21:58 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Gorlas <michal.gorlas@9elements.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, marcello.bauer@9elements.com,
	Michal Gorlas <michal.gorlas@9elements.com>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <202506131541.RxswGh7u-lkp@intel.com>
References: <6cfb5bae79c153c54da298c396adb8a28b5e785a.1749734094.git.michal.gorlas@9elements.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cfb5bae79c153c54da298c396adb8a28b5e785a.1749734094.git.michal.gorlas@9elements.com>

Hi Michal,

kernel test robot noticed the following build errors:

[auto build test ERROR on chrome-platform/for-next]
[also build test ERROR on chrome-platform/for-firmware-next linus/master v6.16-rc1 next-20250612]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Michal-Gorlas/firmware-coreboot-support-for-parsing-SMM-related-informations-from-coreboot-tables/20250612-221612
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
patch link:    https://lore.kernel.org/r/6cfb5bae79c153c54da298c396adb8a28b5e785a.1749734094.git.michal.gorlas%409elements.com
patch subject: [PATCH v1 2/3] firmware: coreboot: loader for Linux-owned SMI handler
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250613/202506131541.RxswGh7u-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250613/202506131541.RxswGh7u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506131541.RxswGh7u-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/google/mm_loader.c: In function 'place_handler':
>> drivers/firmware/google/mm_loader.c:105:9: error: implicit declaration of function 'wbinvd' [-Wimplicit-function-declaration]
     105 |         wbinvd();
         |         ^~~~~~


vim +/wbinvd +105 drivers/firmware/google/mm_loader.c

    84	
    85	static u32 __init place_handler(void)
    86	{
    87		/*
    88		 * The handler (aka MM blob) has to be placed in low 4GB of the memory.
    89		 * This is because we can not assume that coreboot will be in long mode
    90		 * while trying to copy the blob to SMRAM. Even if so, (can be checked by
    91		 * reading cb_data->mm_info.requires_long_mode_call), it would make our life
    92		 * way too complicated (e.g. no need for shared page table).
    93		 */
    94		size_t entry32_offset;
    95		size_t entry64_offset;
    96		u16 real_mode_seg;
    97		const u32 *rel;
    98		u32 count;
    99		unsigned long phys_base;
   100	
   101		blob_size = mm_payload_size_needed();
   102		shared_buffer = (void *)__get_free_pages(GFP_DMA32, get_order(blob_size));
   103	
   104		memcpy(shared_buffer, mm_blob, blob_size);
 > 105		wbinvd();
   106	
   107		/*
   108		 * Based on arch/x86/realmode/init.c
   109		 * The sole purpose of doing relocations is to be able to calculate the offsets
   110		 * for entry points. While the absolute addresses are not valid anymore after the
   111		 * blob is copied to SMRAM, the distances between sections stay the same, so we
   112		 * can still calculate the correct entry point based on coreboot's bitness.
   113		 */
   114		phys_base = __pa(shared_buffer);
   115		real_mode_seg = phys_base >> 4;
   116		rel = (u32 *)mm_relocs;
   117	
   118		/* 16-bit segment relocations. */
   119		count = *rel++;
   120		while (count--) {
   121			u16 *seg = (u16 *)(shared_buffer + *rel++);
   122			*seg = real_mode_seg;
   123		}
   124	
   125		/* 32-bit linear relocations. */
   126		count = *rel++;
   127		while (count--) {
   128			u32 *ptr = (u32 *)(shared_buffer + *rel++);
   129			*ptr += phys_base;
   130		}
   131	
   132		mm_header =  (struct mm_header *)shared_buffer;
   133	
   134		mm_header->mm_signature = REALMODE_END_SIGNATURE;
   135		mm_header->mm_blob_size = mm_payload_size_needed();
   136	
   137		/* At this point relocations are done and we can do some cool
   138		 * pointer arithmetics to help coreboot determine correct entry
   139		 * point based on offsets.
   140		 */
   141		entry32_offset = mm_header->mm_entry_32 - (unsigned long)shared_buffer;
   142		entry64_offset = mm_header->mm_entry_64 - (unsigned long)shared_buffer;
   143	
   144		mm_header->mm_entry_32 = entry32_offset;
   145		mm_header->mm_entry_64 = entry64_offset;
   146	
   147		return (unsigned long)shared_buffer;
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
