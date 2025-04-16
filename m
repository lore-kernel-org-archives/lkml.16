Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186CB219A81
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785175; cv=none; b=DIKao6GV2txdkpWp+mqbE8IMI+WpULR6gytTUp+sreZc0J6RdEYgWsh88N1pPvxfWzcfQjFtzkEgZDuiZNx69Wz5Wyf/5nnsNhxgVYAXyVVJNHiNDAVewTgKqTnK+k1s+DfyqNS7xdCh+Vl7iT2+SyWGJp9nLariQEFLF0lj+hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785175; c=relaxed/simple;
	bh=HqvXA8IoqqkTrWaKGwRoZgujmwxcAeItEBGAZ5IQMF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KM8eXcCwZWhMnsNJQ9TZkV4uLAopP33AAlhl1yMiuQ3RRLl+/ebHTPUNpqsRrB+K9JneMNadhFvrRc9qILcbF6BVqpEswioMtTbEFCSgjaX42zazGcGwLPfWSydXuI2A0aCbsiIT94ZtOWhqJh2/BExq7bcWoPr4O6Fx2XFCtlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rrt1UJia; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rrt1UJia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744785174; x=1776321174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HqvXA8IoqqkTrWaKGwRoZgujmwxcAeItEBGAZ5IQMF8=;
  b=Rrt1UJiaMPmPcB5jO54s74pfJ7QlXGUeIvo5Cpl9KmEwzPjIedzCjzi0
   NUePqR6t7/810/76hRVkIU1XvbnXQ4JDuDgfqVL0B0ArQ5tKy6XKUwKqV
   NVfjc6KN7LZFOpTB7THBAo1Zt5ZfI7gftEO1NAy73hl+mRHUUuiA8lTdv
   tRCbjqURdk1nYsSRpgDqd8iI+3LPwSwmJcA2pQRNXUZrEMyKIRWRaUUQK
   tjW1pmtTC+wR0eXA9Z1P9z+/Jz6UORvcI9/njAq9c0ZVgtOk+9kToJSRB
   DTiWd0LtqobfF90hHVVrxN3j6DCMN5NrXfyx/G0AwmKV6XIz3kBpl8bnz
   w==;
X-CSE-ConnectionGUID: M0Dk+o+dSfeIyAi3yP3Ncw==
X-CSE-MsgGUID: lfdZQfBjRf+t/LcO7Rh6iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46033327"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="46033327"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:32:53 -0700
X-CSE-ConnectionGUID: bQf4fybUSJu2h7zOAdK36A==
X-CSE-MsgGUID: LIAFhK6JTi2auAMnLEmSZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130296388"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 15 Apr 2025 23:32:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 59052481; Wed, 16 Apr 2025 09:32:50 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 2/2] bitmap-str: Add missing header(s)
Date: Wed, 16 Apr 2025 09:32:11 +0300
Message-ID: <20250416063248.1864059-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250416063248.1864059-1-andriy.shevchenko@linux.intel.com>
References: <20250416063248.1864059-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bitmap-str.h is not self-contained, it uses something that is provided
elsewhere, add missing header(s).

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/bitmap-str.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/bitmap-str.h b/include/linux/bitmap-str.h
index d758b4809a3a..53d3e1b32d3d 100644
--- a/include/linux/bitmap-str.h
+++ b/include/linux/bitmap-str.h
@@ -2,6 +2,8 @@
 #ifndef __LINUX_BITMAP_STR_H
 #define __LINUX_BITMAP_STR_H
 
+#include <linux/types.h>
+
 int bitmap_parse_user(const char __user *ubuf, unsigned int ulen, unsigned long *dst, int nbits);
 int bitmap_print_to_pagebuf(bool list, char *buf, const unsigned long *maskp, int nmaskbits);
 int bitmap_print_bitmask_to_buf(char *buf, const unsigned long *maskp, int nmaskbits,
-- 
2.47.2

