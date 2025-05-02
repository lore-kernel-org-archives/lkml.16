Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D3C254AF8
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189119; cv=none; b=I/SUZc64bNrrxxTQ5n2mrDkXGCP2DbLgSYszeDhf085ryAxAjmVN4kKlPyHDBqQlymaCq7gqREka+y2HJL0O/J3yKd1VuYLrUPIaGoucIFgYsd+BvGCreC6rEKlaqJaHyeho3P81eF9ATDinyl6XVfm8rWk219KsOwqyLBoXtes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189119; c=relaxed/simple;
	bh=4nbbHAkkGAtKI9mh8scHvE2TT8W67/3O7vP/JzptVKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kxkmYwm2guNsKiN1sxSAj3Ez4JRfvA19fNtO76rNN16MZdom9Ix4tAnfDLlBEFAIVBYhfJGnE3m/hg1kq9K5WPaUDL4UFLBaGqeDn1rxphlvRG4zRa4+XTn8ak6Rnp2V7FvMgLHJrIBDR19knYKfdIzy+OLxhEFcJkrQW+25woU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MBEotoHW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MBEotoHW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746189117; x=1777725117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4nbbHAkkGAtKI9mh8scHvE2TT8W67/3O7vP/JzptVKQ=;
  b=MBEotoHWpBWEq2PBIQ5dyN3FljMXHEUPNunrIS2XsPdUYPfw1cHwLDRb
   al+QoeaLAv9EoorpD5QcM65IYBmX+P6QK1XRywjVAhdcvP7IYFKj3+Hgx
   355S2splpxBPu85c3s/r2vbR7wCGE97hi6nfdj/xhpH1ldSFEzbdyzAFU
   BVdUaEEkqvNSoo1lxbvWnyl4iTmghusOCfB9pJTE7W3GuDnW91GdnKcsT
   8DxwD4Z/tVRE2ebiO03Y5nvd75xkJe8Dn6PHHvlFtCKSmLlcxiqwEzJxJ
   vjldQnDjCuhOLUCr/LmvVokNfT9SakkzxEak8VMhMekC+8WiUN18J6epP
   Q==;
X-CSE-ConnectionGUID: AlN9ERehTCm872kzHmEiTw==
X-CSE-MsgGUID: VMVEBqKlRmi2dqJKgQ6/mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47955302"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47955302"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 05:31:52 -0700
X-CSE-ConnectionGUID: O2/EIfQ4SHijfel5IupSXQ==
X-CSE-MsgGUID: EG+iCQXwT0KdGMpLk0HSkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135592036"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 02 May 2025 05:31:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id ED9A811C; Fri, 02 May 2025 15:31:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v1 1/6] x86/boot: Convert early_serial_base to unsigned long
Date: Fri,  2 May 2025 15:29:37 +0300
Message-ID: <20250502123145.4066635-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250502123145.4066635-1-andriy.shevchenko@linux.intel.com>
References: <20250502123145.4066635-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As a preparatory of adding flexible serial I/O accessors, convert
early_serial_base to unsigned long to cover all possible bus addresses
on the system.

No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/boot/boot.h                            | 2 +-
 arch/x86/boot/compressed/early_serial_console.c | 2 +-
 arch/x86/boot/compressed/misc.h                 | 4 ++--
 arch/x86/boot/early_serial_console.c            | 6 +++---
 arch/x86/boot/tty.c                             | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
index 38f17a1e1e36..753f429b28cb 100644
--- a/arch/x86/boot/boot.h
+++ b/arch/x86/boot/boot.h
@@ -274,7 +274,7 @@ int check_knl_erratum(void);
 int validate_cpu(void);
 
 /* early_serial_console.c */
-extern int early_serial_base;
+extern unsigned long early_serial_base;
 void console_init(void);
 
 /* edd.c */
diff --git a/arch/x86/boot/compressed/early_serial_console.c b/arch/x86/boot/compressed/early_serial_console.c
index 70a8d1706d0f..5b8db03f40ad 100644
--- a/arch/x86/boot/compressed/early_serial_console.c
+++ b/arch/x86/boot/compressed/early_serial_console.c
@@ -1,6 +1,6 @@
 #include "misc.h"
 
 /* This might be accessed before .bss is cleared, so use .data instead. */
-int early_serial_base __section(".data");
+unsigned long early_serial_base __section(".data");
 
 #include "../early_serial_console.c"
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index dd8d1a85f671..f083360c84c1 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -127,10 +127,10 @@ extern unsigned char _pgtable[];
 
 #ifdef CONFIG_EARLY_PRINTK
 /* early_serial_console.c */
-extern int early_serial_base;
+extern unsigned long early_serial_base;
 void console_init(void);
 #else
-static const int early_serial_base;
+static const unsigned long early_serial_base;
 static inline void console_init(void)
 { }
 #endif
diff --git a/arch/x86/boot/early_serial_console.c b/arch/x86/boot/early_serial_console.c
index 023bf1c3de8b..7a7766fa16e5 100644
--- a/arch/x86/boot/early_serial_console.c
+++ b/arch/x86/boot/early_serial_console.c
@@ -23,7 +23,7 @@
 
 #define DEFAULT_BAUD 9600
 
-static void early_serial_init(int port, int baud)
+static void early_serial_init(unsigned long port, int baud)
 {
 	unsigned char c;
 	unsigned divisor;
@@ -46,9 +46,9 @@ static void early_serial_init(int port, int baud)
 static void parse_earlyprintk(void)
 {
 	int baud = DEFAULT_BAUD;
+	unsigned long port = 0;
 	char arg[32];
 	int pos = 0;
-	int port = 0;
 
 	if (cmdline_find_option("earlyprintk", arg, sizeof(arg)) > 0) {
 		char *e;
@@ -118,7 +118,7 @@ static void parse_console_uart8250(void)
 {
 	char optstr[64], *options;
 	int baud = DEFAULT_BAUD;
-	int port = 0;
+	unsigned long port = 0;
 
 	/*
 	 * console=uart8250,io,0x3f8,115200n8
diff --git a/arch/x86/boot/tty.c b/arch/x86/boot/tty.c
index f7eb976b0a4b..e2ab8b8076ef 100644
--- a/arch/x86/boot/tty.c
+++ b/arch/x86/boot/tty.c
@@ -13,7 +13,7 @@
 
 #include "boot.h"
 
-int early_serial_base;
+unsigned long early_serial_base;
 
 #define XMTRDY          0x20
 
-- 
2.47.2

