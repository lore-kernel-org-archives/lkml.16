Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D6D2E174B
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771730; cv=none; b=IvD12Mvz1g+qVQ6JAlJG+hzB23g39TkKwKKHviAMux26qmLZJrcaSKxsp9ojdrxuxFbdlN3ydGoxUJPK3G9jlY49sHXQgBAsix5Go6ayXT0FhdjRah+EyvMxRUFnavVswJCBJsI20ocWH+Vhp9Gr7Roe2n3br1OsCxeuVKd5pgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771730; c=relaxed/simple;
	bh=z82VwTthUFfnUcTiSCwqdtyH+Epbo4FG69WCMbpyjBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8vi7NVM89DA++pO1aR1fco18YGCjbxeQdbiWUi99zCq+JnB1YV1y2fcMeZedFyLqC0lt7MjGDssjgeKGGqDMWHfjtsA20FU1B1+2xszKvRo56GDp50S1xiCNncD62vuJT9G0NBRNW4RM8/RQeQ8clMaOjcQsiq83+UMAiDToGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=04+TRuU2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=llmdiGYQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="04+TRuU2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="llmdiGYQ"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6VR7KDQRHAhp6nDb7UdnP2R2S4/sVMGxNhQnlYT1M4=;
	b=04+TRuU24KBcaHpYDxBZXAFti2dPt/80pTixfC84I9VFxWBmuJEHaBU06Ra/CixLvyi3FY
	d3/06buirwmRkzoM2xhMuREOyKoI7Qm99pFPga8TPB9pjqtjZfezboBnsprCsVbkSMUaZK
	MqvcHraRbEVoeFLa47IArpb/sezKPIdP+wsf4DFwNocIh0QfEMUM+rSxN1OWOXintUQSs7
	RqC/lx6NTWJehbw0MuSS1PLfH20uS+NXjccui85NWVSvmzOiUDP7DqOCsZd4iOoWv4XG8y
	Zlxr2GLiHW8VJdnzMgwPUEmL94SeRWuhJe1DHiSuZyOyj1Oi9sXQjHy2KjMRXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6VR7KDQRHAhp6nDb7UdnP2R2S4/sVMGxNhQnlYT1M4=;
	b=llmdiGYQc6s2WIEJoyRUj6FPxXSKeyTLiOQ7QKVcd+plmglrP1CW/xLaC0+/iHBQ+91RkS
	otmYhIpZ9pL3BSBg==
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
Subject: [PATCH v3 32/44] x86/cpuid: Remove direct CPUID(0x2) query API
Date: Fri, 13 Jun 2025 01:39:58 +0200
Message-ID: <20250612234010.572636-33-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All call sites at x86/cpu and x86/cacheinfo has been switched from direct
CPUID(0x2) access to parsed CPUID access.  Remove the direct CPUID(0x2)
query APIs at <asm/cpuid/api.h>:

    cpuid_leaf_0x2()
    for_each_cpuid_0x2_desc()

Rename the iterator macro:

    for_each_parsed_cpuid_0x2_desc()

back to:

    for_each_cpuid_0x2_desc()

since the "for_each_parsed_.." name and was just chosen to accommodate
the transition from direct CPUID(0x2) access to parsed access.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h | 75 ++------------------------------
 arch/x86/kernel/cpu/cacheinfo.c  |  2 +-
 arch/x86/kernel/cpu/intel.c      |  2 +-
 3 files changed, 5 insertions(+), 74 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 6a0e766de565..9f9c035a9e73 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -212,75 +212,6 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
 	return 0;
 }
 
-/*
- * CPUID(0x2) parsing:
- */
-
-/**
- * cpuid_leaf_0x2() - Return sanitized CPUID(0x2) register output
- * @regs:	Output parameter
- *
- * Query CPUID(0x2) and store its output in @regs.  Force set any
- * invalid 1-byte descriptor returned by the hardware to zero (the NULL
- * cache/TLB descriptor) before returning it to the caller.
- *
- * Use for_each_cpuid_0x2_desc() to iterate over the register output in
- * parsed form.
- */
-static inline void cpuid_leaf_0x2(union leaf_0x2_regs *regs)
-{
-	cpuid_read(0x2, regs);
-
-	/*
-	 * All Intel CPUs must report an iteration count of 1.	In case
-	 * of bogus hardware, treat all returned descriptors as NULL.
-	 */
-	if (regs->desc[0] != 0x01) {
-		for (int i = 0; i < 4; i++)
-			regs->regv[i] = 0;
-		return;
-	}
-
-	/*
-	 * The most significant bit (MSB) of each register must be clear.
-	 * If a register is invalid, replace its descriptors with NULL.
-	 */
-	for (int i = 0; i < 4; i++) {
-		if (regs->reg[i].invalid)
-			regs->regv[i] = 0;
-	}
-}
-
-/**
- * for_each_cpuid_0x2_desc() - Iterator for parsed CPUID(0x2) descriptors
- * @_regs:	CPUID(0x2) register output, as returned by cpuid_leaf_0x2()
- * @_ptr:	u8 pointer, for macro internal use only
- * @_desc:	Pointer to the parsed CPUID(0x2) descriptor at each iteration
- *
- * Loop over the 1-byte descriptors in the passed CPUID(0x2) output registers
- * @_regs.  Provide the parsed information for each descriptor through @_desc.
- *
- * To handle cache-specific descriptors, switch on @_desc->c_type.  For TLB
- * descriptors, switch on @_desc->t_type.
- *
- * Example usage for cache descriptors::
- *
- *	const struct leaf_0x2_table *desc;
- *	union leaf_0x2_regs regs;
- *	u8 *ptr;
- *
- *	cpuid_leaf_0x2(&regs);
- *	for_each_cpuid_0x2_desc(regs, ptr, desc) {
- *		switch (desc->c_type) {
- *			...
- *		}
- *	}
- */
-#define for_each_cpuid_0x2_desc(_regs, _ptr, _desc)				\
-	for (_ptr = &(_regs).desc[1];						\
-	     _ptr < &(_regs).desc[16] && (_desc = &cpuid_0x2_table[*_ptr]);	\
-	     _ptr++)
-
 /*
  * CPUID(0x80000006) parsing:
  */
@@ -553,7 +484,7 @@ static inline bool cpuid_amd_hygon_has_l3_cache(void)
  */
 
 /**
- * for_each_parsed_cpuid_0x2_desc() - Iterator for parsed CPUID(0x2) descriptors
+ * for_each_cpuid_0x2_desc() - Iterator for parsed CPUID(0x2) descriptors
  * @_regs:   Leaf 0x2 register output, as returned by cpuid_leaf_regs()
  * @_ptr:  u8 pointer, for macro internal use only
  * @_desc:  Pointer to parsed descriptor information at each iteration
@@ -575,13 +506,13 @@ static inline bool cpuid_amd_hygon_has_l3_cache(void)
  *		// Handle error
  *	}
  *
- *	for_each_parsed_cpuid_0x2_desc(regs, ptr, desc) {
+ *	for_each_cpuid_0x2_desc(regs, ptr, desc) {
  *		switch (desc->c_type) {
  *			...
  *		}
  *	}
  */
-#define for_each_parsed_cpuid_0x2_desc(_regs, _ptr, _desc)				\
+#define for_each_cpuid_0x2_desc(_regs, _ptr, _desc)					\
 	for (({ static_assert(sizeof(*_regs) == sizeof(union leaf_0x2_regs)); }),	\
 	     _ptr = &((union leaf_0x2_regs *)(_regs))->desc[1];				\
 	     _ptr < &((union leaf_0x2_regs *)(_regs))->desc[16] && (_desc = &cpuid_0x2_table[*_ptr]);\
diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 39cd6db4f702..f837ccdec116 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -389,7 +389,7 @@ static void intel_cacheinfo_0x2(struct cpuinfo_x86 *c)
 	if (!regs)
 		return;
 
-	for_each_parsed_cpuid_0x2_desc(regs, ptr, desc) {
+	for_each_cpuid_0x2_desc(regs, ptr, desc) {
 		switch (desc->c_type) {
 		case CACHE_L1_INST:	l1i += desc->c_size; break;
 		case CACHE_L1_DATA:	l1d += desc->c_size; break;
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 5eab9135b144..06c249110c8b 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -717,7 +717,7 @@ static void intel_detect_tlb(struct cpuinfo_x86 *c)
 	if (!regs)
 		return;
 
-	for_each_parsed_cpuid_0x2_desc(regs, ptr, desc)
+	for_each_cpuid_0x2_desc(regs, ptr, desc)
 		intel_tlb_lookup(desc);
 }
 
-- 
2.49.0

