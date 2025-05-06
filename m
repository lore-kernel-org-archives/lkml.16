Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4277B27F191
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507944; cv=none; b=jxlOR1vWnZctUR+3Y3GXOcrWg17nXiw8tWczOaZsJDDS6mPMAObCs1qc6jKrE40T+m+eiFFnljmBFMIq1bPcF+fTE0WQHZCgUrAAP0/yUkCviE1mVKXla2qQAjN3CivedePnf1gVblycnqyTYNiC8P4HvQ6Q8YW9ti3QXP81b78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507944; c=relaxed/simple;
	bh=WQHYPF4LgOgFYQ9Q+WPQ42oHU38JPwi9T6wecesfx4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qqV3lsS9GZIbL8VIL7rBHurmku9jILuzKFv1KYrQeFf95TJjxWANFmYQUcplmKGzg/6oinTBGOLrlHJ9aqXxRlDUi28z4Hl5iT+IAFTqr4Xv2yP2eVLfyPQCcmU2NVUp9bIe+Bn5qwlN07pqB44GQstYsRoxzw3rB5m4T/wSNCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=M7fui/4E; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rmqXN9cU; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="M7fui/4E";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rmqXN9cU"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/QPDSSIaDlsMlrBQvmYH5ck2rCJ3D79YkWJVuL6C7c=;
	b=M7fui/4EUtOxyDUPO3BScjw9pWVC1uEOLnkGtsZQMRDJ5SbbRSWXy2E9LBOuZykSIIk1jE
	5kBqsRVA4KL5jr3vYFQnvqXNfA5yC4bUtObgqubMldkVcwVYx5jqGIuv0znHxyZz6vZDDX
	rY3AsdPGMYV2DaRyg1X1t4S+lqoy/CMvVeXBhumshAEajaTN/vCdmpLGlWa4fLauDQtNJr
	+gfslgt9nf6eAgCRbN/tAYCXeLBj0not5Q1xdSboAhYt9/GY41OjVCBI6N32AZupXwAdYh
	7sEMuDcKkbuEYpEMSJ6D+kw0VAs5sYzGJ5/vxNBUEk0awr3T7lhvDag95lPQ0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M/QPDSSIaDlsMlrBQvmYH5ck2rCJ3D79YkWJVuL6C7c=;
	b=rmqXN9cUdJv37bosltdks9h1oPtkT2PJySCR2aN9F4pPNCaQrORCHNeosbGdamqqHscPHl
	9tAW+MPY5KgvU2CA==
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
Subject: [PATCH v1 18/26] x86/cpuid: Scan deterministic cache params CPUID leaves
Date: Tue,  6 May 2025 07:04:29 +0200
Message-ID: <20250506050437.10264-19-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add CPUID scanner logic for Intel CPUID(0x4) and AMD CPUID(0x8000001d).
Define a single CPUID "deterministic cache" read function for both leaves
as both have the same subleaf cache enumeration logic.

Introduce __define_cpuid_read_function() to avoid duplication between
cpuid_read_generic(), the CPUID scanner default read function, and the
new cpuid_read_deterministic_cache().

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/types.h  |  2 ++
 arch/x86/kernel/cpu/cpuid_scanner.c | 40 ++++++++++++++++++++++++-----
 arch/x86/kernel/cpu/cpuid_scanner.h |  4 ++-
 3 files changed, 39 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index b8e525725def..2ac3d05c3fe4 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -181,7 +181,9 @@ struct cpuid_leaves {
 	CPUID_LEAF(0x0,		0,		1);
 	CPUID_LEAF(0x1,		0,		1);
 	CPUID_LEAF(0x2,		0,		1);
+	CPUID_LEAF(0x4,		0,		8);
 	CPUID_LEAF(0x80000000,	0,		1);
+	CPUID_LEAF(0x8000001d,	0,		8);
 };
 
 /**
diff --git a/arch/x86/kernel/cpu/cpuid_scanner.c b/arch/x86/kernel/cpu/cpuid_scanner.c
index aaee1ede0472..664946ebe675 100644
--- a/arch/x86/kernel/cpu/cpuid_scanner.c
+++ b/arch/x86/kernel/cpu/cpuid_scanner.c
@@ -10,15 +10,43 @@
 
 #include "cpuid_scanner.h"
 
+/**
+ * __define_cpuid_read_function() - Generate a CPUID scanner read function
+ * @_suffix:	Suffix for the generated function name (full name: cpuid_read_@_suffix())
+ * @_leaf_t:	Type to cast the CPUID query output storage pointer
+ * @_leaf:	Name of the CPUID query storage pointer
+ * @_break_c:	Condition to break the CPUID scanning loop, which may reference @_leaf,
+ *		and where @_leaf stores each iteration's CPUID query output.
+ *
+ * Define a CPUID scanner read function according to the requirements stated
+ * at &struct cpuid_scan_entry->read().
+ */
+#define __define_cpuid_read_function(_suffix, _leaf_t, _leaf, _break_c)				\
+static void											\
+cpuid_read_##_suffix(const struct cpuid_scan_entry *e, struct cpuid_read_output *output)	\
+{												\
+	struct _leaf_t *_leaf = (struct _leaf_t *)output->leaf;					\
+												\
+	static_assert(sizeof(*_leaf) == 16);							\
+												\
+	output->info->nr_entries = 0;								\
+	for (int i = 0; i < e->maxcnt; i++, _leaf++, output->info->nr_entries++) {		\
+		cpuid_subleaf(e->leaf, e->subleaf + i, _leaf);					\
+		if (_break_c)									\
+			break;									\
+	}											\
+}
+
 /*
  * Default CPUID scanner read function
  */
-static void cpuid_read_generic(const struct cpuid_scan_entry *e, struct cpuid_read_output *output)
-{
-	output->info->nr_entries = 0;
-	for (int i = 0; i < e->maxcnt; i++, output->leaf++, output->info->nr_entries++)
-		cpuid_subleaf(e->leaf, e->subleaf + i, output->leaf);
-}
+__define_cpuid_read_function(generic, cpuid_regs, ignored, false);
+
+/*
+ * Shared read function for Intel CPUID leaf 0x4 and AMD CPUID leaf 0x8000001d,
+ * as both have the same subleaf enumeration logic and registers output format.
+ */
+__define_cpuid_read_function(deterministic_cache, leaf_0x4_0, leaf, leaf->cache_type == 0);
 
 static void cpuid_read_0x2(const struct cpuid_scan_entry *e, struct cpuid_read_output *output)
 {
diff --git a/arch/x86/kernel/cpu/cpuid_scanner.h b/arch/x86/kernel/cpu/cpuid_scanner.h
index dc1d518c9768..a09110a4c72c 100644
--- a/arch/x86/kernel/cpu/cpuid_scanner.h
+++ b/arch/x86/kernel/cpu/cpuid_scanner.h
@@ -93,7 +93,9 @@ struct cpuid_scan_entry {
 	SCAN_ENTRY(0x0,		0,		generic),			\
 	SCAN_ENTRY(0x1,		0,		generic),			\
 	SCAN_ENTRY(0x2,		0,		0x2),				\
-	SCAN_ENTRY(0x80000000,  0,              0x80000000),
+	SCAN_ENTRY(0x4,		0,		deterministic_cache),		\
+	SCAN_ENTRY(0x80000000,  0,              0x80000000),			\
+	SCAN_ENTRY(0x8000001d,  0,              deterministic_cache),		\
 
 /**
  * struct cpuid_scan_info - Parameters for generic CPUID scan logic
-- 
2.49.0

