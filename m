Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02BD27AC5C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507932; cv=none; b=kTzMHerjzexzuLcyaeV8lX9NM95+N8goaEygZ/U+jObw+uAeJKmKKqhMMa9M2G/MlW7BeinFo+SKsSmjLaJM1VH6irnZ1ENwFi3IjbsrZHEjpmn4H1k8R9HomfexS1k4e0Bku1vEfvg6iKirZNZEsN64uKRPIu25Cvwo2spT8Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507932; c=relaxed/simple;
	bh=KQR61UmgfiyguvdsYgOVuQgJzDQdtn/PavEmoFuAuKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltdFeWD3pix7rQl93kCwfRIyXy7jTJVdhCmnydVZkFlsDOeATbrt3KAmakOxkSFP3WeAn9015wrMZEh7spi0tTLtf22+2L8DfaNcCrQi7YB1xSth+wd9jqijOvUc8A8kMTH91j7LZy5zFwrv7rZr4/ZQMSUwdU/UxwlfpqTd4nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MKE5D8TO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=La0Q2Y9T; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MKE5D8TO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="La0Q2Y9T"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1oYN1c0bppNsj0U7Ni0/fCO+nLIukL87UnWS0MYoACA=;
	b=MKE5D8TO9DzIsFDIKbThKgFQZdj2rXgcuy/CjCYdflrZJHJWBl/yOoTZ7eZ7eLFWaD7KbY
	/Rzel1gh8tgINAUWvZZ24l5RDw3e84hMtpPC9JuJfqk/1q7pOyqRGAfmcJKcdENJQZUTxX
	gQjsKiFY60gC5UXHqj5NiAH9dIWTAWlWNpzlm+zbxbEgXJlfK/BKZTMDOOMcNK4/dOO+Oe
	3xHxA0ZqqA9I9rNRo49hdJNsfnMgTgGM5P3PUA4tZKsr8SehvEhTh4nzZKOFYoXKzl8l/+
	A359lpU0TZiID/FuiJyKXIQzRTddg0GuRLTt6lAZJy+o8hs8t5jcJjfDY/mvjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1oYN1c0bppNsj0U7Ni0/fCO+nLIukL87UnWS0MYoACA=;
	b=La0Q2Y9TwR7dpeyRPMswzAwRBagNFddIKVeG5XvrupOt5fSR3pR4leFKwVIhaeggvKyQq3
	dNY0pmaPbToeFpCA==
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
Subject: [PATCH v1 14/26] x86/cpuid: Introduce scanned CPUID(0x2) API
Date: Tue,  6 May 2025 07:04:25 +0200
Message-ID: <20250506050437.10264-15-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new iterator macro, for_each_scanned_leaf_0x2_entry(), for parsing
scanned CPUID(0x2) entries as 1-byte descriptors.

Unlike the existing for_each_leaf_0x2_entry() macro, which operates on
directly retrieved CPUID data, the new one takes its input from the
scanned CPUID data access API.  That is, it is expected to be used as:

    const struct leaf_0x2_table *entry;
    const struct cpuid_regs *regs;
    u8 *ptr;

    regs = cpudata_cpuid_regs(c, 0x2);	// Scanned CPUID access
    for_each_scanned_leaf_0x2_entry(regs, ptr, entry) {
        ...
    }

which should replace the older method:

    const struct leaf_0x2_table *entry;
    union leaf_0x2_regs regs;
    u8 *ptr;

    cpuid_get_leaf_0x2_regs(&regs);	// Direct CPUID access
    for_each_leaf_0x2_entry(regs, ptr, entry) {
        ...
    }

In the new macro, assert that the passed 'regs' is the same size as a
'union leaf_0x2_regs'.  This is necessary since the macro internally
casts 'regs' to that union in order to iterate over the CPUID(0x2) output
as a 1-byte array.

A size equivalence assert is used, instead of a typeof() check, to give
callers the freedom to either pass a 'struct cpuid_regs' pointer or a
'struct leaf_0x2_0' pointer, both as returned by the scanned CPUID API at
<asm/cpuid/table_api.h>.  That size comparison matches what other kernel
CPUID do; e.g. cpuid_leaf() and cpuid_leaf_reg() at <asm/cpuid/api.h>.

Note, put the size equivalence check inside a GNU statement expression,
({..}), so that it can be placed inside the macro's loop initialization.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/leaf_0x2_api.h | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/leaf_0x2_api.h b/arch/x86/include/asm/cpuid/leaf_0x2_api.h
index 09fa3070b271..be3d7e113421 100644
--- a/arch/x86/include/asm/cpuid/leaf_0x2_api.h
+++ b/arch/x86/include/asm/cpuid/leaf_0x2_api.h
@@ -70,4 +70,39 @@ static inline void cpuid_get_leaf_0x2_regs(union leaf_0x2_regs *regs)
 	     __ptr < &(regs).desc[16] && (entry = &cpuid_0x2_table[*__ptr]);	\
 	     __ptr++)
 
+/**
+ * for_each_scanned_leaf_0x2_entry() - Iterator for parsed CPUID(0x2) descriptors
+ * @regs:   Leaf 0x2 register output, as returned by cpudata_cpuid_regs()
+ * @__ptr:  u8 pointer, for macro internal use only
+ * @entry:  Pointer to parsed descriptor information at each iteration
+ *
+ * Loop over the 1-byte descriptors in the passed CPUID(0x2) output registers
+ * @regs.  Provide the parsed information for each descriptor through @entry.
+ *
+ * To handle cache-specific descriptors, switch on @entry->c_type.  For TLB
+ * descriptors, switch on @entry->t_type.
+ *
+ * Example usage for cache descriptors::
+ *
+ *	const struct leaf_0x2_table *entry;
+ *	struct cpuid_regs *regs;
+ *	u8 *ptr;
+ *
+ *	regs = cpudata_cpuid_regs(c, 0x2);
+ *	if (!regs) {
+ *		// Handle error
+ *	}
+ *
+ *	for_each_scanned_leaf_0x2_entry(regs, ptr, entry) {
+ *		switch (entry->c_type) {
+ *			...
+ *		}
+ *	}
+ */
+#define for_each_scanned_leaf_0x2_entry(regs, __ptr, entry)					\
+	for (({ static_assert(sizeof(*regs) == sizeof(union leaf_0x2_regs)); }),		\
+	     __ptr = &((union leaf_0x2_regs *)(regs))->desc[1];					\
+	     __ptr < &((union leaf_0x2_regs *)(regs))->desc[16] && (entry = &cpuid_0x2_table[*__ptr]);\
+	     __ptr++)
+
 #endif /* _ASM_X86_CPUID_LEAF_0x2_API_H */
-- 
2.49.0

