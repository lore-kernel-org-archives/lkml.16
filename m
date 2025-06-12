Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCD12EA498
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771722; cv=none; b=DrNrGHdMzy0R+gXo3flesG6GiGJJ4xPp91ju5ffeCsEyQalL5aPtNcEpQzFqjpe0460fS69QQsLtMXY5g0jhmczJ1TcVNUnaemVzAvQPh5JZM+W2Ot6AuWttaKoNpzDNfiuqDDUC4YbxqIPDm6vIueHYG4j9PPMlIwe1ZWhIQTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771722; c=relaxed/simple;
	bh=qNz1iLYzXxbN2lk1k0TKlGVeCiAHYj+yH8k72e66X/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RB0wCwvd+QC4xwSo6hCupatGsMAbDB5nTyP4yfb0adXaWvCUBz1NR9bQ+FtltF5xsD4lu0ozU/EQgQMa/6dOQZOBWdGhYgloQM19LmVMU8Xt81x/xnFoLdDfQD0vUKPd2gr45kmePQXu6qm+nSn9nkrUow3oodqFxhmeafR/Bqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uDAi4PiU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2CzMqAPx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uDAi4PiU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2CzMqAPx"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTVNlPfPuV0WuhPUD2xW99Y6GJi+2sofUiXVRrozsf0=;
	b=uDAi4PiUJwh31SppfJCjbdL6H92a+lVXSOefzpyReeJR8lIYLfVEVO7Ce389rgS0/iDiJe
	5RrcYjjmNEOHRvhejVQOqx5YvJYuW1N1kgZVWVIe2i5ORtILRuPDEzZBWw/+TbzD10jv33
	PacYmUCHVJAkPXZsVfZHRgmOwGBW5ck3KNb5wt1mq0do/nYkpfuWNY67OMuQdfl2BLWhpY
	53Z3U4i7Uv/uw8zWxWVDor8v4x4zDNPJyfLkKwDTG3jyZPyKJPUQT5Xg88nOG34FcSPMh6
	X4y0cKYuqyTdtowRXhauVPJAkSO805ODH9vd22C1BwbKH4q1YLEoCqsqX4Wgzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTVNlPfPuV0WuhPUD2xW99Y6GJi+2sofUiXVRrozsf0=;
	b=2CzMqAPx5lnzVm+6mpTkEptOMYI94D4qKmYx3YBfAOucCamvupmdRS8RGaiB3vNUsaA4XG
	YBjb6HmuUKxkSJCQ==
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
Subject: [PATCH v3 30/44] x86/cpu: Use parsed CPUID(0x2)
Date: Fri, 13 Jun 2025 01:39:56 +0200
Message-ID: <20250612234010.572636-31-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x2) access instead of direct CPUID queries.

Remove the max standard CPUID level check since the NULL check of
cpuid_leaf_regs()'s result is equivalent.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/intel.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 076eaa41b8c8..5eab9135b144 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -710,14 +710,14 @@ static void intel_tlb_lookup(const struct leaf_0x2_table *desc)
 static void intel_detect_tlb(struct cpuinfo_x86 *c)
 {
 	const struct leaf_0x2_table *desc;
-	union leaf_0x2_regs regs;
+	struct cpuid_regs *regs;
 	u8 *ptr;
 
-	if (c->cpuid_level < 2)
+	regs = cpuid_leaf_regs(c, 0x2);
+	if (!regs)
 		return;
 
-	cpuid_leaf_0x2(&regs);
-	for_each_cpuid_0x2_desc(regs, ptr, desc)
+	for_each_parsed_cpuid_0x2_desc(regs, ptr, desc)
 		intel_tlb_lookup(desc);
 }
 
-- 
2.49.0

