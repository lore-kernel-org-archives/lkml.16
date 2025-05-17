Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794D620C00D
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 16:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747498437; cv=none; b=eBcw9rmAA9JOvZed9XzudCl05xzNk0Vci6GgOOYFfL/dE0GDmM3KyP0j3KUoQqn0cyUAQC5Y2jwIj44uU+cgpHLkbevrnpzYZeM/mwGNfO5Xfq3A7g/ml0p2PG/paJrP9Le4LriPMGTmMyEufoZ8rwOyrcLDgtaVYcAox4dTPmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747498437; c=relaxed/simple;
	bh=q/Dr5kKHhbs2T2A3iYGa4mQeT/Q2D4jN1ZhD5Eetw/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5TumG6p73KIfDhpr6zwyZhbBd9quHaSAs4NCmgmOVuxU59LSbrUkuxBeClw0WJ8ohQin7RTcJFpfz4J9prA9bEg56INMbmKufPuTs2wDenreJMeU6Rz4BO+pQubRcJiFQTvrca2mCujZuTaMW9YBz7K1JaUCMQ2h0kojy4SaXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVSEtg0t; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVSEtg0t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747498436; x=1779034436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q/Dr5kKHhbs2T2A3iYGa4mQeT/Q2D4jN1ZhD5Eetw/U=;
  b=WVSEtg0t7ATQH5i2tCPRZLzNyJGedF0/WJwRDOLEnjI1cYiPnMtHZ9kK
   bIne81OTD4duajMXU5xFVIEL8Uxyh7QcRoQ7dsPOj3QsYIYsTnJ3G9pX3
   qCoLXvLYumEaAFY+KszgSQcr0zfjtDCCkb7HdmD/JlTt2yrjDXzYdm7Ua
   BsJ0P+YoJ7JRcu53VXhzHH9Ly1ngRyAELERgriuw1fa23k3bor+K89AtT
   GMyFC3oPJPvdFCaqZLXPjVIxcWTUpk0rza+ayiT4fCuGsPPgUx7z/KtnL
   NLs5osw1GbCw5z1dAy5zvDFNgltzcOWHyM9tgZxAxHi8XpSMiN2pGO41Z
   A==;
X-CSE-ConnectionGUID: P5JUHF6+Ti+i8XJWVzOFUg==
X-CSE-MsgGUID: qGIZ+RW2TOe5UEfNgNe+ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="48561612"
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="48561612"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 09:13:55 -0700
X-CSE-ConnectionGUID: SZD8oXWiTFa29ilmAPE4sw==
X-CSE-MsgGUID: zM3/QqmdRmGNvuGdlr/pOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,297,1739865600"; 
   d="scan'208";a="143948418"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 May 2025 09:13:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGKAY-000KEj-1n;
	Sat, 17 May 2025 16:13:50 +0000
Date: Sun, 18 May 2025 00:13:47 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Norris <briannorris@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tsai Sung-Fu <danielsftsai@google.com>,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v3] genirq: Add kunit tests for depth counts
Message-ID: <202505172307.yTjulMhx-lkp@intel.com>
References: <20250516183213.848182-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516183213.848182-1-briannorris@chromium.org>

Hi Brian,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Norris/genirq-Add-kunit-tests-for-depth-counts/20250517-023519
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20250516183213.848182-1-briannorris%40chromium.org
patch subject: [PATCH v3] genirq: Add kunit tests for depth counts
config: arm64-randconfig-001-20250517 (https://download.01.org/0day-ci/archive/20250517/202505172307.yTjulMhx-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250517/202505172307.yTjulMhx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505172307.yTjulMhx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kunit_binary_ptr_assert_format
   >>> referenced by irq_test.c:54 (kernel/irq/irq_test.c:54)
   >>>               kernel/irq/irq_test.o:(irq_disable_depth_test) in archive vmlinux.a
   >>> referenced by irq_test.c:54 (kernel/irq/irq_test.c:54)
   >>>               kernel/irq/irq_test.o:(irq_disable_depth_test) in archive vmlinux.a
   >>> referenced by irq_test.c:81 (kernel/irq/irq_test.c:81)
   >>>               kernel/irq/irq_test.o:(irq_free_disabled_test) in archive vmlinux.a
   >>> referenced 5 more times
--
>> ld.lld: error: undefined symbol: kunit_try_catch_throw
   >>> referenced by irq_test.c:0 (kernel/irq/irq_test.c:0)
   >>>               kernel/irq/irq_test.o:(irq_cpuhotplug_test) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
