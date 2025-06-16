Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974CC2BEFE2
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750105918; cv=none; b=CxzPBzHnj2kkD4VaSsEHyClSekjaRWBW43M+DpCLxrTLw6x50pAhltJIfUsycyJNU/AtWOuFZxdnoUTtxZKK/mzKO4PzU+4Ga5gDTzjsPGkTgYTKNzG3opU1k7slYK/HuNITJVJtaZAF4ZaBqVtCZO6y3R/aRI3A/mW0LfoPY58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750105918; c=relaxed/simple;
	bh=MgCdLVTTAtUoKOk5If9G2gC5BCaozX6QWBBrB/BwDM0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qfI9hwX08XjSzrY9MBqRnpJO/5tjSfuA13m+9Cz1RJSTPnmNCLMyda+6xeyvERWpLdopX072C1Yc/0TDObSJpCAOIElm7Ap6u2j7QuGfHg2NP0Q1d7Le/JHYjj4OSkXzA0gks6lkc+1rbgAUlB3xGLDMyOXiB72KBdKKGPXvs6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMObYNJJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMObYNJJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750105917; x=1781641917;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MgCdLVTTAtUoKOk5If9G2gC5BCaozX6QWBBrB/BwDM0=;
  b=bMObYNJJcs619ZJtrkOJ7jHmqwZ6i3AvadXtGz9Hxe3G0O9St7qOnFKX
   cti/YXpC4e4KsIcRXk/Fz3ABEEfwN+VP5dR6NAXWXi3nGEgLk6JM1ESDC
   0cXATKCWNMHPZ9TKpiAJDv8rI0QN2TTPVKBwGAprXGQr/sNKsv4tdMkmF
   T1xvqJZQx5NZx0lyoTFlmmbrjNEY3RySpzFWMw2ZobK0gMkYNagLcNEva
   2b2JK5DibEQ1GHzRs0gMK8bgOsK/FrDXEoTPEF6kqsAGxQugmnzn2Assa
   NidmiJH8elq/6e9gP6tv3xrnd1f6RQ5hzsp7YUwOLzByU5paPOzc7CqdG
   w==;
X-CSE-ConnectionGUID: s4LpZhufSpCwMGDA8bL1iw==
X-CSE-MsgGUID: AESplozmQiqANq12XD702Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51968722"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="51968722"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 13:31:56 -0700
X-CSE-ConnectionGUID: VMiKPuKGRQSZWsU6qnVEeA==
X-CSE-MsgGUID: oU7JRpFpT6mdppZ50bZQLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="179558276"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 Jun 2025 13:31:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRGUi-000FKe-2Y;
	Mon, 16 Jun 2025 20:31:52 +0000
Date: Tue, 17 Jun 2025 04:31:00 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ERROR: modpost: "__ld_r13_to_r23_ret" [lib/zstd/zstd_decompress.ko]
 undefined!
Message-ID: <202506170440.xI7L5buI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   44a5ab7a7958fbf190ae384b8ef252f23b840c1b
commit: 65d1f5507ed2c78c64fce40e44e5574a9419eb09 zstd: Import upstream v1.5.7
date:   3 months ago
config: arc-randconfig-001-20250617 (https://download.01.org/0day-ci/archive/20250617/202506170440.xI7L5buI-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506170440.xI7L5buI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170440.xI7L5buI-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__ld_r13_to_r23_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r22" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r19_ret" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r22_ret" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__st_r13_to_r15" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r24" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__st_r13_to_r19" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__st_r13_to_r23" [lib/zstd/zstd_decompress.ko] undefined!
ERROR: modpost: "__ld_r13_to_r24_ret" [lib/zstd/zstd_decompress.ko] undefined!
>> ERROR: modpost: "__ld_r13_to_r18_ret" [lib/zstd/zstd_decompress.ko] undefined!
WARNING: modpost: suppressed 4 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
