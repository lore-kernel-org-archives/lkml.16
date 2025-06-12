Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741452EBDFF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771756; cv=none; b=q6TErFTgePGZmnp2AaQaPeLYQFnO+FZLH5chRiYXNN0bdxE8zUpSV4NY6L6MZi1mKyDM6gjhPKClPaIoPb8AIwx7LBhUCDoEBgw2QdjH5JqFsrR/EYAytcF6xFeEn2wnq7HPRrnrkytomFUBzeSOjkzZZmc2OdEc+rZbZXCVzm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771756; c=relaxed/simple;
	bh=MgMz0yYc3aNrLivaiDnkV7wvYq4izEq26RKCDhQOEwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g90cU2QxfYI341WwegQy9VKhKaS1pI602xt+lR9gM1GMfyca3pMjI0WTq2+c4JH3rum/ULoAWm6bUhis+gI8rOy4C6/bfRifMQprT4fFJGzp5rhTSVEmqBmg6uE6G/l++hIZK5otHrCNQ3heXatVLYUSP/jbwyUfWVITIiNAwqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KtPoPzgb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NTe/386f; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KtPoPzgb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NTe/386f"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Vhf1GwgXj/r4oy29qh5M4jDcvHAYWmgXdBqd4lDq2c=;
	b=KtPoPzgb8TP780uZ0shDsVnpKm8ye5OQlXCXAq7upKDoKM5gyCUmFaBOntZ2j45xrTT2A6
	PdpmrjjLXD4oDthFKl+0wX4RRlyZS3NEyCh/AP05T5jMv/nmIxN8YbFpMsWo7HDOFbBCAr
	mWpcDS88xQyRzq48gKVpU3I6Q7vUeOweF+k9qGfx50uNd7lvfuNvqCGdgFOaFWbv7BB0pC
	XQW4OsRrM6uoVkYqKFu5+BAgWZqLO7DkvetwxV0kQCyI+9xVklGCu61vCZ4HeWUIsl+iY+
	eEURxldsrfd69HB9qewRrm6nDvpiaSEFeLQdrT1WbmyOcEvt4VDpijQLHTJB7A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Vhf1GwgXj/r4oy29qh5M4jDcvHAYWmgXdBqd4lDq2c=;
	b=NTe/386f8LN+3tSi0oLhCWGrUrbKCWKwv8OxbJFfzcdbqttBgSmUBIHJ48Jb2fuPrasxEU
	/fyNlYHaBCEjIWDg==
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
Subject: [PATCH v3 40/44] x86/amd_nb: Trickle down 'struct cpuinfo_x86' reference
Date: Fri, 13 Jun 2025 01:40:06 +0200
Message-ID: <20250612234010.572636-41-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare cpuid_amd_hygon_has_l3_cache(), which is internally a
CPUID(0x80000006) call site, for using the parsed CPUID API instead of
invoking direct CPUID queries.

Since such an API requires a 'struct cpuinfo_x86' reference, trickle it
down from the start of the amd_nb initcall.

Note, accessing the CPUID tables at initcall_5 using this_cpu_ptr()
should be safe, since the 'struct cpuinfo_x86' per-CPU presentation is
finalized at arch/x86/kernel/cpu/common.c :: arch_cpu_finalize_init().
Meanwhile, at kernel init/main.c, do_initcalls() are done much later.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/amd_nb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index c1acead6227a..a8809778b208 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -16,6 +16,7 @@
 
 #include <asm/amd/nb.h>
 #include <asm/cpuid/api.h>
+#include <asm/processor.h>
 
 static u32 *flush_words;
 
@@ -58,7 +59,7 @@ struct amd_northbridge *node_to_amd_nb(int node)
 }
 EXPORT_SYMBOL_GPL(node_to_amd_nb);
 
-static int amd_cache_northbridges(void)
+static int amd_cache_northbridges(struct cpuinfo_x86 *c)
 {
 	struct amd_northbridge *nb;
 	u16 i;
@@ -315,11 +316,13 @@ static __init void fix_erratum_688(void)
 
 static __init int init_amd_nbs(void)
 {
+	struct cpuinfo_x86 *c = this_cpu_ptr(&cpu_info);
+
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD &&
 	    boot_cpu_data.x86_vendor != X86_VENDOR_HYGON)
 		return 0;
 
-	amd_cache_northbridges();
+	amd_cache_northbridges(c);
 	amd_cache_gart();
 
 	fix_erratum_688();
-- 
2.49.0

