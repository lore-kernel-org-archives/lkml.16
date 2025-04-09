Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A7825D911
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196116; cv=none; b=bDvqJ2v4eF2U52Ny9YkAO5U0/wNg916Z6Tg288jHDIe4tKpBVS4fOWp3IKisuGVYgmd2Lo/GPEnnekbW34yHFHbmCvD+S46pgDIQAMOo84BJIdmci1U0ei7qGRLNSLGc8auaXBBKtG4npWhevtqDQAPiyYULFwHZx/qaQhamOms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196116; c=relaxed/simple;
	bh=wwPowS5KN5fssJ/zxxMmn3uLfB0eWfpJldUm6y0TjQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=q/XluaQgm2RG/fykT+Ny7IsR9pq0rEiIab4LE83Z73i1A79k7GRptp6jTXV5WpwlXeAF7gKDLAPRF/Zxnc1oF00DiscxCJySV80mXKFIfD+Wlg6uHpxqkqhIruUAGItgs8QEO5FleuweYfZr5E1NzhFohR46A465RrpSuqotKXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jakPLrOD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jakPLrOD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744196115; x=1775732115;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wwPowS5KN5fssJ/zxxMmn3uLfB0eWfpJldUm6y0TjQ4=;
  b=jakPLrODJ8k5WAqxOKEOIh+cPchOiCUKN3Jn206YjMSNoJxz6x06BCO6
   hZ8nTNBmxrJKsKe/tHNhsmJKdnJxbhwllF/pj35ze5GunVc0qGampCzV7
   AyYY8vHl0hCDYyhQ8awkmMOjyGN6ekE8Gp7bKAoYPNrPGfF/IW+Rm3yHd
   P5a00DQ8H5GgPoQB0WFTTR44vQ3hT6OjcCUuHqkNNo4uol8gxrFKelN/Z
   MCDwIXlNxXhajYdYq5xB0HR6R/M6YcY7JyuyMAS22lGtu/vaamHK6PtHC
   SPJVY4i4Z4ONq7YLbz91gqnNMdAC/LzsgaNs0Zdd4p99YREE8kPa7PAFS
   A==;
X-CSE-ConnectionGUID: pkw+4y7+Tk2dB73+KrSVBg==
X-CSE-MsgGUID: mv78BWsVS1uhc2Yabtwv2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="56330049"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="56330049"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:55:14 -0700
X-CSE-ConnectionGUID: TlIqvDV0QFKSDaxaQeMmoQ==
X-CSE-MsgGUID: lgUv3hFyQzmxbRCCr2pT/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="128459861"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa010.jf.intel.com with ESMTP; 09 Apr 2025 03:55:12 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andriy.shevchenko@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2] devres: simplify devm_kstrdup() using devm_kmemdup()
Date: Wed,  9 Apr 2025 16:24:32 +0530
Message-Id: <20250409105432.1852355-1-raag.jadav@intel.com>
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

v2: Style adjustment (Andy)

 drivers/base/devres.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index d8a733ea5e1a..eee63bc1f062 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -976,17 +976,10 @@ EXPORT_SYMBOL_GPL(devm_krealloc);
  */
 char *devm_kstrdup(struct device *dev, const char *s, gfp_t gfp)
 {
-	size_t size;
-	char *buf;
-
 	if (!s)
 		return NULL;
 
-	size = strlen(s) + 1;
-	buf = devm_kmalloc(dev, size, gfp);
-	if (buf)
-		memcpy(buf, s, size);
-	return buf;
+	return devm_kmemdup(dev, s, strlen(s) + 1, gfp);
 }
 EXPORT_SYMBOL_GPL(devm_kstrdup);
 
-- 
2.34.1

