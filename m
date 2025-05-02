Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A47211A1E
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189115; cv=none; b=boMiFTryxaV+hWp/0QcVdELs83juK1kaA7uqotBUCSmR0nIIXtn/WWEyxYAWgHg4/jXaM82/hcvi77fyXWGPCvNDuGSGPhaiWrIVvYJQjNKUvHYbZ9TiRyqkC9eOKS7Y9slAaFYFc0MlSP7G6prv+Buoo0QcGVK6WxIG9x1XRHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189115; c=relaxed/simple;
	bh=/LlTdA3MOBGGWSIkReu6dV3xUOfctiYVjZlXyECjSgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L1BEGDCHTQKMQz7qxFNnX/wKQws61UhcDo03i5E6D7IdXJubqBq6cBys/ic1CyFMNAfKquiqoriLAxXqrUJU9+Xal57T6WNLGLgM7W/GeYVukm1K3T7z7EQxNuRF52cZzBBQhIghQudEVTrtyZkCrPldqLxboxy175xOv7CpYio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SpguNW2Q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SpguNW2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746189114; x=1777725114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/LlTdA3MOBGGWSIkReu6dV3xUOfctiYVjZlXyECjSgg=;
  b=SpguNW2Q+w78MWCg+G6lMwjgsH7CwkBXc/gTAOGf5MN5P0WwgevB+zaq
   1eddwE5ttU8LSslu1pAYirwWgtxd6jgaJktm4qnIYrwLk7urCyOASqsww
   9z/OlaiucMvkHc7lyx5QBoZqUOpiS8DZNeEyVrXdvcmqfMgiVswAoYJ+A
   K1aSf6YCqP/Rg2SvSL8QeCzOeZXDv/OG9NLlarmO9m0LK9HFLOtBz0Jba
   t9x6gYOpRx7r4PmHUmuoNQW7vkNeIpneRNBF/gU+MDpp+ch6+YrWNruE/
   Y1QilLUZMS6sa1IXUxI8AWc0LHrNg3bvELkUGyQSnUOlAg1duU6JnNXow
   g==;
X-CSE-ConnectionGUID: gRhHLC7qS7Sg5wCPSFkRFw==
X-CSE-MsgGUID: 5PMv0oCsSsGomMqnIjg02g==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47955275"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47955275"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 05:31:52 -0700
X-CSE-ConnectionGUID: PYbp9R1zStqGHKMBoxcwTA==
X-CSE-MsgGUID: NyyDGcFqTzqmvce4LPpK1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135592033"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 02 May 2025 05:31:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0D81A1AE; Fri, 02 May 2025 15:31:48 +0300 (EEST)
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
Subject: [PATCH v1 2/6] x86/boot: Introduce helpers for serial I/O
Date: Fri,  2 May 2025 15:29:38 +0300
Message-ID: <20250502123145.4066635-3-andriy.shevchenko@linux.intel.com>
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

As preparatory to enable earlyprintk on non-standard ports on x86,
introduce serial_in() and serial_out() helpers to perform serial I/O.

No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/boot/boot.h                          |  2 +
 .../boot/compressed/early_serial_console.c    |  3 +
 arch/x86/boot/compressed/misc.c               |  4 +-
 arch/x86/boot/compressed/misc.h               |  4 ++
 arch/x86/boot/early_serial_console.c          | 63 +++++++++++++------
 arch/x86/boot/tty.c                           |  7 ++-
 6 files changed, 61 insertions(+), 22 deletions(-)

diff --git a/arch/x86/boot/boot.h b/arch/x86/boot/boot.h
index 753f429b28cb..6688c2053707 100644
--- a/arch/x86/boot/boot.h
+++ b/arch/x86/boot/boot.h
@@ -274,6 +274,8 @@ int check_knl_erratum(void);
 int validate_cpu(void);
 
 /* early_serial_console.c */
+extern unsigned int (*serial_in)(unsigned long addr, int offset);
+extern void (*serial_out)(unsigned long addr, int offset, int value);
 extern unsigned long early_serial_base;
 void console_init(void);
 
diff --git a/arch/x86/boot/compressed/early_serial_console.c b/arch/x86/boot/compressed/early_serial_console.c
index 5b8db03f40ad..a5e0459c3d2f 100644
--- a/arch/x86/boot/compressed/early_serial_console.c
+++ b/arch/x86/boot/compressed/early_serial_console.c
@@ -1,5 +1,8 @@
 #include "misc.h"
 
+unsigned int (*serial_in)(unsigned long addr, int offset);
+void (*serial_out)(unsigned long addr, int offset, int value);
+
 /* This might be accessed before .bss is cleared, so use .data instead. */
 unsigned long early_serial_base __section(".data");
 
diff --git a/arch/x86/boot/compressed/misc.c b/arch/x86/boot/compressed/misc.c
index 94b5991da001..056fa5f01598 100644
--- a/arch/x86/boot/compressed/misc.c
+++ b/arch/x86/boot/compressed/misc.c
@@ -109,10 +109,10 @@ static void serial_putchar(int ch)
 {
 	unsigned timeout = 0xffff;
 
-	while ((inb(early_serial_base + LSR) & XMTRDY) == 0 && --timeout)
+	while ((serial_in(early_serial_base, LSR) & XMTRDY) == 0 && --timeout)
 		cpu_relax();
 
-	outb(ch, early_serial_base + TXR);
+	serial_out(early_serial_base, TXR, ch);
 }
 
 void __putstr(const char *s)
diff --git a/arch/x86/boot/compressed/misc.h b/arch/x86/boot/compressed/misc.h
index f083360c84c1..a70e5f31765b 100644
--- a/arch/x86/boot/compressed/misc.h
+++ b/arch/x86/boot/compressed/misc.h
@@ -127,9 +127,13 @@ extern unsigned char _pgtable[];
 
 #ifdef CONFIG_EARLY_PRINTK
 /* early_serial_console.c */
+extern unsigned int (*serial_in)(unsigned long addr, int offset);
+extern void (*serial_out)(unsigned long addr, int offset, int value);
 extern unsigned long early_serial_base;
 void console_init(void);
 #else
+static unsigned int (*serial_in)(unsigned long addr, int offset);
+static void (*serial_out)(unsigned long addr, int offset, int value);
 static const unsigned long early_serial_base;
 static inline void console_init(void)
 { }
diff --git a/arch/x86/boot/early_serial_console.c b/arch/x86/boot/early_serial_console.c
index 7a7766fa16e5..f52a14284854 100644
--- a/arch/x86/boot/early_serial_console.c
+++ b/arch/x86/boot/early_serial_console.c
@@ -23,22 +23,45 @@
 
 #define DEFAULT_BAUD 9600
 
-static void early_serial_init(unsigned long port, int baud)
+static unsigned int io_serial_in(unsigned long addr, int offset)
+{
+	return inb(addr + offset);
+}
+
+static void io_serial_out(unsigned long addr, int offset, int value)
+{
+	outb(value, addr + offset);
+}
+
+static void early_serial_configure(unsigned long port, int baud)
 {
 	unsigned char c;
 	unsigned divisor;
 
-	outb(0x3, port + LCR);	/* 8n1 */
-	outb(0, port + IER);	/* no interrupt */
-	outb(0, port + FCR);	/* no fifo */
-	outb(0x3, port + MCR);	/* DTR + RTS */
+	serial_out(port, LCR, 0x3);	/* 8n1 */
+	serial_out(port, IER, 0);	/* no interrupt */
+	serial_out(port, FCR, 0);	/* no fifo */
+	serial_out(port, MCR, 0x3);	/* DTR + RTS */
 
 	divisor	= 115200 / baud;
-	c = inb(port + LCR);
-	outb(c | DLAB, port + LCR);
-	outb(divisor & 0xff, port + DLL);
-	outb((divisor >> 8) & 0xff, port + DLH);
-	outb(c & ~DLAB, port + LCR);
+	c = serial_in(port, LCR);
+	serial_out(port, LCR, c | DLAB);
+	serial_out(port, DLL, divisor & 0xff);
+	serial_out(port, DLH, (divisor >> 8) & 0xff);
+	serial_out(port, LCR, c & ~DLAB);
+}
+
+/* Assign serial I/O accessors */
+static void early_serial_use_io_accessors(void)
+{
+	/* These will always be IO based ports */
+	serial_in = io_serial_in;
+	serial_out = io_serial_out;
+}
+
+static void early_serial_init(unsigned long port, int baud)
+{
+	early_serial_configure(port, baud);
 
 	early_serial_base = port;
 }
@@ -73,6 +96,7 @@ static void parse_earlyprintk(void)
 				port = DEFAULT_SERIAL_PORT;
 			else
 				pos = e - arg;
+			early_serial_use_io_accessors();
 		} else if (!strncmp(arg + pos, "ttyS", 4)) {
 			static const int bases[] = { 0x3f8, 0x2f8 };
 			int idx = 0;
@@ -84,6 +108,7 @@ static void parse_earlyprintk(void)
 				idx = 1;
 
 			port = bases[idx];
+			early_serial_use_io_accessors();
 		}
 
 		if (arg[pos] == ',')
@@ -104,11 +129,11 @@ static unsigned int probe_baud(int port)
 	unsigned char lcr, dll, dlh;
 	unsigned int quot;
 
-	lcr = inb(port + LCR);
-	outb(lcr | DLAB, port + LCR);
-	dll = inb(port + DLL);
-	dlh = inb(port + DLH);
-	outb(lcr, port + LCR);
+	lcr = serial_in(port, LCR);
+	serial_out(port, LCR, lcr | DLAB);
+	dll = serial_in(port, DLL);
+	dlh = serial_in(port, DLH);
+	serial_out(port, LCR, lcr);
 	quot = (dlh << 8) | dll;
 
 	return BASE_BAUD / quot;
@@ -129,11 +154,13 @@ static void parse_console_uart8250(void)
 
 	options = optstr;
 
-	if (!strncmp(options, "uart8250,io,", 12))
+	if (!strncmp(options, "uart8250,io,", 12)) {
 		port = simple_strtoull(options + 12, &options, 0);
-	else if (!strncmp(options, "uart,io,", 8))
+		early_serial_use_io_accessors();
+	} else if (!strncmp(options, "uart,io,", 8)) {
 		port = simple_strtoull(options + 8, &options, 0);
-	else
+		early_serial_use_io_accessors();
+	} else
 		return;
 
 	if (options && (options[0] == ','))
diff --git a/arch/x86/boot/tty.c b/arch/x86/boot/tty.c
index e2ab8b8076ef..eb0eacd88db7 100644
--- a/arch/x86/boot/tty.c
+++ b/arch/x86/boot/tty.c
@@ -13,6 +13,9 @@
 
 #include "boot.h"
 
+unsigned int (*serial_in)(unsigned long addr, int offset);
+void (*serial_out)(unsigned long addr, int offset, int value);
+
 unsigned long early_serial_base;
 
 #define XMTRDY          0x20
@@ -29,10 +32,10 @@ static void __section(".inittext") serial_putchar(int ch)
 {
 	unsigned timeout = 0xffff;
 
-	while ((inb(early_serial_base + LSR) & XMTRDY) == 0 && --timeout)
+	while ((serial_in(early_serial_base, LSR) & XMTRDY) == 0 && --timeout)
 		cpu_relax();
 
-	outb(ch, early_serial_base + TXR);
+	serial_out(early_serial_base, TXR, ch);
 }
 
 static void __section(".inittext") bios_putchar(int ch)
-- 
2.47.2

