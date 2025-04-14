Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170C2DF42
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744600468; cv=none; b=K8jr5dlBeZKt+j3qu0ulFNaAU6WHrzm5IDu/B/I8vODCHd4uU2L4gkz/VtztOCKwhxwX0hbcqaoQGbbQk15s0rOeBoFz2EPA6s7eMGBtnFNxn5HgF28fj9BkoIuq6d3zm4xHN3IvxDmnz3BG/yv/jJB7cefryPPiGksfCVHtzzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744600468; c=relaxed/simple;
	bh=gKtdvpnqmlFGAluw8oWf4ii9j0FCcbBLz9o9CucgEuI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jBt+iiKgf16Hj4N6eudIBJ3LL3JF1N/lazTdt4Iw0On/kUPwooTKVw8o0LTRg7WuM32KWptDN/g7k+UPdBWqbnjrN8Yal3mNnqS0zuZwhil92gUHJU8r/B4w2AInXkABgsDYcRh1GtHlNemyHlyLpYJcJVAgVnTxxDjq4MT2Ji4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CEdVa/Cu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CEdVa/Cu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744600466; x=1776136466;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gKtdvpnqmlFGAluw8oWf4ii9j0FCcbBLz9o9CucgEuI=;
  b=CEdVa/CuREdEwSkOBVcqQWcA8Kv/0pyw3tulm+cgQqeVE+w3F01/VHyN
   C1fp2DMHH1oULF9wwX5SgXcGIFnj3KNvChm9UOUxeTFsygnHRAeYM6XLG
   /z3C0Tb3tDTXCwqLm1DY3nX21GfjzcUYtqigkt4DjLAQ+3P4OtJ1Ym8QQ
   BzCHfTPXme4oMnWvpFFPvecHxZh6s57lBc0gWLVmgcgrWGcT7kx80Jvbr
   Zsm8Wc0iHnN29kV2qNKWHc7UWw7Hg/pJx2nnd91vKB/1wM2DkbsnAXuAB
   SeiVZR+bq0B1s00edwX28unXlIkJyfY4Vu8+Ii0L8c3anQ3EeyQDwocD3
   A==;
X-CSE-ConnectionGUID: HkmbbAQ1ToK4oN6F2oH1Yg==
X-CSE-MsgGUID: vPcUJ9PfTaG+Cc3v7Y1X5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45291721"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="45291721"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 20:14:25 -0700
X-CSE-ConnectionGUID: qkyWWJixTamMVwEGyTYfAg==
X-CSE-MsgGUID: bLdLj0FHRTOurGW+mAa3aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130546592"
Received: from ubuntu33.bj.intel.com ([10.238.158.132])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 20:14:24 -0700
From: Pi Xiange <xiange.pi@intel.com>
To: x86@kernel.org
Cc: tony.luck@intel.com,
	peterz@infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/cpu: Add CPU model number for Bartlett Lake
Date: Mon, 14 Apr 2025 11:28:39 +0800
Message-Id: <20250414032839.5368-1-xiange.pi@intel.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bartlett Lake has a P-core only product with Raptor Cove.

Signed-off-by: Pi Xiange <xiange.pi@intel.com>
---
 arch/x86/include/asm/intel-family.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/include/asm/intel-family.h b/arch/x86/include/asm/intel-family.h
index 3a97a7eefb51..405bde66032a 100644
--- a/arch/x86/include/asm/intel-family.h
+++ b/arch/x86/include/asm/intel-family.h
@@ -126,6 +126,8 @@
 #define INTEL_GRANITERAPIDS_X		IFM(6, 0xAD) /* Redwood Cove */
 #define INTEL_GRANITERAPIDS_D		IFM(6, 0xAE)
 
+#define INTEL_RAPTORCOVE		IFM(6, 0xD7) /* Bartlett Lake */
+
 /* "Hybrid" Processors (P-Core/E-Core) */
 
 #define INTEL_LAKEFIELD			IFM(6, 0x8A) /* Sunny Cove / Tremont */
-- 
2.31.1

