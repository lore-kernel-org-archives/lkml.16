Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD312AF04
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 23:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744499960; cv=none; b=dZnceCMt5HOwGXQnjQQuqU9KRSFDdRfSUrCuBul8DR1iRwq+AqtUiatgYStx1wF8n93qxntuGZSjw0kyP2g99Cr2s4yq7TrBnNTlL+Iqh+OBaD6TrhvS50DNTk/vQ4CHLUOV0+FZHbYT7JZyxiuXDW/j2wmHZcVgo2rl9QC/lSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744499960; c=relaxed/simple;
	bh=kFAP0nfFG3At58SehEWpuPAFPxXZyU/xyDOYPZcyDa8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GYwoewod4um9+gI0aZbamsWZv9D/Y9PMTZ4TGkOtWlmDJc5ZOT930MxlvfuZpsQHreN0JwosGlla/T9mKptFpwRTHS+EXQZh7gl/2r4R9HTV2e9eVGBXNA2H+pOzqU+dVM8AKlGCcEqsI2LmgC2SarWjGR5zUmr+6qOfgm5xxfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=keFYH8Ie; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="keFYH8Ie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744499958; x=1776035958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kFAP0nfFG3At58SehEWpuPAFPxXZyU/xyDOYPZcyDa8=;
  b=keFYH8Ie3gECnlbS1Iid5/t7AQe2KdlKJWycwT5lmTu82Twf3GBVUwjh
   qAXqXw4TD2gfYRXtOne2U1R+N3eFGNwbHoK0r+y4lxEs3KzbisarRzbVg
   nEGHRxJhRXFcB+3tPRSliwInEaDqXqdJptUim0j+DavE77LFBa3cLhQ/K
   dlhDnXnkoXpigqThwrcE28WAxglh+MpVNd2zTMlgMoQCBgKRg5q3pufqa
   Dp19lWUsSgAuBd8XoxmbrGA+6h5zt8Xfj8KNOhBrnQ07QpcvFvyxnQyld
   DPDQ7a3u0QSF7noV8xEy9VWORktu1BEQK1Dr2Z9jsFE75Y5VqS4Yv8uzr
   Q==;
X-CSE-ConnectionGUID: TlSZxbbdTzGz7MNx0hCVxg==
X-CSE-MsgGUID: OZp7ZiTvSJ+1TgdcOLRknw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="46146936"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="46146936"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 16:19:17 -0700
X-CSE-ConnectionGUID: HzFnhblXRkO3uwImk3sKhQ==
X-CSE-MsgGUID: Aat8rs6oQ5C8wuvAEv/N6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="130051135"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Apr 2025 16:19:14 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3k80-000CDO-0S;
	Sat, 12 Apr 2025 23:19:12 +0000
Date: Sun, 13 Apr 2025 07:18:45 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: arch/riscv/lib/strncmp.S:11: Error: unrecognized opcode
 `__alternative_cfg("nop", "j strncmp_zbb",0,30,'
Message-ID: <202504130710.3IKz6Ibs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b676ac484f847bbe5c7d29603f41475b64fefe55
commit: 9343aaba1f256ff42730db5a61efc32a86149776 RISC-V: separate Zbb optimisations requiring and not requiring toolchain support
date:   4 weeks ago
config: riscv-randconfig-001-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130710.3IKz6Ibs-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130710.3IKz6Ibs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130710.3IKz6Ibs-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/lib/strncmp.S: Assembler messages:
>> arch/riscv/lib/strncmp.S:11: Error: unrecognized opcode `__alternative_cfg("nop", "j strncmp_zbb",0,30,'
>> arch/riscv/lib/strncmp.S:12: Error: junk at end of line, first unrecognized character is `0'
--
   arch/riscv/lib/strlen.S: Assembler messages:
>> arch/riscv/lib/strlen.S:11: Error: unrecognized opcode `__alternative_cfg("nop", "j strlen_zbb",0,30,'
>> arch/riscv/lib/strlen.S:12: Error: junk at end of line, first unrecognized character is `0'
--
   arch/riscv/lib/strcmp.S: Assembler messages:
>> arch/riscv/lib/strcmp.S:11: Error: unrecognized opcode `__alternative_cfg("nop", "j strcmp_zbb",0,30,'
>> arch/riscv/lib/strcmp.S:12: Error: junk at end of line, first unrecognized character is `0'


vim +11 arch/riscv/lib/strncmp.S

    10	
  > 11		__ALTERNATIVE_CFG("nop", "j strncmp_zbb", 0, RISCV_ISA_EXT_ZBB,
  > 12			IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
    13	
    14		/*
    15		 * Returns
    16		 *   a0 - comparison result, value like strncmp
    17		 *
    18		 * Parameters
    19		 *   a0 - string1
    20		 *   a1 - string2
    21		 *   a2 - number of characters to compare
    22		 *
    23		 * Clobbers
    24		 *   t0, t1, t2
    25		 */
    26		li	t2, 0
    27	1:
    28		beq	a2, t2, 2f
    29		lbu	t0, 0(a0)
    30		lbu	t1, 0(a1)
    31		addi	a0, a0, 1
    32		addi	a1, a1, 1
    33		bne	t0, t1, 3f
    34		addi	t2, t2, 1
    35		bnez	t0, 1b
    36	2:
    37		li	a0, 0
    38		ret
    39	3:
    40		/*
    41		 * strncmp only needs to return (< 0, 0, > 0) values
    42		 * not necessarily -1, 0, +1
    43		 */
    44		sub	a0, t0, t1
    45		ret
    46	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
