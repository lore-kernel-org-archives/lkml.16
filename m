Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E8427FB03
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749151477; cv=none; b=FfrvXznLvIMa8jaZ8dRzwxV/GErJsEMmQpGbcbwdMijnxY+96qM1b0tLzwGYo622Oq2xhOZv6Gxmd3jZSXJMy3iWgiDubE83hXZKCx+KBrQ/YN6y58Tld8Uj1jyJ2Ws8O8OZvGswZNiJp61P4GBGMxgkcoSLHDugg1OFjJKoiuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749151477; c=relaxed/simple;
	bh=pO+IMBkT0Cz0KPmZgdkoQHtAYDwL7rAeaWkAl4ieH5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/K6kbSxx9pqXW2UbmHJ6oLRT6lqHDuMSBXtT3ZIoeDoY/VUauVOx5srcdukTrfdvT8As6H/qi9PbZkuFTuJJ4Ihs9PGvT1x7pN2n/Kwch+I7iIhq1R3mmbXL6ldebH7puonZZsBxrVcWp+c+Zassg24CDK9vUokOtrbGOghDGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZYpXVbVR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lfYlkrEF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZYpXVbVR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lfYlkrEF"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749151474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNGt1l4gf4CrsIJvTjbTMUyEMVYVm+r7Tudxfo9S6Lk=;
	b=ZYpXVbVRAgvwFXSfLkpXLX35UQhA6S5p7Ry8f3TophiPL+0py/LTJNnI8tGnwky4cv9m8f
	9BivS5PeXg+9lLIsuhJLOMGhOWCgs0qRzJQRbic3N6i6Rus/ZZTZzZJH5W73C2WYQ8oSkL
	4EatS/Is0LcRYU0bPUWsS1SEnRCQ5ZYUH391OHvtiR1tPKwfGnJVRxuMimTQabiu2tc3of
	V+tnFhhvKaUZRivRVxDJkng08JksG8lH5/dZrxkrCx4ybuM3gbPlCx58mpr/0ywq7FvALg
	DTjk9y2aRzZoUJ8J0gjG6wnmi898S9JDP9v8H06lKhIRMpqoraYl7sJO7H0Lbw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749151474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNGt1l4gf4CrsIJvTjbTMUyEMVYVm+r7Tudxfo9S6Lk=;
	b=lfYlkrEFUfqAWyllgQUYNXUsdKFDwnf2uK4FV2UNhQC8zSWcC+sicB2mIeLw6cvSCxo6a6
	mbJUTtb2oWPvOcCQ==
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
Subject: [PATCH v2 08/27] x86/cpu: Use parsed CPUID(0x0)
Date: Thu,  5 Jun 2025 21:23:37 +0200
Message-ID: <20250605192356.82250-9-darwi@linutronix.de>
In-Reply-To: <20250605192356.82250-1-darwi@linutronix.de>
References: <20250605192356.82250-1-darwi@linutronix.de>
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

