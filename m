Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18EB1E412A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749459046; cv=none; b=HBM/bITWlQetAegHSKBTh6ydpV9oNmHS//fl3Y5elgUeoU//n382nzCd8KVKji80JBRMKg4p84f+HM+XnD9SK6lHt5AYPi62q1tVD55OTdzT/fJsEaG4bazs04xfsUkZ19x60oQkDvSFWTCme4OGVne6hqJsH080jUgMwI7nuXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749459046; c=relaxed/simple;
	bh=8Dwhd/J+dmuQBssTcKZQrL4FyPv/Aj0cHtKmkvHkQEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WsCRYlufyDuZ4q3c2/kmD+31z1+vkifWcHelphUf3gaPHNBzYN5XQtKuZxANk1ywyxJ02X/4Fcfb0fCz1VYxi53y2Q9tYq3OH8afMXQhZxiYdpLBEYk1drgmPWNRRFR4kl3fvZy5pHEyXOCCtZUGrtN6w1hsngcZYOFdvABhbrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1XlUgia; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1XlUgia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749459044; x=1780995044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Dwhd/J+dmuQBssTcKZQrL4FyPv/Aj0cHtKmkvHkQEA=;
  b=Y1XlUgia7DEkkStOS1BwEYFfPnqc+tysv9bgqf0mfWzg4Z4ed/iQH2lj
   3DRQOME+1zKChyRCdDyyxpg6oeVDRa5BbsgvxkEO0fbBRwMxpJj6+7trb
   OYZ4MsPl3vfOEG6sjJWGIOjLgN5WWpBkY3s6JjE7Pqv9FCKoNskpcsPTi
   YqSXh3sFkVWxf9BLQNO0XI0wYuCW0qFSNkB3mE/XCsilT6WLFfshcBGMo
   mSJ2Ck7tiCJS03+YMtRuy3oc1aM3IV/9Y8INgeWTkRn9a9wBa4lQmMwCD
   Up68/z09bcrXLxe7mGlSaxHJaeq3ws92wFLH5Gndm+Gbtszn3F9dgfU0F
   g==;
X-CSE-ConnectionGUID: ocvKLe6vQ+C4qUIfQAbXWA==
X-CSE-MsgGUID: fO1xF22zSCO8dFKh9mknFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="51439684"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="51439684"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 01:50:43 -0700
X-CSE-ConnectionGUID: o3qOqBDvRjOyREi1powz4w==
X-CSE-MsgGUID: 4I93LLx4T6Knaqz4UwKK+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="151324237"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jun 2025 01:50:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOYDG-0006tZ-0b;
	Mon, 09 Jun 2025 08:50:38 +0000
Date: Mon, 9 Jun 2025 16:50:02 +0800
From: kernel test robot <lkp@intel.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: include/linux/kvm_host.h:1908:24: warning: field 'desc' with
 variable sized type 'struct kvm_stats_desc' not at the end of a struct or
 class is a GNU extension
Message-ID: <202506091622.dOo1Na3X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sami,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
commit: 9c3681f9b9fd12cdbc4a542df599f1837512f3d5 kbuild: Add gendwarfksyms as an alternative to genksyms
date:   5 months ago
config: s390-randconfig-r132-20250609 (https://download.01.org/0day-ci/archive/20250609/202506091622.dOo1Na3X-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250609/202506091622.dOo1Na3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506091622.dOo1Na3X-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <stdin>:3:
   In file included from arch/s390/include/asm/asm-prototypes.h:4:
>> include/linux/kvm_host.h:1908:24: warning: field 'desc' with variable sized type 'struct kvm_stats_desc' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
    1908 |         struct kvm_stats_desc desc;
         |                               ^
   1 warning generated.
   error: gendwarfksyms: process_module: dwarf_get_units failed: no debugging information?


vim +1908 include/linux/kvm_host.h

09cbcef6c60e77 Milan Pandurov 2019-12-13  1906  
cb082bfab59a22 Jing Zhang     2021-06-18  1907  struct _kvm_stats_desc {
cb082bfab59a22 Jing Zhang     2021-06-18 @1908  	struct kvm_stats_desc desc;
cb082bfab59a22 Jing Zhang     2021-06-18  1909  	char name[KVM_STATS_NAME_SIZE];
cb082bfab59a22 Jing Zhang     2021-06-18  1910  };
cb082bfab59a22 Jing Zhang     2021-06-18  1911  

:::::: The code at line 1908 was first introduced by commit
:::::: cb082bfab59a224a49ae803fed52cd03e8d6b5e0 KVM: stats: Add fd-based API to read binary stats data

:::::: TO: Jing Zhang <jingzhangos@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
