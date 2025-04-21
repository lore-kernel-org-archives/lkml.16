Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A181EB5D8
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261649; cv=none; b=hPw6GtOlrS+qqLgDrQKClkPGcfU8+zl8kJTMnBa0q9YzQv7y2U94LjLmd/96nVzv7zExsj+tmNpOwW0wEca10JAJeK6E7e4h3/lIV/XMsHlqXQUbwbCHLvAdk8WZamMSFU5glJZ72hrOxXS/4UTuB7aOr4sEnRKOm7/T6dM4o64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261649; c=relaxed/simple;
	bh=QM6gH9TCIv+vanB5Oeg/F4HH+ytmYasNSeoe7V/A8Sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W/Vu2TLu9rmfr1T151lH380lDh3ruTf9aBK75xOWn5IM8phZYTXSLRu/B4yp4GnSspy4SIlAQVbWlxvfXDMuMX/DxyjSwfOZV0bWORwXV/8oE6V9gFXFDeTfQe/ytVpYaPMh721M0XnYo04bwbkr5jqBLS0VKLMw6f332UVO7H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDi9ShJT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDi9ShJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF408C4CEEC;
	Mon, 21 Apr 2025 18:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261648;
	bh=QM6gH9TCIv+vanB5Oeg/F4HH+ytmYasNSeoe7V/A8Sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kDi9ShJTYNosbQNhCkJl3jtTrObzUiD4pxN6uQ6a29ZKkTh1kzWWq2G4sMdye8vvi
	 7TPXspkDZZ6TQTRaOQExDfqXlLWhBm4zNi4EqUH7z0WqL7p3WNTVrOkvspwE6eelZA
	 gtrg/jTSZuqf2W9o8bxHmdjV6Ptlpod8AUn/qTAVdzqAvD8uJQUmCWSHxxVUdiLimL
	 35RoiQQxalJ70Vzwt0pq5J+HyHJqmQTHPjCtThII2WzOToOCyxipui/2u2Jtv7eJ7y
	 dn3vaAgvAJQ4wjm7QYFlV4Zv4V4IXU+rUx/ZZI1cF5iJWX7TBQ9b8m/zViXoJ9a/OU
	 vJHWe6d5ohs0g==
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
Subject: [PATCH 28/29] x86/boot/e820: Make sure e820_search_gap() finds all gaps
Date: Mon, 21 Apr 2025 20:52:08 +0200
Message-ID: <20250421185210.3372306-29-mingo@kernel.org>
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
index b4fe9bebdeb5..f9caf4c922ea 100644
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
 	max_gap_size = 0x400000;
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

