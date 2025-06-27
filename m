Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CC7265CB2
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751020501; cv=none; b=Y8yPfX9RJBduffG4zMDiYXrhDNqj4MK+iGUauweFs7vc93PrXAKHUu3iPiQcKK4VyXt6s2ug0zLQxH6qBna2e8zTa+eiLbY9ElQW5V1Rf+cKnhY2wa+v/pxM3hPP+vccybKzZeHAzZuuA5SWxKgXCz1vCeX3EZoz/w4hXUNbVYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751020501; c=relaxed/simple;
	bh=BTuVbInTviSCPgqccAWc6LF/t2hU2VnFDBewn6YGhvI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tfJ5vK9D7jHRMCTAvMcpmy/Vwk7e5ZSt14loLz4mwnrU9IYJ7Bg0IlQMFAzAUr1CoNqwMHiofe/l7UPW0LcbA5G6bLUCkypfAVYYesSyKdEhQyCdxABoeDaqhwyK5sG2lMVwvFTdKcr7ULA4wNDprk97NMztSpc8LRpUfD3eYus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGnvwdxi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGnvwdxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751020500; x=1782556500;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BTuVbInTviSCPgqccAWc6LF/t2hU2VnFDBewn6YGhvI=;
  b=PGnvwdxiQeXIIkYu5jJn12EIWVsKP2si/WfveoYN3dtVrNtZhACFZgrp
   GGJu1gbPxa3guPMb15WAezZTI8DtU6RZunCV5miyiH3BawbwRAMJuAGeN
   F7UTFNv2Qn34L18ivxz2cuzgxNy13+2D8iYdyEKEcsL+sanQJWp1V4gqo
   bvA0y6S5sfHzRTePVHdgzlF62msuQJZ6rMxyQMZzizfS7IYDzqKk679y0
   o6zQxPdPSA/U+63QBPXYRx2wsaawND9UOi/EuVQauGeO8rmGqCPC2lETa
   kBWLKQmZOwms1jQ1I0LOtyi8kbqmkJB50Lgd7PlJbOVJw/VVfdd9sBmf7
   A==;
X-CSE-ConnectionGUID: h470ADSLTvyKt0OptG+51g==
X-CSE-MsgGUID: 29z6sMDXQ+aTHGtoCPrOXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64770083"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="64770083"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 03:34:59 -0700
X-CSE-ConnectionGUID: VO5wL10LRSu2CfjInRDw8Q==
X-CSE-MsgGUID: eSEkxIfzQxmb+3TOQVgoVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="153073411"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 27 Jun 2025 03:34:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9358A6A; Fri, 27 Jun 2025 13:34:56 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/1] firmware: sysfb: Don't use "proxy" headers
Date: Fri, 27 Jun 2025 13:34:15 +0300
Message-ID: <20250627103454.702606-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update header inclusions to follow IWYU (Include What You Use)
principle.

Note that kernel.h is discouraged to be included as it's written
at the top of that file.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v2: dropped first patch, added tags (Javier, Thomas)

 include/linux/sysfb.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index 07cbab516942..b449665c686a 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -7,9 +7,13 @@
  * Copyright (c) 2012-2013 David Herrmann <dh.herrmann@gmail.com>
  */
 
-#include <linux/kernel.h>
+#include <linux/err.h>
+#include <linux/types.h>
+
 #include <linux/platform_data/simplefb.h>
 
+struct device;
+struct platform_device;
 struct screen_info;
 
 enum {
-- 
2.47.2

