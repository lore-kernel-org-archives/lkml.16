Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C7128136B;
	Wed,  7 May 2025 13:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624898; cv=none; b=YVqR0Y7++Fe8dg4mAr47WEzmNLPajaS3CHXZiXnTo8kN0UZo1ENo1il+6v5DzyX+7eSWukKhJef7WSedLd9dRAtNNkf44eAQFiGw24V7oO7qu3vtNToo6x6KOrqxK+NB3xd3wPg9FSy66NfASkc9grnxwgnEu1yvmNUZdEu1/so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624898; c=relaxed/simple;
	bh=9s/anmmmHnCBE/Juya8NxbudhVpKAE3I7ntHPIaGTeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5akgXU8PJnaSCtTLVU3wtgUa48SRSQDQSxHCjAkH+e4rlV2G8ciXd10WUIi1LjEHH7g+fuLMGC6kKkeaZMD/znJ099qwMI5Lb2O6F2se+tSSnkOROFBtxj/3jF0h0M1wp8qyar8A/yoNaIdttlNlG0noy1MTgildSH5BqbvlVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Glyag8Un; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Glyag8Un"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746624897; x=1778160897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9s/anmmmHnCBE/Juya8NxbudhVpKAE3I7ntHPIaGTeM=;
  b=Glyag8UnW4ZmHoCFv2kda9DYoZQBIHpET9lU2Fziuwsv2B7SGljUMklO
   CzXAwlEJw/BlDIBYegBHb6BNufvGaE7T7HANGS/zaJiiKpkyQLtXebYtO
   fBIkNQis0SDyVEQGZSFYVXho7HmAQveQU/YMqv3w/4HKg3yCHObCZfrKQ
   /ydfHv14q0CBYL3zbRjT/Z9zC59Wv/WX3B3dn3LzQZEPPJ0BBtP02HoZo
   wdHOUtECWo9kKMcPkBL/jlzBWc/Pzon6HfrtvRwtEOuG20blSuiR5kZBs
   SBAfu5xZIq68SOtRf1lfC+X3q10ALfvY1FmAKY03EwGADMz1Q8Gl93/v4
   g==;
X-CSE-ConnectionGUID: 5ae23F6hT/+JnrcqjFEezw==
X-CSE-MsgGUID: xlMytwUoRjCFN9eGEok1zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47606971"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="47606971"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:34:55 -0700
X-CSE-ConnectionGUID: fT4LPrCgQimWp74WxhC1qg==
X-CSE-MsgGUID: SgIV+25KTCG6vTtXnu+F0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140006944"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2025 06:34:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCevB-0007sX-2o;
	Wed, 07 May 2025 13:34:49 +0000
Date: Wed, 7 May 2025 21:34:42 +0800
From: kernel test robot <lkp@intel.com>
To: Cyan Yang <cyan.yang@sifive.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Cyan Yang <cyan.yang@sifive.com>
Subject: Re: [PATCH 02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq
 vendor extensions
Message-ID: <202505072100.TZlEp8h1-lkp@intel.com>
References: <20250418053239.4351-3-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418053239.4351-3-cyan.yang@sifive.com>

Hi Cyan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cyan-Yang/dt-bindings-riscv-Add-xsfvqmaccdod-and-xsfvqmaccqoq-ISA-extension-description/20250418-133832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250418053239.4351-3-cyan.yang%40sifive.com
patch subject: [PATCH 02/12] riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
config: riscv-randconfig-r112-20250426 (https://download.01.org/0day-ci/archive/20250507/202505072100.TZlEp8h1-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505072100.TZlEp8h1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505072100.TZlEp8h1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/riscv/kernel/vendor_extensions/sifive.c:11:33: sparse: sparse: symbol 'riscv_isa_vendor_ext_sifive' was not declared. Should it be static?

vim +/riscv_isa_vendor_ext_sifive +11 arch/riscv/kernel/vendor_extensions/sifive.c

     9	
    10	/* All SiFive vendor extensions supported in Linux */
  > 11	const struct riscv_isa_ext_data riscv_isa_vendor_ext_sifive[] = {
    12		__RISCV_ISA_EXT_DATA(xsfvqmaccdod, RISCV_ISA_VENDOR_EXT_XSFVQMACCDOD),
    13		__RISCV_ISA_EXT_DATA(xsfvqmaccqoq, RISCV_ISA_VENDOR_EXT_XSFVQMACCQOQ),
    14	};
    15	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
