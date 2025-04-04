Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1B520FAA9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743785590; cv=none; b=PHCTxY5uiFoU8fmRBh1m1lW2FBMBWvQNvPI8m/0dyoA1D3mKgwG0YXCA4PcFLorm1qkyuzHMuDpARx5ArwNT3FUAgopMF6gSqnnelvozwP3jxF+O1LjpKxDlY+Ufky5JTWvd9gpxA24wgcTlUrawT/8X8M1EO3YzCvV3djd+WSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743785590; c=relaxed/simple;
	bh=LTu/dk2XgY+nZqQ0ZfQvDk3ddRKJwu9jgNwQj8AKF4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lps/GonUy3PtcQ4JYniNp5LWzuCU0YLplpeZP9KWgrNn451jT6CfTh18qK701dESBvpoH9YDDWoPbkrdJUQ6qrcHLYpFEfehfGGwaltGGKi7yRSvtSFAIDsUcqc8woIK68Mg8JgOmfp5E5Rn6xATGmhsD6ZYDt6LIpDTmyNpoIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRSYugLM; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRSYugLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743785589; x=1775321589;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LTu/dk2XgY+nZqQ0ZfQvDk3ddRKJwu9jgNwQj8AKF4o=;
  b=eRSYugLMQHG546uMoorfGuhSzTTe3AYN9jwEkj8E/KFUrH6yBV5ECjzU
   mJbfLVjf8UC3q9Xh9ucEf8EJY+uAGzPEr+UNw2GQUeVjU9Hay/fSBf+x2
   1M+OeqLRizYt57bh+ykqhzU7/jeE72O0GfyqodG5fnk4iYVY4BOvoJdr/
   SxoWoZ3cjWlog+uOAVCxsPdOz8fJmkIfBTXjWcHJg0Xco8Pf+WsV1nc2x
   FkOndDUf1zBIiAEdaFxKxe/ISD3PwrodypMbWT6f7V5X3aNTm+EdAKrUo
   FlvIOatLVIU1NyocsCJP9Jrjz+acWBLKGCPK8vhihGSP775kNgAs5l1PY
   g==;
X-CSE-ConnectionGUID: NOLPvs5uTU6H1TDL2VTECA==
X-CSE-MsgGUID: DU6zD7NTTleP1m2rtL2qdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="62770181"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="62770181"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 09:53:08 -0700
X-CSE-ConnectionGUID: M3LD+9ckRDK8daMgkUjlIA==
X-CSE-MsgGUID: ZUEvqCMmT5eY3b/Uv3TvLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="132216185"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 04 Apr 2025 09:53:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A11EE129; Fri, 04 Apr 2025 19:53:04 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] x86/boot: Use __ALIGN_KERNEL_MASK() instead of open coded analogue
Date: Fri,  4 Apr 2025 19:53:03 +0300
Message-ID: <20250404165303.3657139-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LOAD_PHYSICAL_ADDR is calculated as an aligned (up) CONFIG_PHYSICAL_START
with the respective alignment value CONFIG_PHYSICAL_ALIGN. However,
the code is written openly while we have __ALIGN_KERNEL_MASK() macro
that does the same. This macro has nothing special, that's why
it may be used in assembler code or linker scripts (on the contrary
__ALIGN_KERNEL() may not). Do it so.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/include/asm/page_types.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/page_types.h b/arch/x86/include/asm/page_types.h
index 974688973cf6..1f749eb5c3cb 100644
--- a/arch/x86/include/asm/page_types.h
+++ b/arch/x86/include/asm/page_types.h
@@ -29,9 +29,7 @@
 #define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_TSK_EXEC
 
 /* Physical address where kernel should be loaded. */
-#define LOAD_PHYSICAL_ADDR ((CONFIG_PHYSICAL_START \
-				+ (CONFIG_PHYSICAL_ALIGN - 1)) \
-				& ~(CONFIG_PHYSICAL_ALIGN - 1))
+#define LOAD_PHYSICAL_ADDR	__ALIGN_KERNEL_MASK(CONFIG_PHYSICAL_START, CONFIG_PHYSICAL_ALIGN - 1)
 
 #define __START_KERNEL		(__START_KERNEL_map + LOAD_PHYSICAL_ADDR)
 
-- 
2.47.2

