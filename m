Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964AC28BAA4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744705924; cv=none; b=Y7hI8sX+b8GGJQbcPUPOEpI/2byABOvDk6mc0i/uFGRKtydv1d8JuH7UkZd1PoDmhBfqtZYuRWOGGOYvR5RGEivjBGi9x2oTPkl11whUzctlxTryKVFdcAf8+tC/HVLzxziGg3jkyyP1BdfsC0O76mdYMqt8MBKreOPabPjdydw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744705924; c=relaxed/simple;
	bh=7LI90iSQnwahUgZE4Es+XwW1c0a7RrKd3W0O4i6EtTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=skdKpVp1YSFM9714Ce2pa8S/8gJ7M2Sx7pm2wPIQKFpZ1/Wiu6Xp0yM4MmSH/tAUEvi9Ol3utLT78lfS9PzuYLFqaiMoz/zN5YP5cjTusSQjA1bhosN9NxScom2m1i77jmFyVKLFaMXfqgx2fLkbHirYizOzmNhNjN0zAPHsKWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9Gz4YtM; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9Gz4YtM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744705922; x=1776241922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7LI90iSQnwahUgZE4Es+XwW1c0a7RrKd3W0O4i6EtTU=;
  b=L9Gz4YtMTmXDlkHKeDvlvsdUxUN0vRjvk3sR83JH3oAoY4H1rBWynxp5
   T8NlHR8oOysFJsalAPsGg/3xfwdWOR4ZsySyzJA6OqtrTa5h2yWRvpyIA
   tDQRqEHEOxqq42o+b87dzHkqDVdiJaJNExxdxC6FKOpF6zr/7+1X5WNyy
   I7TwIpfi4iO3OgbTa2TFOPl7JeI9LwfEcjrjMczVaEIUxeJdhbD40Ac5L
   VcqqlcZcgvj8vK0UoniREkI3ZiArxL/V+n6V61fqJetAyEAKOaNtPe3Fz
   D09juztv8QoVtl6WzWWRLmgGezG4TbUNI0v0PQR346Af7GvsGqLzs6QFL
   Q==;
X-CSE-ConnectionGUID: Agm/F8Q8Sxy9q7aEeoOeyg==
X-CSE-MsgGUID: TfihOqhcTkqXgF1Tg+GJ8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49855679"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="49855679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 01:32:01 -0700
X-CSE-ConnectionGUID: EAFJFarMTEO5wCzxKJQcPg==
X-CSE-MsgGUID: tDba95M0QhGcr14bleRU+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="167224157"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 15 Apr 2025 01:31:59 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 958EF8D1; Tue, 15 Apr 2025 11:31:58 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] bitmap-str: Get rid of extern
Date: Tue, 15 Apr 2025 11:31:19 +0300
Message-ID: <20250415083156.303914-2-andriy.shevchenko@linux.intel.com>
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

