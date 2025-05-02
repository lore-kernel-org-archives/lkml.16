Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297F3253B50
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189117; cv=none; b=XUyEd7YjTIlDrOUjng6pHp3dl63jlN1wxo+pZpBhOjjudrAfOKm5q8wtkp6aUMuHX3Mv5BbM9/w0Cr3e57yA9JOW9cDsIdn+2t5IkxkEMdIcl7KQHbwgzWBTeHtexIl0ydSREGqdd3O9QzuQK5oS5UwCwO8CNAJEwR1rGWJ0EVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189117; c=relaxed/simple;
	bh=HpVFos1tTHg5dfkSMhwdAOhwfisXCl7ONc0joAaTi6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rroT6D9StfsUPBOuQpPyUmSotCZfvQPtZ8NfU+ePm3Prnk+eaADePzaQW70mG5hwLQwcBXT5vJl21fl6DeNMuG8MfndCTaoTu3UvvnithgV6Uj4rKXWbtU3uUUSz7izoC5Eqxa/dqpKi5Ak04NlCCyz3aoVq9XNjjBo6bTnLNNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJhr988I; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJhr988I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746189117; x=1777725117;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HpVFos1tTHg5dfkSMhwdAOhwfisXCl7ONc0joAaTi6I=;
  b=QJhr988IJquduPrWrOoQ/CjpCG+B50Z3dUB/QGwY86aZlB0VqOe4YD38
   ypQhl6vPjbqhjFpDa2xSBXJkMEKFVKxJwLL1trCTqVQS2zYCHHgBVY24U
   vsehaTXudnzVRpqGZcGYkz+OPqKDSld3Xs3RX1zAKSl0hxmFTpYM+Xh5e
   nJvHgaepKcqOKdFqZcqo1SkzIhuSSFPJWBZVATBQzFVA7+70ye5dFh2wa
   PkUz3cpp63JryKCQBRED1hz4SIa48qodopHKq8ERQK86PJaUUzzOyuhDI
   hr65l/RzolwJ3PEkTRav1VMmHbNxi0x52FoCbKosgjvTivmKyxa7hXkW8
   Q==;
X-CSE-ConnectionGUID: JFDTrVcIQ0O0ofspU7tDag==
X-CSE-MsgGUID: /f+15D9FRZStZS9poH9Cgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58078092"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="58078092"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 05:31:56 -0700
X-CSE-ConnectionGUID: l2LEmdW9SEqXgRErr/ub/w==
X-CSE-MsgGUID: 3/5nASF8QkOgB5TF5EeL+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; 
   d="scan'208";a="135613043"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 02 May 2025 05:31:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 33902260; Fri, 02 May 2025 15:31:48 +0300 (EEST)
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
Subject: [PATCH v1 5/6] x86/boot: Also share MMIO accessors
Date: Fri,  2 May 2025 15:29:41 +0300
Message-ID: <20250502123145.4066635-6-andriy.shevchenko@linux.intel.com>
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

For the enabling an arbitrary MMIO for earlyprintk,
share MMIO accessors with a boot code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/include/asm/io.h        | 65 ------------------------------
 arch/x86/include/asm/shared/io.h | 68 ++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 65 deletions(-)

diff --git a/arch/x86/include/asm/io.h b/arch/x86/include/asm/io.h
index e889c3bab5a2..e6ca50fbcbbf 100644
--- a/arch/x86/include/asm/io.h
+++ b/arch/x86/include/asm/io.h
@@ -44,71 +44,6 @@
 #include <asm/shared/io.h>
 #include <asm/special_insns.h>
 
-#define build_mmio_read(name, size, type, reg, barrier) \
-static inline type name(const volatile void __iomem *addr) \
-{ type ret; asm volatile("mov" size " %1,%0":reg (ret) \
-:"m" (*(volatile type __force *)addr) barrier); return ret; }
-
-#define build_mmio_write(name, size, type, reg, barrier) \
-static inline void name(type val, volatile void __iomem *addr) \
-{ asm volatile("mov" size " %0,%1": :reg (val), \
-"m" (*(volatile type __force *)addr) barrier); }
-
-build_mmio_read(readb, "b", unsigned char, "=q", :"memory")
-build_mmio_read(readw, "w", unsigned short, "=r", :"memory")
-build_mmio_read(readl, "l", unsigned int, "=r", :"memory")
-
-build_mmio_read(__readb, "b", unsigned char, "=q", )
-build_mmio_read(__readw, "w", unsigned short, "=r", )
-build_mmio_read(__readl, "l", unsigned int, "=r", )
-
-build_mmio_write(writeb, "b", unsigned char, "q", :"memory")
-build_mmio_write(writew, "w", unsigned short, "r", :"memory")
-build_mmio_write(writel, "l", unsigned int, "r", :"memory")
-
-build_mmio_write(__writeb, "b", unsigned char, "q", )
-build_mmio_write(__writew, "w", unsigned short, "r", )
-build_mmio_write(__writel, "l", unsigned int, "r", )
-
-#define readb readb
-#define readw readw
-#define readl readl
-#define readb_relaxed(a) __readb(a)
-#define readw_relaxed(a) __readw(a)
-#define readl_relaxed(a) __readl(a)
-#define __raw_readb __readb
-#define __raw_readw __readw
-#define __raw_readl __readl
-
-#define writeb writeb
-#define writew writew
-#define writel writel
-#define writeb_relaxed(v, a) __writeb(v, a)
-#define writew_relaxed(v, a) __writew(v, a)
-#define writel_relaxed(v, a) __writel(v, a)
-#define __raw_writeb __writeb
-#define __raw_writew __writew
-#define __raw_writel __writel
-
-#ifdef CONFIG_X86_64
-
-build_mmio_read(readq, "q", u64, "=r", :"memory")
-build_mmio_read(__readq, "q", u64, "=r", )
-build_mmio_write(writeq, "q", u64, "r", :"memory")
-build_mmio_write(__writeq, "q", u64, "r", )
-
-#define readq_relaxed(a)	__readq(a)
-#define writeq_relaxed(v, a)	__writeq(v, a)
-
-#define __raw_readq		__readq
-#define __raw_writeq		__writeq
-
-/* Let people know that we have them */
-#define readq			readq
-#define writeq			writeq
-
-#endif
-
 #define ARCH_HAS_VALID_PHYS_ADDR_RANGE
 extern int valid_phys_addr_range(phys_addr_t addr, size_t size);
 extern int valid_mmap_phys_addr_range(unsigned long pfn, size_t size);
diff --git a/arch/x86/include/asm/shared/io.h b/arch/x86/include/asm/shared/io.h
index 8009d781c2f9..35437ee26e21 100644
--- a/arch/x86/include/asm/shared/io.h
+++ b/arch/x86/include/asm/shared/io.h
@@ -31,4 +31,72 @@ BUILDIO(l,  , u32)
 #define outw __outw
 #define outl __outl
 
+#define build_mmio_read(name, size, type, reg, barrier) \
+static inline type name(const volatile void __iomem *addr) \
+{ type ret; asm volatile("mov" size " %1,%0":reg (ret) \
+:"m" (*(volatile type __force *)addr) barrier); return ret; }
+
+#define build_mmio_write(name, size, type, reg, barrier) \
+static inline void name(type val, volatile void __iomem *addr) \
+{ asm volatile("mov" size " %0,%1": :reg (val), \
+"m" (*(volatile type __force *)addr) barrier); }
+
+build_mmio_read(readb, "b", unsigned char, "=q", :"memory")
+build_mmio_read(readw, "w", unsigned short, "=r", :"memory")
+build_mmio_read(readl, "l", unsigned int, "=r", :"memory")
+
+build_mmio_read(__readb, "b", unsigned char, "=q", )
+build_mmio_read(__readw, "w", unsigned short, "=r", )
+build_mmio_read(__readl, "l", unsigned int, "=r", )
+
+build_mmio_write(writeb, "b", unsigned char, "q", :"memory")
+build_mmio_write(writew, "w", unsigned short, "r", :"memory")
+build_mmio_write(writel, "l", unsigned int, "r", :"memory")
+
+build_mmio_write(__writeb, "b", unsigned char, "q", )
+build_mmio_write(__writew, "w", unsigned short, "r", )
+build_mmio_write(__writel, "l", unsigned int, "r", )
+
+#define readb readb
+#define readw readw
+#define readl readl
+#define readb_relaxed(a) __readb(a)
+#define readw_relaxed(a) __readw(a)
+#define readl_relaxed(a) __readl(a)
+#define __raw_readb __readb
+#define __raw_readw __readw
+#define __raw_readl __readl
+
+#define writeb writeb
+#define writew writew
+#define writel writel
+#define writeb_relaxed(v, a) __writeb(v, a)
+#define writew_relaxed(v, a) __writew(v, a)
+#define writel_relaxed(v, a) __writel(v, a)
+#define __raw_writeb __writeb
+#define __raw_writew __writew
+#define __raw_writel __writel
+
+#ifdef CONFIG_X86_64
+
+build_mmio_read(readq, "q", u64, "=r", :"memory")
+build_mmio_read(__readq, "q", u64, "=r", )
+build_mmio_write(writeq, "q", u64, "r", :"memory")
+build_mmio_write(__writeq, "q", u64, "r", )
+
+#define readq_relaxed(a)	__readq(a)
+#define writeq_relaxed(v, a)	__writeq(v, a)
+
+#define __raw_readq		__readq
+#define __raw_writeq		__writeq
+
+/* Let people know that we have them */
+#define readq			readq
+#define writeq			writeq
+
+#endif
+
+#undef build_mmio_write
+#undef build_mmio_read
+
 #endif
-- 
2.47.2

