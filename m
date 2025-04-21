Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AF61F4C8F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261626; cv=none; b=eC/kWycXx0cEgool3b189qeZ02MpotHallW5WV8gVKkoHIgoJRAacjMDcR+yKRrff3UhV/u2vwJsNARdfHBFWL5v9/40THq7Z8/zRB0gR4NGjQ1XdpqcdO+JOIn0lv1X/ukmFfnyZ6ogwxy2B7zsK2978ZG83si4KynsAkKN0E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261626; c=relaxed/simple;
	bh=POZR5KKXS438W5+E+m5kr9lScH+4LzjpbBPckh8oO40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZaGvokQhcJKMPI9pYDbQWFunoBc7t9fiASL0M+s++aG3xNDl8o8yRJmX+PhFfd0B+17l6G3tUp8JjglAA0iz+MBYTT/EZ6gGAlkXGrk2ui2QycWRw6apcT1JoDqsFfFewpiGG0qSqjm4IOQtG8ui+KdSKQSlm1HOmMhZ5sFMBn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwQW6ivn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwQW6ivn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9FEC4CEEC;
	Mon, 21 Apr 2025 18:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261625;
	bh=POZR5KKXS438W5+E+m5kr9lScH+4LzjpbBPckh8oO40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MwQW6ivn/i8v4rgXqDPnOIcd+7aMbdlOaHsB/Aj0evWu7+0IqWdsPoP69DRJZHSwM
	 3BNkC3le4RXlYickYeYcUyQaTBYjaF6epolNir0j9XQ7PA93vpzRywMNIXwWweegJT
	 bbsBRFrajlmY4fNW1JoD0Ii5furwTJeIwE1d35mWcXFnNq+hEkxgDweyQ/o3ZJnGfs
	 ZdACebbsknjxHQcpvb3pDZ1lsJ+nw6gznkt31PyYQGVyPHGdCN2VpJdO/9epoIhfMu
	 FsIgQG3B/wzEBCaeJpNOWAxy8NUbFybDoUhmllVMX8QXPOgNgp/SG0io2lRG5KIYj8
	 FeXRI1eLkQgzg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
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
	Ingo Molnar <mingo@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 20/29] x86/boot/e820: Clean up e820__setup_pci_gap()/e820_search_gap() a bit
Date: Mon, 21 Apr 2025 20:52:00 +0200
Message-ID: <20250421185210.3372306-21-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250421185210.3372306-1-mingo@kernel.org>
References: <20250421185210.3372306-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a bit more readable variable names, we haven't run out of
underscore characters in the kernel yet.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
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
index d55cb77537e7..01d50331856c 100644
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
+	gap_size = 0x400000;
+	found  = e820_search_gap(&gap_start, &gap_size);
 
 	if (!found) {
 #ifdef CONFIG_X86_64
-		gapstart = (max_pfn << PAGE_SHIFT) + 1024*1024;
+		gap_start = (max_pfn << PAGE_SHIFT) + 1024*1024;
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

