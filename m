Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5AC2E3374
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771691; cv=none; b=ssRBWiT7iFQaNz8tv1i+xM+9SJre7DTAvN1+s1Ndemi0UetoXXrUlBetA8bJQtZkiCTdNuIH07NmGnECXzaGEKdsfksJSXcu1Pl2Ku4Tw8Ew/eSRkiSbYMENJm8EkN8RV9YJ7N74Gn6OKyYmklD+Wz9xsx5XZ5M3hpEQs/kHX10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771691; c=relaxed/simple;
	bh=7qlYrd8ADkiSEKc+gzHN8gdQbL+o5MjgLp2U/du+a8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNNCciEo84fH4L/9VdjKaX4CTuFF/mDp/+5tcOiOVRn+mmbuSu0HGX8Cv8PSOW0CMgx8jkqBWbAqBj4z2Eoze1ui6+BeN/bAzB+LoRuOlcOMFA7MVHt8hH4JvmENmWvoxeFN3K487J8viNUSSU5LR1c0g+QlUbh4qv0owWSQ49U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bDsy54sl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1o6YCbtR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bDsy54sl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1o6YCbtR"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HdOLrTj2U5RFTlroOZyASJWCedyIKcQ0mE4WTpPnqnQ=;
	b=bDsy54slVWVp23joNbyk0sACA4UFIHUZq05poudKw8mBh3sQBzURIKYAGD4kfxl9pajwRL
	RxxxMCTp04fTVaNPDIvoTyKQKGoi2T8Lq8/wBokqeRp7bWpUQ/lFHBf/p7jpNsI2JYMp2t
	d5TGShE8fBh5YnWntqY7ipMsFSk5cvhhRoXIiQgIk0WhZv90QyAueo3kOw2TW3fmfJnDpW
	8FRXHQ53jXOlnDoO3Z1srwU+LK1nyP2Kup4EIeqCJYVRMt7imNr2ItsFi4dlTxzWpGqdb8
	168QS81nx8U+X1X/O6D1q5wQVRk1K6/SGuR22D8e45GteI87FRVx50LsWZuvtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HdOLrTj2U5RFTlroOZyASJWCedyIKcQ0mE4WTpPnqnQ=;
	b=1o6YCbtRKBh/UeOiuTZC1MPuBameYd4JOdWNbCNyj/DU1vwSG0Y3GzbI0kkSHPfz5l40ag
	o2sQ5Akz+3FbdBAQ==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v3 20/44] x86/cpuid: Introduce a centralized CPUID data model
Date: Fri, 13 Jun 2025 01:39:46 +0200
Message-ID: <20250612234010.572636-21-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

** Context

The x86-cpuid-db project generates a C header file with full C99 bitfield
listings for all known CPUID leaf/subleaf query outputs.

That header is now merged by parent commits at <asm/cpuid/leaf_types.h>,
and is in the form:

    struct leaf_0x0_0 { /* CPUID(0x0), subleaf 0, C99 bitfields */ };
    ...
    struct leaf_0x7_0 { /* CPUID(0x7), subleaf 0, C99 bitfields */ };
    struct leaf_0x7_1 { /* CPUID(0x7), subleaf 1, C99 bitfields */ };
    ...

** Goal

Introduce a structured, size-efficient, per-CPU, CPUID data repository.

Use the x86-cpuid-db auto-generated data types, and custom CPUID leaf
parsers, to build that repository.  Given a leaf, subleaf, and index,
provide direct memory access to the parsed and cached per-CPU CPUID
output.

** Long-term goal

Remove the need for drivers and other areas in the kernel to invoke
direct CPUID queries.  Only one place in the kernel should be allowed to
use the CPUID instruction: the CPUID parser code.

** Implementation

Introduce CPUID_LEAF() to build a compact CPUID storage layout in the
form:

    struct leaf_0x0_0		leaf_0x0_0[1];
    struct leaf_query_info	leaf_0x0_0_info;

    struct leaf_0x1_0		leaf_0x1_0[1];
    struct leaf_query_info	leaf_0x0_0_info;

    struct leaf_0x4_0		leaf_0x4_0[8];
    struct leaf_query_info	leaf_0x4_0_info;
     ...

where each CPUID leaf 0xN subleaf M query stores its output at the
designated leaf_0xN_M[] array and has an associated "CPUID query info"
structure.

Introduce 'struct cpuid_leaves' to group all the parsed CPUID outputs and
their metadata –in the layout above– in one structure.  Define a 'struct
cpuid_table' to wrap it, so that global per-table CPUID data can be added
later.  Embed that 'struct cpuid_table' inside 'struct cpuinfo_x86' to
ensure early-boot and per-CPU access through the current CPU's capability
structure.

Given the data layout above, and assuming a CPU capability structure 'c',
a macro can access CPUID(0x7) subleaf 0 parsed query output using the
compile time tokenization below:

    const struct leaf_0x7_0 *l7_0;

    l7_0 = cpuid_subleaf(c, 0x7, 0);
                         |   |   └────────┐
                         |   └─────────┐  |
                         *             *  *
                        &c.cpuid.leaf_0x7_0[0]

Similarly, CPUID(0x7) subleaf 1 output can be accessed using the CPP
tokenization:

    const struct leaf_0x7_1 *l7_1;

    l7_1 = cpuid_subleaf(c, 0x7, 1);
                         |   |   └────────┐
                         |   └─────────┐  |
                         *             *  *
                        &c.cpuid.leaf_0x7_1[0]

which all translate to a single assembly instruction offset calculation.

Use an array of CPUID output storage entries for each leaf/subleaf
combination to accommodate leaves which produce the same output format
for a large subleaf range.  This is typical for CPUID leaves enumerating
hierarchical objects; e.g. CPUID(0x4) cache topology enumeration,
CPUID(0xd) XSAVE enumeration, and CPUID(0x12) SGX Enclave Page Cache
enumeration.

In the CPUID_LEAF() data layout above, CPUID(0x4) has 8 storage entries
to accomodate the suleaves 0 to 7, which all have the same bitfield's
output format.  With that, CPUID(0x4) subleaves 0->7 can be accessed
using the compile time tokenization:

    const struct leaf_0x4_0 *l4_0, *l4_1, l4_2;

    l4_0 = cpuid_subleaf_index(c, 0x4, 0);
                               |   |   └──────────┐
                               |   └─────────┐    |
                               *             *    v
                              &c.cpuid.leaf_0x4_0[0]

    l4_1 = cpuid_subleaf_index(c, 0x4, 1);
                               |   |   └──────────┐
                               |   └─────────┐    |
                               *             *    v
                              &c.cpuid.leaf_0x4_0[1]

    l4_2 = cpuid_subleaf_index(c, 0x4, 2);
                               |   |   └──────────┐
                               |   └─────────┐    |
                               *             *    v
                              &c.cpuid.leaf_0x4_0[2]

where the indices 0, 1, 2 above can be provided dynamically.  This is by
design since call-sites hierarchical CPUID enumeration usually passes the
CPUID subleaf enumeration index dynamically; e.g., within a for loop.

For each of the CPUID leaf/subleaf output storage entries, attach a
'struct leaf_query_info' leaf_0xN_M_info instance.  It is to be filled by
the CPUID parsing logic filling the CPUID table(s).  For now, this info
structure has one element: the number of filled slots by the CPUID
paraser in the CPUID leaf/subleaf output storage array.

** Call-site APIs

Introduce below APIs for CPUID leaves with static subleaves:

    cpuid_subleaf(_cpuinfo, _leaf, _subleaf)
    cpuid_leaf(_cpuinfo, _leaf)
    cpuid_leaf_regs(_cpuinfo, _leaf)

And below APIs for CPUID leaves with dynamic subleaves:

    cpuid_subleaf_count(_cpuinfo, _leaf)
    cpuid_subleaf_index(_cpuinfo, _leaf, _idx)
    cpuid_subleaf_index_regs(_cpuinfo, _leaf, _idx)

At <cpuid/api.h>, add a clear rationale for why call sites should use the
above APIs instead of directly invoking CPUID queries.

** Next steps

For now, define entries for CPUID(0x0) and CPUID(0x1) in the CPUID table.
Generic CPUID parser logic to fill the per-CPU CPUID tables, along with
more CPUID leaves support, will be added next.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>	# CPUID data model
Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>	# x86-cpuid-db schema
Suggested-by: Ingo Molnar <mingo@kernel.org>		# CPUID APIs restructuring
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Link: https://lore.kernel.org/lkml/874ixernra.ffs@tglx
Link: https://gitlab.com/x86-cpuid.org/x86-cpuid-db
---
 arch/x86/include/asm/cpuid/api.h   | 254 +++++++++++++++++++++++++++++
 arch/x86/include/asm/cpuid/types.h | 104 ++++++++++++
 arch/x86/include/asm/processor.h   |   1 +
 3 files changed, 359 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 2b9750cc8a75..b277c82e062f 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -289,4 +289,258 @@ static inline bool cpuid_amd_hygon_has_l3_cache(void)
 	return cpuid_edx(0x80000006);
 }
 
+/*
+ * 'struct cpuid_leaves' accessors:
+ *
+ * For internal-use by the CPUID parser.  These macros do not perform any
+ * sanity checks.
+ */
+
+/**
+ * __cpuid_leaves_subleaf_idx() - Get parsed CPUID output (without sanity checks)
+ * @_leaves:	&struct cpuid_leaves instance
+ * @_leaf:	CPUID leaf, in compile-time 0xN format
+ * @_subleaf:	CPUID subleaf, in compile-time decimal format
+ * @_idx:	@_leaf/@_subleaf CPUID output's storage array index.  Check
+ *		__CPUID_LEAF() for info on CPUID output storage arrays indexing.
+ *
+ * Returns the parsed CPUID output at @_leaves as a <cpuid/leaf_types.h> data
+ * type: 'struct leaf_0xN_M', where 0xN is the token provided at @_leaf, and M
+ * is token provided at @_subleaf.
+ */
+#define __cpuid_leaves_subleaf_idx(_leaves, _leaf, _subleaf, _idx)	\
+	((_leaves)->leaf_ ## _leaf ## _ ## _subleaf)[_idx]
+
+/**
+ * __cpuid_leaves_subleaf_0() - Get parsed CPUID output (without sanity checks)
+ * @_leaves:	&struct cpuid_leaves instance
+ * @_leaf:	CPUID leaf, in compile-time 0xN format
+ *
+ * Like __cpuid_leaves_subleaf_idx(), but with subleaf = 0 and index = 0.
+ */
+#define __cpuid_leaves_subleaf_0(_leaves, _leaf)			\
+	__cpuid_leaves_subleaf_idx(_leaves, _leaf, 0, 0)
+
+/**
+ * __cpuid_leaves_subleaf_info() - Get CPUID query info for @_leaf/@_subleaf
+ * @_leaves:	&struct cpuid_leaves instance
+ * @_leaf:	CPUID leaf, in compile-time 0xN format
+ * @_subleaf:	CPUID subleaf, in compile-time decimal format
+ *
+ * Returns a pointer to the &struct leaf_query_info instance associated with
+ * the given @_leaf/@_subleaf pair at the CPUID @_leaves data repository. See
+ * __CPUID_LEAF().
+ */
+#define __cpuid_leaves_subleaf_info(_leaves, _leaf, _subleaf)		\
+	((_leaves)->leaf_ ## _leaf ## _ ## _subleaf ## _ ## info)
+
+/*
+ * 'struct cpuid_table' accessors:
+ *
+ * For internal-use by the CPUID parser.  These macros perform the necessary
+ * sanity checks by default.
+ */
+
+/**
+ * __cpuid_table_subleaf_idx() - Get parsed CPUID output (with sanity checks)
+ * @_table:	&struct cpuid_table instance
+ * @_leaf:	CPUID leaf, in compile-time 0xN format
+ * @_subleaf:	CPUID subleaf, in compile-time decimal format
+ * @_idx:	@_leaf/@_subleaf CPUID query output's storage array index.
+ *		See __CPUID_LEAF().
+ *
+ * Return a pointer to the requested parsed CPUID output at @_table, as a
+ * <cpuid/leaf_types.h> data type: 'struct leaf_0xN_M', where 0xN is the token
+ * provided at @_leaf, and M is the token provided at @_subleaf; e.g. 'struct
+ * leaf_0x7_0'.
+ *
+ * Returns NULL if the requested CPUID @_leaf/@_subleaf/@_idx query output is
+ * not present at @_table.
+ */
+#define __cpuid_table_subleaf_idx(_table, _leaf, _subleaf, _idx)	\
+	(((_idx) >= __cpuid_leaves_subleaf_info(&((_table)->leaves), _leaf, _subleaf).nr_entries) ? \
+	 NULL : &__cpuid_leaves_subleaf_idx(&((_table)->leaves), _leaf, _subleaf, _idx))
+
+/**
+ * __cpuid_table_subleaf() - Get parsed CPUID output (with sanity checks)
+ * @_table:	&struct cpuid_table instance
+ * @_leaf:	CPUID leaf, in compile-time 0xN format
+ * @_subleaf:	CPUID subleaf, in compile-time decimal format
+ *
+ * Like __cpuid_table_subleaf_idx(), but with CPUID output storage index = 0.
+ */
+#define __cpuid_table_subleaf(_table, _leaf, _subleaf)			\
+	__cpuid_table_subleaf_idx(_table, _leaf, _subleaf, 0)
+
+/*
+ * External APIs for accessing parsed CPUID data:
+ *
+ * Call sites should use below APIs instead of invoking direct CPUID queries.
+ *
+ * Benefits include:
+ *
+ * - Return CPUID output as typed C structures that are auto-generated from a
+ *   centralized database (see <cpuid/leaf_types.h).  Such data types have a
+ *   full C99 bitfield layout per CPUID leaf/subleaf combination.  Call sites
+ *   can thus avoid doing ugly and cryptic bitwise operations on raw CPUID data.
+ *
+ * - Return cached, per-CPU, CPUID output.  Below APIs do not invoke any CPUID
+ *   queries, thus avoiding their side effects like serialization and VM exits.
+ *   Call-site-specific hard coded constants and macros for caching CPUID query
+ *   outputs can also be avoided.
+ *
+ * - Return sanitized CPUID data.  Below APIs return NULL if the given CPUID
+ *   leaf/subleaf input is not supported by hardware, or if the hardware CPUID
+ *   output was deemed invalid by the CPUID parser.  This centralizes all CPUID
+ *   data sanitization in one place (the kernel's CPUID parser.)
+ *
+ * - A centralized global view of system CPUID data.  Below APIs will reflect
+ *   any kernel-enforced feature masking or overrides, unlike ad hoc parsing of
+ *   raw CPUID output by drivers and individual call sites.
+ */
+
+/**
+ * cpuid_subleaf() - Access parsed CPUID data
+ * @_cpuinfo:	CPU capability structure reference ('struct cpuinfo_x86')
+ * @_leaf:	CPUID leaf, in compile-time 0xN format; e.g. 0x7, 0xf
+ * @_subleaf:	CPUID subleaf, in compile-time decimal format; e.g. 0, 1, 3
+ *
+ * Returns a pointer to parsed CPUID output, from the CPUID table inside
+ * @_cpuinfo, as a <cpuid/leaf_types.h> data type: 'struct leaf_0xN_M', where
+ * 0xN is the token provided at @_leaf, and M is the token provided at
+ * @_subleaf; e.g. struct leaf_0x7_0.
+ *
+ * Returns NULL if the requested CPUID @_leaf/@_subleaf query output is not
+ * present at the parsed CPUID table inside @_cpuinfo.  This can happen if:
+ *
+ * - The CPUID table inside @_cpuinfo has not yet been populated.
+ * - The CPUID table inside @_cpuinfo was populated, but the CPU does not
+ *   implement the requested CPUID @_leaf/@_subleaf combination.
+ * - The CPUID table inside @_cpuinfo was populated, but the kernel's CPUID
+ *   parser has predetermined that the requested CPUID @_leaf/@_subleaf
+ *   hardware output is invalid or unsupported.
+ *
+ * Example usage::
+ *
+ *	const struct leaf_0x7_0 *l7_0 = cpuid_subleaf(c, 0x7, 0);
+ *	if (!l7_0) {
+ *		// Handle error
+ *	}
+ *
+ *	const struct leaf_0x7_1 *l7_1 = cpuid_subleaf(c, 0x7, 1);
+ *	if (!l7_1) {
+ *		// Handle error
+ *	}
+ */
+#define cpuid_subleaf(_cpuinfo, _leaf, _subleaf)			\
+	__cpuid_table_subleaf(&_cpuinfo->cpuid, _leaf, _subleaf)
+
+/**
+ * cpuid_leaf() - Access parsed CPUID data
+ * @_cpuinfo:	CPU capability structure reference ('struct cpuinfo_x86')
+ * @_leaf:	CPUID leaf, in compile-time 0xN format; e.g. 0x0, 0x2, 0x80000000
+ *
+ * Similar to cpuid_subleaf(), but with a CPUID subleaf = 0.
+ *
+ * Example usage::
+ *
+ *	const struct leaf_0x0_0 *l0 = cpuid_leaf(c, 0x0);
+ *	if (!l0) {
+ *		// Handle error
+ *	}
+ *
+ *	const struct leaf_0x80000000_0 *el0 = cpuid_leaf(c, 0x80000000);
+ *	if (!el0) {
+ *		// Handle error
+ *	}
+ */
+#define cpuid_leaf(_cpuinfo, _leaf)					\
+	cpuid_subleaf(_cpuinfo, _leaf, 0)
+
+/**
+ * cpuid_leaf_regs() - Access parsed CPUID data in raw format
+ * @_cpuinfo:	CPU capability structure reference ('struct cpuinfo_x86')
+ * @_leaf:	CPUID leaf, in compile-time 0xN format
+ *
+ * Similar to cpuid_leaf(), but returns a raw 'struct cpuid_regs' pointer to
+ * the parsed CPUID data instead of a "typed" <cpuid/leaf_types.h> pointer.
+ */
+#define cpuid_leaf_regs(_cpuinfo, _leaf)				\
+	((struct cpuid_regs *)(cpuid_leaf(_cpuinfo, _leaf)))
+
+#define __cpuid_assert_leaf_has_dynamic_subleaves(_cpuinfo, _leaf)	\
+	static_assert(ARRAY_SIZE(_cpuinfo->cpuid.leaves.leaf_ ## _leaf ## _0) > 1);
+
+/**
+ * cpuid_subleaf_index() - Access parsed CPUID data at runtime subleaf index
+ * @_cpuinfo:	CPU capability structure reference ('struct cpuinfo_x86')
+ * @_leaf:	CPUID leaf, in compile-time 0xN format; e.g. 0x4, 0x8000001d
+ * @_idx:	Index within CPUID(@_leaf) output storage array.  It must be
+ *		smaller than "cpuid_subleaf_count(@_cpuinfo, @_leaf)".  Unlike
+ *		@_leaf, this value can be provided dynamically.
+ *
+ * For a given leaf/subleaf combination, the CPUID table inside @_cpuinfo
+ * contains an array of CPUID output storage entries.  An array of storage
+ * entries is used to accommodate CPUID leaves which produce the same output
+ * format for a large subleaf range.  This is common for CPUID hierarchical
+ * objects enumeration; e.g., CPUID(0x4) and CPUID(0xd).  Check CPUID_LEAF().
+ *
+ * CPUID leaves that are to be accessed using this macro are specified at
+ * <cpuid/types.h>, 'struct cpuid_leaves', with a CPUID_LEAF() count field
+ * bigger than 1.  A build-time error will be generated otherwise.
+ *
+ * Example usage::
+ *
+ *	const struct leaf_0x4_0 *l4;
+ *
+ *	for (int i = 0; i < cpuid_subleaf_count(c, 0x4); i++) {
+ *		l4 = cpuid_subleaf_index(c, 0x4, i);
+ *		if (!l4) {
+ *			// Handle error
+ *		}
+ *
+ *		// Access CPUID(0x4, i) data; e.g. l4->cache_type
+ *	}
+ *
+ * Beside the standard error situations detailed at cpuid_subleaf(), this
+ * macro will return NULL if @_idx is out of range.
+ */
+#define cpuid_subleaf_index(_cpuinfo, _leaf, _idx)			\
+({									\
+	__cpuid_assert_leaf_has_dynamic_subleaves(_cpuinfo, _leaf);	\
+	__cpuid_table_subleaf_idx(&_cpuinfo->cpuid, _leaf, 0, _idx);	\
+})
+
+/**
+ * cpuid_subleaf_index_regs() - Access parsed CPUID data at runtime subleaf index
+ * @_cpuinfo:	CPU capability structure reference ('struct cpuinfo_x86')
+ * @_leaf:	CPUID leaf, in compile-time 0xN format; e.g. 0x4, 0x8000001d
+ * @_idx:	Index within CPUID(@_leaf) output storage array.  It must be
+ *		smaller than "cpuid_subleaf_count(@_cpuinfo, @_leaf)".
+ *
+ * Similar to cpuid_subleaf_index(), but returns a raw 'struct cpuid_regs'
+ * pointer to the parsed CPUID data, instead of a "typed" <cpuid/leaf_types.h>
+ * pointer.
+ */
+#define cpuid_subleaf_index_regs(_cpuinfo, _leaf, _idx)			\
+	((struct cpuid_regs *)cpuid_subleaf_index(_cpuinfo, _leaf, _idx))
+
+/**
+ * cpuid_subleaf_count() - Number of valid (filled) subleaves for @_leaf
+ * @_cpuinfo:	CPU capability structure reference ('struct cpuinfo_x86')
+ * @_leaf:	CPUID leaf, in compile-time 0xN format; e.g. 0x4, 0x8000001d
+ *
+ * Return the number of subleaves filled by the CPUID parser for @_leaf. Check
+ * cpuid_subleaf_index().
+ *
+ * CPUID leaves that are to be accessed using this macro are specified at
+ * <cpuid/types.h>, 'struct cpuid_leaves', with a CPUID_LEAF() count field
+ * bigger than 1.  A build-time error will be generated otherwise.
+ */
+#define cpuid_subleaf_count(_cpuinfo, _leaf)				\
+({									\
+	__cpuid_assert_leaf_has_dynamic_subleaves(_cpuinfo, _leaf);	\
+	__cpuid_leaves_subleaf_info(&_cpuinfo->cpuid.leaves, _leaf, 0).nr_entries;\
+})
+
 #endif /* _ASM_X86_CPUID_API_H */
diff --git a/arch/x86/include/asm/cpuid/types.h b/arch/x86/include/asm/cpuid/types.h
index 8a00364b79de..f1b51ba21ca4 100644
--- a/arch/x86/include/asm/cpuid/types.h
+++ b/arch/x86/include/asm/cpuid/types.h
@@ -5,6 +5,8 @@
 #include <linux/build_bug.h>
 #include <linux/types.h>
 
+#include <asm/cpuid/leaf_types.h>
+
 /*
  * Types for raw CPUID access:
  */
@@ -124,4 +126,106 @@ extern const struct leaf_0x2_table cpuid_0x2_table[256];
  */
 #define TLB_0x63_2M_4M_ENTRIES		32
 
+/*
+ * Types for centralized CPUID tables:
+ *
+ * For internal use by the CPUID parser.
+ */
+
+/**
+ * struct leaf_query_info - Parse info for a CPUID leaf/subleaf query
+ * @nr_entries:	Number of valid output storage entries filled by the CPUID parser
+ *
+ * In a CPUID table (struct cpuid_leaves), each CPUID leaf/subleaf query output
+ * storage entry from <cpuid/leaf_types.h> is paired with a unique instance of
+ * this type.
+ */
+struct leaf_query_info {
+	unsigned int		nr_entries;
+};
+
+/**
+ * __CPUID_LEAF() - Define CPUID output storage and query info entry
+ * @_name:	Struct type name of the CPUID leaf/subleaf (e.g. 'leaf_0x4_0').
+ *		Such types are defined at <cpuid/leaf_types.h>, and follow the
+ *		format 'struct leaf_0xN_M', where 0xN is the leaf and M is the
+ *		subleaf.
+ * @_count:	Number of storage entries to allocate for this leaf/subleaf
+ *
+ * For the given leaf/subleaf combination, define an array of CPUID output
+ * storage entries and an associated query info structure — both residing in a
+ * 'struct cpuid_leaves' instance.
+ *
+ * Use an array of storage entries to accommodate CPUID leaves which produce
+ * the same output format for a large subleaf range.  This is common for
+ * hierarchical objects enumeration; e.g., CPUID(0x4), CPUID(0xd), and
+ * CPUID(0x12).
+ *
+ * The example invocation for CPUID(0x7) storage, subleaves 0->1:
+ *
+ *	__CPUID_LEAF(leaf_0x7_0, 1);
+ *	__CPUID_LEAF(leaf_0x7_1, 1);
+ *
+ * generates 'struct cpuid_leaves' storage entries in the form::
+ *
+ *	struct leaf_0x7_0		leaf_0x7_0[1];
+ *	struct leaf_query_info		leaf_0x7_0_info;
+ *
+ *	struct leaf_0x7_1		leaf_0x7_1[1];
+ *	struct leaf_query_info		leaf_0x7_1_info;
+ *
+ * The example invocation for CPUID(0x4) storage::
+ *
+ *	__CPUID_LEAF(leaf_0x4_0, 8);
+ *
+ * generates storage entries in the form:
+ *
+ *	struct leaf_0x4_0		leaf_0x4_0[8];
+ *	struct leaf_query_info		leaf_0x4_0_info;
+ *
+ * where the 'leaf_0x4_0[8]' storage array can accommodate the output of
+ * CPUID(0x4) subleaves 0->7, since they all have the same output format.
+ */
+#define __CPUID_LEAF(_name, _count)				\
+	struct _name		_name[_count];			\
+	struct leaf_query_info	_name##_info
+
+/**
+ * CPUID_LEAF() - Define a CPUID storage entry in 'struct cpuid_leaves'
+ * @_leaf:	CPUID Leaf number in the 0xN format; e.g., 0x4.
+ * @_subleaf:	Subleaf number in decimal
+ * @_count:	Number of repeated storage entries for this @_leaf/@_subleaf
+ *
+ * Convenience wrapper around __CPUID_LEAF().
+ */
+#define CPUID_LEAF(_leaf, _subleaf, _count)			\
+	__CPUID_LEAF(leaf_ ## _leaf ## _ ## _subleaf, _count)
+
+/*
+ * struct cpuid_leaves - Structured CPUID data repository
+ */
+struct cpuid_leaves {
+	/*         leaf		subleaf		count */
+	CPUID_LEAF(0x0,		0,		1);
+	CPUID_LEAF(0x1,		0,		1);
+};
+
+/*
+ * Types for centralized CPUID tables:
+ *
+ * For external use.
+ */
+
+/**
+ * struct cpuid_table - Per-CPU CPUID data repository
+ * @leaves:	CPUID leaf/subleaf queries' output and metadata
+ *
+ * Embedded inside 'struct cpuinfo_x86' to provide access to stored, parsed,
+ * and sanitized CPUID output per-CPU.  Thus removing the need for any direct
+ * CPUID query by call sites.
+ */
+struct cpuid_table {
+	struct cpuid_leaves	leaves;
+};
+
 #endif /* _ASM_X86_CPUID_TYPES_H */
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index bde58f6510ac..b5d90b60191b 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -165,6 +165,7 @@ struct cpuinfo_x86 {
 	char			x86_vendor_id[16];
 	char			x86_model_id[64];
 	struct cpuinfo_topology	topo;
+	struct cpuid_table	cpuid;
 	/* in KB - valid for CPUS which support this call: */
 	unsigned int		x86_cache_size;
 	int			x86_cache_alignment;	/* In bytes */
-- 
2.49.0

