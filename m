Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF048221269
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 11:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749296627; cv=none; b=BN43FbB9z1gdFHiUQPBlS+tNWhaPk50xzw/ui9DuVbU7lsD7BOIlomP1vKjr+P5lWciAcfqVmeDrNHkJEqFMTUxAp+HFjzA8jNH2mqxbHuDGVgf+HbdNXJlgz3xVtMEI0y6ZSCC5jdB2gIE2JviZ1imww/vK3elHSJpAzo7WfzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749296627; c=relaxed/simple;
	bh=483QbhpRjLlPRWt3JzF5NtZ16KbMBWa4Gy7wbpDG398=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gRjGo0l5MWipbic21B/AnLWP4QvPPVfGMSZcGePdwx97K7xDgpDYMEOG0lIzdAq3bI+v1mQDUwKbUePPwMu7XuTfYg0ibp2WO19o8A9722N44C5NbOLcK0uSLhyFRwf2CJR3UrE5h5qnuFZ57Zq69B7WK9OkUkBfAgaoMlL6BHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KANGIfyA; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KANGIfyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749296626; x=1780832626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=483QbhpRjLlPRWt3JzF5NtZ16KbMBWa4Gy7wbpDG398=;
  b=KANGIfyAaw2vr5JN2Q1hr6r/ybnv/rO9dMNfk+XV6SIE7hBExpAyfuUQ
   5cuk0ITBSElLaDQ3hU/tHMtq3gVTP4iMfezyK2dOLwiBjLAHvu8Usc8qL
   ncyy7kXy32iaoNlq0XX5NWlgWCJydn8BKJgFxnqh/Dmx2BR5VPKrrtoOL
   7zWCzgD0ord4OMEa+R0kgGh/GY2uCqwN3TVIlnJuGaLCzzu6Zbo/NL8/1
   BCzjuU7Z9DyVXEEv614KT5+fJxY8mp3DXfuoP5yuUVr785i6PQgRaP67t
   d+SZ6QonkNmEH5nTel0HF+8i8K+iKzUcA7xW8iR6d+tDXUmsabF73xspy
   w==;
X-CSE-ConnectionGUID: fHE6mS6NReSaZOE6N8NjFQ==
X-CSE-MsgGUID: rOW3FPjYTw2piTXCtE6RtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="73965157"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="73965157"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 04:43:46 -0700
X-CSE-ConnectionGUID: Udb+b8oXTX+HZ6hiL4rcog==
X-CSE-MsgGUID: Zz+8sZQwRAunckrl9KL+HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="150934943"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jun 2025 04:43:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNrxd-0005lR-1k;
	Sat, 07 Jun 2025 11:43:41 +0000
Date: Sat, 7 Jun 2025 19:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: mm/maccess.c:41:17: sparse: sparse: incorrect type in argument 2
 (different address spaces)
Message-ID: <202506071929.Ane6iZuz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bdc7f8c5adad50dad2ec762e317f8b212f5782ac
commit: ca1a66cdd685030738cf077e3955fdedfe39fbb9 riscv: uaccess: do not do misaligned accesses in get/put_user()
date:   2 days ago
config: riscv-randconfig-r133-20250607 (https://download.01.org/0day-ci/archive/20250607/202506071929.Ane6iZuz-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250607/202506071929.Ane6iZuz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071929.Ane6iZuz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/maccess.c:41:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned long long [usertype] * @@
   mm/maccess.c:41:17: sparse:     expected void const [noderef] __user *from
   mm/maccess.c:41:17: sparse:     got unsigned long long [usertype] *
>> mm/maccess.c:43:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned int [usertype] * @@
   mm/maccess.c:43:17: sparse:     expected void const [noderef] __user *from
   mm/maccess.c:43:17: sparse:     got unsigned int [usertype] *
>> mm/maccess.c:45:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned short [usertype] * @@
   mm/maccess.c:45:17: sparse:     expected void const [noderef] __user *from
   mm/maccess.c:45:17: sparse:     got unsigned short [usertype] *
>> mm/maccess.c:46:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] * @@
   mm/maccess.c:46:9: sparse:     expected void const [noderef] __user *from
   mm/maccess.c:46:9: sparse:     got unsigned char [usertype] *
>> mm/maccess.c:73:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned long long [usertype] * @@
   mm/maccess.c:73:17: sparse:     expected void [noderef] __user *to
   mm/maccess.c:73:17: sparse:     got unsigned long long [usertype] *
>> mm/maccess.c:75:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned int [usertype] * @@
   mm/maccess.c:75:17: sparse:     expected void [noderef] __user *to
   mm/maccess.c:75:17: sparse:     got unsigned int [usertype] *
>> mm/maccess.c:77:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned short [usertype] * @@
   mm/maccess.c:77:17: sparse:     expected void [noderef] __user *to
   mm/maccess.c:77:17: sparse:     got unsigned short [usertype] *
>> mm/maccess.c:78:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned char [usertype] * @@
   mm/maccess.c:78:9: sparse:     expected void [noderef] __user *to
   mm/maccess.c:78:9: sparse:     got unsigned char [usertype] *
   mm/maccess.c:98:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned char [usertype] * @@
   mm/maccess.c:98:17: sparse:     expected void const [noderef] __user *from
   mm/maccess.c:98:17: sparse:     got unsigned char [usertype] *

vim +41 mm/maccess.c

eab0c6089b6897 Christoph Hellwig    2020-06-08  15  
e4137f08816bbf Sabyrzhan Tasbolatov 2024-10-11  16  /*
e4137f08816bbf Sabyrzhan Tasbolatov 2024-10-11  17   * The below only uses kmsan_check_memory() to ensure uninitialized kernel
e4137f08816bbf Sabyrzhan Tasbolatov 2024-10-11  18   * memory isn't leaked.
e4137f08816bbf Sabyrzhan Tasbolatov 2024-10-11  19   */
fe557319aa06c2 Christoph Hellwig    2020-06-17  20  #define copy_from_kernel_nofault_loop(dst, src, len, type, err_label)	\
b58294ead14cde Christoph Hellwig    2020-06-08  21  	while (len >= sizeof(type)) {					\
b58294ead14cde Christoph Hellwig    2020-06-08  22  		__get_kernel_nofault(dst, src, type, err_label);	\
e4137f08816bbf Sabyrzhan Tasbolatov 2024-10-11  23  		kmsan_check_memory(src, sizeof(type));			\
b58294ead14cde Christoph Hellwig    2020-06-08  24  		dst += sizeof(type);					\
b58294ead14cde Christoph Hellwig    2020-06-08  25  		src += sizeof(type);					\
b58294ead14cde Christoph Hellwig    2020-06-08  26  		len -= sizeof(type);					\
b58294ead14cde Christoph Hellwig    2020-06-08  27  	}
b58294ead14cde Christoph Hellwig    2020-06-08  28  
fe557319aa06c2 Christoph Hellwig    2020-06-17  29  long copy_from_kernel_nofault(void *dst, const void *src, size_t size)
b58294ead14cde Christoph Hellwig    2020-06-08  30  {
2423de2e6f4d86 Arnd Bergmann        2021-08-11  31  	unsigned long align = 0;
2423de2e6f4d86 Arnd Bergmann        2021-08-11  32  
2423de2e6f4d86 Arnd Bergmann        2021-08-11  33  	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
2423de2e6f4d86 Arnd Bergmann        2021-08-11  34  		align = (unsigned long)dst | (unsigned long)src;
2423de2e6f4d86 Arnd Bergmann        2021-08-11  35  
fe557319aa06c2 Christoph Hellwig    2020-06-17  36  	if (!copy_from_kernel_nofault_allowed(src, size))
2a71e81d321987 Christoph Hellwig    2020-06-08  37  		return -ERANGE;
b58294ead14cde Christoph Hellwig    2020-06-08  38  
b58294ead14cde Christoph Hellwig    2020-06-08  39  	pagefault_disable();
2423de2e6f4d86 Arnd Bergmann        2021-08-11  40  	if (!(align & 7))
fe557319aa06c2 Christoph Hellwig    2020-06-17 @41  		copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
2423de2e6f4d86 Arnd Bergmann        2021-08-11  42  	if (!(align & 3))
fe557319aa06c2 Christoph Hellwig    2020-06-17 @43  		copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
2423de2e6f4d86 Arnd Bergmann        2021-08-11  44  	if (!(align & 1))
fe557319aa06c2 Christoph Hellwig    2020-06-17 @45  		copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
fe557319aa06c2 Christoph Hellwig    2020-06-17 @46  	copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
b58294ead14cde Christoph Hellwig    2020-06-08  47  	pagefault_enable();
b58294ead14cde Christoph Hellwig    2020-06-08  48  	return 0;
b58294ead14cde Christoph Hellwig    2020-06-08  49  Efault:
b58294ead14cde Christoph Hellwig    2020-06-08  50  	pagefault_enable();
b58294ead14cde Christoph Hellwig    2020-06-08  51  	return -EFAULT;
b58294ead14cde Christoph Hellwig    2020-06-08  52  }
fe557319aa06c2 Christoph Hellwig    2020-06-17  53  EXPORT_SYMBOL_GPL(copy_from_kernel_nofault);
b58294ead14cde Christoph Hellwig    2020-06-08  54  
fe557319aa06c2 Christoph Hellwig    2020-06-17  55  #define copy_to_kernel_nofault_loop(dst, src, len, type, err_label)	\
b58294ead14cde Christoph Hellwig    2020-06-08  56  	while (len >= sizeof(type)) {					\
b58294ead14cde Christoph Hellwig    2020-06-08  57  		__put_kernel_nofault(dst, src, type, err_label);	\
e4137f08816bbf Sabyrzhan Tasbolatov 2024-10-11  58  		instrument_write(dst, sizeof(type));			\
b58294ead14cde Christoph Hellwig    2020-06-08  59  		dst += sizeof(type);					\
b58294ead14cde Christoph Hellwig    2020-06-08  60  		src += sizeof(type);					\
b58294ead14cde Christoph Hellwig    2020-06-08  61  		len -= sizeof(type);					\
b58294ead14cde Christoph Hellwig    2020-06-08  62  	}
b58294ead14cde Christoph Hellwig    2020-06-08  63  
fe557319aa06c2 Christoph Hellwig    2020-06-17  64  long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
b58294ead14cde Christoph Hellwig    2020-06-08  65  {
2423de2e6f4d86 Arnd Bergmann        2021-08-11  66  	unsigned long align = 0;
2423de2e6f4d86 Arnd Bergmann        2021-08-11  67  
2423de2e6f4d86 Arnd Bergmann        2021-08-11  68  	if (!IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS))
2423de2e6f4d86 Arnd Bergmann        2021-08-11  69  		align = (unsigned long)dst | (unsigned long)src;
2423de2e6f4d86 Arnd Bergmann        2021-08-11  70  
b58294ead14cde Christoph Hellwig    2020-06-08  71  	pagefault_disable();
2423de2e6f4d86 Arnd Bergmann        2021-08-11  72  	if (!(align & 7))
fe557319aa06c2 Christoph Hellwig    2020-06-17 @73  		copy_to_kernel_nofault_loop(dst, src, size, u64, Efault);
2423de2e6f4d86 Arnd Bergmann        2021-08-11  74  	if (!(align & 3))
fe557319aa06c2 Christoph Hellwig    2020-06-17 @75  		copy_to_kernel_nofault_loop(dst, src, size, u32, Efault);
2423de2e6f4d86 Arnd Bergmann        2021-08-11  76  	if (!(align & 1))
fe557319aa06c2 Christoph Hellwig    2020-06-17 @77  		copy_to_kernel_nofault_loop(dst, src, size, u16, Efault);
fe557319aa06c2 Christoph Hellwig    2020-06-17 @78  	copy_to_kernel_nofault_loop(dst, src, size, u8, Efault);
b58294ead14cde Christoph Hellwig    2020-06-08  79  	pagefault_enable();
b58294ead14cde Christoph Hellwig    2020-06-08  80  	return 0;
b58294ead14cde Christoph Hellwig    2020-06-08  81  Efault:
b58294ead14cde Christoph Hellwig    2020-06-08  82  	pagefault_enable();
b58294ead14cde Christoph Hellwig    2020-06-08  83  	return -EFAULT;
b58294ead14cde Christoph Hellwig    2020-06-08  84  }
ca79a00bb9a899 Sabyrzhan Tasbolatov 2024-10-16  85  EXPORT_SYMBOL_GPL(copy_to_kernel_nofault);
b58294ead14cde Christoph Hellwig    2020-06-08  86  

:::::: The code at line 41 was first introduced by commit
:::::: fe557319aa06c23cffc9346000f119547e0f289a maccess: rename probe_kernel_{read,write} to copy_{from,to}_kernel_nofault

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
