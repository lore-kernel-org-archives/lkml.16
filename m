Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868DB1D5CE5
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 09:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746263337; cv=none; b=XMks1NCo/Twr1q5PFjb9xssrLD7La31oUvpcMsh006hv6lt92+x445WVKqQF5gzmFwUIw6O62sE23dAS3Z1/GRfHnnfMkezGyKGJD5lmhjDyBsrVzdd90siAZXBcAtZTzaLB3DgE6rjIuZt9NIp9U3ioQlMrB4E6wCN8mHkM7EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746263337; c=relaxed/simple;
	bh=7DXKKLxqc9pxgZV4iNYTNG7B8b3bBjtSHb8Lyl7QTFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CKaiVsL5YJGW0plYrlQ4Fm5zDY89Qy5OhSde6HjmUkGFQReHHpQVO0KAiicmfCeGA3HkMA4QJfxKoQbT8z3vDGb6RKTkLJhiU+QEPz0BMNp6gX6W4r4Knb6BRY8sj+uDf8M1SOkw4oE50nF7hmUGfbMjmX4ZfmOkHg4ATvPB7ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uw8KCeRJ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uw8KCeRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746263335; x=1777799335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7DXKKLxqc9pxgZV4iNYTNG7B8b3bBjtSHb8Lyl7QTFU=;
  b=Uw8KCeRJUUyU/qC7/qVL/Bm2KL8UdsD+Yw6kB5SP7Q0jQiE+jyy8ZtrH
   jlJs3mPezkA6NVqQ/ckrirP5EHbtBmJKZOXpbCImLNjpXPAQWLBFbwnBs
   0qmohhBEKMEH2uOXG8dGIx0BRpsy09PncowfUjWaa8ZZ6EpweDgyAF3pZ
   5StS71sXViI1uhcQnaY3c12F85iZKaiqBJJkVVmakyeWL3GjUa3XgaPRl
   YO1ey/1wfdyd/GiQPxTEWgSbJMLjyhZB8FcdXmRWCOtKCHELnXCSB37ZV
   F9Tr4Zpx9v3dD/BZagcfEOGJ+nRoVEZNozGLpMhVS95MgTrnE24R1qlzp
   A==;
X-CSE-ConnectionGUID: qiqfZwGCQ4CyonvMO9mUrg==
X-CSE-MsgGUID: 2kTuBRqxQu+dqBGvKOg7uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="35554530"
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="35554530"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2025 02:08:54 -0700
X-CSE-ConnectionGUID: hSku64yzSPOYPPLfRkiXlg==
X-CSE-MsgGUID: kvScOu7pQV2GontxOajcrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,258,1739865600"; 
   d="scan'208";a="134793274"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 May 2025 02:08:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uB8ra-0005HB-06;
	Sat, 03 May 2025 09:08:50 +0000
Date: Sat, 3 May 2025 17:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Jesse Taube <mr.bossman075@gmail.com>
Subject: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at
 1083866), and 'i32 1' from vmlinux.a(net-traces.o at 1275566)
Message-ID: <202505031656.UrRdPiGI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   95d3481af6dc90fd7175a7643fd108cdcb808ce5
commit: 2c0391b29b27f315c1b4c29ffde66f50b29fab99 riscv: Allow NOMMU kernels to access all of RAM
date:   5 weeks ago
config: riscv-randconfig-r053-20250503 (https://download.01.org/0day-ci/archive/20250503/202505031656.UrRdPiGI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505031656.UrRdPiGI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505031656.UrRdPiGI-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(memcontrol.o at 1100606)
>> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(net-traces.o at 1275566)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(trace.o at 1093826)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(dir.o at 1110086)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(skbuff.o at 1273406)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(syscall.o at 1095206)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(xprtsock.o at 1284926)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(slub.o at 1100306)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(tcp.o at 1279226)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(ring_buffer.o at 1093766)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(filter.o at 1274486)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(ip6_output.o at 1282346)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(af_packet.o at 1284686)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(page_alloc.o at 1100066)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(namei.o at 1101746)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(vmscan.o at 1098926)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(auth_gss.o at 1286246)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(svcsock.o at 1285346)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(xdr.o at 1285706)
   ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1083866), and 'i32 1' from vmlinux.a(svcauth_gss.o at 1286366)
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
