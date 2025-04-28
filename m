Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2C541760
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825242; cv=none; b=F62gVog0OcN5mcgav1m11w5OPmwqKof5XQOp4Vhkyr5vaLBCdorm6LBVEiXiMgbZMsqS06y2REgEq4XHx9IkDweV25kN261okA6d2Spujnv/9OTXcVaAcZqmWhPrx17HXBFDgZj+/4VRb/edXOH6u1LgxEnnnI+DSsGeb9VSzrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825242; c=relaxed/simple;
	bh=uuLa9PuejMEFVOYGkNw6Lcd+L7bwy0itJA8DqgQSQgY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Nifqk4TXWNZs2rUlATFsQGshKPARVThuBE8Of3w+i6ykmI2F3HNjVsHsYKP/Nz9HYy2yXbZVcmdxlgeGICRnuFDwrJKCrA9wsAhAqpJzzKrMJf4MOJx5msjQI+A789FkF+UJ5djiTIr9t0+ouTr0+aDiaENlaukUxb2LMEIrK9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oao1ojIp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oao1ojIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745825240; x=1777361240;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uuLa9PuejMEFVOYGkNw6Lcd+L7bwy0itJA8DqgQSQgY=;
  b=Oao1ojIpqo1x9potXoWqO6QtvqLoHbCvWWhUKBqcIZSIm8qsEKjT+nIH
   dyCQeZXpyJ1ItAbXzhglHcEVksJlGspucKHODwhliBqZ3qvwqCHd7o/ZS
   MW45sZvObzRd26LfGDt3UaAw7FfsKbyw8XEy9YpQB4MeBvew5uZuR9bG/
   VhN/ChMIZkexiJFw0SAhIKPmAQiijRp+nS/Lbgp6Zp39sRFefNy01CdVh
   yuMl67JPHrtpX5I17tO9QxAeFxNagrAuBMJnj/f/FToT9o034WRH4EpNp
   H8AoEKDCmF2H9I58d5PBiW3j4Rmb+X+L0sHsUtnrF/TdCJYBxcXN/iuKM
   g==;
X-CSE-ConnectionGUID: Z5KWAXZnSFmFFURoWsZ0qg==
X-CSE-MsgGUID: UYhxFXWbTxSQtcYAqkMJEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="50057608"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="50057608"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 00:27:19 -0700
X-CSE-ConnectionGUID: ZKkk4cEbSl6cjQGobNcf2A==
X-CSE-MsgGUID: 7fyyZ4DrTE+um7OAPTQjWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; 
   d="scan'208";a="133409728"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 28 Apr 2025 00:27:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D16FD1BC; Mon, 28 Apr 2025 10:27:16 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alexandru Ardelean <aardelean@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] util_macros.h: Fix the reference in kernel-doc
Date: Mon, 28 Apr 2025 10:27:15 +0300
Message-ID: <20250428072715.3265168-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In PTR_IF() description the text refers to the parameter as (ptr)
while the kernel-doc format asks for @ptr. Fix this accordingly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/util_macros.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/util_macros.h b/include/linux/util_macros.h
index 93b30c1dce60..dcb836ef0cc3 100644
--- a/include/linux/util_macros.h
+++ b/include/linux/util_macros.h
@@ -88,7 +88,7 @@
  * @ptr: A pointer to assign if @cond is true.
  *
  * PTR_IF(IS_ENABLED(CONFIG_FOO), ptr) evaluates to @ptr if CONFIG_FOO is set
- * to 'y' or 'm', or to NULL otherwise. The (ptr) argument must be a pointer.
+ * to 'y' or 'm', or to NULL otherwise. The @ptr argument must be a pointer.
  *
  * The macro can be very useful to help compiler dropping dead code.
  *
-- 
2.47.2

