Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DAE27FB1C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151480; cv=none; b=TWOb/7Xq+zUYBuue2gysnBeJojfpCOYjLZpB2QxgUALejwUu6sIFdxbjArJPh9WjKv3fYGOhjgRFJP2O7JslHBn14g/qO+1/HkAVkeNcYzdRfw/AdI0S5DezKXspMExLbg0AjE+wWUMBd3/t0H2lyxTnxuJpVHLnFNpmXydEO2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151480; c=relaxed/simple;
	bh=tSAjyB89b4eytydfgx0gH4Tzjd8WBD196r5kl7VISI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eVCIalTcHbTFX16X6GN12iGdFG8Erd57Y8D6Y6BfY3GGwDLiDL84quYi2FsMB4TyE1pIkXXgOsG8fLvov1yrisq+nHw3mz7GnYvb2SzvWREhVPsAVcLtEJTRAN29PbUuvzXJsE4N6mdcTXP+ibjXYLk7J1DW90mJnpQTDsTeSIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J27tsaIB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dzNmRZw2; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J27tsaIB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dzNmRZw2"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e6Kht8ppdQQKav+Wh8kl9/36dTIAet5yNOEHs+YKI0U=;
	b=J27tsaIBnSVA6xoHIC7krYL3G0NuQknVqOQiNPAUid0k9UMooKhLuUoNgHCZYZKEZL9Iw1
	MhozRXOqfrkau7ajZP8Jl7Vhmg45qcmqRV0kMkNDVptNWY9CBjz7fvb5wFVTfzHyNAjXE4
	FZLywaldvAHB0n1n+aXCTwYpjW8JWsNcFBZI1bQufNKp31VgA2LVSMfXe3ONplLhtaogPk
	9+4ntY3pzaEtRyLyf2aNVLZ3IMZQrI0WnZr/z8v5uIiBDe7up1bnL8GllmSI0qUpE0MUTw
	ch5Bh7v690L6DZJ/e13DAUca/rMhUaE/qhs6PWkA1jcTR/1tZEiP8fQ5MaHa3w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e6Kht8ppdQQKav+Wh8kl9/36dTIAet5yNOEHs+YKI0U=;
	b=dzNmRZw21ecxUu76vnBWMsXrxIsSs+8N0pmy/DCxj32VfQgFt0YjO5+mwUY+SZ5ofZ4cUQ
	KGxvuqigBnljBnAA==
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
Subject: [PATCH v2 09/27] x86/cpu: Use parsed CPUID(0x80000001)
Date: Thu,  5 Jun 2025 21:23:38 +0200
Message-ID: <20250605192356.82250-10-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x80000001) access instead of a direct CPUID query.

The affected code has the check:

	(eax & 0xffff0000) == 0x80000000

to protect against 32-bit CPUs that lack extended CPUID support.  A
similar check is already done at the CPUID(0x80000001) scanner read
function at cpuid_parser.c:

	/*
	 * Protect against 32-bit CPUs lacking extended CPUID support: Max
	 * extended CPUID leaf must be in the 0x80000001-0x8000ffff range.
	 */
	if ((el0->max_ext_leaf & 0xffff0000) != 0x80000000) {
		// Handle error
	}

Thus, just check that the parsed CPUID macro:

	cpuid_leaf(c, 0x80000000)

does not return NULL, thus providing a sanity check similar to the
original code.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 234d0f5de39e..b3408ae2b144 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -972,6 +972,7 @@ static void init_speculation_control(struct cpuinfo_x86 *c)
 
 void get_cpu_cap(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x80000000_0 *el0;
 	u32 eax, ebx, ecx, edx;
 
 	/* Intel-defined flags: level 0x00000001 */
@@ -1007,12 +1008,8 @@ void get_cpu_cap(struct cpuinfo_x86 *c)
 		c->x86_capability[CPUID_D_1_EAX] = eax;
 	}
 
-	/*
-	 * Check if extended CPUID leaves are implemented: Max extended
-	 * CPUID leaf must be in the 0x80000001-0x8000ffff range.
-	 */
-	eax = cpuid_eax(0x80000000);
-	c->extended_cpuid_level = ((eax & 0xffff0000) == 0x80000000) ? eax : 0;
+	el0 = cpuid_leaf(c, 0x80000000);
+	c->extended_cpuid_level = (el0) ? el0->max_ext_leaf : 0;
 
 	if (c->extended_cpuid_level >= 0x80000001) {
 		cpuid(0x80000001, &eax, &ebx, &ecx, &edx);
-- 
2.49.0

