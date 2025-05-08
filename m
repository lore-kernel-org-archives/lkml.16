Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C62217D2
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 03:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746676352; cv=none; b=nzXdd0/EdNQr7dpOyFBHsCTexIvmw2IADXj/RyRySTljXL6lIbGw5+eESYmJpDtOvZFvCAqUT0bHdYHpOWtQvfZM249RnRdj8oOv2280N+KkoWKbKdCMJktlgzjpd0YnFEyHzK7KTXG7+4L8Qb/Y69ZqcMpyJQZ3WVjUx6OpbRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746676352; c=relaxed/simple;
	bh=mZb9HKFcXDBEUoe+DBMpALiIqz3Hrlum7jBh47OEf4g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DnhL0Bw1i4QuRpllTpbPvGMWe857+NoIx8xLvzc3Fth3oQ7YlnIVNP5L6+iWkZBVctObfOMvXx4Dyrlvnjot9ac+95EonN7CP9hQRpk0r4kbTn1mNHtz5vl/NrzG1b+jGwFa4+Lo38gTBYrO07TtfhVQta4wbtJOct9tP/qOgy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=duR/xXQ/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="duR/xXQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746676350; x=1778212350;
  h=date:from:to:cc:subject:message-id;
  bh=mZb9HKFcXDBEUoe+DBMpALiIqz3Hrlum7jBh47OEf4g=;
  b=duR/xXQ/d7itS3F57x9RvQqdK+kuw3T9zRRKVuuFOkuCVP9gotaeVEf7
   GfGFQmy1aIGsiPFay5OqXyFcdJL6pD3UWkui39RnwSV5Bhe40HXq2A6XB
   PJ5M85cpalxZweZEkV19zgaIngNlhjMfpv9NYfgIwBnCZYoCq9k2Vze2b
   oGYL8bsEINbTnnm+0QXrgrWh2Qlp18cU8IBl6TfvODYdiQDV6LUV6WlT5
   mhUY+ixc4AuAFlGP2dOB2KBsPjj1qEEf4uS0iElCVdoUrs1zC8GbRgzOR
   9m4JoX4+5Nq5Oa2v5kzu6p1wJMaTHhG/QdazYQd6rDYlJIOQtcOGRw0Sp
   Q==;
X-CSE-ConnectionGUID: eOfGkTd1QLyUMsEPkzjv0w==
X-CSE-MsgGUID: hWXTGOluSIWhsDbqzulbaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48589525"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="48589525"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 20:52:30 -0700
X-CSE-ConnectionGUID: tJIbVoPhShKIq21iCkZUCg==
X-CSE-MsgGUID: N7WprvPRQySPm1a2J4c/pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="140201831"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 May 2025 20:52:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCsJ9-0009rH-1j;
	Thu, 08 May 2025 03:52:27 +0000
Date: Thu, 08 May 2025 11:52:00 +0800
From: kernel test robot <lkp@intel.com>
To: "x86-ml" <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:x86/boot] BUILD SUCCESS
 ed4d95d033e359f9445e85bf5a768a5859a5830b
Message-ID: <202505081154.mwjqVdRe-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
branch HEAD: ed4d95d033e359f9445e85bf5a768a5859a5830b  x86/sev: Disentangle #VC handling code from startup code

elapsed time: 4200m

configs tested: 23
configs skipped: 1

The following configs have been built successfully.
More configs may be tested in the coming days.

tested configs:
alpha        allnoconfig    gcc-14.2.0
arc          allnoconfig    gcc-14.2.0
arm          allnoconfig    clang-21
arm64        allnoconfig    gcc-14.2.0
csky         allnoconfig    gcc-14.2.0
hexagon      allnoconfig    clang-21
loongarch    allnoconfig    gcc-14.2.0
m68k         allnoconfig    gcc-14.2.0
microblaze   allnoconfig    gcc-14.2.0
mips         allnoconfig    gcc-14.2.0
nios2        allnoconfig    gcc-14.2.0
openrisc     allnoconfig    gcc-14.2.0
parisc       allnoconfig    gcc-14.2.0
powerpc      allnoconfig    gcc-14.2.0
riscv        allnoconfig    gcc-14.2.0
s390         allnoconfig    clang-21
sh          allmodconfig    gcc-14.2.0
sh           allnoconfig    gcc-14.2.0
sparc        allnoconfig    gcc-14.2.0
um           allnoconfig    clang-21
x86_64       allnoconfig    clang-20
x86_64         defconfig    gcc-11
xtensa       allnoconfig    gcc-14.2.0

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
