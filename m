Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE7322DFB8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744028063; cv=none; b=LjwIkNNUIeguKHBcmkJh3y83EWuIUywBmTC1TNSBd4NPES7znX2UTzJlK/QZoRQcKw4RQy32l2nf/lZjqnaaKeA7z3Znex9gqZYU0p2AfYQIWjQUVi5SJXlNtqEK8t6S+NSvMdmAOe1ASU3vRPndssWJVidt5X9XsJEuRkoUd2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744028063; c=relaxed/simple;
	bh=gCBdwr2KBIq0g6AA73TvgVyR7iOez4f0dnF02Qchvlo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PUa3KVp6bFAENvwHv3rWZ+n2aliKh8Zit9+SOwYhjUfMhzDlDJCCW+yqLO1osRhGMyRVHHUMRFEAM/WTwepd0yeetZlr4mKKYkJr5K1y+m2cbxTHaUil+WzRIEFs/O8447T1/YLAF0KP0X/8bALzkgCRAZr6f9rn2tD4EJOU7BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9r1mLGv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9r1mLGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744028062; x=1775564062;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gCBdwr2KBIq0g6AA73TvgVyR7iOez4f0dnF02Qchvlo=;
  b=P9r1mLGvC/q0fjjoP31AUQvSZzHdBguwJJ8o/njyzC+FDOGZZcgJDhLd
   1w6YgrsKXYLLbpfnDjuUD/WPrV5Emyl+pJlpL7YtqFqzyjN4fsye18wIi
   UdWKeP25OI+NdVAi9kG5WD1L1HAZoJlFgiPlIZk7N8FaONSMJHgTLNUS+
   xq7pFOH+bsiaMpF76ZqstqdoMIlfwnhxlUG/XOyqSbqTu+10oChhKLPAt
   WSoZb8ePuLTaGN4NJEuwby2X50C3CnW7Gn/Ut4/vJVDpwtRu+Y5YVY52L
   eQRpIk0ViVMiQSjf1FLMt2Cp+aj0EsHVb9xwzHYgyEfdCBXB/MBkYfKup
   g==;
X-CSE-ConnectionGUID: nZNp6HYUSZ27RiTUoU1l6A==
X-CSE-MsgGUID: u7mRgkRORCmm2r0yhRDz8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45530424"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45530424"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 05:14:21 -0700
X-CSE-ConnectionGUID: JRi486UdS+Sya0WHFU3eUQ==
X-CSE-MsgGUID: 9jxxe08kRCauFHVqN64laA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="128442490"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa010.fm.intel.com with ESMTP; 07 Apr 2025 05:14:19 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andriy.shevchenko@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] devres: simplify devm_kstrdup() using devm_kmemdup()
Date: Mon,  7 Apr 2025 17:43:11 +0530
Message-Id: <20250407121311.1702521-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kstrdup() logic pretty much reflects devm_kmemdup() for strings,
so just reuse it.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/base/devres.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index d8a733ea5e1a..82fdc1c55045 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -976,17 +976,7 @@ EXPORT_SYMBOL_GPL(devm_krealloc);
  */
 char *devm_kstrdup(struct device *dev, const char *s, gfp_t gfp)
 {
-	size_t size;
-	char *buf;
-
-	if (!s)
-		return NULL;
-
-	size = strlen(s) + 1;
-	buf = devm_kmalloc(dev, size, gfp);
-	if (buf)
-		memcpy(buf, s, size);
-	return buf;
+	return s ? devm_kmemdup(dev, s, strlen(s) + 1, gfp) : NULL;
 }
 EXPORT_SYMBOL_GPL(devm_kstrdup);
 
-- 
2.34.1

