Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75F92E92D9
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771713; cv=none; b=pAGvJithJqouzNKb94/NAdZJHuJXZ2BmnaN0wPXrd12JVjJ7hNjdPX5nSaBnCr73ZQG3vnFrS9LiO5KNxyVYihdVTk5bUCso8uabrpwrPngXvlg0pR8KuDaGoGDtNpDVlR+ofBszY+flPMibNvEYAzXuKjwCSe4zZ5T6XMrHHvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771713; c=relaxed/simple;
	bh=lSnfTGNvCCHUD1g3OuwoLvAwB3bAKJBfyXYmqNb6quc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETJcF+mIQmI+z3IvdeqztrzlHidKNXFXMLBruI7/jAfTb2QYGtpl+LIoIRxNnmStiqJDXqzXynqn8i/NC5ipFOQhDqziPn/mehd+HLTSWDtY5fEbMyCIzU2lt/KUtOUGDAt50cMz6byvJ75gqRPK0DhqiN9bnnwXmEfEuwg5EjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pVY3m3cF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SMyO02Ks; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pVY3m3cF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SMyO02Ks"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CGXqbv3TKuxoI3faR1b+5Z5vqE19ecaVzTdKl1HhrNQ=;
	b=pVY3m3cFzWy0NkwFKjXWC2unM/Esw2Soz0SmrY+QXUJGP2Ga0ORTNLPJSrf8BYsF1lgswl
	qyAEOo4gjmmBKV7WgWNxeOXuKkB74x8fa86kYWYVdcAzHnwwDczkrshTpBa1OpvCro9MxI
	pl2PPd0dwHfeIzVTfiryny/aFUnBRn2BRUCJdVxKu5CTOiRa/ShSN/2KKfQWBJ2q/bZqqr
	ncwrf2GsgqFqAp//k4hMpJN+sNTWExBb2M7EJw3j/TVUQx06gw94YvccZmlVWSP2wRv0Tk
	oRwgUkqX+bTMf3sgZywu3GYQut8Gr/iyWDQjLVyjvPmiW4BkrRKt7/72uA1MMw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CGXqbv3TKuxoI3faR1b+5Z5vqE19ecaVzTdKl1HhrNQ=;
	b=SMyO02KsTHAX/bM0XB1TCVyNRTLXYd0DFXfDHKEDxo1qEtbqT3jxhH5dZr7ZrYPSMPqI8v
	7DTnHwWdI+v/tjCA==
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
Subject: [PATCH v3 27/44] x86/cpu: Use parsed CPUID(0x1)
Date: Fri, 13 Jun 2025 01:39:53 +0200
Message-ID: <20250612234010.572636-28-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x1) access, instead of a direct CPUID query, at early
boot CPU detection code.

Beside the centralization benefits of the new CPUID model APIs, this
allows using the auto-generated <cpuid/leaf_types.h> leaf data types and
their full C99 bitfields instead of performing ugly bitwise operations on
CPUID register output.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index b3408ae2b144..023613698b15 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -896,6 +896,7 @@ void get_cpu_vendor(struct cpuinfo_x86 *c)
 void cpu_detect(struct cpuinfo_x86 *c)
 {
 	const struct leaf_0x0_0 *l0 = cpuid_leaf(c, 0x0);
+	const struct leaf_0x1_0 *l1 = cpuid_leaf(c, 0x1);
 
 	c->cpuid_level = l0->max_std_leaf;
 	*(u32 *)&c->x86_vendor_id[0] = l0->cpu_vendorid_0;
@@ -903,17 +904,14 @@ void cpu_detect(struct cpuinfo_x86 *c)
 	*(u32 *)&c->x86_vendor_id[8] = l0->cpu_vendorid_2;
 
 	c->x86 = 4;
-	/* Intel-defined flags: level 0x00000001 */
-	if (c->cpuid_level >= 0x00000001) {
-		u32 junk, tfms, cap0, misc;
 
-		cpuid(0x00000001, &tfms, &misc, &junk, &cap0);
-		c->x86		= x86_family(tfms);
-		c->x86_model	= x86_model(tfms);
-		c->x86_stepping	= x86_stepping(tfms);
+	if (l1) {
+		c->x86		= cpuid_family(l1);
+		c->x86_model	= cpuid_model(l1);
+		c->x86_stepping	= l1->stepping;
 
-		if (cap0 & (1<<19)) {
-			c->x86_clflush_size = ((misc >> 8) & 0xff) * 8;
+		if (l1->clflush) {
+			c->x86_clflush_size = l1->clflush_size * 8;
 			c->x86_cache_alignment = c->x86_clflush_size;
 		}
 	}
-- 
2.49.0

