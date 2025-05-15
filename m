Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8868D4B1E64
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 02:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747277989; cv=none; b=IUtKxU2yrQcHPUJT7tSGNwIfnBPr425Fnz27GyMbD6lUE4gS/bQCnBo5nHmMpxLseKtYvHyOo7EgNW8bPHWoSXaCn/8ZsYf6hH5Z0vgDs3ZjKygkDybzZyqPQV8EzBXBwYMbK5Baf0eTeNqjC/IreqVtzDEnkePXdvQtvXzdU6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747277989; c=relaxed/simple;
	bh=HsfreBSPTaUwvPo+a+UW0RwvFkDmhpcCnMej2+zMrZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+tCfUl/bDl9BTjuU9Q+y1rIx2xbMvYNM72NrfMD8rf9cCs+L9k3ZQb19YGqBs7TpAANWvoA6Uq/OETDdaswqWFL+KSFZyfDca51ArfyqtH5DWVTC+S9bjth4TD/3AK/VFRfBI3MCJXZt1OdfCYlPvb5lwafS5G+wQIeahdPg2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+hSxxUv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+hSxxUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747277988; x=1778813988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HsfreBSPTaUwvPo+a+UW0RwvFkDmhpcCnMej2+zMrZo=;
  b=n+hSxxUvZtbkd9bII3gUFprAyP/RX2gqjjVX40Bj/pxq3I6KX1Dr0S+o
   8E3YsCfSkrlDoyhahAN1dNIB0+NL67EDzTgEcru7b9w51b+nha/TPFPA/
   mjxh3GbbY08jFzlsLFlRQql9O6yTGiBiJMMGas/Cw4tTwdyu956FSlKA0
   xsURVrdDNFZV/alrus6tJELyXw0IiYE0fgGceMRJfNC/4Kb+4ywdsXj+q
   bdHHBWo7kLuoWT+xndZfV8vZQE0SBn9yxmum/UZ8w2ivyMLi6ApErpZjy
   WSiuy5+jNbiOk+Zbhaswovm6DzHoj+gYxxSdf8jPIG1q8Cy6pHpvD2hCw
   w==;
X-CSE-ConnectionGUID: 1NwuBLAMS2aqN0owCbUmyg==
X-CSE-MsgGUID: LI+Uuw0ATu2TppDYuOmDZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="59850499"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="59850499"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 19:59:47 -0700
X-CSE-ConnectionGUID: 3bTV9dubTkq3H46JE5s/ZA==
X-CSE-MsgGUID: 1nGSZBhDR2+oUzrzoyHjfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="175363445"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 May 2025 19:59:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFOow-000Hnz-2S;
	Thu, 15 May 2025 02:59:42 +0000
Date: Thu, 15 May 2025 10:59:02 +0800
From: kernel test robot <lkp@intel.com>
To: Bo Liu <liubo03@inspur.com>, xiang@kernel.org, chao@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Bo Liu <liubo03@inspur.com>
Subject: Re: [PATCH v2] erofs: support deflate decompress by using Intel QAT
Message-ID: <202505151023.ond6cMbi-lkp@intel.com>
References: <20250514121709.2557-1-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514121709.2557-1-liubo03@inspur.com>

Hi Bo,

kernel test robot noticed the following build errors:

[auto build test ERROR on xiang-erofs/dev-test]
[also build test ERROR on xiang-erofs/dev xiang-erofs/fixes linus/master v6.15-rc6 next-20250514]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bo-Liu/erofs-support-deflate-decompress-by-using-Intel-QAT/20250514-202351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20250514121709.2557-1-liubo03%40inspur.com
patch subject: [PATCH v2] erofs: support deflate decompress by using Intel QAT
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250515/202505151023.ond6cMbi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151023.ond6cMbi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151023.ond6cMbi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/erofs/sysfs.c:60:27: error: 'erofs_attr_crypto_enable' undeclared here (not in a function); did you mean 'attr_crypto_enable'?
      60 | #define ATTR_LIST(name) (&erofs_attr_##name.attr)
         |                           ^~~~~~~~~~~
   fs/erofs/sysfs.c:103:9: note: in expansion of macro 'ATTR_LIST'
     103 |         ATTR_LIST(crypto_enable),
         |         ^~~~~~~~~
>> fs/erofs/sysfs.c:60:27: error: 'erofs_attr_crypto_disable' undeclared here (not in a function); did you mean 'attr_crypto_disable'?
      60 | #define ATTR_LIST(name) (&erofs_attr_##name.attr)
         |                           ^~~~~~~~~~~
   fs/erofs/sysfs.c:104:9: note: in expansion of macro 'ATTR_LIST'
     104 |         ATTR_LIST(crypto_disable),
         |         ^~~~~~~~~


vim +60 fs/erofs/sysfs.c

168e9a76200c54 Huang Jianan 2021-12-01  47  
168e9a76200c54 Huang Jianan 2021-12-01  48  #define EROFS_ATTR_RW(_name, _id, _struct)	\
168e9a76200c54 Huang Jianan 2021-12-01  49  	EROFS_ATTR_OFFSET(_name, 0644, _id, _struct)
168e9a76200c54 Huang Jianan 2021-12-01  50  
168e9a76200c54 Huang Jianan 2021-12-01  51  #define EROFS_RO_ATTR(_name, _id, _struct)	\
168e9a76200c54 Huang Jianan 2021-12-01  52  	EROFS_ATTR_OFFSET(_name, 0444, _id, _struct)
168e9a76200c54 Huang Jianan 2021-12-01  53  
168e9a76200c54 Huang Jianan 2021-12-01  54  #define EROFS_ATTR_RW_UI(_name, _struct)	\
168e9a76200c54 Huang Jianan 2021-12-01  55  	EROFS_ATTR_RW(_name, pointer_ui, _struct)
168e9a76200c54 Huang Jianan 2021-12-01  56  
168e9a76200c54 Huang Jianan 2021-12-01  57  #define EROFS_ATTR_RW_BOOL(_name, _struct)	\
168e9a76200c54 Huang Jianan 2021-12-01  58  	EROFS_ATTR_RW(_name, pointer_bool, _struct)
168e9a76200c54 Huang Jianan 2021-12-01  59  
168e9a76200c54 Huang Jianan 2021-12-01 @60  #define ATTR_LIST(name) (&erofs_attr_##name.attr)
168e9a76200c54 Huang Jianan 2021-12-01  61  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
