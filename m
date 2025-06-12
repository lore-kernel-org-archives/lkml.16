Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC012EA47F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771719; cv=none; b=CpCxLIMgis3Twey0ovjIa/vsuBLIT7RpNgZdnrmqtY2E2LRU5uYDNHCl9v0WKyRPqmU6cPOa6DjWn/OtMZDQAp57uqP7cUT6CyupiEDZIjt/0Qalx1InOYwFmd2yIWTsLLiiIgagJqvYFBHY9x+WekwjDg2T28g7nPvP4wpvN2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771719; c=relaxed/simple;
	bh=XnIAh2DBgis63hKFk2UK5e7z6J0ZuL4OXW2F7KTTBu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xw1WO5syp1iTynzjOxD0RHb9AbFc+mHxH6y2xlmbg30yBrAnexU/i52r999m+UrkZFVhDBmbndPXfA2QmpFnic8ReIXyUQRh6pCQAkmcOGccJcyO87RjEq6cqA40oiTCjD4w4s3g5BnTgzIRPA5W4jmBpQPNFELYvhi1q+eRagE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=07Tn3zcY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wfzeSLos; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="07Tn3zcY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wfzeSLos"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqtlKNOMLvwsPQYHA55+cYkA8khdSW+f11FE0sVNEcc=;
	b=07Tn3zcY0rDMZPA2QdCR8/wKcXvKFogNmHwoiUnhQksHaowI2MX2P2UjQbBzogNQFyK3wD
	/9JfQl2QTF60AFlRCxB8qo9aoU5eH24eabDvHIA9f8Fx52YILqEucWGieGJLjHKotNE245
	fSp/bEoW5duO24dRr2ts+nV3Z5YNbwbluQQdEEYVBGbJasZN7DM7YGj1MtKZt7LRhOtdN0
	pGd3MYTCsTxx6uBI1IwIvpfwrQq0cUprUIkL6SV9rOZS7+Y2ghrbLUg7vmY+qzxwyhPqLG
	iuRe6VjDgiF/sMImJ5rmzCIOoAp2ucOF03u1GlH5RQ+WgB24FmyE4JnjOzMBuQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqtlKNOMLvwsPQYHA55+cYkA8khdSW+f11FE0sVNEcc=;
	b=wfzeSLosbZFW1ohZmqfyKIxxGaM134rt0cwwGRYv92SkFWESFUFbahaieBHywPaGO2Xml4
	ls93jjoipnVAqGBw==
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
Subject: [PATCH v3 29/44] x86/cpuid: Introduce parsed CPUID(0x2) API
Date: Fri, 13 Jun 2025 01:39:55 +0200
Message-ID: <20250612234010.572636-30-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new iterator macro, for_each_parsed_cpuid_0x2_desc(), for
retrieving parsed CPUID(0x2) entries as 1-byte descriptors.

Unlike the existing for_each_cpuid_0x2_desc() macro, which operates on
directly retrieved CPUID data, the new one takes its input from the
centralized CPUID parser.  That is, it is expected to be used as:

    const struct leaf_0x2_table *desc;
    const struct cpuid_regs *regs;
    u8 *ptr;

    regs = cpuid_leaf_regs(c, 0x2);	// Parsed CPUID access
    for_each_parsed_cpuid_0x2_desc(regs, ptr, desc) {
        ...
    }

which should replace the older method:

    const struct leaf_0x2_table *desc;
    union leaf_0x2_regs regs;
    u8 *ptr;

    cpuid_leaf_0x2(&regs);		// Direct CPUID access
    for_each_leaf_0x2_desc(regs, ptr, desc) {
        ...
    }

In the new macro, assert that the passed 'regs' is the same size as a
'union leaf_0x2_regs'.  This is necessary since the macro internally
casts 'regs' to that union in order to iterate over the CPUID(0x2) output
as a 1-byte array.

A size equivalence assert is used, instead of a typeof() check, to give
callers the freedom to either pass a 'struct cpuid_regs' pointer or a
'struct leaf_0x2_0' pointer, both as returned by the parsed CPUID API at
<cpuid/api.h>.  That size comparison matches what other kernel CPUID APIs
do; e.g. cpuid_read() and cpuid_read_subleaf() at <cpuid/api.h>.

Note, put the size equivalence check inside a GNU statement expression,
({..}), so that it can be placed inside the macro's loop initialization.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h | 43 ++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index dbc954e21b7e..6a0e766de565 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -544,6 +544,49 @@ static inline bool cpuid_amd_hygon_has_l3_cache(void)
 	__cpuid_leaves_subleaf_info(&_cpuinfo->cpuid.leaves, _leaf, 0).nr_entries;\
 })
 
+/*
+ * Convenience leaf-specific functions (using parsed CPUID data):
+ */
+
+/*
+ * CPUID(0x2)
+ */
+
+/**
+ * for_each_parsed_cpuid_0x2_desc() - Iterator for parsed CPUID(0x2) descriptors
+ * @_regs:   Leaf 0x2 register output, as returned by cpuid_leaf_regs()
+ * @_ptr:  u8 pointer, for macro internal use only
+ * @_desc:  Pointer to parsed descriptor information at each iteration
+ *
+ * Loop over the 1-byte descriptors in the passed CPUID(0x2) output registers
+ * @_regs.  Provide the parsed information for each descriptor through @_desc.
+ *
+ * To handle cache-specific descriptors, switch on @_desc->c_type.  For TLB
+ * descriptors, switch on @_desc->t_type.
+ *
+ * Example usage for cache descriptors::
+ *
+ *	const struct leaf_0x2_table *desc;
+ *	struct cpuid_regs *regs;
+ *	u8 *ptr;
+ *
+ *	regs = cpuid_leaf_regs(c, 0x2);
+ *	if (!regs) {
+ *		// Handle error
+ *	}
+ *
+ *	for_each_parsed_cpuid_0x2_desc(regs, ptr, desc) {
+ *		switch (desc->c_type) {
+ *			...
+ *		}
+ *	}
+ */
+#define for_each_parsed_cpuid_0x2_desc(_regs, _ptr, _desc)				\
+	for (({ static_assert(sizeof(*_regs) == sizeof(union leaf_0x2_regs)); }),	\
+	     _ptr = &((union leaf_0x2_regs *)(_regs))->desc[1];				\
+	     _ptr < &((union leaf_0x2_regs *)(_regs))->desc[16] && (_desc = &cpuid_0x2_table[*_ptr]);\
+	     _ptr++)
+
 /*
  * CPUID parser exported APIs:
  */
-- 
2.49.0

