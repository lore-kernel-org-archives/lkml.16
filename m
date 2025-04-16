Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64981F8BCB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785174; cv=none; b=Uyp2zgNGKy9Q1WLad2X1Pk8dBmJWCwgg9Hf+kI48lX2MN3yn6MqN204R3vjyK1sFG/woco+3VTPb2PTOTBDdORk8unhkFtK6mrRbS45HZVuJ7mTallWi2aXYH3Gf/PgI3ZAiYAfXfJs/6WxWF0XItmsWpqeN/fpStPIKW7b02lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785174; c=relaxed/simple;
	bh=Idy6NuTbMAZmRoJvPCH8C8WWkxm1k2/4cpjO0LE8byY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cCjAarwydcIke+SDvNS9GIjc5ut3eFsaLdXeh71i82WfqAxjDSJq7114C1Z38ZFAqt6RsOH1NQAjch+LwY2do9rpO3eiqtONzMELRCXQOW29pqyNoQ6DRzJNGEbCY2BmJS6WREqUxr7DDIi3HV40Z82T1SnAdn2GkDUGP2n2ZUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RjBUGCXE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RjBUGCXE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744785173; x=1776321173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Idy6NuTbMAZmRoJvPCH8C8WWkxm1k2/4cpjO0LE8byY=;
  b=RjBUGCXEje3t+TdkBNs9H31eIsKbhAbxiDW9wVoU6Y5bw3qsKLRLFZWp
   GdDmm28QtSJ3IksOXVZ0R2EmyAEn1lsxFGCSDpQitlEzJDPExv+NPly82
   v0f8ixEAoi0sfkXfoD2zomJxNulB/EssI2hJmGdafTC2KFplBS7E350Nv
   cPQ9CsDsWUe8ntEJFAGuDKoRFFZMt5R7Z/AvEvCJAwkx3cCNoAxQuGVO2
   Xj9+Qqsz07o/dPPRGJjsWRcFA4so5nih161vUvGPQRjYhUAMX7dQ6WTOQ
   7+2ybFwBathxl3RVV770cl5avTOa0xVK1Ug2Z7MSpBEbyBBDzgsc2vUdr
   Q==;
X-CSE-ConnectionGUID: ZbF/XXiWSgGQP0SWJRd4UQ==
X-CSE-MsgGUID: ZZcQ8joDSSa8KvUhuwYb5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57312433"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="57312433"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 23:32:52 -0700
X-CSE-ConnectionGUID: 0SHahbwgR6ewkMMGKi2UiA==
X-CSE-MsgGUID: NQGnYMcoR0WnGetPc7MVzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="130662808"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 15 Apr 2025 23:32:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C3DA522A; Wed, 16 Apr 2025 09:32:49 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v2 1/2] bitmap-str: Get rid of 'extern' for function prototypes
Date: Wed, 16 Apr 2025 09:32:10 +0300
Message-ID: <20250416063248.1864059-2-andriy.shevchenko@linux.intel.com>
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

The bitmap-str.h uses mixed style for function prototypes. Drop
the 'extern' as it easier to read and makes style aligned with
a new code in the kernel.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/bitmap-str.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/bitmap-str.h b/include/linux/bitmap-str.h
index 17caeca94cab..d758b4809a3a 100644
--- a/include/linux/bitmap-str.h
+++ b/include/linux/bitmap-str.h
@@ -4,10 +4,10 @@
 
 int bitmap_parse_user(const char __user *ubuf, unsigned int ulen, unsigned long *dst, int nbits);
 int bitmap_print_to_pagebuf(bool list, char *buf, const unsigned long *maskp, int nmaskbits);
-extern int bitmap_print_bitmask_to_buf(char *buf, const unsigned long *maskp,
-					int nmaskbits, loff_t off, size_t count);
-extern int bitmap_print_list_to_buf(char *buf, const unsigned long *maskp,
-					int nmaskbits, loff_t off, size_t count);
+int bitmap_print_bitmask_to_buf(char *buf, const unsigned long *maskp, int nmaskbits,
+				loff_t off, size_t count);
+int bitmap_print_list_to_buf(char *buf, const unsigned long *maskp, int nmaskbits,
+			     loff_t off, size_t count);
 int bitmap_parse(const char *buf, unsigned int buflen, unsigned long *dst, int nbits);
 int bitmap_parselist(const char *buf, unsigned long *maskp, int nmaskbits);
 int bitmap_parselist_user(const char __user *ubuf, unsigned int ulen,
-- 
2.47.2

