Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ACD1A238D
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747114097; cv=none; b=Y+pHzZdQ7XQCEkTzAt8zpYua/LEEFChoKFi7fkrBJXTZlI3Yz3mwOLI/97RTgAVAQuO1uybWTGyCH1+A2E04unWl8ZDtdt2zQ2ZfCNOlf+HSjtS7RSG7A0wrv/7kodtamYW7fb7tbDjHICrO6gKeTser35EBbwI1BicdODT36MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747114097; c=relaxed/simple;
	bh=3rSkmiQ5jHQlroCrD9dPMs4HAs3GNb9C9q7u+y2Jas8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c6VhRpjYnWyd0abQ5z4bRPvQH69xG09GIn3uAcowW1xxvyof8xNsB/mshqIp66I1OMYQ/VS8aJZY7sJ6XYkvsMRxCP9Ik21gG3jDsPdZEOfiPo0wNyoGBU45I7DshQDjtsKMkYCw2xIF/ZxbTWQLi6Lgo7X193pV+U2KfOdFprM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNdNB5i7; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNdNB5i7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747114093; x=1778650093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3rSkmiQ5jHQlroCrD9dPMs4HAs3GNb9C9q7u+y2Jas8=;
  b=UNdNB5i7UyauvMQTYA6jHO/s7P81R6Zc0ATtvZGAwl7RDN8jfrKqbmhW
   3PZFEPHFhmk3nqRgCcEmTqTqWXTuuhInO0x1J4nr7CEAkTIQ3R+kWsyrJ
   xo+SH/yAkY5w6H9m+rGvzWX/h2ehIPYtCZuDOrpCfWItJ+/1MCAYTbKjc
   x462xE0sIAjS/Pfgk7JNWrOHiX3ad/BvIsT7Ye8qn9HtMKjrAFS+ABaLN
   DECjTZma5CNfZQSxLKVkRYshXlryLerncxcF8vUxONtyQZJjH/CMgnJ6u
   B93V1qUlDa1cfLcbrdyXaYHQEQs3j8zg2seLAmibgGx0NgQWxqrS7CTbV
   g==;
X-CSE-ConnectionGUID: y/txQF9WRiy/LCgPYm7LUA==
X-CSE-MsgGUID: hXvk4Nf4RLyWmmcGusnJ4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="66345891"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="66345891"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 22:28:12 -0700
X-CSE-ConnectionGUID: 5oai/k18QsSUMYFu70AxcA==
X-CSE-MsgGUID: HGHrWYsLSbeKM0U4Ufn/CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="138114573"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 May 2025 22:28:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEiBU-000FjX-1h;
	Tue, 13 May 2025 05:28:08 +0000
Date: Tue, 13 May 2025 13:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rich Felker <dalias@libc.org>
Subject: kismet: WARNING: unmet direct dependencies detected for G2_DMA when
 selected by SND_AICA
Message-ID: <202505131320.PzgTtl9H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9565e23cd89d4d5cd4388f8742130be1d6f182d
commit: f477a538c14d07f8c45e554c8c5208d588514e98 sh: dma: fix kconfig dependency for G2_DMA
date:   4 years, 4 months ago
config: sh-kismet-CONFIG_G2_DMA-CONFIG_SND_AICA-0-0 (https://download.01.org/0day-ci/archive/20250513/202505131320.PzgTtl9H-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250513/202505131320.PzgTtl9H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131320.PzgTtl9H-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for G2_DMA when selected by SND_AICA
   WARNING: unmet direct dependencies detected for G2_DMA
     Depends on [n]: SH_DREAMCAST [=y] && SH_DMA_API [=n]
     Selected by [y]:
     - SND_AICA [=y] && SOUND [=y] && !UML && SND [=y] && SND_SUPERH [=y] && SH_DREAMCAST [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
