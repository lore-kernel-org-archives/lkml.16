Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7932581
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 04:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744432366; cv=none; b=FV4wWHRFl7hVuayBRS6uIgpqjFU/XDROZftE7VLsuzNgvd2JRmV382GF0EWTpiymJGQe2O6WaGFbtGydkVlW+bk9vNDVpGGMu+benuuDq31dXHBZJAauxwvZ2APTN1C5vUNZS7xfksJxHVlEkdQSVXe0vHo0SMB7Yz1lMmd7OYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744432366; c=relaxed/simple;
	bh=Evu5+ifxtFwPTNGrFhSdkdd+xpx/XtmnJoir2EVvjuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aT23eyNnO9eSbutp/xbzbn5xNXczHRjUTjgJSdLp9BPo9wXZ0M6Xk/6+VXQt/+63xYp9U/tObOEBdsDI8HIEMnVB0kuuVg3H1PRPrDvSoFQC7TlFzSrvNJwhLd2+4R17+ikWtzwKNxurC9HeLXdDZSKG+NpUOKNJd+dNVrhS0fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KSNwD+ay; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KSNwD+ay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744432364; x=1775968364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Evu5+ifxtFwPTNGrFhSdkdd+xpx/XtmnJoir2EVvjuI=;
  b=KSNwD+ay7D20WelCP9XjZTNiYUViwOQk1oAZit6SmXTLwewMdjEfoBsC
   lm5uu5H8eJSV4nbG8+D9acHFnzCOm2EJDa/UkthnnuQg84RKK8ywrETZS
   LhV14w8pt27LxmFibmIq18j9ivlin1oT1mUYZFVia3v8kdwIRGcQ0Dhxu
   EhzyMucCPBvqGV+Yk0V66h1o3XQKjH7k4Pqgk4GhKkdFmEZdKr7SO1um1
   +rP1yJ5iJV7lGaMtlBO0fliMGKJ8hhEcE8r7JciJps6xdbeB5no4MLwzQ
   6chbvyIqag3ixdlzuki4E6bAF04belEpmPrFDZtZ85K+lRR8Y0IPoTwED
   g==;
X-CSE-ConnectionGUID: QLQeI7b2QRKSBBjoTe5/rg==
X-CSE-MsgGUID: tJbTKp1eTBC/BbP6boqzQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="49816753"
X-IronPort-AV: E=Sophos;i="6.15,207,1739865600"; 
   d="scan'208";a="49816753"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 21:31:30 -0700
X-CSE-ConnectionGUID: W0NcofwzTz2bOrzO++tbdQ==
X-CSE-MsgGUID: FggYdAjKRm2QUWD5bUqv+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,207,1739865600"; 
   d="scan'208";a="129212219"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Apr 2025 21:31:29 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3SWd-000BZe-0I;
	Sat, 12 Apr 2025 04:31:27 +0000
Date: Sat, 12 Apr 2025 12:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [paulmck-rcu:dev.2025.04.09a 32/52]
 security/integrity/ima/ima_crypto.c:319:17: sparse: sparse: Initializer
 entry defined twice
Message-ID: <202504121256.tiCMP2yi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2025.04.09a
head:   45d581d282cfd358f599a7a53768519772444871
commit: 7388d97bfc3c63bc8bd9aa32ef8cbd78c7fdf135 [32/52] ratelimit: Reduce ratelimit's false-positive misses
config: arc-randconfig-r121-20250412 (https://download.01.org/0day-ci/archive/20250412/202504121256.tiCMP2yi-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250412/202504121256.tiCMP2yi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504121256.tiCMP2yi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/integrity/ima/ima_crypto.c:319:17: sparse: sparse: Initializer entry defined twice
   security/integrity/ima/ima_crypto.c:319:17: sparse:   also defined here
>> security/integrity/ima/ima_crypto.c:319:17: sparse: sparse: Initializer entry defined twice
   security/integrity/ima/ima_crypto.c:319:17: sparse:   also defined here
>> security/integrity/ima/ima_crypto.c:319:17: sparse: sparse: Initializer entry defined twice
   security/integrity/ima/ima_crypto.c:319:17: sparse:   also defined here
>> security/integrity/ima/ima_crypto.c:319:17: sparse: sparse: Initializer entry defined twice
   security/integrity/ima/ima_crypto.c:319:17: sparse:   also defined here
>> security/integrity/ima/ima_crypto.c:319:17: sparse: sparse: Initializer entry defined twice
   security/integrity/ima/ima_crypto.c:319:17: sparse:   also defined here
>> security/integrity/ima/ima_crypto.c:319:17: sparse: sparse: Initializer entry defined twice
   security/integrity/ima/ima_crypto.c:319:17: sparse:   also defined here
>> security/integrity/ima/ima_crypto.c:319:17: sparse: sparse: Initializer entry defined twice
   security/integrity/ima/ima_crypto.c:319:17: sparse:   also defined here
>> security/integrity/ima/ima_crypto.c:319:17: sparse: sparse: Initializer entry defined twice
   security/integrity/ima/ima_crypto.c:319:17: sparse:   also defined here

vim +319 security/integrity/ima/ima_crypto.c

3bcced39ea7d1b0 Dmitry Kasatkin  2014-02-26  315  
46f1414c8a92d85 Gilad Ben-Yossef 2017-10-18  316  	err = crypto_wait_req(err, wait);
3bcced39ea7d1b0 Dmitry Kasatkin  2014-02-26  317  
46f1414c8a92d85 Gilad Ben-Yossef 2017-10-18  318  	if (err)
3bcced39ea7d1b0 Dmitry Kasatkin  2014-02-26 @319  		pr_crit_ratelimited("ahash calculation failed: err: %d\n", err);
3bcced39ea7d1b0 Dmitry Kasatkin  2014-02-26  320  
3bcced39ea7d1b0 Dmitry Kasatkin  2014-02-26  321  	return err;
3bcced39ea7d1b0 Dmitry Kasatkin  2014-02-26  322  }
3bcced39ea7d1b0 Dmitry Kasatkin  2014-02-26  323  

:::::: The code at line 319 was first introduced by commit
:::::: 3bcced39ea7d1b0da0a991e221f53de480c6b60b ima: use ahash API for file hash calculation

:::::: TO: Dmitry Kasatkin <d.kasatkin@samsung.com>
:::::: CC: Mimi Zohar <zohar@linux.vnet.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
