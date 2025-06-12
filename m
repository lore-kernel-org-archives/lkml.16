Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11232E62AC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771656; cv=none; b=KJ78wOwk4v0UtAax+WI5XO6fsUrVxmop5KeajsRhG3DKX+UYGGGmk1cmZngWRCTgVSLlBZtjW04BHrgKVMD0KATzBlZ0xYNLqM6u2uWtZVbqBGdlHb8Q7x824o11IO8dirryjVtIjLm6bo2FcMgRz7HAf1u15X/xQbEfqIStPlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771656; c=relaxed/simple;
	bh=zVtu24Jq3Y5Vh/O39OdbkmPJ+eq8b964V5huRoplZPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DExQm2NcHWaJZ5YmaydC0UF6MKT0zeqc3LqgO9q/FZJ5wKsrqnQ7DnjAqzjJMGX8s0JApVizMxHw4TGftOd+JNkek+tW+s8CXUkjGbqqy4bmKnEYE2FzSjLEjZ1YdDjLrmhPS5hx15MRHInmZRAFhDTbFgJROz8seLt/SfZ8NK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=frxW2cfh; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f0w2wKms; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="frxW2cfh";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f0w2wKms"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/OAQdEEwtyXyr3kBijxT+OF/3UlkaKXjT5VRLgiNcqc=;
	b=frxW2cfh0z8H2Eod/4qUbHhBYaj2zxgyrIRSoyUspF3lPBFgn/aPCCignodAczFM5r4Ybk
	l4ZDPf9hCoGTIiCwb6EtdhQUMTG/XI/BYQ+RtaPHPAos5MYeWQaUAqTJXhUqTRLf0r4QhX
	QPqkLc/rCcUmxallLy6WX6USFQRnnog+Cl/fPtGVz65qKXjT3daeAEOkrtktVZSFqxE76g
	HBYTTe+x+1P4TdWJo8mZ83aAl/N+q3a3pVhgo/xPcBWNTsossDEwr1q8NW5B7OtwyIxRPK
	f6n71oXPOvdahazAJWyILAxwNglUOsm+n8KvZxkhKI/goud86wiPVGHb0th0tQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/OAQdEEwtyXyr3kBijxT+OF/3UlkaKXjT5VRLgiNcqc=;
	b=f0w2wKmsbV0baw0bbz/umfkjNJKnXLgkN6N68UwTKZpx+K7PJoBSgkH5Fr74QMEHuVytlK
	6WyhS7T0nhXfL4Cw==
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
Subject: [PATCH v3 10/44] x86/resctrl: Reorder core.c headers alphabetically
Date: Fri, 13 Jun 2025 01:39:36 +0200
Message-ID: <20250612234010.572636-11-darwi@linutronix.de>
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
 arch/x86/kernel/cpu/resctrl/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 7109cbfcad4f..289e79154922 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -17,13 +17,14 @@
 #define pr_fmt(fmt)	"resctrl: " fmt
 
 #include <linux/cpu.h>
-#include <linux/slab.h>
-#include <linux/err.h>
 #include <linux/cpuhotplug.h>
+#include <linux/err.h>
+#include <linux/slab.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/msr.h>
 #include <asm/resctrl.h>
+
 #include "internal.h"
 
 /*
-- 
2.49.0

