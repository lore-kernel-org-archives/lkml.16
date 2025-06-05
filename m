Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1CD280312
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151496; cv=none; b=I3OHljSxuYcJy533dSvl5PUXxKh7zzMv2a6cekR0JSIc+W0jAfPVqBXvmOnxR9tsz8GSsxRNZGA5kA0KPUOQ+5bYMwDlR7lrPhhVMv6fqF9j7JtK2cVLU71PszyLB3IXFY6j5C5M/hOzGoO9aiZ77PuereRpRaBmo/JtaRlytZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151496; c=relaxed/simple;
	bh=bU9EYIqMXE1W6N++OSgjszY1XEyu/gdXCb/IYPfu2ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zas470Js1CIVY8b7cAnqJTil+UJkdsd8nqW2qiVOwD9APbVTkkpik3A7fmILr+JA0pRRO3pB4ybKLGuPFwHGsoC/DwGaGRcO4ck7rM4mj4xGPqbGy9D1Iq+d2b0lWQykSSSEq87sq1LB8gNdyMPSmbauw3aGDU/0LH5rRML08QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=F4+KBO1m; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=I776+h7b; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="F4+KBO1m";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="I776+h7b"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ach8PGqE+vUBqcIRU5YJpA7PFcKh+hh6xzW1+cmwIL0=;
	b=F4+KBO1mFsXEZ5XReJZdFoR6Rp5f5o2VruWsu4mv/vicA+wN08liqaGBeR5xVwu1M/dSUx
	wWCigaKPFVFslLuE7x86GWzZGHn3D15ma27bCAj+GYW/wBKO0Pg6wFFYYZTvzM96bWT42H
	u9FLgD5fviBla/AkHbj77oF8VCbVfDAY0dNvJIr0mrbcGxXQ0OrXhqGMm4awl4UdXzOjsd
	TLDqw+NAJEgUFL09gpCDipmtV55fqIaIB+6PWgkIM62XQsi+CFtWlThF9+wtDG3E7M3bNI
	0JB8JXO8Mi7YTJz/23mv4MpbMVc2tFVxj/zw+wQTDtbpAhML+z8U0ONdCOZccQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ach8PGqE+vUBqcIRU5YJpA7PFcKh+hh6xzW1+cmwIL0=;
	b=I776+h7bSSDL1WgsvVoTnaQ6jiYkugDXUGf2PGyaJh5U7twdjOrRV0UHfwFHW3SUc09ETD
	bb6pZsLIMIM3qEBg==
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
Subject: [PATCH v2 14/27] x86/cpuid: Introduce parsed CPUID(0x2) API
Date: Thu,  5 Jun 2025 21:23:43 +0200
Message-ID: <20250605192356.82250-15-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
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
<asm/cpuid/api.h>.  That size comparison matches what other kernel
CPUID do; e.g. cpuid_leaf() and cpuid_leaf_reg() at <asm/cpuid/api.h>.

Note, put the size equivalence check inside a GNU statement expression,
({..}), so that it can be placed inside the macro's loop initialization.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index a0c84fbc8fcb..7ee6b4443333 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -281,6 +281,41 @@ static inline void cpuid_leaf_0x2(union leaf_0x2_regs *regs)
 	     _ptr < &(_regs).desc[16] && (_desc = &cpuid_0x2_table[*_ptr]);	\
 	     _ptr++)
 
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
  * CPUID(0x80000006) parsing:
  */
-- 
2.49.0

