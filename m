Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB0C24C076
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507915; cv=none; b=E1v2sAzVYgEuQLxe5FIOSgqXyth/LTYuN0vEVR7e7mo/ad5WQMoQDfpeWqWEz7JIxYyvA4wFi1wtKkplEC47KY+1H2VZw5za/HuEyDQXasIIvs4N74nXRy3SM2kqVqQhTLc5fTMf3qWrp14+/xe6SOH7UchTBKQP+7LeqsvnFrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507915; c=relaxed/simple;
	bh=bbW8PfIdv2AD4XBo/NzbvGb0OCETPVArPGaq4rVPAco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=igsk5kuX74o+7GHc9OwFbW40SiZ96Zr+5fB7LWG0yzBclGXoQCdIqTSguXeJ6FFsHtSd5yPds2vwhGwS/oilkL/jB5X4OO4EtLdPCiX8Y3oDdhc99bdZwNMeSupnSD2pVVtTcAj4hKVgq2C4BQ9irfOEd4WWqxOwxPi+lkLcrdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FSaS2yEU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7liYQRxr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FSaS2yEU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7liYQRxr"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8nuLOQqtFBzYbvrSpcZLKRVUltALfLlOONjAmyFZtnk=;
	b=FSaS2yEUdjqoKf2R0q5pBSS4u0KGMRjA9O39d2mKuIhuEI7szckQqS1UNXEaW3+UD8tv+E
	YDghc879OnMy+nJL2SC94wiu0oA3CN4aJ/9wPzCbL3DrNwCitERFD57gd9e2nC72n6UQ3b
	fMijIM1z3tv1rQL93uICFcJxTc6g8ipXUQX4iZuIIGq4bYCa8Xq1qrFGnnACeBGIC5nzCP
	CLQU1N3dQNIoA/Nd0Ai7Moc3gkxXr1eA1WxJ7t6O8IjKMjgzSTamG6KE6iv2fvxUSqk4BF
	M3jGqGYCMYS2kXgLi5887RCShsUZryYGcvhZOI+a1of/cz9N2u/e8cl3mj5bfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8nuLOQqtFBzYbvrSpcZLKRVUltALfLlOONjAmyFZtnk=;
	b=7liYQRxr3g7zsHHgZ3Tw2eQhOSeJF8sj0Ci/21lhqIQiCj//aRiPS9w+ibPeTU2Twhf9vH
	8nFbWnognEWq6XBg==
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
Subject: [PATCH v1 08/26] x86/cpuid: Introduce external CPUID table accessors
Date: Tue,  6 May 2025 07:04:19 +0200
Message-ID: <20250506050437.10264-9-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the scanned CPUID tables accessors below at <cpuid/table_api.h>,
which are intended for external use:

    cpudata_cpuid(c, leaf)
    cpudata_cpuid_nr_entries(c, leaf)
    cpudata_cpuid_regs(c, leaf)
    cpudata_cpuid_index(c, leaf, idx)
    cpudata_cpuid_index_regs(c, leaf, idx)
    cpudata_cpuid_subleaf(c, leaf, subleaf)

Unlike the internal __cpuid_get() and __cpuid_info_get() macros at
<cpuid/internal_api.h>, the above macros take a struct cpuinfo_x86 as
first parameter and always do the necessary sanity checks beforehand.
Both are necessary for external call sites.

Add proper kernel-doc for each macro as well.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/table_api.h | 110 +++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/table_api.h b/arch/x86/include/asm/cpuid/table_api.h
index d4b6d848eac2..5c4788741dfb 100644
--- a/arch/x86/include/asm/cpuid/table_api.h
+++ b/arch/x86/include/asm/cpuid/table_api.h
@@ -2,8 +2,118 @@
 #ifndef _ASM_X86_CPUID_TABLE_API_H
 #define _ASM_X86_CPUID_TABLE_API_H
 
+#include <asm/cpuid/internal_api.h>
+#include <asm/cpuid/types.h>
 #include <asm/processor.h>
 
+/*
+ * Accessors of scanned CPUID data, intended for external use:
+ *
+ * Note, all the accessors below require @_leaf and @_subleaf as literals.
+ * For example:
+ *
+ *		cpudata_cpuid(c, 0x0);
+ *		cpudata_cpuid_subleaf(c, 0x7, 1);
+ *
+ * This is due to the CPP tokenization used to construct the CPUID tables
+ * at <cpuid/types.h>.
+ */
+
+/**
+ * cpudata_cpuid_subleaf() - Get scanned CPUID data
+ * @_cpuinfo:	CPU capability table (struct cpuinfo_x86)
+ * @_leaf:	CPUID leaf, in 0xN format
+ * @_subleaf:	CPUID subleaf, in decimal format
+ *
+ * Return scanned CPUID output in a ready-to-parse <cpuid/leaves.h> type:
+ * 'struct leaf_0xN_M', where 0xN is the leaf token from @_leaf, and M is
+ * the subleaf token from @_subleaf.
+ *
+ * Return NULL if the leaf/subleaf is not present in the scanned table
+ * referenced by @_cpuinfo.  This may occur if the leaf is beyond the CPU's
+ * max supported standard/extended leaf, or if the CPUID scanner code
+ * skipped the @_leaf entry because it was considered invalid.
+ */
+#define cpudata_cpuid_subleaf(_cpuinfo, _leaf, _subleaf)		\
+	__cpudata_cpuid_subleaf(&_cpuinfo->cpuid_table, _leaf, _subleaf)
+
+/**
+ * cpudata_cpuid() - Get scanned CPUID data (subleaf = 0)
+ * @_cpuinfo:	CPU capability table (struct cpuinfo_x86)
+ * @_leaf:	CPUID leaf, in 0xN format
+ *
+ * Shortcut for cpudata_cpuid_subleaf() with subleaf = 0.
+ */
+#define cpudata_cpuid(_cpuinfo, _leaf)					\
+	__cpudata_cpuid_subleaf(&_cpuinfo->cpuid_table, _leaf, 0)
+
+/**
+ * cpudata_cpuid_nr_entries() - Get Number of filled entries for @_leaf
+ * @_cpuinfo:	CPU capability table (struct cpuinfo_x86)
+ * @_leaf:	CPUID leaf, in 0xN format
+ *
+ * CPUID leaves that enumerate hierarchical structures (e.g. cache topology
+ * with leaf 0x4, XSAVE with 0xd, SGX with 0x12) can have multiple valid
+ * subleafs with identical output formats. The scanned CPUID table stores
+ * these in an output storage array.
+ *
+ * Return the number of entries filled by the CPUID scanner for @_leaf.
+ */
+#define cpudata_cpuid_nr_entries(_cpuinfo, _leaf)			\
+	__cpuid_info_get(&_cpuinfo->cpuid_table.leaves, _leaf, 0).nr_entries
+
+/**
+ * cpudata_cpuid_index() - Get scanned CPUID data at index
+ * @_cpuinfo:	CPU capability table (struct cpuinfo_x86)
+ * @_leaf:	CPUID leaf, in 0xN format
+ * @_idx:	Index within leaf 0xN output storage array. It must be smaller
+ *		than cpudata_cpuid_nr_entries(@_cpuinfo, @_leaf).
+ *
+ * Similar to cpudata_cpuid(), but accesses a specific indexed entry.  This is
+ * useful for CPUID leaves with identical output format for multiple subleaves.
+ * For example, accessing CPUID leaf 0x4 output can be done as::
+ *
+ *	for (int i = 0; i < cpudata_cpuid_nr_entries(c, 0x4); i++) {
+ *		const struct leaf_0x4_0 *l4 = cpudata_cpuid_index(c, 0x4, i);
+ *		if (!l4)
+ *			break;
+ *
+ *		// Access l4->cache_type, etc.
+ *	}
+ *
+ * Beside the "return NULL" situations detailed at cpudata_cpuid_subleaf(),
+ * NULL will also be returned if @_idx is out of range.
+ *
+ * See 'struct cpuid_leaves' at <asm/cpuid/types.h> for multi-entry leaves.
+ * Such leaves will have a CPUID_LEAF() @_count parameter bigger than one.
+ */
+#define cpudata_cpuid_index(_cpuinfo, _leaf, _idx)			\
+	__cpudata_cpuid_subleaf_idx(&_cpuinfo->cpuid_table, _leaf, 0, _idx)
+
+/**
+ * cpudata_cpuid_regs() - Get raw register output for scanned CPUID leaf
+ * @_cpuinfo:	CPU capability table (struct cpuinfo_x86)
+ * @_leaf:	CPUID leaf, 0xN format
+ *
+ * Similar to cpudata_cpuid(), but returns a raw 'struct cpuid_regs *' instead
+ * of a <cpuid/leaves.h> data type.
+ */
+#define cpudata_cpuid_regs(_cpuinfo, _leaf)				\
+	(struct cpuid_regs *)(cpudata_cpuid(_cpuinfo, _leaf))
+
+/**
+ * cpudata_cpuid_index_regs() - Get raw scanned CPUID register output
+ * @_cpuinfo:	CPU capability table (struct cpuinfo_x86)
+ * @_leaf:	CPUID leaf, in 0xN format
+ * @_idx:	Index within leaf 0xN output storage entry. It must be smaller
+ *		than cpudata_cpuid_nr_entries(@_cpuinfo, @_leaf).
+ *
+ * Like cpudata_cpuid_index(), but returns a raw 'struct cpuid_regs *' instead
+ * of a <cpuid/leaves.h> data type.
+ */
+#define cpudata_cpuid_index_regs(_cpuinfo, _leaf, _idx)			\
+	(struct cpuid_regs *)cpudata_cpuid_index(_cpuinfo, _leaf, _idx)
+
 void cpuid_scan_cpu(struct cpuinfo_x86 *c);
 
 #endif /* _ASM_X86_CPUID_TABLE_API_H */
-- 
2.49.0

