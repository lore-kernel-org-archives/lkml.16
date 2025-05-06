Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFF6272E52
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507926; cv=none; b=JshOtt26CHQ3ZRsOQPvF/wl/FswyBhLrrjItQSqrRZeKu5kIjTLOhom5UuQeRvZt3EXOyLlr+3w7FT2mQgt4DxNNpWryVZvCkB4rwl6pd1GDhl02MZropco2JcgolGNKftjYPfUMbPUU9fI6bovOWCSoodUVu26zX5mb9Iy/Tl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507926; c=relaxed/simple;
	bh=SndlGTyrCkoWPKCAePK4okQDqgfITJHhIAyRqPIoSOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uugGZbTu3wgn2PmCST4vMzJNXAbPmn/PXBodDp8/qqZX1bZaGzpYd7vY5l5xuuZOy1ccTtrCkHqnJ+p2tqnyFjkdb50JtBIAniM1PHowQw9sALrohkTi4n6iwQ3/jn5GBVXG0RyXDQD4LuiZu4t7KE13VVIaWI10j0e58PpkiKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=a1HoiGtb; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rhMKNlyw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="a1HoiGtb";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rhMKNlyw"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZTG5jIGIaf0sKkTzdxEHSIyZ2Z6c7IYM3Hc7JdohYI=;
	b=a1HoiGtbiHuIC8C01rQ5MkX8G0QW1wZXteAgUTifVPeETn0DJWAiZkkvM19EeWLrcanpxt
	re0ijdjfBuINDwAard4YAr/47uUxDPXOG0bjrAVg0iNzukpH+FtxFLmQX3Sy4cqNzXCYKL
	xR2rRWxQ6bdZfp+71fyoDctwlA6M1joqFkICWZz8kIsVbWIkV/Ah2e9CMkt3XhhoIru+83
	Z50DaTGuxaibco9DeLgNd2zKRfHzA9uDjN8c5OC1c/NRhGNE0/fMjn4cke/gJAOdHVeXGF
	3J+WpyvzMsSRWCcyh9S02zgUiVfQkaICHfTcbgF/yO1wW90tBcYmqL6TND6sdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZTG5jIGIaf0sKkTzdxEHSIyZ2Z6c7IYM3Hc7JdohYI=;
	b=rhMKNlywLzzlZLDuwVwqExKxDIoK9TqnTyzbu9F5T7Yj0QPcKC+2FOm6mpLDzgx1q5pjOk
	JIK4u0CbiB9wH7Dw==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v1 12/26] x86/cpu: Use scanned CPUID(0x1)
Date: Tue,  6 May 2025 07:04:23 +0200
Message-ID: <20250506050437.10264-13-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use scanned CPUID(0x1) access, instead of a direct CPUID query, at early
boot CPU detection code.

Beside the centralization benefits of the scanned CPUID API, this allows
using the auto-generated <cpuid/leaves.h> CPUID leaf data types and their
full C99 bitfields instead of performing ugly bitwise operations on CPUID
register output.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 59ddf6b074f2..a08340a5e6a5 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -895,6 +895,7 @@ void get_cpu_vendor(struct cpuinfo_x86 *c)
 void cpu_detect(struct cpuinfo_x86 *c)
 {
 	const struct leaf_0x0_0 *l0 = cpudata_cpuid(c, 0x0);
+	const struct leaf_0x1_0 *l1 = cpudata_cpuid(c, 0x1);
 
 	c->cpuid_level = l0->max_std_leaf;
 	*(u32 *)&c->x86_vendor_id[0] = l0->cpu_vendorid_0;
@@ -902,17 +903,14 @@ void cpu_detect(struct cpuinfo_x86 *c)
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

