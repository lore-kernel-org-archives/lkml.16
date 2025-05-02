Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC3A2550B2
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189119; cv=none; b=LkF2Lmklpwodbt7gEu3JReaDcLgO3cvCyPW7ZnbmwE1oEJa5gOon220rGfa6bh6kx8FA8HCgEsQDgkhAyqbdezCgj1sWFa6nElA+H1jzi14srJRYH3VvTVUfWegIWCs/JL5UvgPBkFquImUDN8M2vCIsb5ykryp0zXZY7pmVwrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189119; c=relaxed/simple;
	bh=JFN/A3j92YrW1yGcaADxhShlxbiQHnzx9X1/unZy8BI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kAtHmb4wghwxru/iO3I4BW+aWtlvBNWRLKhEB1MJLePEJBzysIA560fBf5Utnpk4/EmLillLmDD6A8F2x1qYhP6xT36Fm1gPZ/hN1TCx1QIz0Q3UTB/Baf81nsSa30km8iUPpMBIsVcEJZowZnS4qX+1dKai9bKINbZBzTsMg1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KzLG5obL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KzLG5obL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746189118; x=1777725118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JFN/A3j92YrW1yGcaADxhShlxbiQHnzx9X1/unZy8BI=;
  b=KzLG5obLy7r8jUoa+NM44r7mmrRixmx0HQ6vNuxw6lVyO+mum3/kDINH
   UIaUQWpBrUD20YJSPSpKrnSmuTY6PaRIG79Olo/S74e6vG4aykZ5uxnF+
   SiNRzMEX735mKZfN3rPgmGPyk/5dAJCbqya49VE7WmGvw/uZE/oj+z5cP
   NcfsfxoNfsmSg76Cw0+Cele2/f7oYX71foq1kQ7MWlWpdGAweAFP3GBg+
   GW49ePnTk89UGycj+ceDVioL3dfLpg5qjYgpidsOS2JhADy8Lkg+RZGDc
   hG26iiKrmnNwXi+V9L2NJJdxKaQz3gbxe4wKHIh8BiTaKXC6dMrxl6QP/
   w==;
X-CSE-ConnectionGUID: R+sJC4n3S+yxhAcY4rqG8g==
X-CSE-MsgGUID: 8KcZTNDUR8uuPPg9Ppk9pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="47955312"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="47955312"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 05:31:56 -0700
X-CSE-ConnectionGUID: sbJx785xQzanfS08EVNpwQ==
X-CSE-MsgGUID: 5xTkwiscQK6sj942VCs+iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135592037"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 02 May 2025 05:31:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3C3201AC; Fri, 02 May 2025 15:31:48 +0300 (EEST)
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
Subject: [PATCH v1 6/6] x86/boot: Introduce MMIO accessors and their support in earlyprintk
Date: Fri,  2 May 2025 15:29:42 +0300
Message-ID: <20250502123145.4066635-7-andriy.shevchenko@linux.intel.com>
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

If user supplied serial base address via kernel command line and
at the same time the word 'mmio' is present, use MMIO accessors.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/boot/early_serial_console.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/x86/boot/early_serial_console.c b/arch/x86/boot/early_serial_console.c
index 6841f14346c2..fa8eb0b4542e 100644
--- a/arch/x86/boot/early_serial_console.c
+++ b/arch/x86/boot/early_serial_console.c
@@ -33,6 +33,20 @@ static void io_serial_out(unsigned long addr, int offset, int value)
 	outb(value, addr + offset);
 }
 
+static void mem8_serial_out(unsigned long addr, int offset, int value)
+{
+	u8 __iomem *vaddr = (u8 __iomem *)addr;
+	/* shift implied by pointer type */
+	writeb(value, vaddr + offset);
+}
+
+static unsigned int mem8_serial_in(unsigned long addr, int offset)
+{
+	u8 __iomem *vaddr = (u8 __iomem *)addr;
+	/* shift implied by pointer type */
+	return readb(vaddr + offset);
+}
+
 static void early_serial_configure(unsigned long port, int baud)
 {
 	unsigned char c;
@@ -59,6 +73,13 @@ static void early_serial_use_io_accessors(void)
 	serial_out = io_serial_out;
 }
 
+static void early_serial_use_mmio_accessors(void)
+{
+	/* It is memory mapped - assume 8-bit alignment */
+	serial_in = mem8_serial_in;
+	serial_out = mem8_serial_out;
+}
+
 static void early_serial_init(unsigned long port, int baud)
 {
 	early_serial_configure(port, baud);
@@ -101,12 +122,16 @@ static void parse_earlyprintk(void)
 		/*
 		 * make sure we have
 		 *	"serial,0x3f8,115200"
+		 *	"serial,mmio,0xff010180,115200"
 		 *	"serial,ttyS0,115200"
 		 *	"ttyS0,115200"
 		 */
 		if (pos == 7 && !strncmp(arg + pos, "0x", 2)) {
 			port = parse_serial_port(arg, pos + 0, &pos);
 			early_serial_use_io_accessors();
+		} else if (pos == 7 && !strncmp(arg + pos, "mmio,0x", 7)) {
+			port = parse_serial_port(arg, pos + 5, &pos);
+			early_serial_use_mmio_accessors();
 		} else if (!strncmp(arg + pos, "ttyS", 4)) {
 			static const int bases[] = { 0x3f8, 0x2f8 };
 			int idx = 0;
-- 
2.47.2

