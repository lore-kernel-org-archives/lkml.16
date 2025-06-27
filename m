Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9BF21ABCF;
	Fri, 27 Jun 2025 07:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751008461; cv=none; b=TiJWkfNN2+R4TI7quKAefso0HJ0lZFoAni06+J6ieotyxj1L0K262adNtaixWsBMmBuCLqj2R7xLNGuxmFe2uhQMAcAu9zWGWLpEAtC3ZPfy4AJNzMglNxfkyXqWAn+qatfVI6W3nNLgXes5AQt5Uk4RfndnN1JnjoVwVADfCdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751008461; c=relaxed/simple;
	bh=r7WqAqDZvux8ILvAUvJ0zRMtKQ3KYersyvbrv0LPqXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5vZUL57Xjsg0JOG0eQnJusB07gGqc5Sg5la6aIwJaAwwPPJcmufNDWmHKU7JowS0hagKvtlO+locNVZKcBMsAEcCYnV5pbzlqBOgHolJ6x5xhLL0cGlKkUJ19j8sKQ0f+pFUpRXYS988+SrBoQGHVdl/Rjw5h7c30zBOw6JeCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKSqKMVW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKSqKMVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751008460; x=1782544460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r7WqAqDZvux8ILvAUvJ0zRMtKQ3KYersyvbrv0LPqXM=;
  b=XKSqKMVWbDc6tmvkDXUO+Hn7zcZP59EQT/XdgT4x66jHecfBjStPosvP
   ZNa58W2PE39uR+NREUD1b491ZqLdhYeS0/4RuHFZkPXj4fKxGdWkDUwrt
   bL+t4bv/J6GTW1Oq/Q0DIPFuWmaxzA7va3Mx+vSLGy8qvOIZQ/bKM1SLa
   915VCfDggDFUy9rHf4efqQ1li1dChqnv12r0neV2TD4AKX4YXpsHlQCVk
   to/cChyaXwTcHM1OTwUYp+OLnMZy7F8pJUSs/shdReyNn27+qXMpiLW2a
   GcuNV20cSdIIgrfIHWdIGMaAbxlisZQviVNvMVG1VDmtrkWXVfvxF0u9C
   g==;
X-CSE-ConnectionGUID: swgDw5tzQ5W5IltR/BavhQ==
X-CSE-MsgGUID: WmjrFVnlRqqS3/naYACJVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53413931"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="53413931"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 00:14:19 -0700
X-CSE-ConnectionGUID: 8Z9o0froSrqnqnj4QFd/XQ==
X-CSE-MsgGUID: gH+DYWqxQhilc/m8cjiI4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="158468558"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Jun 2025 00:14:17 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV3Hq-000VuA-2m;
	Fri, 27 Jun 2025 07:14:14 +0000
Date: Fri, 27 Jun 2025 15:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: hsyemail2@gmail.com, Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sheng-Yuan Huang <syhuang3@nuvoton.com>
Subject: Re: [PATCH v3 1/1] USB: serial: nct_usb_serial: add support for
 Nuvoton USB adapter
Message-ID: <202506271430.ZtD5WXck-lkp@intel.com>
References: <20250623071713.12814-2-syhuang3@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623071713.12814-2-syhuang3@nuvoton.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on johan-usb-serial/usb-next]
[also build test WARNING on johan-usb-serial/usb-linus usb/usb-testing usb/usb-next usb/usb-linus tty/tty-testing tty/tty-next tty/tty-linus linus/master v6.16-rc3 next-20250626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/hsyemail2-gmail-com/USB-serial-nct_usb_serial-add-support-for-Nuvoton-USB-adapter/20250623-151955
base:   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git usb-next
patch link:    https://lore.kernel.org/r/20250623071713.12814-2-syhuang3%40nuvoton.com
patch subject: [PATCH v3 1/1] USB: serial: nct_usb_serial: add support for Nuvoton USB adapter
reproduce: (https://download.01.org/0day-ci/archive/20250627/202506271430.ZtD5WXck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271430.ZtD5WXck-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.78.0-bindgen-0.65.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS= -fno-crash-diagnostics -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 --keep-going LLVM=1 -j32 ARCH=x86_64 versioncheck
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
   ./drivers/media/i2c/ov02c10.c: 12 linux/version.h not needed.
>> ./drivers/usb/serial/nct_usb_serial.c: 29 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 432: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
