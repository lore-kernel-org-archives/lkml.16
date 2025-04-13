Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE69F17F4F6
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 20:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744577340; cv=none; b=h9vNZm/FSkyMeBtwKn/stkMZ+yDfT70kTP/7r8zPaBRQXp41Rp0iowrBiTTUs2uM/7eJ3qxIg7kmwKSwmCoo17wPlJUjr6S3Mx+72PP0xLWclW7QM296YACBjpMf9EyXnIm9EIietvS4n2DHP+39L7UhPIBmkfw8hFMzdCAqxqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744577340; c=relaxed/simple;
	bh=GwsfUzYaLCBUf7vIoP/MMIApw3ANVBJmta5sveYTZlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HB+OmtMqKkyZJkePumDnbzIbOkiW2pI+e0x3Hl16JJ/wwl89H+uZQSplnrB/zDYXhzIOTjezBpbQPyT/0Pog90qTNqO1+EnkMBiybYWakkPRZDTMUlHM+Sxf6WVj2Cgw9QZ/sX+p0WUzNltUL1MBpEc08olr7SpSRO+lE5vXkB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eW5cku7s; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eW5cku7s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744577339; x=1776113339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GwsfUzYaLCBUf7vIoP/MMIApw3ANVBJmta5sveYTZlI=;
  b=eW5cku7sbVzN2qmgNFxTY8n9HyyPGg/HSNr4CXBqnSIxBzyaawWUKxLJ
   mbforidr/0MuMEZUl6OlHipdNmx5KPhw6ujr4xpJ0SjDY2XJaZuOhakp+
   BQ8CsQBQTjeV7liZ35zazisSm35E97jwnBOeFnhgrmG26fSgk0td+nLdo
   +ibqDyhJxVXnV5Dvk3EIaKRT2cWb4/3kHx0vF54EvwVmwLkxQa8cAP2F/
   xoLyb/vRm6Di2iLwNIzsgaqQENwBKosflAZQNFGUl7SQqU41T5mFKv3o/
   WFWAiOz6If+Hn2OINLyEIBWYSOuRoMva6TxBej2FVMujQd0AOXaRtJdCE
   A==;
X-CSE-ConnectionGUID: HyerOWrKS/S8A0mC/RsSKw==
X-CSE-MsgGUID: eakjWEjaTRijqo5784YGJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="48744949"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="48744949"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 13:48:58 -0700
X-CSE-ConnectionGUID: KKLRlElkRL2WttmST/vvIg==
X-CSE-MsgGUID: Hk8vAQpxTSOQ/C5KxLt96Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="129616917"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Apr 2025 13:48:57 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u44G6-000CtW-16;
	Sun, 13 Apr 2025 20:48:54 +0000
Date: Mon, 14 Apr 2025 04:48:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: <stdin>:4:15: error: use of undeclared identifier 'csum_partial'
Message-ID: <202504140435.2OoLcwfS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ffd015db85fea3e15a77027fda6c02ced4d2444
commit: 9c3681f9b9fd12cdbc4a542df599f1837512f3d5 kbuild: Add gendwarfksyms as an alternative to genksyms
date:   3 months ago
config: um-randconfig-r073-20250414 (https://download.01.org/0day-ci/archive/20250414/202504140435.2OoLcwfS-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504140435.2OoLcwfS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504140435.2OoLcwfS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <stdin>:4:15: error: use of undeclared identifier 'csum_partial'
       4 | EXPORT_SYMBOL(csum_partial);
         |               ^
>> <stdin>:5:15: error: use of undeclared identifier 'csum_partial_copy_generic'
       5 | EXPORT_SYMBOL(csum_partial_copy_generic);
         |               ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
