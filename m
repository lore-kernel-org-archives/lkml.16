Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F1529B79A
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310833; cv=none; b=QDe6CRpjy6QnWhH6iVRhjBFfI3+SkZ2yqeulUt+q+ie2oVEvNGDpsrs0o9boJXL/uEfqwCvCX/SXb61Qyl+yEBjjhW+hB+E5ETtgQNkzToyN3Mc9mLCHcF6eNFMldinGgOIhQRpzdCZzYLz6SsTSX1i7nPaD5HCOwnLgfzO8a8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310833; c=relaxed/simple;
	bh=6SLHwAUM+btkcB2mBfsCr4BZVFt3PSCOic7YPAKPi2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUgzQNtHg+2tgPmFzfjrzZ8Zx+3t2Nz17FRPDSUEUNoizq5b+Dd5Eoi7YrjjC6Z9ECKYcVzuBLLFgy2qci2u+qSXjh4KUbSQyelsx4nABw2vPwzQkafU6S593bjBMCqdwkG5EG1dFz0mksR0k4SJQ+lRI6wdCatc/FXLKkamGlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSiiALgF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSiiALgF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3763C4CEED;
	Thu, 15 May 2025 12:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310832;
	bh=6SLHwAUM+btkcB2mBfsCr4BZVFt3PSCOic7YPAKPi2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YSiiALgFOU0cuDpivGfNQorZvkaDRiXlauriTFhJLBI3IxW8Puj99quPban2aT6b2
	 RIKrEDr/XISSUXc2WubCkqzEOqEpXZQOKxB1rnezIwGJN5JGAjWuP5Lyn+v7A+b0Kq
	 ImSNi0kzWc0ay1ozx5Ofg5ef9Hr1JFO/L+f4ut8yCbp1V8hGRmRzODO8lp7j7MlO5W
	 hFn96g54qo8eBxR51Do4RSWpaSNo3Y8HF/2RNtMG/67D2jNLaKMMVEEiLD2TaxDC8t
	 43gtvQ5xXC9gj75h/6vF5ZK+oIgqqcJNxi/JnNMU4lz0VW89SeFFp/JlxFPELaTIIU
	 Sob++HOsJSpsw==
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
Subject: [PATCH 22/32] x86/boot/e820: Rename gap_start/gap_size to max_gap_start/max_gap_start in e820_search_gap() et al
Date: Thu, 15 May 2025 14:05:38 +0200
Message-ID: <20250515120549.2820541-23-mingo@kernel.org>
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

The PCI gap searching functions pass around pointers to the
gap_start/gap_size variables, which refer to the maximum
size gap found so far.

Rename the variables to say so, and disambiguate their namespace
from 'current gap' variables.

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
index b2e2ada50adb..1eb5afbdd9e6 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -680,7 +680,7 @@ static void __init e820__update_table_kexec(void)
 /*
  * Search for a gap in the E820 memory space from 0 to MAX_GAP_END (4GB).
  */
-static int __init e820_search_gap(unsigned long *gap_start, unsigned long *gap_size)
+static int __init e820_search_gap(unsigned long *max_gap_start, unsigned long *max_gap_size)
 {
 	u64 last = MAX_GAP_END;
 	int idx = e820_table->nr_entries;
@@ -697,9 +697,9 @@ static int __init e820_search_gap(unsigned long *gap_start, unsigned long *gap_s
 		if (last > end) {
 			unsigned long gap = last - end;
 
-			if (gap > *gap_size) {
-				*gap_size = gap;
-				*gap_start = end;
+			if (gap > *max_gap_size) {
+				*max_gap_size = gap;
+				*max_gap_start = end;
 				found = 1;
 			}
 		}
@@ -719,29 +719,29 @@ static int __init e820_search_gap(unsigned long *gap_start, unsigned long *gap_s
  */
 __init void e820__setup_pci_gap(void)
 {
-	unsigned long gap_start, gap_size;
+	unsigned long max_gap_start, max_gap_size;
 	int found;
 
-	gap_size = SZ_4M;
-	found  = e820_search_gap(&gap_start, &gap_size);
+	max_gap_size = SZ_4M;
+	found  = e820_search_gap(&max_gap_start, &max_gap_size);
 
 	if (!found) {
 #ifdef CONFIG_X86_64
-		gap_start = (max_pfn << PAGE_SHIFT) + SZ_1M;
+		max_gap_start = (max_pfn << PAGE_SHIFT) + SZ_1M;
 		pr_err("Cannot find an available gap in the 32-bit address range\n");
 		pr_err("PCI devices with unassigned 32-bit BARs may not work!\n");
 #else
-		gap_start = 0x10000000;
+		max_gap_start = 0x10000000;
 #endif
 	}
 
 	/*
 	 * e820__reserve_resources_late() protects stolen RAM already:
 	 */
-	pci_mem_start = gap_start;
+	pci_mem_start = max_gap_start;
 
 	pr_info("[gap %#010lx-%#010lx] available for PCI devices\n",
-		gap_start, gap_start + gap_size - 1);
+		max_gap_start, max_gap_start + max_gap_size - 1);
 }
 
 /*
-- 
2.45.2

