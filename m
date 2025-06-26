Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD0E2F1FDE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 00:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750899593; cv=none; b=J5Fi7NucjhCqQCpjFmfLsUJsaRUE6oBXRY8JbIh7BQIsf/cG/KweAAsahkwT68IjOuVvwRV9+KsDdgJsClOTItF9DouiVAJel9KIF5TgK6XSbgvTbZVs3LMS8voAXqRJWKuABioRttI392nXtVXKAaW9QQQjqC6k8kGdoNepHXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750899593; c=relaxed/simple;
	bh=1g6viRrj9kcWFZzmaCX5ijC1e4JJFvw7EVRPQMaIY6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t8TRPQ+2A07SpRJhpKDeqtNSpJJMyhUFoVE8M4dONjxU7tEQu8kF5i9vW6SIy9RXhlI5EqSHlzXhXQMNrUBpHwNRsGgzkNDC3Em5b4gVFlwVyojRYkxAKQFl2GySXCbEccH/QmdNTCaPlLrchk9qLWg1XkHwZS6G1E8UNs3yxS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h2mDlk84; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h2mDlk84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750899592; x=1782435592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1g6viRrj9kcWFZzmaCX5ijC1e4JJFvw7EVRPQMaIY6Y=;
  b=h2mDlk84oweZkJ8WgtwTzxUkUHMne8gofD7EWIkXqewvaqtzQIiY8luS
   WcxBNKCU8ioC7QF6eicSPyobuLAy5rUNLcN2RGgukBBsw6NU6cv5nTov0
   3BkaRovwRDNiAVBLf/rE3/gNzbBD+ssv7xILUxcOlYjHeF5l2oMvwe6pC
   RVoFbsMF1HF97iITcZHQAAv1/ZHewj8pOUNw5VAAu2Rm6pSKj5Ix05H0o
   vmnEWqwY8qmQ9dcK91qLHpZ/7ni21HSRGzyIWWDppzNvI3QE35LL/sKwh
   ht6WxmgKVSsLvOcDeZFzHEXZJnSD2yuQaD3ZheeoKnSGh6zfVAZ75jy7O
   A==;
X-CSE-ConnectionGUID: 9i7CYKUXQEC3rFaQ1Wdi4g==
X-CSE-MsgGUID: 9r/layYgSpWJjxfbnajSkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="55811854"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="55811854"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 17:59:51 -0700
X-CSE-ConnectionGUID: wStyQmh3QfeCPKR9xCo90Q==
X-CSE-MsgGUID: cmNs/mbfSDKJxwcdoRlxAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="151985787"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Jun 2025 17:59:50 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUaxv-000TaY-2r;
	Thu, 26 Jun 2025 00:59:47 +0000
Date: Thu, 26 Jun 2025 08:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250616 19/19] Warning:
 drivers/gpu/drm/xlnx/zynqmp_disp.c:103 Excess struct member 'xt' description
 in 'zynqmp_disp_layer_dma'
Message-ID: <202506260858.2DTGYCvK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250616
head:   78f053980ba50a0becae798ab7d07527d97e790d
commit: 78f053980ba50a0becae798ab7d07527d97e790d [19/19] treewide: Avoid -Wflex-array-member-not-at-end warnings
config: arm64-randconfig-004-20250626 (https://download.01.org/0day-ci/archive/20250626/202506260858.2DTGYCvK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260858.2DTGYCvK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260858.2DTGYCvK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/xlnx/zynqmp_disp.c:103 Excess struct member 'xt' description in 'zynqmp_disp_layer_dma'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
