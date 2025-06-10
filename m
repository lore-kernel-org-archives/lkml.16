Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656AE28033E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545390; cv=none; b=NFQuDU45jlDtJMJtc59c8oCIJNI03MMSQury1BdGA4ojn2nTmX99CHZzcD9lQ5wblwxK4e64yC6288VPxZANqE30vZcVflZLuhSClPO2Y4mo4MouZ5RElkusNm2k29REeSQ7oIXcaB6V0aZ+VhwObVPosU+DS+Lz70nu+u8W9PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545390; c=relaxed/simple;
	bh=7LfT8GNcNcWGCusTpMvd4v+fIchh3wvdmfaj/Wu0fyo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dNQ5VkqoRGjjUEHjuxMxDe92nPENmyU3kLlUhFtU5hxk0FayTJeqtq1LNO9D6BVf+02aUf/jZ1OxuSLj05giMXI0CoPK2cyQCjra68dQf7OrKVlbQi1a9fHDAu+xHT6o3BZlqQKJgO04NJt/llUqZA4duVKhXnW4to0t0IxxY8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xl9X1Mhw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xl9X1Mhw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749545389; x=1781081389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7LfT8GNcNcWGCusTpMvd4v+fIchh3wvdmfaj/Wu0fyo=;
  b=Xl9X1Mhwhkwq6VaM+x6jY5sKbiQkxSwVMiATe3UQkojuSMTYHZVhBYId
   8Z6qn/WCYEBDcOkYjhfM6enOs1c+m+bZ8nxLZF7/wVGWhP67JjRJYc459
   OUZSASpiO9kI5oy110CDcDgJUB4igzTHhONsa7msFFYYzmwUOBApbHcU8
   GH+jwSq4pfEo+NsblownfBDWz2YnZWCdVsJ2Jfy7mnyhN/oomDrms70fP
   yFOEz+tcZOvYxi3+O2sh1bsohLX6KSuPvIpuLq7PeX7UZpxpr2c0bX31e
   WJpiBHsjr8Ursr4OGqQWyIqBqcVwg9ziXvjrbSxVDfEZLePW0YygvnCOZ
   g==;
X-CSE-ConnectionGUID: fAXUgZIGStiS9kCBxpBBKw==
X-CSE-MsgGUID: pRc/+QMNTj21PUrZO9a93Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="77045680"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="77045680"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 01:49:49 -0700
X-CSE-ConnectionGUID: Vw4DYjUjRN6OdeMc98DHfQ==
X-CSE-MsgGUID: 7G1Nj+92Sm20fko3BASL/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="147709703"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jun 2025 01:49:47 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOufx-0007zz-1p;
	Tue, 10 Jun 2025 08:49:45 +0000
Date: Tue, 10 Jun 2025 16:49:16 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 mem_alloc_profiling_enabled+0x18 (section: .text.unlikely) ->
 initcall_level_names (section: .init.data)
Message-ID: <202506101608.NmYI7eVO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
date:   5 months ago
config: xtensa-randconfig-r051-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101608.NmYI7eVO-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101608.NmYI7eVO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101608.NmYI7eVO-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: mem_alloc_profiling_enabled+0x18 (section: .text.unlikely) -> initcall_level_names (section: .init.data)
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/xtensa/platforms/iss/simdisk.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
