Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C086B2E337E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771703; cv=none; b=n48/L8/N3qan2smn/MAo9jr/GqCl+KdigdNKoA6r4Y70L5hPeDkv66jBi4F0M9vDa28Ld0aDBS/ss6RAKld62XS1vQ7H+LhdT2grlFJVSSCU33vo/wlvn6CDrziwgIksRdj2694ayVXR962GjApgUpurKCaoCWonQ3rYTObKq3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771703; c=relaxed/simple;
	bh=pO+IMBkT0Cz0KPmZgdkoQHtAYDwL7rAeaWkAl4ieH5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fnmQab7yAcFuPcaooxcE+GLn3fhsWayrWAoYfL9UsmT0po8GKcxnetsixWjlSZtfim9vhuDINkLus/2FFt+7xlDnLdHWK6viMzcjCrhtOovvdDS/FEknjZAdIK3Lit7w3NXvHGK0eobiCQdMUmpLMy/aWkrLnyzer1J19dTNNzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=phY6lihw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JCsY/C3x; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="phY6lihw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JCsY/C3x"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNGt1l4gf4CrsIJvTjbTMUyEMVYVm+r7Tudxfo9S6Lk=;
	b=phY6lihwwFp+9WXl0Y1Hms8Pzfh/uendugdoR5ApAwOJ7GhHy2fxQLPxO4cMszOOIwUpR3
	s9bLgieHMdlqKINEzOcwD7/5/hEsL6dgyKhcNPSHLxlhKw88B6kiwO8K0IvEjvplrZoMqe
	nv56S9q9uH05ETOBAEJxF6LAZ7dyHCvP0+DESSNme1ZIx9i5bHjq/jslDuosLImsRAkU7F
	/IqUR4KMIEI7r5M9vm6Fr1eta1sMDzcGdPjmeBGmmh/tI92lIaZrXeNcxrxaQVNK7rwSRi
	tAuSac6k9gNLuI3f3dDr442nZn1iDPsZcgkIzt0fs4Pubnf+IMxTlfhxZcu06A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNGt1l4gf4CrsIJvTjbTMUyEMVYVm+r7Tudxfo9S6Lk=;
	b=JCsY/C3xs/yX5L9mlVXjSJCY2elFsTMH2w20zy973qNOAZyEFAPPZwH5p22QTIUe7anP5L
	F1fWf3y8VA6PsHBg==
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
Subject: [PATCH v3 24/44] x86/cpu: Use parsed CPUID(0x0)
Date: Fri, 13 Jun 2025 01:39:50 +0200
Message-ID: <20250612234010.572636-25-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x0) access instead of a direct CPUID query.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 8aa3ba269c0b..234d0f5de39e 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -895,11 +895,12 @@ void get_cpu_vendor(struct cpuinfo_x86 *c)
 
 void cpu_detect(struct cpuinfo_x86 *c)
 {
-	/* Get vendor name */
-	cpuid(0x00000000, (unsigned int *)&c->cpuid_level,
-	      (unsigned int *)&c->x86_vendor_id[0],
-	      (unsigned int *)&c->x86_vendor_id[8],
-	      (unsigned int *)&c->x86_vendor_id[4]);
+	const struct leaf_0x0_0 *l0 = cpuid_leaf(c, 0x0);
+
+	c->cpuid_level = l0->max_std_leaf;
+	*(u32 *)&c->x86_vendor_id[0] = l0->cpu_vendorid_0;
+	*(u32 *)&c->x86_vendor_id[4] = l0->cpu_vendorid_1;
+	*(u32 *)&c->x86_vendor_id[8] = l0->cpu_vendorid_2;
 
 	c->x86 = 4;
 	/* Intel-defined flags: level 0x00000001 */
-- 
2.49.0

