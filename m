Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF59254AE1
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906747; cv=none; b=PxLEYwoySzeeHzkdrRoiHtpQmYm/ICfAaTD4ovpG89UHaTygJfhg7BCbNfN9LHUh1LDAKrFF3pFZKwGXsDLJXVvYKOx02dcHOtABYBdDDZZKwhdsuIOKPQa8eGll9CrDq9CyuXrdN1TqpGd+pALSCgWML+gcx+VWd+Y5q7jf9vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906747; c=relaxed/simple;
	bh=4UOX7EbCCJODBGK9+4Xd5RU9+8jQhPYd9IB6Nt0fjd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pF4+/ju9pneJkwhuj3zK37NgvsRUO8+uSl6X1vXk6Xn6LhX1chR+yaGMlacCAXW8q1IfZ/Qzhmi6kmNcvnVGTXUhQ+vkhn/CGKUUsecfMc1gclBTEJile20VNfdsltWPcyvHAEz+cWSiQzW8INy679zQxYGRVM/rufZPPe/yvho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDiC7S6N; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDiC7S6N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744906745; x=1776442745;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4UOX7EbCCJODBGK9+4Xd5RU9+8jQhPYd9IB6Nt0fjd4=;
  b=eDiC7S6NLfygPRb16rWbET5ABPQcZiF3bnEwsZlW222HUN6vEay3bthy
   VH8fZroPJUctaO6Qvvz72di9xjBxML9aiyzJpdOMOPfuzyMHDNRGqRiae
   /33wlALBSti6VwQiL/fzk5zl+moUUPNVPRSoOt1eQA9kRX/sFvSUV9/aq
   sumBvsLztqETbjU//5kPmJdFyuxrdH3qelDY3dGmTjhJ9oac569QNBf/F
   Lmm4geLwgPXEeJ12/YD3t15JNGG3fWTs5lNmHZOLiu2GU4N07Trfrtro0
   tMGIE/7ikdJnjwcA/yCfjQEmPgbNsAVe6BRPYX1u5MznGHool+WsCLmXn
   g==;
X-CSE-ConnectionGUID: 0ASV+WSySW+EmrnB6qgZ1g==
X-CSE-MsgGUID: yGy0X3cxSQO162YXOz+uCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46390259"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46390259"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:19:02 -0700
X-CSE-ConnectionGUID: tKBHTmeZRMOKW4ucISomfA==
X-CSE-MsgGUID: HzIFqthERd2xCzMLxq7Mjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131743879"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 17 Apr 2025 09:19:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2AFAD85E; Thu, 17 Apr 2025 19:19:00 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v3 2/2] bitmap-str: Add missing header(s)
Date: Thu, 17 Apr 2025 19:17:16 +0300
Message-ID: <20250417161858.611211-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250417161858.611211-1-andriy.shevchenko@linux.intel.com>
References: <20250417161858.611211-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bitmap-str.h is not self-contained, it uses bool type that is provided
in types.h and it uses __user annotation that is guaranteed to be included
with types.h. Add missing header(s) to follow IWYU (Include What You Use)
principle.

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

