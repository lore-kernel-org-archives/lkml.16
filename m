Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1541280334
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151500; cv=none; b=JN/H0xVtxb94sgE6ubvvQWt0r64h4vz+N4oG/94+uKFRi9E3nQpWA/z16nJriSNxsw1t/Wrqok4v8NeWVVeMIBuy5GKAPmQ2Rdj6gcIymth3Qm+MaEhvCLspJl4fjIqf2rxwD43J9pzL9IOQE3uspm4pyhZ7tpL3IKA8Dic2TnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151500; c=relaxed/simple;
	bh=qNz1iLYzXxbN2lk1k0TKlGVeCiAHYj+yH8k72e66X/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjNcnmyvJ5HcrMGNYP+WKar5LyLcpqLOokduBJhVs17PH4/kXl5IHTza0QuC4bQjfFevODmrxnLCUMwegWDByD/q95fLoBtX2CQGW52W/j52J91SUPP7g1+CUVxcyMj4Sdta7e3PUcdudMnIktbSKefWh9uWpUs26eQs/ezVgG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hWPHLiE5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GdMI1Qft; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hWPHLiE5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GdMI1Qft"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTVNlPfPuV0WuhPUD2xW99Y6GJi+2sofUiXVRrozsf0=;
	b=hWPHLiE5aTA9b2q5YpZdAmC4pCEBXP5YpOwa+2iRJdWQ7b5ggDyyw2W+GmxFTfnY/Hy3yP
	qDTgJK8Xk4NKWi7YpptBLL3x0uLoVyqtW4fcH53yO+7USL6JRuO1WuAfZEJkgUKEBuJiFU
	Snc+Vpp0/G8iZEBNppouQlT5HUcXqh1im8sR9E8+/jCcQAhtJUDMwnI6u04DEDhuPv4V1f
	ItEKb7VOql+NK1UjynpPknXpuajK9DKqKEcKc3PTY3bbVkbBJAvTsizQKyMqTfj5O4nkBK
	2h8tdwLk18Vtn8TxulupG7y+o5unvLysCtClMeH7Yz0PgwFtedfjWUuon1UZZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTVNlPfPuV0WuhPUD2xW99Y6GJi+2sofUiXVRrozsf0=;
	b=GdMI1QftpTTXVG8VQXcNvuhan8hycTIPilYXCini8lRBhmsq/gWteNGWlb712b7Qp/qWc6
	SsqS+o5+NFZtlYDg==
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
Subject: [PATCH v2 15/27] x86/cpu: Use parsed CPUID(0x2)
Date: Thu,  5 Jun 2025 21:23:44 +0200
Message-ID: <20250605192356.82250-16-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
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

