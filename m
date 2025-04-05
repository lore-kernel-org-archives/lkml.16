Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D1213AA31
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743868599; cv=none; b=pOUw10ZDto2YctmMkW4PwOCjeLjrbn4oqtp1lMqk78qVC/b2mX0mwWokzTIhs2SLdGyJMKdLIS64n7ck8luSiys/HXVWswTSa6Y1UCdYSxG0sN+QIEEN+L6TtORadsj3x9rYw1/CqTZyFX9TCBndepiDWRol+SZcPm0Lf4P7l/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743868599; c=relaxed/simple;
	bh=l2vXHFW49XxHHHkNIgLn8Ijs9q+hx64EoXxG3KaCq3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oetfU0ZlE4r6qAq2yHg/dkA4sy6klM+rTnikxp6bbkDu0k2ob/5fWcTHTB6LzP5yMoFR8GMwSgZ6H8JTYaLnL3KIj2UgHu2uEzxz+8aVLbfszl3iUOye0pUXn4VNrTRJrRKsN3LWgUTX2ey02OVGswx+XNQMT5Ypz2km9aTYhAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EP3notwM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EP3notwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743868598; x=1775404598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l2vXHFW49XxHHHkNIgLn8Ijs9q+hx64EoXxG3KaCq3g=;
  b=EP3notwMZWIddYRkvFgMI8tkFqIUXBP6+9Ou0UJ0Hd/8/izl8Hhg6WyV
   PEbkMM8zxUeWeGj37cvIWFslWg8tPWMsfMTkb0T+UA1jczaL5yYdkF0kj
   aSloQaVmF2XfRmxOXLqXD1n3TDMkUo9s/CkTJ9dgJMMdPjbgjlr+CVgoD
   H9Iw1fonMGSorDaamQNEPcnnexJVXGQ7hPBIiNgllgmqO2ofdnE1jXSSx
   3rDzDDseloYFl2nNqcs3gT91E9+bifxOPKeMttf7P0Tirr1smMhL5vR8x
   oPO5M+E7WCNc0o2JR6XWhBzOoWKe3Jgq60rW7fqhcxgRPusznaghismAP
   A==;
X-CSE-ConnectionGUID: BDZAWFgHQvuzTgzREHN2xQ==
X-CSE-MsgGUID: brt0wAxBSZag/qy7+XEp6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="56670383"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="56670383"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 08:56:37 -0700
X-CSE-ConnectionGUID: Tx+rfS8cSc6qdurkrXso9w==
X-CSE-MsgGUID: /Bwu7ftWSsW9TUWtnRsVkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="150766546"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Apr 2025 08:56:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u15sl-00028B-2b;
	Sat, 05 Apr 2025 15:56:31 +0000
Date: Sat, 5 Apr 2025 23:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH v2] x86/xen: fix balloon target initialization for PVH
 dom0
Message-ID: <202504052301.dMtJILzp-lkp@intel.com>
References: <20250404133459.16125-1-roger.pau@citrix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404133459.16125-1-roger.pau@citrix.com>

Hi Roger,

kernel test robot noticed the following build errors:

[auto build test ERROR on xen-tip/linux-next]
[also build test ERROR on tip/x86/core linus/master v6.14 next-20250404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Roger-Pau-Monne/x86-xen-fix-balloon-target-initialization-for-PVH-dom0/20250404-214218
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
patch link:    https://lore.kernel.org/r/20250404133459.16125-1-roger.pau%40citrix.com
patch subject: [PATCH v2] x86/xen: fix balloon target initialization for PVH dom0
config: x86_64-buildonly-randconfig-003-20250405 (https://download.01.org/0day-ci/archive/20250405/202504052301.dMtJILzp-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504052301.dMtJILzp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504052301.dMtJILzp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xen_released_pages
   >>> referenced by balloon.c
   >>>               drivers/xen/balloon.o:(balloon_init) in archive vmlinux.a
   >>> referenced by balloon.c
   >>>               drivers/xen/balloon.o:(balloon_init) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
