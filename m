Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B05929C35B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310854; cv=none; b=PhIkaMJElULPVRM5Oi3s5McdRdbNGKMtCjY9blOocIe8XobScwf6thBOnMI0wfZiNMUPaLDsHfFAwYgTpuqbgpIbFPricOgyB0aDV6i2mUDtdSfOx/H24Zofn8RdFPY8F85xragv+S0719GaA8mabfIG/63Fj08M8+YDK0nN7mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310854; c=relaxed/simple;
	bh=VgVnHh1c7rhPJCchELKiTUN2OXkQW1yRKPkHQDPQf7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/+Zt2lwO1NM/AwJgsvPCjEa+XDUZC5RzfrzOY9Av7MhBv9RUrDzhkDTCYaKc+nWd9qqEROYSIH/LRKsqZfQJW4bmJDbHjkEOrUXR7XD+nP2CF/K5rMDZqzVUuHmpHLhOIw1I5Lj89MaA4wUp94/rZDnAiPYHFGnU7/nGIyyTAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R5F33Esq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R5F33Esq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE331C4CEE7;
	Thu, 15 May 2025 12:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310853;
	bh=VgVnHh1c7rhPJCchELKiTUN2OXkQW1yRKPkHQDPQf7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R5F33EsqdUTJ9oWJtElxMkSAN+Ev8+STh1paLnnMLOB80n/X36ukMfuEiLj9Oo3OR
	 m425Ktoic8wCzRNnN9C8Ag9Bedd4sjA1PMD6x7MKPAMNT4jf6NIhAFAPDquuGU1/LA
	 pVirEuhctiO8HBfs6PkXlulTHv2iZkHysik726D9b8Y5zPDIM7KdLO6+yqDUc+V443
	 X5DzJwKhT8RkXGHZNPUkRz8TvgK7vHa+GYtdBWKzsLj4WNmzls6VA72oL57NSoV/UV
	 K85+/vI1QrxgxwwO+U4hdadvMBMseR/tDg7xCJfo1yBfy64u84ntDgaBtBqIaePahw
	 hrVWOXPutbQww==
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
Subject: [PATCH 28/32] x86/boot/e820: Make sure e820_search_gap() finds all gaps
Date: Thu, 15 May 2025 14:05:44 +0200
Message-ID: <20250515120549.2820541-29-mingo@kernel.org>
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

The current implementation of e820_search_gap() searches gaps
in a reverse search from MAX_GAP_END back to 0, contrary to
what its main comment claims:

    * Search for a gap in the E820 memory space from 0 to MAX_GAP_END (4GB).

But gaps can not only be beyond E820 RAM ranges, they can be below
them as well. For example this function will not find the proper
PCI gap for simplified memory map layouts that have a single RAM
range that crosses the 4GB boundary.

Rework the function to have a proper forward search of
E820 table entries.

This makes the code somewhat bigger:

   text       data        bss        dec        hex    filename
   7613      44072          0      51685       c9e5    e820.o.before
   7645      44072          0      51717       ca05    e820.o.after

but it now both implements what it claims to do, and is more
straightforward to read.

( This also allows 'idx' to be the regular u32 again, not an 'int'
  underflowing to -1. )

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 59 +++++++++++++++++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 0d7e9794cd52..5260ce6ad466 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -666,30 +666,52 @@ __init static void e820__update_table_kexec(void)
  */
 __init static int e820_search_gap(unsigned long *max_gap_start, unsigned long *max_gap_size)
 {
-	u64 last = MAX_GAP_END;
-	int idx = e820_table->nr_entries;
+	struct e820_entry *entry;
+	u64 range_end_prev = 0;
 	int found = 0;
+	u32 idx;
 
-	while (--idx >= 0) {
-		u64 start = e820_table->entries[idx].addr;
-		u64 end = start + e820_table->entries[idx].size;
+	for (idx = 0; idx < e820_table->nr_entries; idx++) {
+		u64 range_start, range_end;
 
-		/*
-		 * Since "last" is at most 4GB, we know we'll
-		 * fit in 32 bits if this condition is true:
-		 */
-		if (last > end) {
-			unsigned long gap = last - end;
+		entry = e820_table->entries + idx;
+		range_start = entry->addr;
+		range_end   = entry->addr + entry->size;
 
-			if (gap > *max_gap_size) {
-				*max_gap_size = gap;
-				*max_gap_start = end;
-				found = 1;
+		/* Process any gap before this entry: */
+		if (range_start > range_end_prev) {
+			u64 gap_start = range_end_prev;
+			u64 gap_end = range_start;
+			u64 gap_size;
+
+			if (gap_start < MAX_GAP_END) {
+				/* Make sure the entirety of the gap is below MAX_GAP_END: */
+				gap_end = min(gap_end, MAX_GAP_END);
+				gap_size = gap_end-gap_start;
+
+				if (gap_size >= *max_gap_size) {
+					*max_gap_start = gap_start;
+					*max_gap_size = gap_size;
+					found = 1;
+				}
 			}
 		}
-		if (start < last)
-			last = start;
+
+		range_end_prev = range_end;
+	}
+
+	/* Is there a usable gap beyond the last entry: */
+	if (entry->addr + entry->size < MAX_GAP_END) {
+		u64 gap_start = entry->addr + entry->size;
+		u64 gap_size = MAX_GAP_END-gap_start;
+
+		if (gap_size >= *max_gap_size) {
+			*max_gap_start = gap_start;
+			*max_gap_size = gap_size;
+			found = 1;
+		}
 	}
+
 	return found;
 }
 
@@ -706,6 +728,7 @@ __init void e820__setup_pci_gap(void)
 	unsigned long max_gap_start, max_gap_size;
 	int found;
 
+	/* The minimum eligible gap size is 4MB: */
 	max_gap_size = SZ_4M;
 	found  = e820_search_gap(&max_gap_start, &max_gap_size);
 
@@ -725,7 +748,7 @@ __init void e820__setup_pci_gap(void)
 	pci_mem_start = max_gap_start;
 
 	pr_info("[gap %#010lx-%#010lx] available for PCI devices\n",
-		max_gap_start, max_gap_start + max_gap_size - 1);
+		max_gap_start, max_gap_start + max_gap_size-1);
 }
 
 /*
-- 
2.45.2

