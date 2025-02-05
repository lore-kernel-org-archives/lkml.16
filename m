Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4944314A4E9
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 13:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738763875; cv=none; b=YCD2l5rH4h7R7olQth6d+iDR1AiT7nBNpRNPUyT50uYUpBvHn55HbP57s4ZsOrisi2TrVX1GBEMFSAzxRkxIlcUEJ11jFYBfgACdLLUH04zO3zFSwgggZipRfcXmJ67qIr0TG8LLo4Fx4y01bR4Nr7Hd5SOnPaUy0h0xIAn5YdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738763875; c=relaxed/simple;
	bh=XO6sHeHiVrk5Gbdq9A3Bv2OzdJw+JX9+2VxND3IAoRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pKpe4YY7AEQdUn4ddL0guOva7noXRs6XFff4InIkSjxb6stMdqN2UfRW1S0xaQD8pUKaI9CqCxXZvyU3WgvMvyF1KGXgic8+vTlLt44mn1wPLjw3uXK1j479L+QNfBNR0nsLkfE/Y9SYgodEFOZWb8zElhaf7hEQTnfjUIRQ7/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgNFopqT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgNFopqT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738763873; x=1770299873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XO6sHeHiVrk5Gbdq9A3Bv2OzdJw+JX9+2VxND3IAoRw=;
  b=VgNFopqTN4lgqEB7VbrRvkg4Vuab8utTqR0qqDoMa0Ma8UunKFS5OG9n
   jdtCg0+p93JDKkkFaKM2w2aSXevBv1TEaC+a+JafyUa9CGeTyFeO/1L4A
   JaC5hhVxjO8LWTixHgdDmDAk0jI6rvJfPAM63KSa13QhsbrKAryQWkCWy
   3H5aI6PquaC74V2G5AxaGJBxJyZvs2QtAai4VxSsGsFvs7qiOtSguHZFX
   rchN4gE+AFD3+xjIdRhIAKeOUWak9I4Iw2PtLu4r8EjjMsZBN+l3biUD7
   Qun5QS12ONWzT+i+Jkz81N/eZnhJL+yF4Rp70qoCpBKJKEXAqS5PLzlj7
   Q==;
X-CSE-ConnectionGUID: 7lhEcEn+TzeU1VQ4ruYnhg==
X-CSE-MsgGUID: 9dmTT029Q6O6wWhwuAotyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39228743"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39228743"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 05:57:52 -0800
X-CSE-ConnectionGUID: 3ALrVzlYRwaFQIhZxqKMUw==
X-CSE-MsgGUID: +kNG5S86R/az5WaBD4NwTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115904238"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Feb 2025 05:57:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tffuV-000u69-2l;
	Wed, 05 Feb 2025 13:57:47 +0000
Date: Wed, 5 Feb 2025 21:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Ungerer <gerg@kernel.org>
Subject: arch/m68k/coldfire/gpio.c:27 __mcfgpio_set_value() warn: unsigned
 'gpio' is never less than zero.
Message-ID: <202502052133.bpeqHMoZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5c8c229261f14159b54b9a32f12e5fa89d88b905
commit: f212140962c93cd5da43283a18e31681540fc23d m68k: mcfgpio: Fix incorrect register offset for CONFIG_M5441x
date:   3 months ago
config: m68k-randconfig-r072-20250205 (https://download.01.org/0day-ci/archive/20250205/202502052133.bpeqHMoZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502052133.bpeqHMoZ-lkp@intel.com/

New smatch warnings:
arch/m68k/coldfire/gpio.c:27 __mcfgpio_set_value() warn: unsigned 'gpio' is never less than zero.
arch/m68k/coldfire/gpio.c:76 __mcfgpio_direction_output() warn: unsigned 'gpio' is never less than zero.

Old smatch warnings:
arch/m68k/include/asm/io_no.h:50 __cf_internalio() warn: always true condition '(addr <= 3758096384 + 536870912 - 1) => (0-u32max <= u32max)'

vim +/gpio +27 arch/m68k/coldfire/gpio.c

af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  24  
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  25  void __mcfgpio_set_value(unsigned gpio, int value)
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  26  {
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21 @27  	if (gpio < MCFGPIO_SCR_START) {
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  28  		unsigned long flags;
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  29  		MCFGPIO_PORTTYPE data;
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  30  
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  31  		local_irq_save(flags);
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  32  		data = mcfgpio_read(__mcfgpio_podr(gpio));
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  33  		if (value)
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  34  			data |= mcfgpio_bit(gpio);
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  35  		else
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  36  			data &= ~mcfgpio_bit(gpio);
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  37  		mcfgpio_write(data, __mcfgpio_podr(gpio));
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  38  		local_irq_restore(flags);
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  39  	} else {
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  40  		if (value)
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  41  			mcfgpio_write(mcfgpio_bit(gpio),
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  42  					MCFGPIO_SETR_PORT(gpio));
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  43  		else
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  44  			mcfgpio_write(~mcfgpio_bit(gpio),
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  45  					MCFGPIO_CLRR_PORT(gpio));
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  46  	}
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  47  }
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  48  EXPORT_SYMBOL(__mcfgpio_set_value);
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  49  
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  50  int __mcfgpio_direction_input(unsigned gpio)
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  51  {
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  52  	unsigned long flags;
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  53  	MCFGPIO_PORTTYPE dir;
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  54  
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  55  	local_irq_save(flags);
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  56  	dir = mcfgpio_read(__mcfgpio_pddr(gpio));
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  57  	dir &= ~mcfgpio_bit(gpio);
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  58  	mcfgpio_write(dir, __mcfgpio_pddr(gpio));
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  59  	local_irq_restore(flags);
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  60  
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  61  	return 0;
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  62  }
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  63  EXPORT_SYMBOL(__mcfgpio_direction_input);
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  64  
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  65  int __mcfgpio_direction_output(unsigned gpio, int value)
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  66  {
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  67  	unsigned long flags;
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  68  	MCFGPIO_PORTTYPE data;
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  69  
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  70  	local_irq_save(flags);
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  71  	data = mcfgpio_read(__mcfgpio_pddr(gpio));
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  72  	data |= mcfgpio_bit(gpio);
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  73  	mcfgpio_write(data, __mcfgpio_pddr(gpio));
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  74  
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  75  	/* now set the data to output */
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21 @76  	if (gpio < MCFGPIO_SCR_START) {
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  77  		data = mcfgpio_read(__mcfgpio_podr(gpio));
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  78  		if (value)
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  79  			data |= mcfgpio_bit(gpio);
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  80  		else
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  81  			data &= ~mcfgpio_bit(gpio);
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  82  		mcfgpio_write(data, __mcfgpio_podr(gpio));
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  83  	} else {
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  84  		 if (value)
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  85  			mcfgpio_write(mcfgpio_bit(gpio),
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  86  					MCFGPIO_SETR_PORT(gpio));
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  87  		 else
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  88  			 mcfgpio_write(~mcfgpio_bit(gpio),
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  89  					 MCFGPIO_CLRR_PORT(gpio));
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  90  	}
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  91  	local_irq_restore(flags);
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  92  	return 0;
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  93  }
eac57949947fa2 arch/m68k/platform/coldfire/gpio.c      Steven King      2012-05-21  94  EXPORT_SYMBOL(__mcfgpio_direction_output);
af39bb8b07af83 arch/m68knommu/platform/coldfire/gpio.c sfking@fdwdc.com 2009-06-19  95  

:::::: The code at line 27 was first introduced by commit
:::::: eac57949947fa24f47a2e993a1dbbfdb573b4301 m68knommu: refactor Coldfire GPIO not to require GPIOLIB, eliminate mcf_gpio_chips.

:::::: TO: Steven King <sfking@fdwdc.com>
:::::: CC: Greg Ungerer <gerg@uclinux.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
