Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7A626B946
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745908545; cv=none; b=h9FLC/S3nlY3bPoxH+zlBjRo16V+Y9ttsdC1OxndQcy59jb2fxA/A/jiW10XxDoF27fQ3c5i68SzefiCUxTKEN2zA/xXqdzNxOeobrkUa+ELKdMrMloNDYMu15t23kMKlUjr/2QHmEv7Vd8hAtbW6psZj2PZpLxfWt3gmrku8oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745908545; c=relaxed/simple;
	bh=iOcIxw2pw44Xqs/6IxM7qze1a8ftQkyXXG8jHhqVEPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HDj4yo807L+xfDznSLiLLCULn+TlPx9ds5H+VJ5IaE7+cwbQCZ9xRPaUz89cVrlkYzyBnUl3YCw1ClvEDkB9lWBXi9xH5IHGnJiGqWfCDksN5aElbzTVzj+IxGysKyTfWC6PyWKcwtvYHhSAVHo+T3ywMxB9Q8pzAX1ZwQOuGp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f0f1BPzw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f0f1BPzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745908544; x=1777444544;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iOcIxw2pw44Xqs/6IxM7qze1a8ftQkyXXG8jHhqVEPo=;
  b=f0f1BPzw1/NMSUJSKjNoQyAtSA9GiZF4ea4u8aspZPlM+gWgVtwx0EDK
   9VKNFBLoE8hYW/6YBccX8PEVbXsN786CzW0XQAswSb+rtkGXAbxfh5A5f
   DFNxBbmkUh99nqDdIwvIeEEdMxgFEUskLB32d0r/COIry/kYKcHxX8ouR
   Dyvfq4nFeD4KmGcBCFQvj6hNVOoBdkVsfaqKJwBq2RleR3GzJpONnaFze
   2sqbJrC21CNadpzqP/Opyw4v+0fth53c38fHca3iSu0yg6I1StzHTGZp3
   icd8PVZIA6TyDDPlcGs3bWs4dIoV9CAxFga69jYx/LuVPGAhftXBm/yJg
   w==;
X-CSE-ConnectionGUID: lr37EUt6RIK6E/Tyg1AbTQ==
X-CSE-MsgGUID: fMplJdM+Q2ybaSyYCTH2Lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="64937621"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="64937621"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 23:35:43 -0700
X-CSE-ConnectionGUID: KXgO75msS0yFwCsDXkPv+w==
X-CSE-MsgGUID: Ajg2w+LHTG6AgjgydaAMyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="134254067"
Received: from unknown (HELO CannotLeaveINTEL.bj.intel.com) ([10.238.153.146])
  by fmviesa010.fm.intel.com with ESMTP; 28 Apr 2025 23:35:39 -0700
From: Jun Miao <jun.miao@intel.com>
To: kirill.shutemov@linux.intel.com,
	dave.hansen@linux.intel.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de
Cc: x86@kernel.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jun.miao@intel.com,
	fan.du.com,
	zhiquan1.li@intel.com
Subject: [V2 PATCH 0/1][Bug Report] and Fix TDX cpuid0x2 #VE causing segment
Date: Tue, 29 Apr 2025 10:31:13 -0400
Message-ID: <20250429143114.1724280-1-jun.miao@intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi

[TDX Bug Report]

There is a segfault, when boot a upstream kernel as a TDX guest.
- Boot log:
[   46.902055] systemd[1]: segfault at 55c974b82650 ip 00007f252eef09c2 sp 00007ffcd94fe7b8 error 4 in libc.so.6[7f252ee28000+175000] likely on CPU 1 (core 1, socket 0)
[   46.903302] Code: 00 0f 18 8e 00 31 00 00 0f 18 8e 40 31 00 00 0f 18 8e 80 31 00 00 0f 18 8e c0 31 00 00 62 e1 fe 48 6f 06 62 e1 fe 48 6f 4e 01 <62> e1 fe 48 6f 66 40 62 e1 fe 48 6f 6e 41 62 61 fe 48 6f 86 00 20
[   46.905516] systemd[1]: Caught <SEGV> from PID 1958225488.
[   46.921256] systemd[1]: Caught <SEGV>, dumped core as pid 346.
[   46.922056] systemd[1]: Freezing execution.

- Guest kernel version:
  Linux version 6.15.0-rc4
- Guest qcow2:
  rhel-guest-image-9.2-20230414.17.x86_64.qcow2
- TDX module info:
  TDX module: 1.5.16.00.0869 (build_date 20250219, Production module), TDX_FEATURES0 0x226f3f0fbf
  TDX_FEATURES0.VE_REDUCTION (bit 30) = 1
  TDX_FEATURES0.CPUID2_VIRT (bit 29) = 1

The root cases:
Glibc 2.34 and newer segfault if CPUID leaf 0x2 reports zero.
https://sourceware.org/bugzilla/show_bug.cgi?id=30037
That is #VE on CPUID leaf 0x2 is handled by returning all-0 to the code which executed CPUID.
In many cases, an all-0 value is not the correct value, and may cause improper operation.
Although, the bits of VE_REDUCETION and VIRT_CPUID2 are marked "1" as supported in TDX FEATURES0, their functionality fails during runtime stress tests.


[Solution]

Add VIRT_CPUID2 virtualization if REDUCE_VE was not successful to avoiding the segfault when glibc invoked the CPUID leaf 0x2.
Since the enable_cpu_topology_enumeration() doesn't very little and can be integrated into reduce_unnecessary_ve().
v1-->v2:
1. checkpatch.pl the patch and adjusted code formatting.
2. modify code logic:  when configured is ok but REDUCE_VE=false enable
   ENUM_TOPOLOGY and VIRT_CPUID

***  ***

Zhiquan Li (1):
  x86/tdx: add VIRT_CPUID2 virtualization if REDUCE_VE was not
    successful
 arch/x86/coco/tdx/tdx.c | 52 +++++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 18 deletions(-)

-- 
2.43.0

