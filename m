Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044682E3395
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771653; cv=none; b=tJpGAEL4YTsPhsD2PqRaayQR2XcuR1zlzBMDe2Zqk2QoZtKpagbEm5VpAXExse7LsuGdtF4eE5L9zZL+ZmQBcIgtMac+Sny5eiaHQgfkIrKELf4SEcU/NgNe7JuN/qjkt2OpUFFgO4rWjXBw3a52UA5d7yBUquywPdXs/W4xfKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771653; c=relaxed/simple;
	bh=urbfpYJB7BRJdqVutwFNMY3nz2cVZo87E4j1bkM4ZEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nfDqZJzJGFMeKDjvbTGIa7SrCyGOj2kaE2/mhO0Pj6+fr+Oo4G7yyBChu6/eZsjJgeppZD2ESkMFg7kUVtMIvTRkPqKkldzlEEwJzmRc+MWua+gKgz7eSM4YUM86RxX0gVchXnFshTWq4frvLREaxOg2sewVhol3Alt5wWVAi9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2L5iwY8G; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CZECyNr8; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2L5iwY8G";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CZECyNr8"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MUGg50fnGzlgiN5hug/Z9cYMqVZSaR5sj8t00daGjms=;
	b=2L5iwY8G8T5fhY7ezZtYML5EgHr8jPDCnUR86ZSLr7zO6r07c5NxQxrQLCyW4S67aYob7D
	pCPIaJilq6annn8rqxATllTkY0d2QXftBX0dhKh540CjqwCYzwpyn+vl9rvDMirjlHeWIJ
	+Ej+knHIqdHFrFKUQ7k6oJ2jgrrSO/RGa0FrDisida5cUOTUe7eZb1xC7MyHeZBDTRMfZP
	Qvh28xyGox5l0Pc+VHyO9rVRI/PWEtabQ2mn14vDPUpHiJ9BULcFLjlWRv2K+iDyXkr+mB
	VJSNq8fDWC/o9r0ZqnF34j49WGAb4xq+FFEVFCfIB1hydC4Abng0yUv7gCq5nQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MUGg50fnGzlgiN5hug/Z9cYMqVZSaR5sj8t00daGjms=;
	b=CZECyNr8zBboQrslHSEFXZHY9St8WXnsreLrYZZmovR97kiO0rzqcEoytANI8/KfOLcYMq
	2IAJpC5/x4CXQODg==
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
Subject: [PATCH v3 09/44] x86/perf/zhaoxin: Reorder headers alphabetically
Date: Fri, 13 Jun 2025 01:39:35 +0200
Message-ID: <20250612234010.572636-10-darwi@linutronix.de>
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
 arch/x86/events/zhaoxin/core.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/events/zhaoxin/core.c b/arch/x86/events/zhaoxin/core.c
index 4bdfcf091200..d59992364880 100644
--- a/arch/x86/events/zhaoxin/core.c
+++ b/arch/x86/events/zhaoxin/core.c
@@ -5,16 +5,16 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/stddef.h>
-#include <linux/types.h>
-#include <linux/init.h>
-#include <linux/slab.h>
 #include <linux/export.h>
+#include <linux/init.h>
 #include <linux/nmi.h>
+#include <linux/slab.h>
+#include <linux/stddef.h>
+#include <linux/types.h>
 
+#include <asm/apic.h>
 #include <asm/cpufeature.h>
 #include <asm/hardirq.h>
-#include <asm/apic.h>
 #include <asm/msr.h>
 
 #include "../perf_event.h"
@@ -616,4 +616,3 @@ __init int zhaoxin_pmu_init(void)
 
 	return 0;
 }
-
-- 
2.49.0

