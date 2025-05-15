Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5234829CB37
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310857; cv=none; b=jgjyRGcT4nB8vP+QqFDvxr36wvPVd0NfpX8Rsj48onBekjhRDW4EgZMJuxqCRxeaFNyuTFyomBD9kxACeMgr8hoCU6qaDMzRyzZ2GHHVInhXJclxZE88RI1Qa11CTeUdYFJu4DV0yp3BCnHlSGrtCxMdRcTWPUGrzkNu6UtTBZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310857; c=relaxed/simple;
	bh=2SO7mjIYcRnFjMw60iUgeObaAMHDHhAGqTDKiGyMZyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KKwID2MtirT/m2NIJOqc+6BCWlsTlWlL2Gr+vgw1qtdq1yXwDIhtr+6eqH391GCya/BfsMLrpBt8KqoeFnMdBs9a2LPbiivT/IKM/bw3LlX2XurX/2KxJin5jwpV3cRGBGn+0vSHPqrlKJ4PGdBcc5iPOaxH6C5Bm/4IBVcPbsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sWTY4/Nh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sWTY4/Nh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7B4C4CEE9;
	Thu, 15 May 2025 12:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310857;
	bh=2SO7mjIYcRnFjMw60iUgeObaAMHDHhAGqTDKiGyMZyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sWTY4/NhI/uWJr+dvofDTbvGPJpk+5SQXQ1/vxi2W09sh78e5QtAsOdpfBuphQNOp
	 kiDL+MmAJKBla6N7qcDt6bHDgDSmkiqoOvYm/jfecS/o2scW+BUJ/Kf01hs2KI8tWl
	 n8UZ6ozadzDMPjj2EV/MurzRYYNtfmYDNW/+BXEl+5Cf15CpZkSVMIhzt4KUFPsxf6
	 u3i29UNmxQI/jiX2qhWflJC/KYf1R2OwzyJS/YExdGurvnyw33mgqg2V8nniP8F7op
	 ls0qQqrJE4xfvd15YlGYlrUgD4Xc2f6SZvUC1NLXong8rdGm8iK6mVc4nknNeDDugI
	 K65QR5Da586cQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 29/32] x86/boot/e820: Introduce E820_TYPE_13 and treat it as a device region
Date: Thu, 15 May 2025 14:05:45 +0200
Message-ID: <20250515120549.2820541-30-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515120549.2820541-1-mingo@kernel.org>
References: <20250515120549.2820541-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Paul Menzel pointed out that ACPI specification 6.3 defines 'reserved'
E820 region types as E820_TYPE_RESERVED (type 2):

 > Table 15-374 *Address Range Types* in the ACPI specification 6.3 says:
 >
 > > Reserved for future use. OSPM must treat any range of this type as if
 > > the type returned was AddressRangeReserved.

This has relevance for device address regions, which on some firmware such
as CoreBoot, get passed to Linux as type-13 - which the kernel
treats as system regions and registers them as unavailable to drivers:

	static bool __init e820_device_region(enum e820_type type, struct resource *res)

	...

        case E820_TYPE_ACPI:
        case E820_TYPE_NVS:
        case E820_TYPE_UNUSABLE:
        default:
                return false;

Users of such systems will see device breakage on Linux, which they
have to work around with iomem=relaxed kind of boot time hacks to
turn off resource conflict checking.

Partially follow the ACPI spec and add a limited quirk for the
E820_TYPE_13 type, and allow it to be claimed by device drivers
(similarly to E820_TYPE_RESERVED).

Don't change behavior for other unknown types.

Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Suggested-by: H. Peter Anvin <hpa@zytor.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/include/asm/e820/types.h |  4 ++++
 arch/x86/kernel/e820.c            | 11 +++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/e820/types.h b/arch/x86/include/asm/e820/types.h
index df12f7ee75d3..2430120c2528 100644
--- a/arch/x86/include/asm/e820/types.h
+++ b/arch/x86/include/asm/e820/types.h
@@ -27,6 +27,10 @@ enum e820_type {
 	 *   6 was assigned differently. Some time they will learn... )
 	 */
 	E820_TYPE_PRAM		= 12,
+	/*
+	 * Certain firmware such as CoreBoot uses this type:
+	 */
+	E820_TYPE_13		= 13,
 
 	/*
 	 * Special-purpose memory is indicated to the system via the
diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 5260ce6ad466..6c9c00ce8db9 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -1075,7 +1075,7 @@ __init static const char * e820_type_to_string(struct e820_entry *entry)
 	case E820_TYPE_PRAM:		return "Persistent Memory (legacy)";
 	case E820_TYPE_PMEM:		return "Persistent Memory";
 	case E820_TYPE_RESERVED:	return "Reserved";
-	case E820_TYPE_SOFT_RESERVED:	return "Soft Reserved";
+	case E820_TYPE_13:		return "Type 13";
 	default:			return "Unknown E820 type";
 	}
 }
@@ -1090,6 +1090,7 @@ __init static unsigned long e820_type_to_iomem_type(struct e820_entry *entry)
 	case E820_TYPE_PRAM:		/* Fall-through: */
 	case E820_TYPE_PMEM:		/* Fall-through: */
 	case E820_TYPE_RESERVED:	/* Fall-through: */
+	case E820_TYPE_13:		/* Fall-through: */
 	case E820_TYPE_SOFT_RESERVED:	/* Fall-through: */
 	default:			return IORESOURCE_MEM;
 	}
@@ -1102,7 +1103,8 @@ __init static unsigned long e820_type_to_iores_desc(struct e820_entry *entry)
 	case E820_TYPE_NVS:		return IORES_DESC_ACPI_NV_STORAGE;
 	case E820_TYPE_PMEM:		return IORES_DESC_PERSISTENT_MEMORY;
 	case E820_TYPE_PRAM:		return IORES_DESC_PERSISTENT_MEMORY_LEGACY;
-	case E820_TYPE_RESERVED:	return IORES_DESC_RESERVED;
+	case E820_TYPE_RESERVED:	/* Fall-through: */
+	case E820_TYPE_13:		return IORES_DESC_RESERVED;
 	case E820_TYPE_SOFT_RESERVED:	return IORES_DESC_SOFT_RESERVED;
 	case E820_TYPE_RAM:		/* Fall-through: */
 	case E820_TYPE_UNUSABLE:	/* Fall-through: */
@@ -1132,6 +1134,7 @@ __init static bool e820_device_region(enum e820_type type, struct resource *res)
 	 */
 	switch (type) {
 	case E820_TYPE_RESERVED:
+	case E820_TYPE_13:
 	case E820_TYPE_SOFT_RESERVED:
 	case E820_TYPE_PRAM:
 	case E820_TYPE_PMEM:
@@ -1140,6 +1143,10 @@ __init static bool e820_device_region(enum e820_type type, struct resource *res)
 	case E820_TYPE_ACPI:
 	case E820_TYPE_NVS:
 	case E820_TYPE_UNUSABLE:
+	/*
+	 * Unknown E820 types should be treated passively, here we
+	 * don't allow them to be claimed by device drivers:
+	 */
 	default:
 		return false;
 	}
-- 
2.45.2

