Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F4B2D3EFC
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030828; cv=none; b=nKAnebU1Tt596txUY4ZpI9JLv3Ibz4kGa+jdr+OP6Ql1va/7KRYmi87saT8ftUk5aXS1Q97XB7YYmixzEVMGE2VN69P7/fWj3P9rv97DdE1uUKmuzNgqo495FTsgix+OvJeeZzqvO+JcBgrPTNhONnpr5QMWMKMB1pb17oZrgNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030828; c=relaxed/simple;
	bh=+kIQ5VHvJN30K60J0VWbUzogD9+6Rd5JFkoTsIYhD3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P5ka7cD51rE4Hq1UwciQUfV/YFHrTyELl21O6g1RK3PO31gfJBDFzwiPg9rLXMShdBDZWphebmuBI2yy6RAXj+axTZvbNJ7M7TENL1V5NjbrGIXhwOIGkvhxf22L7riachzo3N2PAPMyf9zqoYX8r6YvrXWbfd5EffmO+Ev5MZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3zP03eW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3zP03eW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751030827; x=1782566827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+kIQ5VHvJN30K60J0VWbUzogD9+6Rd5JFkoTsIYhD3k=;
  b=B3zP03eWNduVqbzpOoBuBzVurd6hzxV0rNehGnb9t8OrLxhp++KQ/OPZ
   c6ECjl+f910cOJClQV5b2/SOupJAYNpBZBKsRN+BpgHf/HK/rXrOR4Qa4
   B85B7TUT+MDjVEPoOit6Ao02/T0J0nEGQdM4L7ivP1GhSVDkHzW5DYh+A
   I4laL2+54p4rYREDAArc7SQtn5+oBIPmvFJ+fsfVZLsi5/cdB7TIinJx4
   QTkiYZoA+37e6KOYacZHAM+fdBU4nZ4Y89eKUYy5behxiSybpJvOpyppM
   mFRYM+Nr5hJQlmdaDYKUtQlwqbj0OyweGZhQ9B85yuk76xJL0n6c7GOFD
   A==;
X-CSE-ConnectionGUID: gfnOR12uQcCeaFb2roKi/Q==
X-CSE-MsgGUID: X8bfJcfvRZ64yFgvfVjprw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="70913322"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="70913322"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 06:27:06 -0700
X-CSE-ConnectionGUID: fGQwhC+nQkuusG5LaKpopQ==
X-CSE-MsgGUID: IIfp3XjgQJqgOYa7qXHVWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152329228"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 27 Jun 2025 06:27:04 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV96c-000WCU-0v;
	Fri, 27 Jun 2025 13:27:02 +0000
Date: Fri, 27 Jun 2025 21:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SERIAL_OF_PLATFORM when selected by ECONET
Message-ID: <202506272102.tz4YMFgc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   67a993863163cb88b1b68974c31b0d84ece4293e
commit: 35fb26f94dfa1b291086b84b2421f957214824d1 mips: Add EcoNet MIPS platform support
date:   5 weeks ago
config: mips-kismet-CONFIG_SERIAL_OF_PLATFORM-CONFIG_ECONET-0-0 (https://download.01.org/0day-ci/archive/20250627/202506272102.tz4YMFgc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250627/202506272102.tz4YMFgc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506272102.tz4YMFgc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM when selected by ECONET
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
     Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=n] && OF [=y]
     Selected by [y]:
     - ECONET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
