Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EE728BAA7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705924; cv=none; b=hY+OswDb/aPu2xeyAJw7n1CkZY7cdiJE5fTyPoYO5W7D+JUWyv+Nyf/4T9iJR52hEsibuKbzDG5XQ63SGi6o1r/xlSzvqnVk7mDbE8WGMs44Qm02aCOBc0vfl3efU08N6xibePVpa4TaJ+DMD1tt3DRuPYIrGalFnYHmJj1J7ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705924; c=relaxed/simple;
	bh=vukE8v9D02EZpWH5CWbR+fLQeYxLnF8gMvLZiCZFa7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJm/ckTEOJwqnQJKKwbqH1rMyrV/gezWngpf7p70m0QPu0itwMpV8RWUytdckE0bJDCu6CEvw/0uugzrSX1f9puqOyVrarhJPtAlAx+v1wKRFz/eKgUiEYi+fh44yvC0OrY4sKx/rOr+0HkvhyQMnrNwtbhcIqhYIcJAxIKzOik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BA5uzxab; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BA5uzxab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744705923; x=1776241923;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vukE8v9D02EZpWH5CWbR+fLQeYxLnF8gMvLZiCZFa7Y=;
  b=BA5uzxabhSZTl/SksYRBk22EefReRvQ3vWSi/dle6uiutlO2LrP6TVFh
   LzTCBCdA2vD29emZRjfikrRlKporX1k7uj5FasTxvAzqOvpPC2amqQamp
   iiooG410smVy1zJ+tnF1Q9Z05Bslp/BRfRQDCgHIxL7rYIEvEcdcUGrmN
   CmNhnJFbQZNC7RIf9/gx6Oo9B3CClLy2Kt8wsmHqXsFi0BVxgpY68Z/xE
   cyBIpV4VNmhDgFiNLEmD2xst1T8K4TCNDbFU1CWBYLzFh67yu02ZWAYbD
   3JfXN1BIHwFot3OTWp8zzmZvoyV76nx427VQG7dBP61JEnBO99RM2IRG/
   A==;
X-CSE-ConnectionGUID: jFPM/2qDR5Sei+2Q7F8QWw==
X-CSE-MsgGUID: MYDTidJJSpiI/w/36GIOUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49855684"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="49855684"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 01:32:01 -0700
X-CSE-ConnectionGUID: M1iHBWCuQoSh4Y0Du0/e3g==
X-CSE-MsgGUID: T/cqMK5rT5uzKKWP77IDLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="167224162"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 15 Apr 2025 01:32:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0F015AB6; Tue, 15 Apr 2025 11:31:59 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] bitmap-str: Add missing header(s)
Date: Tue, 15 Apr 2025 11:31:20 +0300
Message-ID: <20250415083156.303914-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250415083156.303914-1-andriy.shevchenko@linux.intel.com>
References: <20250415083156.303914-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

