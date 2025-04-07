Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C610A2163A4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 17:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744046815; cv=none; b=YGPnbemF8PeySE7ZaNAkpFt67Z+LKNgoF69Ri0LRxMMlDq+Xv+SjD9QlmNBICw8hbZ4+fx8t90sRrUYF1N+xq2lP/P3Q/2kYRRo9sl+2bzSskEqE8GOqSGo+9Obdv5FvlShOtD7l8mJQ/FqgHo8B4Kq/iaGE5wA8ZegES5oLcH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744046815; c=relaxed/simple;
	bh=yp6ISIWr8empZJZm6Z4F5lpdHQEM5y/1Vf9ItJrdlJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SV9VJO8DyjfRmDMUZZbDcLKPVlL0tUf+06z5R5uFkgfiZO1wZ1wKoV2+fzZ0GbDK/Gi1Y8cMnvchLy5qVONZs/Jch/eQNDXpFsQsb6v7qJmjeqPCtKzdKJmTRhvO9ey+sHYg2iFWXrkR+mxdeNaCXTEQZjRVEFq0dq8OYztGH7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FAYpiYzB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FAYpiYzB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744046814; x=1775582814;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yp6ISIWr8empZJZm6Z4F5lpdHQEM5y/1Vf9ItJrdlJ0=;
  b=FAYpiYzB/KSWdyxHn+HmXnZ+5UX/MlI7PjD4b3WCUfefQpLyXmTllsiK
   es+bKt3l+ys2yA5qmKT9OglHtdcc8KOsO1NNj3G5gTP4GdJFjTa8AHhLJ
   3kjzTjJxb3c9DoShh29XdH+dz3swSe9i5SFMYpx4UsAUhp1wCiK41lMqk
   ML8gxrV2U7DuDaSAsLO34Y+LV0xvwPh2brhPikGT9YjjO3OFWj8hCmka3
   5U1+Y1D5crKuxS+oXrMKaJ7g85bsoFsV/AQ78neXOIUJ/BCPTGAhMbWKX
   P2WfM5OougBOiDDt21WnqwiQdXcD5kwwR53sIgxdCmpQK5QLzV0iaRy2X
   g==;
X-CSE-ConnectionGUID: KANmeUd1QjO+9ZiVbuhQ9Q==
X-CSE-MsgGUID: YnVwgzsdRhm/JjP0fRPXRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45160065"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45160065"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 10:26:54 -0700
X-CSE-ConnectionGUID: u4jOUj7tRVmMvNaRtDk7nQ==
X-CSE-MsgGUID: u8Z/PO4wR9iARtGYqw+ydg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127773678"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 07 Apr 2025 10:26:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 07EF6F0; Mon, 07 Apr 2025 20:26:49 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v1 1/1] x86/early_printk: Fix comment for "pciserial" case
Date: Mon,  7 Apr 2025 20:26:49 +0300
Message-ID: <20250407172649.792996-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment seem contains the copy'n'paste error when mentioning "serial"
instead of "pciserial" (with double quotes). Fix this. With that, move
it upper, so we don't calculate buf twice.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/kernel/early_printk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/early_printk.c b/arch/x86/kernel/early_printk.c
index dc053641698c..4a9ba7cb7e5a 100644
--- a/arch/x86/kernel/early_printk.c
+++ b/arch/x86/kernel/early_printk.c
@@ -442,9 +442,9 @@ static int __init setup_early_printk(char *buf)
 		}
 #ifdef CONFIG_PCI
 		if (!strncmp(buf, "pciserial", 9)) {
-			early_pci_serial_init(buf + 9);
+			buf += 9; /* Keep from match the above "pciserial" */
+			early_pci_serial_init(buf);
 			early_console_register(&early_serial_console, keep);
-			buf += 9; /* Keep from match the above "serial" */
 		}
 #endif
 		if (!strncmp(buf, "vga", 3) &&
-- 
2.47.2

