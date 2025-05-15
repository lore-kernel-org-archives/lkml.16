Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B92F29B23D
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747340512; cv=none; b=d/G/O8TifIfv3md7VFgxspvKklJOCbJ6Zc5NTFNkBGG6z7XgZzyUTcAq9x47++1zCzvgF8/fz8V3haOT232ZvJ0ak0Uq39GCVKQzEf+8QYgIbIGP/QWf9UiU+ir6z3c3lYjOPEJXCCcvKfPhagJh1M5WvmZV+cbaj67Q+IxYbU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747340512; c=relaxed/simple;
	bh=wUjjHir9umYBfWcexces7fjBYJ2cljh8IHV5teLVlBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqnwx4yQ1ljx1NG7oeQogpWsfxH2lPGU/WaiGKa3Aa+WRlpkB1XkoMlJ+GXzs9AFdMCxgrU7BN2dHwEWASfs9GpmL1nQ/QUSBU4wCB49ytfz2ZKrTJWE4B+DlBYxdUaEGtcsW1OEnQ1M5ZHXV02whgkYHdoDg1MD5AHYwBBwzGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vXMntWkX; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DKDqw928; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vXMntWkX";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DKDqw928"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747340508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gI+qgdHH/JNK7szxkvKUfIqBaaHnasCVQthfpsDd22E=;
	b=vXMntWkXHSNkqIpjSGV4h70t5Zm6J+BkhOg8iLA6BNZea8akHp51yH55rb5AuM+Jy6usKA
	DYKc7GfpzE3XHJzA29G29zX43K15R01HcDIsqGIlPXnzVAvl4NKpOW56Z0+wf+sH12UlUO
	iW3mkMy4DlNCyi5xaZw1OuSoFmUEVJtlK0m/dC+4chxTdqpZio4JXYydRl0ohO94gRDnyu
	ajtT0B54hDGIkdW0eN0ld+iWsIkoKzJIcBL+XZy005kFI3nKz2MMjRlJ3MgPiPu1w5YOK5
	zCtzYzyvtiinXdAW8pi+SydTOY7AuNduK6Du1uQXEoAv86GpqTKNVU24AY1EhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747340508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gI+qgdHH/JNK7szxkvKUfIqBaaHnasCVQthfpsDd22E=;
	b=DKDqw928cHNjETjJU23HtPCCUqLi0oqZd1hA78Tb+jO0/fHHUgf1r2Cr6of2zEOSO5ABP5
	2BefXbQ4ycugUlDw==
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
Subject: [PATCH v2 1/2] x86/cpuid: Fix CPUID(0x2) iterator kernel-doc
Date: Thu, 15 May 2025 22:21:41 +0200
Message-ID: <20250515202143.34448-2-darwi@linutronix.de>
In-Reply-To: <20250515202143.34448-1-darwi@linutronix.de>
References: <20250515202143.34448-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CPUID(0x2) cache/TLB descriptors iterator has been recently changed
from:

    for_each_leaf_0x2_entry(regs, __ptr, entry)

to:

    for_each_cpuid_0x2_desc(_regs, _ptr, _desc)

but the attached kernel-doc was not fully adapted.  Fix it.

Fixes: c4c9ea879c3b ("x86/cpuid: Rename cpuid_get_leaf_0x2_regs() to cpuid_leaf_0x2()")
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/include/asm/cpuid/api.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
index bf97f9770789..ccf20c62b89f 100644
--- a/arch/x86/include/asm/cpuid/api.h
+++ b/arch/x86/include/asm/cpuid/api.h
@@ -252,15 +252,15 @@ static inline void cpuid_leaf_0x2(union leaf_0x2_regs *regs)
 
 /**
  * for_each_cpuid_0x2_desc() - Iterator for parsed CPUID(0x2) descriptors
- * @regs:   CPUID(0x2) register output, as returned by cpuid_leaf_0x2()
- * @__ptr:  u8 pointer, for macro internal use only
- * @desc:   Pointer to parsed CPUID(0x2) descriptor at each iteration
+ * @_regs:	CPUID(0x2) register output, as returned by cpuid_leaf_0x2()
+ * @_ptr:	u8 pointer, for macro internal use only
+ * @_desc:	Pointer to the parsed CPUID(0x2) descriptor at each iteration
  *
  * Loop over the 1-byte descriptors in the passed CPUID(0x2) output registers
- * @regs.  Provide the parsed information for each descriptor through @desc.
+ * @_regs.  Provide the parsed information for each descriptor through @_desc.
  *
- * To handle cache-specific descriptors, switch on @entry->c_type.  For TLB
- * descriptors, switch on @entry->t_type.
+ * To handle cache-specific descriptors, switch on @_desc->c_type.  For TLB
+ * descriptors, switch on @_desc->t_type.
  *
  * Example usage for cache descriptors::
  *
-- 
2.49.0

