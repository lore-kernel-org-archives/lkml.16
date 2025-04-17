Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE3A254AEF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906747; cv=none; b=h5ZBNK1Mr9uFI3nLg0v+RhDEM4fTm3xd9z3+hE9fSQvlLPhLjTLad4S7Uzzh9ccUP8xTfvhtXSAqFBB5pgLVujU5jGeLkUN6hZgEh0XnU7OA471v1ToLdPCJ1eVFy/+fO31HRXO3RHKlkq0WIt+mo0zKo3S+8VIvJdwVgq+FZHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906747; c=relaxed/simple;
	bh=Idy6NuTbMAZmRoJvPCH8C8WWkxm1k2/4cpjO0LE8byY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gmPATefx19gE3lWqoAohQo612if3+8Eq7diF44+QRy9cSvTFAtbY8kji0THFqvRTkI1nPNAFnoyo/A6UZZjMRRes79GpfBxYigKiOUZ/1WEcqzGOcyxZM6d9Tb1xOP7/7+KABQb5QTaD7HzAtDJW6yPG8vf3mcy+n0Ya1LRAxhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUIvf+9k; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUIvf+9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744906746; x=1776442746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Idy6NuTbMAZmRoJvPCH8C8WWkxm1k2/4cpjO0LE8byY=;
  b=UUIvf+9kMejTwWAyj52AbAUc468d8wLl1C4iVwFHSw8gHZpYwkbDjmVH
   ywRDLRo1dZq8hZqbaM0SvshAUCUHrPwVehw2oMdBLshz+AHHZAFW0bDx9
   BSCJHxLAOqe6l9kuByy6CRwz59QNuvfSkHBIO0eSTnGpcvV9EekfHQOHw
   FX7o0dZXBB/yvSZkQn8AzwWiJ/ICbq0xdfqLyG+K+ETkcOH4QI4FhP/4J
   h9uQnDiAugke+UYN73YuM5KDu+46aJijsVrzELGQ+LYhH6zScU6DHGCtT
   smuamChobqf2J9WwC86RuzyH4Y8Lp3zkjG8/uYLa8KD9AlrJkMElGCT9u
   Q==;
X-CSE-ConnectionGUID: lrtmQ2e4QkaDimj+VoONWA==
X-CSE-MsgGUID: DH5TE5A8SAG0kCiMPb2NGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46390262"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46390262"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:19:03 -0700
X-CSE-ConnectionGUID: KJaFwUWSTcm5cASKOVIWHg==
X-CSE-MsgGUID: O3nuDqgCQbquP8MR4Z2Rxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131743883"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 17 Apr 2025 09:19:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 1D478170; Thu, 17 Apr 2025 19:19:00 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH v3 1/2] bitmap-str: Get rid of 'extern' for function prototypes
Date: Thu, 17 Apr 2025 19:17:15 +0300
Message-ID: <20250417161858.611211-2-andriy.shevchenko@linux.intel.com>
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

