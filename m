Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471EE27A90F
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716579; cv=none; b=GA6/KfnTQXRD0C4YwEh13o6PWxyEQPyk6CLodWki674l0eJquTvVX3kNimHUV9nmrxvY18d08SoH8Rs/WG7CLS+4YbVGk4p+RUeP+/1TQaI+zoZNsGQ3gWTFeVoC4ijAwgy8p+SJZY6FybD7Nn9+BCsexD/uSceooTth8FEx9tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716579; c=relaxed/simple;
	bh=3PYcpfwLxTEKFv/bxLMLmifenYAM9sHe53k0E2HOZiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7UkllHIjXD4JkhLIWquKXgafAg0J4GRFvypxNkJo9p/TIghFaksEXjtruWS3mRuGXXVIygfW/7IcL/vYIshr2VnVLuhBXZo7KSucChjbIcEPzYjkqpF2jc9jAl5smoAB+RQX+3JlvOdqU4CcpUGqktuJpcH6kN8Jz9KBSTZBBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iWgekgFr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RDKy2I5e; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iWgekgFr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RDKy2I5e"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746716575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W5RMb9J6kkNDiesJ6oIzMO9/H9Rb3V4T9T68CUJaezU=;
	b=iWgekgFr1YPydQPqkPnpd6CiVK0I9p219Brmo9CJO99x3eXEZrNjUECYGtXa9Q6qJ6WXGT
	2tqlvM5z8j+j/nzgvmwc2YYzFja/tCd69EL3iTpsOdTWbEFEF9xT9VVXJmUhf6akBHmFyB
	IIAbY0pPrQR9MetUMHWXSazjUbx2rscfP072XwsFqEfDyDIk8OPLihBUkvvWR/kTg7e8Tp
	rqkrHUe+so+KWMIiiR75hX0Uenpyv2UxpS13Tq7sGUdbNQr/EQc9I/vlBDF7EDarsZaUOV
	dYkgyesiH7sqI0eQu5m/0jmmdkrEIvsrt8PB6YcTKAkDDRpU/UXS5WcAs+uq9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746716575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W5RMb9J6kkNDiesJ6oIzMO9/H9Rb3V4T9T68CUJaezU=;
	b=RDKy2I5e0fIDhFK02KnoZzsN0H9tNp9RGc5022HUj5hkS9ddT9uN/Rcn1LdoQIrBjsgZ40
	cq8lULW8NHV75BAA==
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
Subject: [PATCH v1 5/9] x86/cpuid: Rename cpuid_get_leaf_0x2_regs() to cpuid_leaf_0x2()
Date: Thu,  8 May 2025 17:02:34 +0200
Message-ID: <20250508150240.172915-6-darwi@linutronix.de>
In-Reply-To: <20250508150240.172915-1-darwi@linutronix.de>
References: <20250508150240.172915-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the CPUID(0x2) register accessor function:

    cpuid_get_leaf_0x2_regs(regs)

to:

    cpuid_leaf_0x2(regs)

for consistency with other <cpuid/api.h> accessors that return full CPUID
registers outputs like:

    cpuid_leaf(regs)
    cpuid_subleaf(regs)

In the same vein, rename the CPUID(0x2) iteration macro:

    for_each_leaf_0x2_entry()

to:

    for_each_cpuid_0x2_desc()

to include "cpuid" in the macro name, and since what is iterated upon is
CPUID(0x2) cache and TLB "descriptos", not "entries".  Prefix an
underscore to that iterator macro parameters, so that the newly renamed
'desc' parameter do not get mixed with "union leaf_0x2_regs :: desc[]" in
the macro's implementation.

Adjust all the affected call-sites accordingly.

While at it, use "CPUID(0x2)" instead of "CPUID leaf 0x2" as this is the
recommended style.

References: 62e565273993 ("x86/cacheinfo: Standardize header files and CPUID references")
References: 718f9038acc5 ("x86/cpuid: Remove obsolete CPUID(0x2) iteration macro")
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h | 34 ++++++++++++++++----------------
 arch/x86/kernel/cpu/cacheinfo.c  |  4 ++--
 arch/x86/kernel/cpu/intel.c      |  4 ++--
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index 0e4b53306e99..e957f09d8a8f 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -216,17 +216,17 @@ static inline u32 cpuid_hypervisor_base(const char *sig, u32 leaves)
  */
 
 /**
- * cpuid_get_leaf_0x2_regs() - Return sanitized leaf 0x2 register output
+ * cpuid_leaf_0x2() - Return sanitized CPUID(0x2) register output
  * @regs:	Output parameter
  *
- * Query CPUID leaf 0x2 and store its output in @regs.	Force set any
+ * Query CPUID(0x2) and store its output in @regs.  Force set any
  * invalid 1-byte descriptor returned by the hardware to zero (the NULL
  * cache/TLB descriptor) before returning it to the caller.
  *
- * Use for_each_leaf_0x2_entry() to iterate over the register output in
+ * Use for_each_cpuid_0x2_desc() to iterate over the register output in
  * parsed form.
  */
-static inline void cpuid_get_leaf_0x2_regs(union leaf_0x2_regs *regs)
+static inline void cpuid_leaf_0x2(union leaf_0x2_regs *regs)
 {
 	cpuid_leaf(0x2, regs);
 
@@ -251,34 +251,34 @@ static inline void cpuid_get_leaf_0x2_regs(union leaf_0x2_regs *regs)
 }
 
 /**
- * for_each_leaf_0x2_entry() - Iterator for parsed leaf 0x2 descriptors
- * @regs:   Leaf 0x2 register output, returned by cpuid_get_leaf_0x2_regs()
+ * for_each_cpuid_0x2_desc() - Iterator for parsed CPUID(0x2) descriptors
+ * @regs:   CPUID(0x2) register output, as returned by cpuid_leaf_0x2()
  * @__ptr:  u8 pointer, for macro internal use only
- * @entry:  Pointer to parsed descriptor information at each iteration
+ * @desc:   Pointer to parsed CPUID(0x2) descriptor at each iteration
  *
- * Loop over the 1-byte descriptors in the passed leaf 0x2 output registers
- * @regs.  Provide the parsed information for each descriptor through @entry.
+ * Loop over the 1-byte descriptors in the passed CPUID(0x2) output registers
+ * @regs.  Provide the parsed information for each descriptor through @desc.
  *
  * To handle cache-specific descriptors, switch on @entry->c_type.  For TLB
  * descriptors, switch on @entry->t_type.
  *
  * Example usage for cache descriptors::
  *
- *	const struct leaf_0x2_table *entry;
+ *	const struct leaf_0x2_table *desc;
  *	union leaf_0x2_regs regs;
  *	u8 *ptr;
  *
- *	cpuid_get_leaf_0x2_regs(&regs);
- *	for_each_leaf_0x2_entry(regs, ptr, entry) {
- *		switch (entry->c_type) {
+ *	cpuid_leaf_0x2(&regs);
+ *	for_each_cpuid_0x2_desc(regs, ptr, desc) {
+ *		switch (desc->c_type) {
  *			...
  *		}
  *	}
  */
-#define for_each_leaf_0x2_entry(regs, __ptr, entry)				\
-	for (__ptr = &(regs).desc[1];						\
-	     __ptr < &(regs).desc[16] && (entry = &cpuid_0x2_table[*__ptr]);	\
-	     __ptr++)
+#define for_each_cpuid_0x2_desc(_regs, _ptr, _desc)				\
+	for (_ptr = &(_regs).desc[1];						\
+	     _ptr < &(_regs).desc[16] && (_desc = &cpuid_0x2_table[*_ptr]);	\
+	     _ptr++)
 
 /*
  * CPUID(0x80000006) parsing:
diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 6d61f7dff9e7..b6349c1792dd 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -388,8 +388,8 @@ static void intel_cacheinfo_0x2(struct cpuinfo_x86 *c)
 	if (c->cpuid_level < 2)
 		return;
 
-	cpuid_get_leaf_0x2_regs(&regs);
-	for_each_leaf_0x2_entry(regs, ptr, entry) {
+	cpuid_leaf_0x2(&regs);
+	for_each_cpuid_0x2_desc(regs, ptr, entry) {
 		switch (entry->c_type) {
 		case CACHE_L1_INST:	l1i += entry->c_size; break;
 		case CACHE_L1_DATA:	l1d += entry->c_size; break;
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index ade5557dd3f8..d4efca7e4bd6 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -716,8 +716,8 @@ static void intel_detect_tlb(struct cpuinfo_x86 *c)
 	if (c->cpuid_level < 2)
 		return;
 
-	cpuid_get_leaf_0x2_regs(&regs);
-	for_each_leaf_0x2_entry(regs, ptr, entry)
+	cpuid_leaf_0x2(&regs);
+	for_each_cpuid_0x2_desc(regs, ptr, entry)
 		intel_tlb_lookup(entry);
 }
 
-- 
2.49.0

