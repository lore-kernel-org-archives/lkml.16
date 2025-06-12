Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA5D2ECE9D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771762; cv=none; b=PapgZKJgPtg7QMMPYeiCbBllEgc3CoyL+E8j/YZzR8oJhp37AQUzLrOnTGLk9qhQmQu3NLChnziSbkIRSCoMo2125H3AeAj11We8mlkm8vWApxCJeOMYrCbGUqwxEsoVd3XELyruVf47v9rAe5hv0Ykl94J9QBzardR+q82NxOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771762; c=relaxed/simple;
	bh=o6Bbz5lQ615J4ru0a/N+eq20jvp8zjlPf71idMnzQY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aLTBosFISv6SjGxnbC033uMEidlZZgIDSRCcZ6eIPv8pxzlUzzYonvim2/XWeVsRZvbiu2XjenzvelQvmBZl04o6o7gx2sGQUJWL+vKtHlfnei4IZsjfCjE7mtSNXoPod0G0VE4WsHcA/BAR8JULmdv7qt5bxKUjAjKPeLrspLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=T13hYi1c; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=N12RORi/; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="T13hYi1c";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="N12RORi/"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nsczU9Cnv76lV78TZ5tdmxGG7/e4mNUxWgTJZQGdiA0=;
	b=T13hYi1cp2uDHJxyuL2G14Y4iZXeOtv8NtQrldkj48L4ZOZj8OfqCNm39W7eFiyTc7ejmx
	pvzr9nA9oiWyYPuDJxh1Q+SLzAVIkaQ/vDO9SkMmayqhZveUhsLxJiImDA+hmeFdOv+InA
	5zOioQ60fDJZpMafpkX+eg8HHw+eaQCXytnxJcSaJEUnD+WPpbtF/npPcuB3w47z7MqS0J
	aSYNpAD1gTyVQ+2ace0L7zpG7wSFiwEDNqO3mA2snRHCaybrxd9JIxbdtgNCf1Ud0cj2CZ
	pcDqWxEIDRT40+fVCilVoH7F82EGtbRtMBhKNaXi+9UBvbES+4x7hT+AItmwcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nsczU9Cnv76lV78TZ5tdmxGG7/e4mNUxWgTJZQGdiA0=;
	b=N12RORi/jE/zf6Tt1F9psWgvk5BXj1JaxEkysgWhYsKWYaa3oYN0levdRFSvMWlkAN3BFk
	03DYMfN2bYMvMpBw==
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
Subject: [PATCH v3 42/44] x86/cpuid: Use parsed CPUID(0x80000006)
Date: Fri, 13 Jun 2025 01:40:08 +0200
Message-ID: <20250612234010.572636-43-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For cpuid_amd_hygon_has_l3_cache(), use parsed CPUID access instead of a
direct CPUID query.  The new API offers centralization benefits and
avoids bit fiddling at call sites.

For testing L3 cache availability, just check if the EDX.l3_assoc output
is not zero.  Per AMD manuals, an L3 associativity of zero implies the
absence of an L3 cache on the CPU.

Note, since this function is now using parsed CPUID API, move it under
the <cpuid/api.h> section: 'Convenience leaf-specific functions (using
parsed CPUID data)'

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h | 18 +++++++++---------
 arch/x86/kernel/amd_nb.c         |  2 +-
 arch/x86/kernel/cpu/cacheinfo.c  |  6 +++---
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 9f9c035a9e73..92366de5e490 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -212,15 +212,6 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
 	return 0;
 }
 
-/*
- * CPUID(0x80000006) parsing:
- */
-
-static inline bool cpuid_amd_hygon_has_l3_cache(void)
-{
-	return cpuid_edx(0x80000006);
-}
-
 /*
  * 'struct cpuid_leaves' accessors:
  *
@@ -518,6 +509,15 @@ static inline bool cpuid_amd_hygon_has_l3_cache(void)
 	     _ptr < &((union leaf_0x2_regs *)(_regs))->desc[16] && (_desc = &cpuid_0x2_table[*_ptr]);\
 	     _ptr++)
 
+/*
+ * CPUID(0x80000006)
+ */
+
+static inline bool cpuid_amd_hygon_has_l3_cache(struct cpuinfo_x86 *c)
+{
+	return cpuid_leaf(c, 0x80000006)->l3_assoc;
+}
+
 /*
  * CPUID parser exported APIs:
  */
diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index a8809778b208..a5d022e15a6b 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -94,7 +94,7 @@ static int amd_cache_northbridges(struct cpuinfo_x86 *c)
 	if (amd_gart_present())
 		amd_northbridges.flags |= AMD_NB_GART;
 
-	if (!cpuid_amd_hygon_has_l3_cache())
+	if (!cpuid_amd_hygon_has_l3_cache(c))
 		return 0;
 
 	/*
diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index de8e7125eedd..dc28ffdbdc7f 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -210,7 +210,7 @@ static int fill_cpuid4_info(struct cpuinfo_x86 *c, int index, struct _cpuid4_inf
 
 void cacheinfo_amd_init_llc_id(struct cpuinfo_x86 *c, u16 die_id)
 {
-	if (!cpuid_amd_hygon_has_l3_cache())
+	if (!cpuid_amd_hygon_has_l3_cache(c))
 		return;
 
 	if (c->x86 < 0x17) {
@@ -241,7 +241,7 @@ void cacheinfo_amd_init_llc_id(struct cpuinfo_x86 *c, u16 die_id)
 
 void cacheinfo_hygon_init_llc_id(struct cpuinfo_x86 *c)
 {
-	if (!cpuid_amd_hygon_has_l3_cache())
+	if (!cpuid_amd_hygon_has_l3_cache(c))
 		return;
 
 	/*
@@ -257,7 +257,7 @@ void init_amd_cacheinfo(struct cpuinfo_x86 *c)
 
 	ci->num_leaves = boot_cpu_has(X86_FEATURE_TOPOEXT) ?
 		cpuid_subleaf_count(c, 0x8000001d) :
-		cpuid_leaf(c, 0x80000006)->l3_assoc ? 4 : 3;
+		cpuid_amd_hygon_has_l3_cache(c) ? 4 : 3;
 }
 
 void init_hygon_cacheinfo(struct cpuinfo_x86 *c)
-- 
2.49.0

