Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28B81FF7B4
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 02:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745636067; cv=none; b=Nt/kmP4al0X3lkocXPi00ZBm9YA4J5GhrdCsffeelhGtTA5vfi7RFAYQxUgpscr+Nt5lecI26JBTXalbBeJ6QFN1823+3XHcoskQmB7jzegvHd6A09wjYeZVZHCUVw08uHwkReerTZBkzpHeXQuhUEM1YsSDXuzramWC2zZZ0js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745636067; c=relaxed/simple;
	bh=krWw2qpJONsAnp99cvlMBBYaMm3NDLtFvniWE1+WEp0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tuLGKYWQhzL3hdg9iOtI0wUOV/ZiXwInHFA9w4S1Iw3Fji46NU3ZCRoNJBnxM0X6abrOuEN6aguwBzoix3I6Fn0GnPvbauhDKL/nz3UrtRY3Z8PZsgauIv0h0yQgwt3j4qX00vMA8SebSXOtGU1doSdJt++coFeOQhlkTJljujo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVv+o9EY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVv+o9EY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745636066; x=1777172066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=krWw2qpJONsAnp99cvlMBBYaMm3NDLtFvniWE1+WEp0=;
  b=aVv+o9EY8DLLhMIGQvJw5XJum74RiIJTnyyr0NAao1ffl9WlkejUfjY0
   exWaMFRNb9+utnzOWNK8h5sNZ17nm8g3RWoD3AzPTtPsDeINqL/6574l1
   vjmZBhlr0YghNYsDKLoAei944lLk07/tOFOiYG9PxVBoh+4jnYP/+EuYV
   LTwH71QBikQQ0lw9kN5cRjM+gqSGXzdmyhOLiWaOIfm6TML1KRvu5jSG6
   YBDiSCfrW5TctrT4chiBzkXRwZYv1DA+jFQCEiVOW70ixO3p06qk5cHR/
   UBTuIQJ+QXTqxF1rUXMixQPDJjjyzZKi+ZwCszeHvhQ/aPe89P0LuXJJb
   g==;
X-CSE-ConnectionGUID: DENZC/ezSFy8egl/Jph5Ww==
X-CSE-MsgGUID: jI7lDBVyQRSu2BUza9iUyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47467626"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="47467626"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 19:54:25 -0700
X-CSE-ConnectionGUID: hOn8ZKmjRayOjQGTM9ITqg==
X-CSE-MsgGUID: SkSofne1T1CYIyfOrLIQrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="137100832"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Apr 2025 19:54:23 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8VgL-0005fz-2I;
	Sat, 26 Apr 2025 02:54:21 +0000
Date: Sat, 26 Apr 2025 10:53:49 +0800
From: kernel test robot <lkp@intel.com>
To: Bertrand Wlodarczyk <bertrand.wlodarczyk@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Tim Chen <tim.c.chen@linux.intel.com>
Subject: mm/vmscan.o: warning: objtool: shrink_node+0x1a59: sibling call from
 callable instruction with modified stack frame
Message-ID: <202504261055.rmRAbIb9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 6e80c0aaad469e0a923ea0d7018fb1464e992018 vmscan, cleanup: add for_each_managed_zone_pgdat macro
date:   6 weeks ago
config: x86_64-randconfig-104-20250426 (https://download.01.org/0day-ci/archive/20250426/202504261055.rmRAbIb9-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504261055.rmRAbIb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504261055.rmRAbIb9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.o: warning: objtool: shrink_node+0x1a59: sibling call from callable instruction with modified stack frame

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
