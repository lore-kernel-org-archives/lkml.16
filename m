Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2A627F4CA
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151528; cv=none; b=OAL3RxWl4QxuKkZkNYFxzst7QZPXufLLepJNHZAIW50PTN7mKKpPfEgP48ruY2t5CCIkaJYydQ7YMGtx6t5+dZG/xR1wUEzG8T5j3tg64rMkM3WTtEMVCytAfP7l4dAdpGXDOcBdqpj1pxcKjm54RmPGSN16G8iLJUjelmPKTZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151528; c=relaxed/simple;
	bh=5Ly6ffg812X5mpcNc+Jf6FI+sq7VzR9uL6heUmmVFbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SukLQ6wioI+DUYIV0jCZQgxutrexPGG4thExHNVWVkAQCwOPTmWbYNe5ssSmxnDeOfgWk6LSLDYnVqHl4WsP6FJRytqC3M6sSK9Fk72yShjeWKAW8lLOJjuiisWLcFzJQdEiDGvzVXyDktRVzNFI/RYxxFRei9f0iLGl+hc6+Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HEeCKMDN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CxCsDYcg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HEeCKMDN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CxCsDYcg"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NDLgExsVbLhKJ5840XSmyp+63ZOIMoDXGAvTIqWxPMo=;
	b=HEeCKMDN07oEQSap7YfAcos9tBOzarjGbe+XwkQNeCqARqO3HUoUMcFLZAkj6xx66z4W5A
	Aw40J4rD0dDEYgeVzxJJrQ5pwK+xK7L6fw/u7f6gADOJj2tdQfL4v8Q45WOXI+FEGVXsAk
	AiKNIjk0BTdwr2nJ9pijKM1PMWCaHBxrAz+VJ1ClQPhzOlelSR8xU8rwInSylpKhDcb73M
	qNg/Pf1kqfx8+GiJHDZhhKu8SNPq3z6zIhvpa5vyylLL66yffy/fpJydAAq65+WmnYCtGa
	CQ2hO1u9jeif44MaguttRyguCY6w6BT9eiByV1UrrCnJI1U8Dg7eiLSUHzhkmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NDLgExsVbLhKJ5840XSmyp+63ZOIMoDXGAvTIqWxPMo=;
	b=CxCsDYcgrV1olxIT2Y1zS+ti7mPyTdHuyAB5MIMOPE6kr7DtHr7/y5cGRKy6woX5P22ATX
	jOkNZKLtwvEu9iBw==
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
Subject: [PATCH v2 24/27] x86/cacheinfo: Use parsed CPUID(0x80000005) and CPUID(0x80000006)
Date: Thu,  5 Jun 2025 21:23:53 +0200
Message-ID: <20250605192356.82250-25-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the AMD CPUID(0x4)-emulation logic, use parsed CPUID(0x80000005) and
CPUID(0x80000006) APID access instead of invoking direct CPUID queries.

Beside centralizing CPUID access, this allows using the auto-generated
<cpuid/leaf_types.h> 'struct leaf_0x80000005_0' and 'struct
leaf_0x80000006_0' data types.

Remove the 'union {l1,l2,l3}_cache' definitions as they are no longer
needed.

Note, the expression:

    ci->num_leaves = (cpuid_edx(0x80000006) & 0xf000) ? 4 : 3;

is replaced with:

    ci->num_leaves = cpuid_leaf(c, 0x80000006)->l3_assoc ? 4 : 3;

which is the same logic, since the 'l3_assoc' bitfield is 4 bits wide at
EDX offset 12.  Per AMD manuals, an L3 associativity of zero implies the
absence of L3 cache on the CPU.

While at it, separate the 'Fallback AMD CPUID(0x4) emulation' comment
from the '@AMD_L2_L3_INVALID_ASSOC' one, since the former acts as a
source code section header.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c | 105 ++++++++++++--------------------
 1 file changed, 40 insertions(+), 65 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index f0540cba4bd4..de8e7125eedd 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -56,47 +56,17 @@ static const enum cache_type cache_type_map[] = {
 };
 
 /*
- * Fallback AMD CPUID(0x4) emulation
+ * Fallback AMD CPUID(0x4) emulation:
  * AMD CPUs with TOPOEXT can just use CPUID(0x8000001d)
- *
+ */
+
+/*
  * @AMD_L2_L3_INVALID_ASSOC: cache info for the respective L2/L3 cache should
  * be determined from CPUID(0x8000001d) instead of CPUID(0x80000006).
  */
-
 #define AMD_CPUID4_FULLY_ASSOCIATIVE	0xffff
 #define AMD_L2_L3_INVALID_ASSOC		0x9
 
-union l1_cache {
-	struct {
-		unsigned line_size	:8;
-		unsigned lines_per_tag	:8;
-		unsigned assoc		:8;
-		unsigned size_in_kb	:8;
-	};
-	unsigned int val;
-};
-
-union l2_cache {
-	struct {
-		unsigned line_size	:8;
-		unsigned lines_per_tag	:4;
-		unsigned assoc		:4;
-		unsigned size_in_kb	:16;
-	};
-	unsigned int val;
-};
-
-union l3_cache {
-	struct {
-		unsigned line_size	:8;
-		unsigned lines_per_tag	:4;
-		unsigned assoc		:4;
-		unsigned res		:2;
-		unsigned size_encoded	:14;
-	};
-	unsigned int val;
-};
-
 /* L2/L3 associativity mapping */
 static const unsigned short assocs[] = {
 	[1]		= 1,
@@ -117,50 +87,52 @@ static const unsigned short assocs[] = {
 static const unsigned char levels[] = { 1, 1, 2, 3 };
 static const unsigned char types[]  = { 1, 2, 3, 3 };
 
-static void legacy_amd_cpuid4(int index, struct leaf_0x4_0 *regs)
+static void legacy_amd_cpuid4(struct cpuinfo_x86 *c, int index, struct leaf_0x4_0 *regs)
 {
-	unsigned int dummy, line_size, lines_per_tag, assoc, size_in_kb;
-	union l1_cache l1i, l1d, *l1;
-	union l2_cache l2;
-	union l3_cache l3;
+	const struct leaf_0x80000005_0 *el5 = cpuid_leaf(c, 0x80000005);
+	const struct leaf_0x80000006_0 *el6 = cpuid_leaf(c, 0x80000006);
+	const struct cpuid_regs *el5_raw = (const struct cpuid_regs *)el5;
+	unsigned int line_size, lines_per_tag, assoc, size_in_kb;
 
 	*regs = (struct leaf_0x4_0){ };
 
-	cpuid(0x80000005, &dummy, &dummy, &l1d.val, &l1i.val);
-	cpuid(0x80000006, &dummy, &dummy, &l2.val, &l3.val);
-
-	l1 = &l1d;
 	switch (index) {
-	case 1:
-		l1 = &l1i;
-		fallthrough;
 	case 0:
-		if (!l1->val)
+		if (!el5 || !el5_raw->ecx)
 			return;
 
-		assoc		= (l1->assoc == 0xff) ? AMD_CPUID4_FULLY_ASSOCIATIVE : l1->assoc;
-		line_size	= l1->line_size;
-		lines_per_tag	= l1->lines_per_tag;
-		size_in_kb	= l1->size_in_kb;
+		assoc		= el5->l1_dcache_assoc;
+		line_size	= el5->l1_dcache_line_size;
+		lines_per_tag	= el5->l1_dcache_nlines;
+		size_in_kb	= el5->l1_dcache_size_kb;
+		break;
+	case 1:
+		if (!el5 || !el5_raw->edx)
+			return;
+
+		assoc		= el5->l1_icache_assoc;
+		line_size	= el5->l1_icache_line_size;
+		lines_per_tag	= el5->l1_icache_nlines;
+		size_in_kb	= el5->l1_icache_size_kb;
 		break;
 	case 2:
-		if (!l2.assoc || l2.assoc == AMD_L2_L3_INVALID_ASSOC)
+		if (!el6 || !el6->l2_assoc || el6->l2_assoc == AMD_L2_L3_INVALID_ASSOC)
 			return;
 
 		/* Use x86_cache_size as it might have K7 errata fixes */
-		assoc		= assocs[l2.assoc];
-		line_size	= l2.line_size;
-		lines_per_tag	= l2.lines_per_tag;
+		assoc		= assocs[el6->l2_assoc];
+		line_size	= el6->l2_line_size;
+		lines_per_tag	= el6->l2_nlines;
 		size_in_kb	= __this_cpu_read(cpu_info.x86_cache_size);
 		break;
 	case 3:
-		if (!l3.assoc || l3.assoc == AMD_L2_L3_INVALID_ASSOC)
+		if (!el6 || !el6->l3_assoc || el6->l3_assoc == AMD_L2_L3_INVALID_ASSOC)
 			return;
 
-		assoc		= assocs[l3.assoc];
-		line_size	= l3.line_size;
-		lines_per_tag	= l3.lines_per_tag;
-		size_in_kb	= l3.size_encoded * 512;
+		assoc		= assocs[el6->l3_assoc];
+		line_size	= el6->l3_line_size;
+		lines_per_tag	= el6->l3_nlines;
+		size_in_kb	= el6->l3_size_range * 512;
 		if (boot_cpu_has(X86_FEATURE_AMD_DCM)) {
 			size_in_kb	= size_in_kb >> 1;
 			assoc		= assoc >> 1;
@@ -170,6 +142,10 @@ static void legacy_amd_cpuid4(int index, struct leaf_0x4_0 *regs)
 		return;
 	}
 
+	/* For L1d and L1i caches, 0xff is the full associativity marker */
+	if ((index == 0 || index == 1) && assoc == 0xff)
+		assoc = AMD_CPUID4_FULLY_ASSOCIATIVE;
+
 	regs->cache_self_init		= 1;
 	regs->cache_type		= types[index];
 	regs->cache_level		= levels[index];
@@ -207,7 +183,7 @@ static int amd_fill_cpuid4_info(struct cpuinfo_x86 *c, int index, struct _cpuid4
 	if (boot_cpu_has(X86_FEATURE_TOPOEXT) || boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
 		regs = *(struct leaf_0x4_0 *)cpuid_subleaf_index(c, 0x8000001d, index);
 	else
-		legacy_amd_cpuid4(index, &regs);
+		legacy_amd_cpuid4(c, index, &regs);
 
 	return cpuid4_info_fill_done(id4, &regs);
 }
@@ -279,10 +255,9 @@ void init_amd_cacheinfo(struct cpuinfo_x86 *c)
 {
 	struct cpu_cacheinfo *ci = get_cpu_cacheinfo(c->cpu_index);
 
-	if (boot_cpu_has(X86_FEATURE_TOPOEXT))
-		ci->num_leaves = cpuid_subleaf_count(c, 0x8000001d);
-	else if (c->extended_cpuid_level >= 0x80000006)
-		ci->num_leaves = (cpuid_edx(0x80000006) & 0xf000) ? 4 : 3;
+	ci->num_leaves = boot_cpu_has(X86_FEATURE_TOPOEXT) ?
+		cpuid_subleaf_count(c, 0x8000001d) :
+		cpuid_leaf(c, 0x80000006)->l3_assoc ? 4 : 3;
 }
 
 void init_hygon_cacheinfo(struct cpuinfo_x86 *c)
-- 
2.49.0

