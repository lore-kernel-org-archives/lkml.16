Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866E42641F9
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746696223; cv=none; b=YwglgsBvEu5Vo30ouXKlKscepXCl8HEk7zcDhdiYDNnGGbxh47bGTci1DKPgKhLO69iTr9CwKMgb29GSHCmrwRnJgqB3nAjMEmzpjlzet+R9eeD/ipyx+Rdd5bRqONGxUrvP19hR1syEB8Il5YRuk2nnBiSO3GGhZIX5JpgVCUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746696223; c=relaxed/simple;
	bh=NDgnn8AnD/9pt8OpdPfPHktVucw4enB2CH//iFG5GSc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gyhF8xnETB8zyka5unkmPxQVym9O6M7XLgZ9bvr9O52kGU5z/PMYwiiZGFVbILLMDulqKgDZCaVgVI2ugNc4bhFiCUDLsGiRGfXWymYiQpUvNNu8i8FrqZ9DFLp9nR+hOIQKnDvTLtSrMpKs4q43uMGIYYKPisNXBGwbwJHvQW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FfRbSVL+; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FfRbSVL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746696221; x=1778232221;
  h=date:from:to:cc:subject:message-id;
  bh=NDgnn8AnD/9pt8OpdPfPHktVucw4enB2CH//iFG5GSc=;
  b=FfRbSVL+MsZC3aGEy2V24GcBIegBYJdyw4qxZvvPAO0XhR5TlZoTpnXA
   EBVSoR7fkO63VkCQkbqlYVmlSE78hlEG5G76Y6R+5nYTtwy9w17rKJTik
   fmdmhN2BeT19HuLmK2cOgtx32UyhzxCUsBp9nuDjGWH5FEy2RItaSrMSR
   QXxoO+Z1VfuZERQPApiqo/eabXsAcwB78dszdxIFbZ+BJO0FURQPTo5+I
   +qf4APJ6N1ZsE9I0kvnFMhxqzktkkzuC0iw/2WZS3aQKKP12TSTw9t1F2
   pHNr2dR08jH1Mrkc6r8YVXzNW6164QayzqZLXwFj2o5BbKQ5kzufiHD1P
   A==;
X-CSE-ConnectionGUID: GIXsqsyJRrSokm1Vhq8JQQ==
X-CSE-MsgGUID: USsE4gYxRZeYTG7cg9NyWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59096676"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59096676"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 02:23:40 -0700
X-CSE-ConnectionGUID: xqskcgMASAOd0zWCpANUnA==
X-CSE-MsgGUID: 7JlOOCUYSl+yQoQQyYgSUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="167168446"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 May 2025 02:23:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCxTd-000ApL-2J;
	Thu, 08 May 2025 09:23:37 +0000
Date: Thu, 08 May 2025 17:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:core/entry] BUILD SUCCESS
 8278fd6006a02e3352d5230927c4576f53fb3b06
Message-ID: <202505081727.K9YRvuzw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
branch HEAD: 8278fd6006a02e3352d5230927c4576f53fb3b06  LoongArch: entry: Fix include order

elapsed time: 1450m

configs tested: 39
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allnoconfig    gcc-14.2.0
alpha       allyesconfig    gcc-14.2.0
arc         allmodconfig    gcc-14.2.0
arc          allnoconfig    gcc-14.2.0
arc         allyesconfig    gcc-14.2.0
arm          allnoconfig    clang-21
arm64        allnoconfig    gcc-14.2.0
csky         allnoconfig    gcc-14.2.0
hexagon     allmodconfig    clang-17
hexagon      allnoconfig    clang-21
hexagon     allyesconfig    clang-21
i386        allmodconfig    gcc-12
i386         allnoconfig    gcc-12
i386           defconfig    clang-20
loongarch   allmodconfig    gcc-14.2.0
loongarch    allnoconfig    gcc-14.2.0
m68k        allmodconfig    gcc-14.2.0
m68k         allnoconfig    gcc-14.2.0
m68k        allyesconfig    gcc-14.2.0
microblaze   allnoconfig    gcc-14.2.0
mips         allnoconfig    gcc-14.2.0
nios2        allnoconfig    gcc-14.2.0
openrisc     allnoconfig    gcc-14.2.0
parisc       allnoconfig    gcc-14.2.0
powerpc      allnoconfig    gcc-14.2.0
riscv        allnoconfig    gcc-14.2.0
s390        allmodconfig    clang-18
s390         allnoconfig    clang-21
s390        allyesconfig    gcc-14.2.0
sh          allmodconfig    gcc-14.2.0
sh           allnoconfig    gcc-14.2.0
sh          allyesconfig    gcc-14.2.0
sparc       allmodconfig    gcc-14.2.0
sparc        allnoconfig    gcc-14.2.0
um           allnoconfig    clang-21
x86_64       allnoconfig    clang-20
x86_64      allyesconfig    clang-20
x86_64         defconfig    gcc-11
xtensa       allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
