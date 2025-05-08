Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69A8214222
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 05:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746682210; cv=none; b=EW+xGHrRokt7GHGnylQUlVOylKA+SD35msgoqUC0bn70q5UvfoTO6SO9QAGZMwWiWtRJhhpSx8B8CvvRTG89qQDiAlROk8NlAIhZXeCfAPMn+WppZ6toiYcnAqypzvh83k62aEV62L2MmjT6pjI5w/LZfOJc48yRE1OO9nc0hmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746682210; c=relaxed/simple;
	bh=EmxGLWUdcXN+kCHP71dF2lUdSWO87c+SuxarmBB86B0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CIW54hZ4xdxn+5VFcoPxzO2BBAHLdF24CjHBCjNuo6HayupGd3FQF8XHGaGOsWIzRxbDOLi23OlHgSU+YB5ODiM2VBb4TOL1FwK/I2gKO2uWXAmDkBlhL2mAwago9cYhmxv6CEHcLpeVW1y1I/2Vajrahpf7bKl+pbxLYxYMW4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDan7T5Q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDan7T5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746682209; x=1778218209;
  h=date:from:to:cc:subject:message-id;
  bh=EmxGLWUdcXN+kCHP71dF2lUdSWO87c+SuxarmBB86B0=;
  b=iDan7T5Q+tqnpZXsoi2Kxsllq70ZTHjcCaAKJSmLUZvoQRcuvWQ1BmrE
   IuJypZc1jXIZdVqxkfkuTmAUuYenu8YCOPbfEHowABnzwkaD42lDM+6A/
   uRCtC1rIoEzSI8AZ++ufg0/bfaJsQC+eit6cnChLXce6/+ts4zm4PlFFV
   43q0tJLFbjBaPm1aEIwKiIqrMKbxYE/YmK+mIrL1YDyOMYCJNFrCs0/d9
   P/LGfJukLBZjzoRxS2dfGr8us/npAqsBLNcvX1IHCEhjKphmiy0CVJStv
   7WKpBqNLkjjOOeqWCcf3Gxcdw5J4PHe1oFqK2h2sJxTHsBQv+cLBPIGsy
   w==;
X-CSE-ConnectionGUID: 6FuV85+pSnujSToFlL8xsA==
X-CSE-MsgGUID: 0yf17dw/To+4ze1Grsjytw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="52098802"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="52098802"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 22:30:07 -0700
X-CSE-ConnectionGUID: lUZ9fpWRTtKNvC5evM5kxg==
X-CSE-MsgGUID: 2JXcZVypTfKW4CGic4Hx8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="141392114"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2025 22:30:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCtpZ-000ANQ-0D;
	Thu, 08 May 2025 05:30:01 +0000
Date: Thu, 08 May 2025 13:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/merge] BUILD SUCCESS
 6c9e5bc15d6d79b529c5ba290f689bc7398bc7b6
Message-ID: <202505081338.BMMttjN1-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/merge
branch HEAD: 6c9e5bc15d6d79b529c5ba290f689bc7398bc7b6  Merge branch 'x86/msr' into x86/merge, to pick up conflict resolution

elapsed time: 2138m

configs tested: 40
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allnoconfig    gcc-14.2.0
alpha       allyesconfig    gcc-14.2.0
arc         allmodconfig    gcc-14.2.0
arc          allnoconfig    gcc-14.2.0
arc         allyesconfig    gcc-14.2.0
arm         allmodconfig    gcc-14.2.0
arm          allnoconfig    clang-21
arm64        allnoconfig    gcc-14.2.0
csky         allnoconfig    gcc-14.2.0
hexagon     allmodconfig    clang-17
hexagon      allnoconfig    clang-21
hexagon     allyesconfig    clang-21
i386        allmodconfig    gcc-12
i386         allnoconfig    gcc-12
i386        allyesconfig    gcc-12
i386           defconfig    clang-20
loongarch   allmodconfig    gcc-14.2.0
loongarch    allnoconfig    gcc-14.2.0
m68k        allmodconfig    gcc-14.2.0
m68k         allnoconfig    gcc-14.2.0
m68k        allyesconfig    gcc-14.2.0
microblaze  allmodconfig    gcc-14.2.0
microblaze   allnoconfig    gcc-14.2.0
microblaze  allyesconfig    gcc-14.2.0
mips         allnoconfig    gcc-14.2.0
nios2        allnoconfig    gcc-14.2.0
openrisc     allnoconfig    gcc-14.2.0
parisc       allnoconfig    gcc-14.2.0
powerpc      allnoconfig    gcc-14.2.0
riscv        allnoconfig    gcc-14.2.0
s390         allnoconfig    clang-21
sh           allnoconfig    gcc-14.2.0
sparc        allnoconfig    gcc-14.2.0
um          allmodconfig    clang-19
um           allnoconfig    clang-21
um          allyesconfig    gcc-12
x86_64       allnoconfig    clang-20
x86_64      allyesconfig    clang-20
x86_64         defconfig    gcc-11
xtensa       allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
