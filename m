Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B386119C554
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747984827; cv=none; b=lUP7f1aHrCYjDSe4XVvY4yoKI3ec9qFSLBovoQ+JgERant7oOph6G/yBgNS9kyOplpYIggfj1ZDkmZ++Oo8zcScmD0iA/2bzASwEXu2OlIw4y2vBi+3nbEGp5FXKXRfbgpQzDEu+DSBBe24FI95z8v0OGcTqr6fPYO2ytL0syuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747984827; c=relaxed/simple;
	bh=fW7a3/gECDZY6ptlTYpQDHTPsytBdrwV8a3YoEnMvP4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kwpsWCTd2OOyNYodbDK/L6r1v3kOHxeVjyBuSL8Jf1RsUOxGRwvZx8ZzYPePHNxqZewhjBHdlJN6At6t37dBZOgnCVd37W+uV8XcJ8igFRi2QgBV5hgjLI5EG7eBUXPtfFRCcIVLz6ZJj5+U9P4AR40ZC0xdTuXyHO+oZAmAyHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOEBC0IJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOEBC0IJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747984826; x=1779520826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fW7a3/gECDZY6ptlTYpQDHTPsytBdrwV8a3YoEnMvP4=;
  b=DOEBC0IJHVnrXoVPvRWxnwywkH3NNrm6zXO2fsqI0jby6ltnHAkkKnSN
   Pnc+swEzz3veKxC/gP/6OetkND683i4AvTwyzxx5WPhAwkkl6F2HMaqk5
   shCaCXDM6Um+4c/NAJRSZP7quk2NZkl73UuNc7IyBGJiHMr9qFToHvaeQ
   Dy8ksB7NYvzUDO9PkfxgK0D+9/er+DGnl4+4YIvqWDWgWF6pOJfZ8/ixY
   w81eiB5biHd8ccLyvK4meh3PmcORTZD3lJ9ZB6Tc22XZMZ2djD16C+104
   26qVS06nyAkFJnl0LzoKUhG6Ytksqhzl8xOmiHGmkezc/LPdeLrF8a6eI
   A==;
X-CSE-ConnectionGUID: SJFzSt8qTpW/UsmBRazcnA==
X-CSE-MsgGUID: v+zi1e+QTaG7flcqIhwbxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49736942"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="49736942"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 00:20:25 -0700
X-CSE-ConnectionGUID: 9X9b2IQpRNGzGLl9NtcmSA==
X-CSE-MsgGUID: ijNJH/mKQui06Vrv8jxhNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="140877707"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 May 2025 00:20:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIMhZ-000Q9q-0Y;
	Fri, 23 May 2025 07:20:21 +0000
Date: Fri, 23 May 2025 15:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: ld.lld: error: call to __read_overflow marked "dontcall-error":
 detected read beyond size of object (1st parameter)
Message-ID: <202505231544.lATsLNnT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94305e83eccb3120c921cd3a015cd74731140bac
commit: 6ee149f61bcce39692f0335a01e99355d4cec8da kunit/fortify: Replace "volatile" with OPTIMIZER_HIDE_VAR()
date:   2 months ago
config: arm64-randconfig-r063-20250523 (https://download.01.org/0day-ci/archive/20250523/202505231544.lATsLNnT-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505231544.lATsLNnT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505231544.lATsLNnT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __read_overflow marked "dontcall-error": detected read beyond size of object (1st parameter)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
