Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDD524728D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507909; cv=none; b=CfCQjzUfFH0YpyEumCIDa1ymsNJxfKmQpeJgTXFu+nR9nNQKn0GJwQolKJEvHmFLwBZqtCI470RSI4P0SHXDpP78y4FwyBYVSESgPKwFGfOMYjMT1TvjVWZ6QaNpF1e8TyK0x98iSfPuAJbJB+KxtGDIdf0rqIslNKT0WG6EJFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507909; c=relaxed/simple;
	bh=KmHZJNH6RR9bd9LWPqVq1zU+HX0JaYILjt9w3k5TxxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LX+BvD85zIrvtKGdkUl7ZShWmlwY0AYEJEQy+vFWGwNsCtpbeUuiSD2O3BsypDWogNPhEVmWRMrYEvdxRNTp1OroRVGfWvqgX3BYKdyFx3x18280KqhHeSgJbDzlmbk2Rnsu020dX2QFzTFazmjbUw5VUaZs5WESVXUHoq4ob+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Vqy83au2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/83t/QER; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Vqy83au2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/83t/QER"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PddnIYK7N+TkPGYBThn8xi4CLcz8wP2gH65K8kQ/H10=;
	b=Vqy83au2zF8HCogiRuRzKlrfrPYdZCX5mFTVOnyI3jgTSAAFNsd4UlLiJErjY3u2YITd7A
	99JJOMcuQO4jr4K/cDpFq6py/+/dV9pkNAEpuUVOqG/LkrozVLu1zFcwDOmB8Mdp86cOEY
	a6G9K+wXnExQu6zVLutpRcbqgdtmRl9j8U7OrJNoylXpct8ouFhBs2O4deo9BJ1rnTppQH
	pbPCYvD7rfTJm+0LG3I1Og7ipAQrF6FXcBdwwBdAWuqvyMxKINa9vbV/XpI6QKn5bzv4SG
	BxZyPV2rVCrOhtCnQJbs9g8jg0cOxA7ZRBGUl9UJxqxo3na3ZX/pCCMJqfRfDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PddnIYK7N+TkPGYBThn8xi4CLcz8wP2gH65K8kQ/H10=;
	b=/83t/QERUFJflBYwlr1jHent7qARD8tNTP4RsmZC3BanAJKPpatvufdpMgPtSDAE8Edj8o
	ConiFrwl6G6ZEWCA==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 06/26] x86/cpuid: Scan CPUID(0x80000000)
Date: Tue,  6 May 2025 07:04:17 +0200
Message-ID: <20250506050437.10264-7-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPUID scanner logic for CPUID(0x80000000).

Similar to kernel/head_32.S and kernel/cpu/common.c, verify the
CPUID(0x80000000) query output beforehand.  This is due to x86-32
machines without an extended CPUID range, where a CPUID(0x80000000) query
will just repeat the max-valid standard CPUID leaf output.

References: 8a50e5135af0 ("x86-32: Use symbolic constants, safer CPUID when enabling EFER.NX")
References: 67ad24e6d39c ("- pre5:    - Rasmus Andersen: add proper...")  # Historical git
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Link: https://lore.kernel.org/r/d4fcfd91-cc92-4b3c-9dd2-56ecd754cecc@citrix.com
---
 arch/x86/include/asm/cpuid/types.h  |  7 ++++++-
 arch/x86/kernel/cpu/cpuid_scanner.c | 22 +++++++++++++++++++++-
 arch/x86/kernel/cpu/cpuid_scanner.h |  1 +
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 6150cb0fa77e..51b7e1b59ea5 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -33,7 +33,11 @@ enum cpuid_regs_idx {
 #define CPUID_LEAF_TILE		0x1d
 
 #define CPUID_BASE_START	0x0
-#define CPUID_BASE_END		(CPUID_BASE_START + 0xffff)
+#define CPUID_EXT_START		0x80000000
+
+#define __CPUID_RANGE_END(idx)	((idx) + 0xffff)
+#define CPUID_BASE_END		__CPUID_RANGE_END(CPUID_BASE_START)
+#define CPUID_EXT_END		__CPUID_RANGE_END(CPUID_EXT_START)
 
 /*
  * Types for CPUID(0x2) parsing
@@ -176,6 +180,7 @@ struct cpuid_leaves {
 	/*         leaf		subleaf		count */
 	CPUID_LEAF(0x0,		0,		1);
 	CPUID_LEAF(0x1,		0,		1);
+	CPUID_LEAF(0x80000000,	0,		1);
 };
 
 /**
diff --git a/arch/x86/kernel/cpu/cpuid_scanner.c b/arch/x86/kernel/cpu/cpuid_scanner.c
index 8f290047b661..ec45c441bde5 100644
--- a/arch/x86/kernel/cpu/cpuid_scanner.c
+++ b/arch/x86/kernel/cpu/cpuid_scanner.c
@@ -20,10 +20,29 @@ static void cpuid_read_generic(const struct cpuid_scan_entry *e, struct cpuid_re
 		cpuid_subleaf(e->leaf, e->subleaf + i, output->leaf);
 }
 
+static void cpuid_read_0x80000000(const struct cpuid_scan_entry *e, struct cpuid_read_output *output)
+{
+	struct leaf_0x80000000_0 *el0 = (struct leaf_0x80000000_0 *)output->leaf;
+
+	cpuid_subleaf(e->leaf, e->subleaf, el0);
+
+	/*
+	 * Protect against 32-bit CPUs lacking extended CPUID support: Max
+	 * extended CPUID leaf must be in the 0x80000001-0x8000ffff range.
+	 */
+	if ((el0->max_ext_leaf & 0xffff0000) != 0x80000000) {
+		*el0 = (struct leaf_0x80000000_0){ };
+		return;
+	}
+
+	output->info->nr_entries = 1;
+}
+
 static unsigned int cpuid_range_max_leaf(const struct cpuid_leaves *leaves, unsigned int range)
 {
 	switch (range) {
 	case CPUID_BASE_START:	return cpuid_get(leaves, 0x0).max_std_leaf;
+	case CPUID_EXT_START:   return cpuid_get(leaves, 0x80000000).max_ext_leaf;
 	default:		return 0;
 	}
 }
@@ -39,7 +58,8 @@ cpuid_range_valid(const struct cpuid_leaves *l, unsigned int leaf, unsigned int
 
 static bool cpuid_leaf_valid(const struct cpuid_leaves *l, unsigned int leaf)
 {
-	return cpuid_range_valid(l, leaf, CPUID_BASE_START, CPUID_BASE_END);
+	return	cpuid_range_valid(l, leaf, CPUID_BASE_START, CPUID_BASE_END) ||
+		cpuid_range_valid(l, leaf, CPUID_EXT_START, CPUID_EXT_END);
 }
 
 static const struct cpuid_scan_entry cpuid_common_scan_entries[] = {
diff --git a/arch/x86/kernel/cpu/cpuid_scanner.h b/arch/x86/kernel/cpu/cpuid_scanner.h
index ff34b478c74f..b3e4676ab7f7 100644
--- a/arch/x86/kernel/cpu/cpuid_scanner.h
+++ b/arch/x86/kernel/cpu/cpuid_scanner.h
@@ -92,6 +92,7 @@ struct cpuid_scan_entry {
 	/*	   leaf		subleaf		reader */			\
 	SCAN_ENTRY(0x0,		0,		generic),			\
 	SCAN_ENTRY(0x1,		0,		generic),			\
+	SCAN_ENTRY(0x80000000,  0,              0x80000000),
 
 /**
  * struct cpuid_scan_info - Parameters for generic CPUID scan logic
-- 
2.49.0

