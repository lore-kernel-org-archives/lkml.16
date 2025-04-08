Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643C21D5172
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122371; cv=none; b=o/1C1al9aRloWLTFB/qBXUH7OZc4EAd1r9i2h3lT71ZEKz7EPwj2+lGv8N1f0EXUDe6m3NzMJ2jjhF6ufhpibr8aHgqwk9XRnmtDGt9HPl0h0j/vASK/jISo1ALYQrzGSUzqIE0jLYfVP1S7DS+a/pBBl4mr36+oKwUOIZlYzTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122371; c=relaxed/simple;
	bh=H6JUoL+6FS2VaznWnQIGcsnzEe+sh4tA0CCJPT3jWiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8t2AzLjs5A64zpiW4Nhxg/QdF8545rQFH+ruCNR9JJKNGdhcwY9Y4AtXWXse8/veRSHVKdnQyFalfXsjQPt8G9kUSlKPcKvXJ70JHQtE0eRvTRizwXOffAh/TqKf02YG2C19uwtR34eWa2pdyYL0qM59YJbXKmewxUZLb3JgDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQSdayg8; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQSdayg8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744122369; x=1775658369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H6JUoL+6FS2VaznWnQIGcsnzEe+sh4tA0CCJPT3jWiA=;
  b=QQSdayg8g2Fz8QjyVtz3KFkGrePxy/zd/XArVehNQTGkn+x5xbrJmQtz
   UizXYIYVtZyyEhCefmlBpORE8z3aZK6ntbc5mpNH2w6XtYn+FsmkHBfJY
   s9S7xuP7QvJIaBnC5C3Eil/yKHh3x+Pfl71qBtY3f7amc2vokD0+OW7WA
   TtBVGPBk0tx+71m0Mr60SGl2tcrv3ffcMovhjTwHLWktQwr5gV9kxxa4/
   HJt/4E7yJ80FOLo5pvXBlmHnkFZNa0nKUyv9UYkZxCcDamNiCy/gyUlng
   SCwNQsJ0XWQu9HfUd0NXvg/sGUYQbQAXBBtxUDc8D7cZHlCchgt0QxBSL
   g==;
X-CSE-ConnectionGUID: Xzke7FUKR/SjT6Xz5RIXxQ==
X-CSE-MsgGUID: zHjs+1n0R6mtBLLdTrFvNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="49403605"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="49403605"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 07:26:08 -0700
X-CSE-ConnectionGUID: qX67iDHHRoqfjybajy2FOw==
X-CSE-MsgGUID: ZwnR0zbgQ3G18aaIn5URlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; 
   d="scan'208";a="151480193"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 08 Apr 2025 07:26:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 70E87263; Tue, 08 Apr 2025 17:26:05 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 1/2] fbtft: Unorphan the driver
Date: Tue,  8 Apr 2025 17:22:25 +0300
Message-ID: <20250408142554.1366319-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250408142554.1366319-1-andriy.shevchenko@linux.intel.com>
References: <20250408142554.1366319-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's maintain occasional fixes to the fbtft driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..28c9100bc240 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9006,9 +9006,10 @@ F:	lib/fault-inject.c
 F:	tools/testing/fault-injection/
 
 FBTFT Framebuffer drivers
+M:	Andy Shevchenko <andy@kernel.org>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-fbdev@vger.kernel.org
-S:	Orphan
+S:	Odd fixes
 F:	drivers/staging/fbtft/
 
 FC0011 TUNER DRIVER
-- 
2.47.2

