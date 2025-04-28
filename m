Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BC58836
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825279; cv=none; b=byl1EcgpGTyV5G6DJrXTMLFAHLV/S8SRMBOLVZFaXFvXG/iUM9VMHC/EkFVtCdxO2DuwRQ8t3e6dFfCQwUDNUlfoSjeWyQE3/aECCmSiitiDcnxvyOVUnBvltLoyC/D+3cNnvS0lu868hY/VaVltYK9F85ATCGFXNrKcXI40Fw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825279; c=relaxed/simple;
	bh=isQCprdS0hFY1aabSNFLKi8bqBSj7bA9chaLJ1e5EtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q0SyZIWoBVOKRIh2/a0Foa3I7Lrkz0ShLIII1Rw79Y3BT25dAGIsRP0Fsn3gqh6RxYY2nwTojGenUFK2C12m04f4xMMIxc5meNIxy9eP+0sjO4EaFXBIoC7smb/EnKurGLt9ZeRLxoU3a1xSp0JhAGNKjOvENg8H6lRCBbS+ABA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MqYABppC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqYABppC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745825278; x=1777361278;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=isQCprdS0hFY1aabSNFLKi8bqBSj7bA9chaLJ1e5EtM=;
  b=MqYABppCAN8qF9Apghmf1zyrYQbwuZk+13IdTC9+pa7YMkVJz4b7IYkT
   8N+rvKX3Foq7lkAZh9ibYuFmSdvxwDNo00ebfieMDb9ojGDs4bCkZyHC8
   LW3U4uTGA9/4iq9207IYZ58lt8WmKtUydC76HlNt2JxcI/wcxjRkV5r4U
   0PkAYifUPeECL6GIBtIAjsOjzBlPvqtCyZc8ShPUjkuVIkJ4Q0l0VzdH6
   oXUvrmZUnJOeKezzRcjmeHN1ChGSxt0sKAkTFMrxeOIw9Hi5IEl9CRRxV
   JfpQPN+LxWA+/cMASScqHFmJwHbJoeeJFwp7VBuMnAV7/gUdLzQlrq7bj
   w==;
X-CSE-ConnectionGUID: IvSjhP4STXm2Z7MbIexZ/A==
X-CSE-MsgGUID: RTmTO1wETsmVh3Bm4jxw2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="69902117"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="69902117"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 00:27:58 -0700
X-CSE-ConnectionGUID: nM1zip06Sj63SRTiTKhPuA==
X-CSE-MsgGUID: JupSX0/aQI2Jh6unBusIvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="134388542"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 28 Apr 2025 00:27:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7AFE51BC; Mon, 28 Apr 2025 10:27:55 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alexandru Ardelean <aardelean@baylibre.com>,
	linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v1 1/1] util_macros.h: Make the header more resilient
Date: Mon, 28 Apr 2025 10:27:54 +0300
Message-ID: <20250428072754.3265274-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing header inclusions and protect against double inclusion.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/util_macros.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/util_macros.h b/include/linux/util_macros.h
index 7b64fb597f85..8239a7748f49 100644
--- a/include/linux/util_macros.h
+++ b/include/linux/util_macros.h
@@ -2,7 +2,10 @@
 #ifndef _LINUX_HELPER_MACROS_H_
 #define _LINUX_HELPER_MACROS_H_
 
+#include <linux/compiler_attributes.h>
 #include <linux/math.h>
+#include <linux/typecheck.h>
+#include <linux/stddef.h>
 
 /**
  * for_each_if - helper for handling conditionals in various for_each macros
-- 
2.47.2

