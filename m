Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3505C283120
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151519; cv=none; b=EH4IVM0U/3PSonou6CRjFsS9RWnvhYD3tTkOLTbyjduIx22T4XkGAvXdE3ncNOj4MxOJ7mBiEg+KaZorVQ0OrWfPHgS6aBGX7809QjoFrn/eTNWU/+/REEZIVkTSfWLUTiMsUsLZgoLoNPhhn79nS60810VG4WeiYWKdJPwbPV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151519; c=relaxed/simple;
	bh=FPi0T+ZPHVxFlKBJeZhvqtH99ssopk9ydCy7etjY6jM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vs9ErOK6f++ANI+lESiEpalGxVO7e8FEb2yqM0cHO8aEJiSGolwXZxyOC8nyy8RVilrnB9XU3Q556Omnpx2r+dISLDl934x/gDzEm2ymbmN3dYBdwc9VMqINIDDGAhiHxbSCcADyxDmEnaBUUn39VYGpJh5E5iUotJfUMIiM6js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=irqk510j; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0AtAZ6AN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="irqk510j";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0AtAZ6AN"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mjuF6lOnbxM2mnXkJdbZYdkl6Gf4g+uakMCPx4X7vT8=;
	b=irqk510jsC8KH0glDWs0hrZ/GSVgUV/VLtlyRnc5CWYm3c6CIq/47AfYvLcq7tFsf4II9c
	s0OgW1TTIVvQLlRgQAM3Jb1NiQ2x711o/1s19P0vBHM6sLk9/L4VQOG+gi5eDdP7STxcqN
	V1hNCJ4+Nz09FbTB71/N8wYY38/VPi5thWZtn3okk8iLfEmTHQ6EFjFtK4bfriTPmaDCwV
	6iOIlYW8Q1ANqofadaJSSdnc7qBLz0VLFCKbIPiORq99LRNNebawv6knC+eP/SW+7KMDFM
	TWmjYrWWrpSep9Zy9l8XF5v2D7oyhUE9ppapcDZgt5LCOc02Zt6PPqWc0zc4cw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mjuF6lOnbxM2mnXkJdbZYdkl6Gf4g+uakMCPx4X7vT8=;
	b=0AtAZ6ANQyFCmflG9wp9nNV7q7tpXF/UE3jr/rVBf70UooSJBDMv7t6J+FYe54C5wYYVfr
	s5+TQsREPR7jsbCQ==
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
Subject: [PATCH v2 21/27] x86/cacheinfo: Use parsed CPUID(0x8000001d)
Date: Thu,  5 Jun 2025 21:23:50 +0200
Message-ID: <20250605192356.82250-22-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the AMD CPUID(0x8000001d) cacheinfo logic to use the parsed
CPUID API instead of issuing direct CPUID queries.

Beside CPUID data centralization benefits, this allows using the
auto-generated <cpuid/leaf_types.h> 'struct cpuid_0x8000001d_0' data type
with its full C99 bitfields instead of doing ugly bitwise operations.

Since parsed CPUID access requires a 'struct cpuinfo_x86' reference,
trickle it down to relevant functions.

Use the parsed CPUID API:

    cpuid_subleaf_count(c, 0x8000001d)

to find the number of cache leaves, thus replacing
amd_find_num_cache_leaves() and its direct CPUID queries.  Drop that
function entirely as it is no longer needed.

For now, keep using the 'union _cpuid4_leaf_eax/ebx/ecx' structures as
they are required by the AMD CPUID(0x4) emulation code paths.  A follow
up commit will replace them with <cpuid/leaf_types.h> equivalents.

Note, for below code:

    cpuid_count(0x8000001d, llc_index, &eax, &ebx, &ecx, &edx);
    if (eax)
        num_sharing_cache = ((eax >> 14) & 0xfff) + 1;

    if (num_sharing_cache) {
        int index_msb = get_count_order(num_sharing_cache);
        ...
    }

it is replaced with:

    const struct leaf_0x8000001d_0 *leaf =
        cpuid_subleaf_index(c, 0x8000001d, llc_index);

    if (leaf) {
        int index_msb = get_count_order(l->num_threads_sharing + 1);
        ...
    }

The "if (leaf)" check is sufficient since the parsed CPUID API returns
NULL if the leaf is out of range (> max CPU extended leaf) or if the
'llc_index' is out of range.  An out of range LLC index is equivalent to
"EAX.cache_type == 0" in the original code, making the logic match.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c | 47 +++++++++++----------------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 07f0883f9fbe..05a3fbd0d849 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -237,16 +237,19 @@ static int cpuid4_info_fill_done(struct _cpuid4_info *id4, union _cpuid4_leaf_ea
 	return 0;
 }
 
-static int amd_fill_cpuid4_info(int index, struct _cpuid4_info *id4)
+static int amd_fill_cpuid4_info(struct cpuinfo_x86 *c, int index, struct _cpuid4_info *id4)
 {
 	union _cpuid4_leaf_eax eax;
 	union _cpuid4_leaf_ebx ebx;
 	union _cpuid4_leaf_ecx ecx;
-	u32 ignored;
 
-	if (boot_cpu_has(X86_FEATURE_TOPOEXT) || boot_cpu_data.x86_vendor == X86_VENDOR_HYGON)
-		cpuid_count(0x8000001d, index, &eax.full, &ebx.full, &ecx.full, &ignored);
-	else
+	if (boot_cpu_has(X86_FEATURE_TOPOEXT) || boot_cpu_data.x86_vendor == X86_VENDOR_HYGON) {
+		const struct cpuid_regs *regs = cpuid_subleaf_index_regs(c, 0x8000001d, index);
+
+		eax.full = regs->eax;
+		ebx.full = regs->ebx;
+		ecx.full = regs->ecx;
+	} else
 		legacy_amd_cpuid4(index, &eax, &ebx, &ecx);
 
 	return cpuid4_info_fill_done(id4, eax, ebx, ecx);
@@ -267,25 +270,10 @@ static int fill_cpuid4_info(struct cpuinfo_x86 *c, int index, struct _cpuid4_inf
 	u8 cpu_vendor = boot_cpu_data.x86_vendor;
 
 	return (cpu_vendor == X86_VENDOR_AMD || cpu_vendor == X86_VENDOR_HYGON) ?
-		amd_fill_cpuid4_info(index, id4) :
+		amd_fill_cpuid4_info(c, index, id4) :
 		intel_fill_cpuid4_info(c, index, id4);
 }
 
-static int amd_find_num_cache_leaves(struct cpuinfo_x86 *c)
-{
-	union _cpuid4_leaf_eax cache_eax;
-	unsigned int eax, ebx, ecx, edx;
-	int i = -1;
-
-	/* Do a CPUID(0x8000001d) loop to calculate num_cache_leaves */
-	do {
-		++i;
-		cpuid_count(0x8000001d, i, &eax, &ebx, &ecx, &edx);
-		cache_eax.full = eax;
-	} while (cache_eax.split.type != CTYPE_NULL);
-	return i;
-}
-
 /*
  * AMD/Hygon CPUs may have multiple LLCs if L3 caches exist.
  */
@@ -309,15 +297,12 @@ void cacheinfo_amd_init_llc_id(struct cpuinfo_x86 *c, u16 die_id)
 		 * Newer families: LLC ID is calculated from the number
 		 * of threads sharing the L3 cache.
 		 */
-		u32 eax, ebx, ecx, edx, num_sharing_cache = 0;
-		u32 llc_index = amd_find_num_cache_leaves(c) - 1;
-
-		cpuid_count(0x8000001d, llc_index, &eax, &ebx, &ecx, &edx);
-		if (eax)
-			num_sharing_cache = ((eax >> 14) & 0xfff) + 1;
+		u32 llc_index = cpuid_subleaf_count(c, 0x8000001d) - 1;
+		const struct leaf_0x8000001d_0 *leaf =
+			cpuid_subleaf_index(c, 0x8000001d, llc_index);
 
-		if (num_sharing_cache) {
-			int index_msb = get_count_order(num_sharing_cache);
+		if (leaf) {
+			int index_msb = get_count_order(leaf->num_threads_sharing + 1);
 
 			c->topo.llc_id = c->topo.apicid >> index_msb;
 		}
@@ -341,7 +326,7 @@ void init_amd_cacheinfo(struct cpuinfo_x86 *c)
 	struct cpu_cacheinfo *ci = get_cpu_cacheinfo(c->cpu_index);
 
 	if (boot_cpu_has(X86_FEATURE_TOPOEXT))
-		ci->num_leaves = amd_find_num_cache_leaves(c);
+		ci->num_leaves = cpuid_subleaf_count(c, 0x8000001d);
 	else if (c->extended_cpuid_level >= 0x80000006)
 		ci->num_leaves = (cpuid_edx(0x80000006) & 0xf000) ? 4 : 3;
 }
@@ -350,7 +335,7 @@ void init_hygon_cacheinfo(struct cpuinfo_x86 *c)
 {
 	struct cpu_cacheinfo *ci = get_cpu_cacheinfo(c->cpu_index);
 
-	ci->num_leaves = amd_find_num_cache_leaves(c);
+	ci->num_leaves = cpuid_subleaf_count(c, 0x8000001d);
 }
 
 static void intel_cacheinfo_done(struct cpuinfo_x86 *c, unsigned int l3,
-- 
2.49.0

