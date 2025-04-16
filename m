Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF521ABB2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744811947; cv=none; b=OSzcQ4BBXVB1DTd9FLvLOrGNt/PTgLPBsRZ+TjafO/ujm/LUq0G0tr0OEglj6zAci2zCIgT5EV1bGPmc9bXvohvsa02dZyWcNtqJs8hbZVgelgIeikRC2uGNJtsANIp7XfZj0MjU3vzREmxUz8HXz+E3Rfs1ebrvPNfQzchEscY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744811947; c=relaxed/simple;
	bh=hn6xwOP93/yhoELlBY8V8Xuv/wDTtTZJFnraUzSgg0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sw7z6ZzP7CCE35MZ6DlFg9Vvc5baLtqaRHJ6lrbl9paCvIF46UwbyzpWOeHUJkHTWuEEt7771HBRy6XIaan7sPydbWn1NK05GEiJINPOR6PhdfUdSoNSRyHeEadCWECvnuF8shuno30I9n18tvWwFwbdBt992TCRiATXSV4xw4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RaPiPvdR; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RaPiPvdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744811946; x=1776347946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hn6xwOP93/yhoELlBY8V8Xuv/wDTtTZJFnraUzSgg0c=;
  b=RaPiPvdR9+zB7XSUQVH/ynI4nY93SMHDMyXHOTvCiHKENHW4GHL+eoZB
   tc3TpPbMwxqONW9PM3+W3PODX6y1mC/YylZ50VaDM57h3zqp7g3Nlv1u3
   VIyvlBanDlFJVdnlY/YR8v8VqvxReJ9yZ77WL8cu/U2q5qjCOGZXFcy+F
   DwHaJBVnkv5BxsRqDnymcuKDUVDav2KwW9BF3GIiduEkGuMKJhERg4jmn
   I+sHTDOWHVF8EMtVM6HfCdQciKhzcSrae59V1f1/JXgHBWOpocJpkV3nz
   tlhOO/Omfej15o1bYNyP6zzxX9ctf6LIGeW1MWSXPQQL4pHilaTk23GUP
   Q==;
X-CSE-ConnectionGUID: WHr9XmbsQe61CZUsZdHENw==
X-CSE-MsgGUID: XAdV1+LqRW2d+kyWTa2/Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50169605"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="50169605"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 06:59:05 -0700
X-CSE-ConnectionGUID: og39v+s6Sf277AFQZeP/fQ==
X-CSE-MsgGUID: h+35UNDxQyCysYGvgIBmow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135291556"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Apr 2025 06:59:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u53I4-000Jpw-0h;
	Wed, 16 Apr 2025 13:59:00 +0000
Date: Wed, 16 Apr 2025 21:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Song Shuai <songshuaishuai@tinylab.org>,
	linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Nick Kossifidis <mick@ics.forth.gr>,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>
Subject: Re: [PATCH v3 2/2] riscv: kexec_file: Support loading Image binary
 file
Message-ID: <202504162100.DHKsuYS1-lkp@intel.com>
References: <20250409193004.643839-3-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409193004.643839-3-bjorn@kernel.org>

Hi Björn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a24588245776dafc227243a01bfbeb8a59bafba9]

url:    https://github.com/intel-lab-lkp/linux/commits/Bj-rn-T-pel/riscv-kexec_file-Split-the-loading-of-kernel-and-others/20250410-033243
base:   a24588245776dafc227243a01bfbeb8a59bafba9
patch link:    https://lore.kernel.org/r/20250409193004.643839-3-bjorn%40kernel.org
patch subject: [PATCH v3 2/2] riscv: kexec_file: Support loading Image binary file
reproduce: (https://download.01.org/0day-ci/archive/20250416/202504162100.DHKsuYS1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504162100.DHKsuYS1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
>> Warning: arch/riscv/kernel/kexec_image.c references a file that doesn't exist: Documentation/riscv/boot-image-header.rst
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1804: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'htmldocs' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
