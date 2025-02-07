Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915F41DF725
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738930325; cv=none; b=RQYie2FCery7xDWVyBRdylMj2EdIwYduDaPw03frbXfZlsNJwpeJFlgREt1AQZd5RPfA6TWdOjls7O958YA0wa6uEtrW4IeN3/2vVxaKc8IOLxvFqv7lFAOiFWhoOWR2UptGyOcatN0N+pesgOV0E2bsGHMfy6WhI6jow7eYhSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738930325; c=relaxed/simple;
	bh=AmuQre01RLoUbWS2fm3+7JpCF3+k1864vDeFafj57Is=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qkuljx6Pz2LP4hX2p0gEDWpux8bi3xXnvexzMpxFYMLM4lphhqMEFx0FJs8XJBXPqWV0sdN9kCHAxmAjd2abFlrrb/LQTKkm5SxG/d834AvAZyfPl6yuPkVJIgriHb6ka0Ndhm1PhyRsq4hvf4LHQWQJL4Xj1vB8Y+9rJo4TsDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmQ8yLcT; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmQ8yLcT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738930324; x=1770466324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AmuQre01RLoUbWS2fm3+7JpCF3+k1864vDeFafj57Is=;
  b=DmQ8yLcT2I96VC8TwwGtu6n4y7+YFH+ESHyzKbMu53mhTDIGHBhqVRTp
   suhdkIWhRvBlLOu40ersR/k23AtFjjTvaOm2nBNYzJoFBWw+ml+aQSTy/
   YJnVl87ZHtNd2iSAHtPQcoTvu5Dr0n0iylQ5+VbdPnX5G044HMIa5kGuG
   lc6/5al8CWcDZpZxb5zH83e35aDvIjh76fvsIR8sMrI/hO5ZcUzshlG+l
   IJsM3tSwsxAcLXV85gRq/tloldZFVSkyd1hhXL+WeOMyv65RKVyfFmQWt
   ROVOdSBjUaudYiufaX2K3C3TPBOCDhsKVt4zoGIZQIWKOjFIMQQN8ovqI
   w==;
X-CSE-ConnectionGUID: KCvLSAZtS9CWrdu3B3XGjw==
X-CSE-MsgGUID: s5jPalTPS3yGf/yefNdYYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38797789"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; 
   d="scan'208";a="38797789"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 04:12:01 -0800
X-CSE-ConnectionGUID: onGf0nrSQLmZBKp2GDSVNg==
X-CSE-MsgGUID: wDZYPthyTRqAj6H9MVgPtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111358555"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Feb 2025 04:11:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgNDA-000yHH-0c;
	Fri, 07 Feb 2025 12:11:56 +0000
Date: Fri, 7 Feb 2025 20:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: Elizabeth Figura <zfigura@codeweavers.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/thread_info.h:259:25: error: call to '__bad_copy_to'
 declared with attribute error: copy destination size is too small
Message-ID: <202502072019.LYoCR9bF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bb066fe812d6fb3a9d01c073d9f1e2fd5a63403b
commit: c301e1fefc2d6c83a2beb47e9cdd7b59a90b0067 ntsync: No longer depend on BROKEN.
date:   4 weeks ago
config: i386-randconfig-001-20250207 (https://download.01.org/0day-ci/archive/20250207/202502072019.LYoCR9bF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502072019.LYoCR9bF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502072019.LYoCR9bF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:60,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from drivers/misc/ntsync.c:11:
   In function 'check_copy_size',
       inlined from 'copy_from_user' at include/linux/uaccess.h:207:7,
       inlined from 'setup_wait' at drivers/misc/ntsync.c:888:6:
>> include/linux/thread_info.h:259:25: error: call to '__bad_copy_to' declared with attribute error: copy destination size is too small
     259 |                         __bad_copy_to();
         |                         ^~~~~~~~~~~~~~~


vim +/__bad_copy_to +259 include/linux/thread_info.h

b0377fedb652808 Al Viro   2017-06-29  248  
9dd819a15162f8f Kees Cook 2019-09-25  249  static __always_inline __must_check bool
b0377fedb652808 Al Viro   2017-06-29  250  check_copy_size(const void *addr, size_t bytes, bool is_source)
b0377fedb652808 Al Viro   2017-06-29  251  {
c80d92fbb67b2c8 Kees Cook 2021-06-17  252  	int sz = __builtin_object_size(addr, 0);
b0377fedb652808 Al Viro   2017-06-29  253  	if (unlikely(sz >= 0 && sz < bytes)) {
b0377fedb652808 Al Viro   2017-06-29  254  		if (!__builtin_constant_p(bytes))
b0377fedb652808 Al Viro   2017-06-29  255  			copy_overflow(sz, bytes);
b0377fedb652808 Al Viro   2017-06-29  256  		else if (is_source)
b0377fedb652808 Al Viro   2017-06-29  257  			__bad_copy_from();
b0377fedb652808 Al Viro   2017-06-29  258  		else
b0377fedb652808 Al Viro   2017-06-29 @259  			__bad_copy_to();
b0377fedb652808 Al Viro   2017-06-29  260  		return false;
b0377fedb652808 Al Viro   2017-06-29  261  	}
6d13de1489b6bf5 Kees Cook 2019-12-04  262  	if (WARN_ON_ONCE(bytes > INT_MAX))
6d13de1489b6bf5 Kees Cook 2019-12-04  263  		return false;
b0377fedb652808 Al Viro   2017-06-29  264  	check_object_size(addr, bytes, is_source);
b0377fedb652808 Al Viro   2017-06-29  265  	return true;
b0377fedb652808 Al Viro   2017-06-29  266  }
b0377fedb652808 Al Viro   2017-06-29  267  

:::::: The code at line 259 was first introduced by commit
:::::: b0377fedb6528087ed319b0d054d6ed82240372c copy_{to,from}_user(): consolidate object size checks

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
