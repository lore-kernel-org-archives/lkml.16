Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3178D2066E4
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 12:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738585166; cv=none; b=Lo0vnqLoPuRrKg5homnlcRLSvAaGS0R8abl2gy0EO4dlcRskISKTL8ryYVHbdr6o9iRkXb+Ly1hNN2Z1njtajQU3DRn/TtsTl6hXucSPn3TVU5Uwz30xhgMqpX5cnDHMnVIpcLNnddLcWK5PVIWToxPuBjCL9XroOTL5tAZpZag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738585166; c=relaxed/simple;
	bh=xPKxqU0o1lJdDsnPPwZm2VdeS2k+IByI8MHBdOs9DiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RZRMhW8toPBc/3bP8JuDGP84eXK/V5V6yP7d5ycYWr66Fb4bJmFgtlwkbsp0ahekDe+Hnos7M63JdBKSBeVuAQcu9qjts7LjUrUWMq2G1HAtwf4jrVTau3Fy5v8EVsSnPW5apUCgL2ppuevLPnZP4YjvkhMlD9nllIoieGI6Xkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUZfcWEe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUZfcWEe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738585165; x=1770121165;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xPKxqU0o1lJdDsnPPwZm2VdeS2k+IByI8MHBdOs9DiA=;
  b=iUZfcWEe+5HvO9i965oRpr8LIAAAEZJL7eVYH5OsR07+jXXM5Dh07ZFj
   ZuIZ9mSwIwLmMdFkEzjU3iXPCyqWbezHJ6A019Pla3Fre35lC2yU5Ndfe
   XrqXmv6z4PptmYd5/A3CtHPbHh1F4LMgPJgeD+gYj8a/H2HsBAu/3u7sw
   PZdxsLt0NDV3Mc449OEnsS/0zofItsyEJv2LrAUSmTS3cWRAOoSHiOHzZ
   4ipAClHOGBkubMsblBsfBByNaEWqyWXzqlb5hCVBKLp9uV5KC/UZP45QT
   nrD+H/8Iu18ZUQq7reMkt7d9sz/ntwBjp41o1nPnkWz/UU7SAw/xUMCYr
   g==;
X-CSE-ConnectionGUID: 9vynVzkaTQOisDo+98fIyQ==
X-CSE-MsgGUID: mQWM+/M5RZKb7808DOcvHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39338759"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="39338759"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 04:19:25 -0800
X-CSE-ConnectionGUID: V961lt8JQuqD2VxImkGv4g==
X-CSE-MsgGUID: GatcwB8KTEGZ0cOyEbD4AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114897881"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 03 Feb 2025 04:19:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A05B623F; Mon, 03 Feb 2025 14:19:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] bitmap: Align documentation between bitmap_gather() and bitmap_scatter()
Date: Mon,  3 Feb 2025 14:19:19 +0200
Message-ID: <20250203121919.3184930-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First of all, the bitmap_scatter() mistakenly refers to itself for
detailed explanation about the relationships of two. Instead of simply
fixing this, align text in both making a cross-reference.

Fixes: de5f84338970 ("lib/bitmap: Introduce bitmap_scatter() and bitmap_gather() helpers")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/bitmap.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 2026953e2c4e..595217b7a6e7 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -560,9 +560,9 @@ void bitmap_replace(unsigned long *dst,
  *	      ...0..11...0..10
  *	dst:  0000001100000010
  *
- * A relationship exists between bitmap_scatter() and bitmap_gather().
+ * A relationship exists between bitmap_scatter() and bitmap_gather(). See
+ * bitmap_gather() for the bitmap gather detailed operations. TL;DR:
  * bitmap_gather() can be seen as the 'reverse' bitmap_scatter() operation.
- * See bitmap_scatter() for details related to this relationship.
  */
 static __always_inline
 void bitmap_scatter(unsigned long *dst, const unsigned long *src,
@@ -608,7 +608,9 @@ void bitmap_scatter(unsigned long *dst, const unsigned long *src,
  *	dst:  0000000000011010
  *
  * A relationship exists between bitmap_gather() and bitmap_scatter(). See
- * bitmap_scatter() for the bitmap scatter detailed operations.
+ * bitmap_scatter() for the bitmap scatter detailed operations. TL;DR:
+ * bitmap_scatter() can be seen as the 'reverse' bitmap_gather() operation.
+ *
  * Suppose scattered computed using bitmap_scatter(scattered, src, mask, n).
  * The operation bitmap_gather(result, scattered, mask, n) leads to a result
  * equal or equivalent to src.
-- 
2.43.0.rc1.1336.g36b5255a03ac

