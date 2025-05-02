Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3292528E4
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188272; cv=none; b=pt7kb9H86csHMr10s87zipniPNRKwWm0A/DiE7hfikGAgEYZuD9Lj/t9Ql3lBY6bUDeK6fQSkxzMAZECyRS+rSykbQXPR/eGD7TPbWe4SHy3aGkxXX5qASV3vtwz6rrtdeXHRFGu9EfkzHUXDy0Yeo3BnqIjezCUiakK+Yckfs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188272; c=relaxed/simple;
	bh=T+TcDXyo6Em8mPO9ilRAO3XZ5T2mbbp6D9AUdnuIlA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LEN7JOVK1yebirGnPXJNL8VkaS2MB/R+v6iKc+ttbfN8rKahIAeKE9OpIye1xuwhV7M9iCscCWwkGERIenNTkFCG+jnDXe0NZPkW24ig82ZKmD+YPDxo82NPr5OLjL03VRvhHjtkBcwFFQSW9IMVFPSi9CCOvAm07ceQc50fjmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHpBm8SZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHpBm8SZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746188271; x=1777724271;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T+TcDXyo6Em8mPO9ilRAO3XZ5T2mbbp6D9AUdnuIlA4=;
  b=aHpBm8SZAS+ipYTBrNAw+7k/cTob6ZXAsi658g62uVRJr/yNlzuU7uGt
   K3PBG8ipZ/NvAib82kLw2rTdtbq3kKpgsL2SrWmYG0Qc5MUWld3AuO4wx
   CS23VGZtw7zSLtrWn1Mw9SzIqpQ585HE9yAEOhUCdo9iVtSsvPInaGJ7I
   6fDDvdH2UGd7WUXoBK8ejkoeCALxMosdwJItdmMX9JLiWItRBf5XUSXKx
   y4ulKnSCgX1tiL2jJQW8oGVNvMn/zY2oAzvk+fVDzg1HZXs3Go0RL+NYJ
   MeUrtYktqAdiQ6mPW3qNDhiz0f559lXbQFarNChmbqOCUMOWQZkZMHxjF
   A==;
X-CSE-ConnectionGUID: tVeWn/UZRQqjh50aSdPMkA==
X-CSE-MsgGUID: TVy16mz9RDaMNYUt6+pnnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="46977448"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="46977448"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 05:17:50 -0700
X-CSE-ConnectionGUID: 89ye/atUTyyVd5Hi3tdUNA==
X-CSE-MsgGUID: KOMpHpxhQ2Gk1YGel3GRDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="139425216"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 02 May 2025 05:17:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 927891A1; Fri, 02 May 2025 15:17:46 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v1 1/1] list: Remove redundant 'extern' for function prototypes
Date: Fri,  2 May 2025 15:17:42 +0300
Message-ID: <20250502121742.3997529-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'extern' keyword is redundant for function prototypes.
list.h never used them and new code in general is better
without them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/list.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/list.h b/include/linux/list.h
index 29a375889fb8..e7e28afd28f8 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -50,9 +50,9 @@ static inline void INIT_LIST_HEAD(struct list_head *list)
  * Performs the full set of list corruption checks before __list_add().
  * On list corruption reports a warning, and returns false.
  */
-extern bool __list_valid_slowpath __list_add_valid_or_report(struct list_head *new,
-							     struct list_head *prev,
-							     struct list_head *next);
+bool __list_valid_slowpath __list_add_valid_or_report(struct list_head *new,
+						      struct list_head *prev,
+						      struct list_head *next);
 
 /*
  * Performs list corruption checks before __list_add(). Returns false if a
@@ -93,7 +93,7 @@ static __always_inline bool __list_add_valid(struct list_head *new,
  * Performs the full set of list corruption checks before __list_del_entry().
  * On list corruption reports a warning, and returns false.
  */
-extern bool __list_valid_slowpath __list_del_entry_valid_or_report(struct list_head *entry);
+bool __list_valid_slowpath __list_del_entry_valid_or_report(struct list_head *entry);
 
 /*
  * Performs list corruption checks before __list_del_entry(). Returns false if a
-- 
2.47.2

