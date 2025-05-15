Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BD2298CAD
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310827; cv=none; b=rTrsPRIzlbJsSSSMNij1/nuw8lm6VGOljnkis99/bpBbXPPKzO3X2o+btk8Wxpfxm2lAT3dqVofiLIdl1iRW8UG0gxWl0x8i8M5abzfr1Xeke1wrcMY2OXmNDtaeVgMtoNCGM+xBMWdDPyFDJyeZ57ZrhDAb2S9ucxqINKqQZ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310827; c=relaxed/simple;
	bh=MlUQf1NQ7gX+mFF9JkdSt8ETIhb2gycIemf5SZNgLyg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i+957oAqFTCsqB035RmKLaMnst9SeRsmA5BeLyuX5tLHBkFLRmbqr4W1U6juTsQuwXv6JsfqvapnHDstCGKsHAOFqBuo3pGysWGbewgmj3kjzrZ6aZqyFZKsEpLvu9xzIkwBJXEExROD4DWFxBjr4GOZliJvxSVnPZwOzjulaqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SAUQaRRV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SAUQaRRV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CACC8C4CEE7;
	Thu, 15 May 2025 12:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310825;
	bh=MlUQf1NQ7gX+mFF9JkdSt8ETIhb2gycIemf5SZNgLyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SAUQaRRVmFlsw0OHMWuVjA1o+1mFH67dZm56X7pm09P3Oe2Eo0SkN8bRhsyADrj6+
	 9HPvy3m/xkSJ0/kDhkbJrUuG+e826ECGVh+DlnM2Y1I6aPk7nvr9JGt2Y0KL1PsIPa
	 FPJoTp2H66M4rE3FjoWtIAbtRCfZTAVbgovtAd3zU4fgFmy1hfG0Og1AW8oA/Ztijt
	 jJFg4H1FVsCTrHTzkfMm2jkW8JRXigm9r0AL+2PzUvBJ4/2eWBcCbchHAFki5tY5pz
	 kf/D3Uu/unQ0v/HwJ91qdWrZmiB0+JmbXOhZju6iQJm46nBWSeiuLP2/C3FOzp+Xiv
	 dX6c9nPA9UcGw==
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
Subject: [PATCH 20/32] x86/boot/e820: Clean up e820__setup_pci_gap()/e820_search_gap() a bit
Date: Thu, 15 May 2025 14:05:36 +0200
Message-ID: <20250515120549.2820541-21-mingo@kernel.org>
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

Apply misc cleanups:

 - Use a bit more readable variable names, we haven't run out of
   underscore characters in the kernel yet.

 - s/0x400000/SZ_4M

 - s/1024*1024/SZ_1M

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index ee8b56605e4a..d00ca2dd20b7 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -680,7 +680,7 @@ static void __init e820__update_table_kexec(void)
 /*
  * Search for a gap in the E820 memory space from 0 to MAX_GAP_END (4GB).
  */
-static int __init e820_search_gap(unsigned long *gapstart, unsigned long *gapsize)
+static int __init e820_search_gap(unsigned long *gap_start, unsigned long *gap_size)
 {
 	u64 last = MAX_GAP_END;
 	int idx = e820_table->nr_entries;
@@ -697,9 +697,9 @@ static int __init e820_search_gap(unsigned long *gapstart, unsigned long *gapsiz
 		if (last > end) {
 			unsigned long gap = last - end;
 
-			if (gap >= *gapsize) {
-				*gapsize = gap;
-				*gapstart = end;
+			if (gap >= *gap_size) {
+				*gap_size = gap;
+				*gap_start = end;
 				found = 1;
 			}
 		}
@@ -719,29 +719,29 @@ static int __init e820_search_gap(unsigned long *gapstart, unsigned long *gapsiz
  */
 __init void e820__setup_pci_gap(void)
 {
-	unsigned long gapstart, gapsize;
+	unsigned long gap_start, gap_size;
 	int found;
 
-	gapsize = 0x400000;
-	found  = e820_search_gap(&gapstart, &gapsize);
+	gap_size = SZ_4M;
+	found  = e820_search_gap(&gap_start, &gap_size);
 
 	if (!found) {
 #ifdef CONFIG_X86_64
-		gapstart = (max_pfn << PAGE_SHIFT) + 1024*1024;
+		gap_start = (max_pfn << PAGE_SHIFT) + SZ_1M;
 		pr_err("Cannot find an available gap in the 32-bit address range\n");
 		pr_err("PCI devices with unassigned 32-bit BARs may not work!\n");
 #else
-		gapstart = 0x10000000;
+		gap_start = 0x10000000;
 #endif
 	}
 
 	/*
 	 * e820__reserve_resources_late() protects stolen RAM already:
 	 */
-	pci_mem_start = gapstart;
+	pci_mem_start = gap_start;
 
 	pr_info("[gap %#010lx-%#010lx] available for PCI devices\n",
-		gapstart, gapstart + gapsize - 1);
+		gap_start, gap_start + gap_size - 1);
 }
 
 /*
-- 
2.45.2

