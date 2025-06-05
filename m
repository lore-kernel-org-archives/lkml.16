Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B9C280A4D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151503; cv=none; b=Y+CCD0KUAzhisx6dVJ43FpBzjrV/3c4rcP7gshJMfpzfPMxQVEkXyV4Ap0KcSkBHXwuMxmdIMgguqm1BODzLFIiZB7w8gjVt95iSMcA6y7ehPmxGSt1BZ/Bv9dO7DZxruk0cqRC/+bghx1uwqiGC+sxV2TWEqcIvQSQwF8ZkS2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151503; c=relaxed/simple;
	bh=Q6VUb++4XOTCTCjcxAP97gZhJFg//ThEY0Q6wlCmFQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htR9q6+GDzSqIomr1gb8UU5lRtZw0DME3b3Erne0kkQZT8P+8dxwyKbrIkfa2CJIgyZypryWMcppphHJJkv/HdNBqpaV0A/zP64GKw2IvDBpKoqFIcj5NIVpRdxzWLEFVUv73p5qIct6+dOCVi9W1uN/AzntSfz+pZIsWB80C9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mKjQ8WSp; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wyIRlaRO; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mKjQ8WSp";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wyIRlaRO"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rmtXB3vSta6fGqJCXxmMRAj9XLGXz6rgjPfCqdr78qY=;
	b=mKjQ8WSpkZemTMgGl+7sFxkplPjeD3kDN5lMzp4R0n/KxaPslykdvCMRnu6YU28wT6ilif
	fZ9WPJAJAG89+lclnDuo1tvmilTEi8Wipn7ikUCYTsF+HFk6ZkNw70KyzEVHoQLlKYUT1r
	6tyo6MQ9cuGzbfWi0qXntAYxouXUS4MtbJG4XoKAUhfluVhWVDJI0tH6dG+rEnk1+WpP9e
	Ej6StNIvsF7Ggry02eX5c6JO/eJ30p20GrWO9vBrUpAHoDlk7LgdcOWcb5x8wqlxVK2OHV
	64LJqfnZIylE1AtxjExLYCiJ7mH32H9XWgNyKnr6kIbGIbpIszedO0n1kYnpbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rmtXB3vSta6fGqJCXxmMRAj9XLGXz6rgjPfCqdr78qY=;
	b=wyIRlaRO7MYNRZUfAKSdLDCVcyTw3QOuEx97Xwl6cxF0FSFqIIf+47iPrDadORCb1rlLPo
	vvwyb4If3VCXNHAw==
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
Subject: [PATCH v2 16/27] x86/cacheinfo: Use parsed CPUID(0x2)
Date: Thu,  5 Jun 2025 21:23:45 +0200
Message-ID: <20250605192356.82250-17-darwi@linutronix.de>
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
 arch/x86/kernel/cpu/cacheinfo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index adfa7e8bb865..39cd6db4f702 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -382,14 +382,14 @@ static void intel_cacheinfo_0x2(struct cpuinfo_x86 *c)
 {
 	unsigned int l1i = 0, l1d = 0, l2 = 0, l3 = 0;
 	const struct leaf_0x2_table *desc;
-	union leaf_0x2_regs regs;
+	struct cpuid_regs *regs;
 	u8 *ptr;
 
-	if (c->cpuid_level < 2)
+	regs = cpuid_leaf_regs(c, 0x2);
+	if (!regs)
 		return;
 
-	cpuid_leaf_0x2(&regs);
-	for_each_cpuid_0x2_desc(regs, ptr, desc) {
+	for_each_parsed_cpuid_0x2_desc(regs, ptr, desc) {
 		switch (desc->c_type) {
 		case CACHE_L1_INST:	l1i += desc->c_size; break;
 		case CACHE_L1_DATA:	l1d += desc->c_size; break;
-- 
2.49.0

