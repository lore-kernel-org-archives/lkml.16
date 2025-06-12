Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CFB2E7623
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771674; cv=none; b=RZBiC3B6tCaiWcRVZg6TxnMtNvEMYTlgzdYdicLEgGaEW+fH3grW+Hf7Stu5lNyKlmvxW/H6qDhifAHzqQOGqlhajWiUaxrcH+Awt81y5p5ealeKbdaxigj/crqci3KPi/j+1T5POdyGF1iUCEIzT+y7d4bPxpMt4MJWce9Fd1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771674; c=relaxed/simple;
	bh=GS/O6l7q82cHAdK1ICSA7cmyeoYsObESi8FWvEj/9FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y3kaXnxrLT/cysSf09ntcAyP0lq/H6ad0A9+r4jFqHjU26jusJzIC9dkoyGcygcv8VACY0G9sSZMLrJNzVV9yzOX2J0HJ9Ylj+vr/M9ILD1FZYUikNri9Ik3uaT3IQ/dVrfeXb3HvaR8oiPT1pMMitb6wItxJCz+zLxc6G4ewns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OUAQIXMz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9cDoyULx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OUAQIXMz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9cDoyULx"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zt4WCz732vUfMxV2b2intBgT1aJnCmDcR2DgO+Zn+Po=;
	b=OUAQIXMzDk/JZedOI3k7F3xsWkH1ZTNJErRu4MiW7I9q2wGo/XEWTTsBAw0C+nM8URqdbU
	xb7ULi+VmHrvoDmNxDKAU0OZLZh7G5eeLHYkE53sULuVKtzpRuoytK9loudX8jlyIFKeRv
	SRTe/Vuuio13AJh194fEzGyOGbkif73m76DgN35REj7gTg/JDc5Mod7QiNP1rEBANjyX0m
	lx1zEVoQgQNgkBGm0whB6vuD14uN0cl3Jt/L07r+l/GMzLeBDo3jD6gRU9qG+Xe9kTa/mA
	zzNNIQgxK067Gd1phjK0dV57FfNBv0y6oJwHJKy3lehirlibQQn7Z9Pi89D4Qw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zt4WCz732vUfMxV2b2intBgT1aJnCmDcR2DgO+Zn+Po=;
	b=9cDoyULxyLVtvCNh6X3andpxOwb9jo4Em4l76GHUTJmRqbXfh0AaA5FILJe8JtxmeQLCM4
	7KeFBy3E8McR91Aw==
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
Subject: [PATCH v3 15/44] perf/x86/amd/uncore: Reorder headers alphabetically
Date: Fri, 13 Jun 2025 01:39:41 +0200
Message-ID: <20250612234010.572636-16-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The source file uses cpuid_*() macros, but it does not include
<asm/cpuid/api.h>.  Sort its include lines so that the CPUID header can
be included next.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/events/amd/uncore.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/events/amd/uncore.c b/arch/x86/events/amd/uncore.c
index e8b6af199c73..c1483ef16c0b 100644
--- a/arch/x86/events/amd/uncore.c
+++ b/arch/x86/events/amd/uncore.c
@@ -5,18 +5,18 @@
  * Author: Jacob Shin <jacob.shin@amd.com>
  */
 
-#include <linux/perf_event.h>
-#include <linux/percpu.h>
-#include <linux/types.h>
-#include <linux/slab.h>
-#include <linux/init.h>
 #include <linux/cpu.h>
-#include <linux/cpumask.h>
 #include <linux/cpufeature.h>
+#include <linux/cpumask.h>
+#include <linux/init.h>
+#include <linux/percpu.h>
+#include <linux/perf_event.h>
+#include <linux/slab.h>
 #include <linux/smp.h>
+#include <linux/types.h>
 
-#include <asm/perf_event.h>
 #include <asm/msr.h>
+#include <asm/perf_event.h>
 
 #define NUM_COUNTERS_NB		4
 #define NUM_COUNTERS_L2		4
-- 
2.49.0

