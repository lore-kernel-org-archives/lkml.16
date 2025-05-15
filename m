Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66328C1F;
	Thu, 15 May 2025 01:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747272102; cv=none; b=I5km5CjdVssUMq8W+c/T3hSUQgQ18vynw72BVixzUE66LDSEWNo94lWM1UoLq9ETyQ0ZB9RTVa3JIwkDpksJPfdvlCWnjIeBFOkfFmv05TiUDTXmqyB0XxJWCUwsxw3P3L7u4h/2sEUNhiTMXVcIdGFIrtf8UQczVgfiGOK0Las=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747272102; c=relaxed/simple;
	bh=jgjSrlr/T0ZiWg2l9ELXgMwJAxZDAl6Zhb98CMnMTL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HH0lsUY0jTlAa1grxxgWOpsEekQbu5XSpi50JhAsCUaswNE7DcSKgkEuAyTpIHKY2wpq71BTETDzE06nis6XSBK3TdIFxMJQEkY3jLy6NbtQaUKmmlqbuymGhLAvHnDR/qS7s1sbbqiCgYgkWoCP3RiNRGWNrhydsLRHNEedrw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5/UdE2S; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5/UdE2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747272101; x=1778808101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jgjSrlr/T0ZiWg2l9ELXgMwJAxZDAl6Zhb98CMnMTL8=;
  b=R5/UdE2SIYX47ZIg9vWceYBmUw14BAc3y3zvgtz8NH2S7x8ljQjS6Ud6
   1ETHGStTh3VM3mP8CIAu9x58wk32TMotJ84DfwiHJ6A88q8K7+KNYHlCV
   4Dq7CDv/Y9rjGwSLpYJzhty9Pux8lZ0umNRccz/P/+1wpoHOd5VSAm/Xz
   KkoBWfhXGHSNt/eYyJJqgoVYj8ZmFkggBy4q/8JOC/w0b25xp8dTXEwbR
   jSbkn8AG3Pz47QXW1ih36Sjs6RxjjoQpVrbpLSvcRxIPDmYnI69GQk9eM
   raJECY2YzRHR+M43Xg83qeHRJbwkJPxAsdznspcDhlaLW8it8738w2OdA
   g==;
X-CSE-ConnectionGUID: ebNYtUzWS0mkbVuNrwsFjA==
X-CSE-MsgGUID: paNCFFFoRiK7wxbcdQnH/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52997096"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="52997096"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 18:21:40 -0700
X-CSE-ConnectionGUID: ZHDeO+p7Q5iDzwAbdYR0CA==
X-CSE-MsgGUID: QbWLwMJ8SnOi5SPFb4oH8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; 
   d="scan'208";a="138716109"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 May 2025 18:21:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFNHy-000Hkz-1M;
	Thu, 15 May 2025 01:21:34 +0000
Date: Thu, 15 May 2025 09:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Subject: Re: [PATCH v4 2/2] Allow for riscv-clock to pick up mmio address.
Message-ID: <202505150913.Iq1XRKqC-lkp@intel.com>
References: <20250514-riscv-time-mmio-v4-2-cb0cf2922d66@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-riscv-time-mmio-v4-2-cb0cf2922d66@htecgroup.com>

Hi Aleksa,

kernel test robot noticed the following build errors:

[auto build test ERROR on 9c32cda43eb78f78c73aee4aa344b777714e259b]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Paunovic-via-B4-Relay/dt-bindings-timer-mti-gcru/20250514-165347
base:   9c32cda43eb78f78c73aee4aa344b777714e259b
patch link:    https://lore.kernel.org/r/20250514-riscv-time-mmio-v4-2-cb0cf2922d66%40htecgroup.com
patch subject: [PATCH v4 2/2] Allow for riscv-clock to pick up mmio address.
config: riscv-randconfig-001-20250515 (https://download.01.org/0day-ci/archive/20250515/202505150913.Iq1XRKqC-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505150913.Iq1XRKqC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505150913.Iq1XRKqC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/jiffies.h:10,
                    from include/linux/ktime.h:25,
                    from include/linux/timer.h:6,
                    from include/linux/uprobes.h:18,
                    from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/kernel/asm-offsets.c:8:
   arch/riscv/include/asm/timex.h: In function 'random_get_entropy':
>> arch/riscv/include/asm/timex.h:39:9: error: implicit declaration of function 'get_cycles'; did you mean 'get_cycles_ptr'? [-Werror=implicit-function-declaration]
     return get_cycles();
            ^~~~~~~~~~
            get_cycles_ptr
   arch/riscv/include/asm/timex.h: In function 'get_cycles64':
>> arch/riscv/include/asm/timex.h:45:23: error: implicit declaration of function 'get_cycles_ptr_hi'; did you mean 'get_cycles_ptr'? [-Werror=implicit-function-declaration]
    #define get_cycles_hi get_cycles_ptr_hi
                          ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/timex.h:58:8: note: in expansion of macro 'get_cycles_hi'
      hi = get_cycles_hi();
           ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:98: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=2386734513
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2 shuffle=2386734513
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2386734513
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2386734513
   make: Target 'prepare' not remade because of errors.


vim +39 arch/riscv/include/asm/timex.h

d5be89a8d118a8 Palmer Dabbelt     2020-09-14  29  
aa9887608e77b8 Anup Patel         2020-09-27  30  /*
aa9887608e77b8 Anup Patel         2020-09-27  31   * Much like MIPS, we may not have a viable counter to use at an early point
aa9887608e77b8 Anup Patel         2020-09-27  32   * in the boot process. Unfortunately we don't have a fallback, so instead
aa9887608e77b8 Anup Patel         2020-09-27  33   * we just return 0.
aa9887608e77b8 Anup Patel         2020-09-27  34   */
aa9887608e77b8 Anup Patel         2020-09-27  35  static inline unsigned long random_get_entropy(void)
aa9887608e77b8 Anup Patel         2020-09-27  36  {
aa9887608e77b8 Anup Patel         2020-09-27  37  	if (unlikely(clint_time_val == NULL))
6d01238623faa9 Jason A. Donenfeld 2022-04-08  38  		return random_get_entropy_fallback();
aa9887608e77b8 Anup Patel         2020-09-27 @39  	return get_cycles();
aa9887608e77b8 Anup Patel         2020-09-27  40  }
aa9887608e77b8 Anup Patel         2020-09-27  41  #define random_get_entropy()	random_get_entropy()
7eeda0113dff84 Aleksa Paunovic    2025-05-14  42  #endif
aa9887608e77b8 Anup Patel         2020-09-27  43  
7eeda0113dff84 Aleksa Paunovic    2025-05-14  44  #define get_cycles get_cycles_ptr
7eeda0113dff84 Aleksa Paunovic    2025-05-14 @45  #define get_cycles_hi get_cycles_ptr_hi
ccbbfd1cbf365b Palmer Dabbelt     2020-11-25  46  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
