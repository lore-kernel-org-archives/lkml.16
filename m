Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01739242D85
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507897; cv=none; b=WLxAsuYAqJIu4gAV2R+aSvmdnxHLMQyrPXUAq8yfRiCnhwb7CjzPYroQt2QZiKYa93irWqfaHW7rXF30salyNWn9PKesKESYzD63bKRyeTK4e0mpjQQ32URyzqYyiSbCCRNYwjmxluuPFL4SewjWv7ncf456xMreD0mIICsL+0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507897; c=relaxed/simple;
	bh=5NdHW8XoKulPI2Cxom/ClWi42Xviuu1ciwa+udmpjNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJy987BLbS0GeAhkLEdWDVCNoDVOYG/VQpAVTe7ibyRWFeZdSTWfjpPmckhrMHCG9AjvIsIRedcOiYaQ90eAimmy1pNmayBO+THh0nuRWUNIP1A8UsLEC16tArnZy9b+LcyIbiapJDef0/6jkOzVJf+uDvaE2+lb1vBv76koBrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=biU9hkvj; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2NxcDM7H; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="biU9hkvj";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2NxcDM7H"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SQyv/NMZJnb0bKw4IPoUw2TLvZHnQXLQBXoGKnfd0aQ=;
	b=biU9hkvjXCklcFWPIpYU/F2lu2nat+xkQjgaPbJmcLqcYdw4LWJ/4gT+fWVXVoWGIvciyX
	FTChr32a7FV97zHaxLpoLBGb9TtY/APnI8W5nzfiRyX8j+49t8hXgDHs2v7jEOe3OWIy1f
	VPntOXYgm1foVJeOcb+JCadUxo8xt3+UouoWhi1VFfVwuGrDQozPbb+hLQ2RLjtUBqwU47
	XO4/1k58WsMIpl0c/zQFttU6JaZggL9ROj2xEziDTs4lgbhbBqfk4Fok3JfFYOFmWbrJt1
	3WXc+3azlydV4BXnbKWt2FP3AwE6JXoXo2mBpmt8Z3U+bAmes8HznuZKOwA3Uw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SQyv/NMZJnb0bKw4IPoUw2TLvZHnQXLQBXoGKnfd0aQ=;
	b=2NxcDM7HhVLD64HNa4a4VwNqbjESKCCHfZaiD2IyKjBAcCeYe4/yKOVaOiT+ilDXwZWFa5
	sF3cNV8ytK65kNBQ==
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
Subject: [PATCH v1 02/26] x86/cpu: Sanitize CPUID(0x80000000) output
Date: Tue,  6 May 2025 07:04:13 +0200
Message-ID: <20250506050437.10264-3-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CPUID(0x80000000).EAX returns the max extended CPUID leaf available.  On
x86-32 machines without an extended CPUID range, a CPUID(0x80000000)
query will just repeat the output of the last valid standard CPUID leaf
on the CPU; i.e., a garbage values.  Current x86/cpu code protects against
this by doing:

	eax = cpuid_eax(0x80000000);
	c->extended_cpuid_level = eax;

	if ((eax & 0xffff0000) == 0x80000000) {
		// CPU has an extended CPUID range. Check for 0x80000001
		if (eax >= 0x80000001) {
			cpuid(0x80000001, ...);
		}
	}

This is correct so far.  Afterwards though, the same possibly broken EAX
value is used to check the availability of other extended CPUID leaves:

	if (c->extended_cpuid_level >= 0x80000007)
		...
	if (c->extended_cpuid_level >= 0x80000008)
		...
	if (c->extended_cpuid_level >= 0x8000000a)
		...
	if (c->extended_cpuid_level >= 0x8000001f)
		...

which is invalid.  Fix this by immediately setting the CPU's max extended
CPUID leaf to zero if CPUID(0x80000000).EAX doesn't indicate a valid
CPUID extended range.

While at it, add a comment, similar to kernel/head_32.S, clarifying the
CPUID(0x80000000) sanity check.

Fixes: 3da99c977637 ("x86: make (early)_identify_cpu more the same between 32bit and 64 bit")
References: 8a50e5135af0 ("x86-32: Use symbolic constants, safer CPUID when enabling EFER.NX")
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Link: https://lore.kernel.org/r/d4fcfd91-cc92-4b3c-9dd2-56ecd754cecc@citrix.com
---
 arch/x86/kernel/cpu/common.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 4ada55f126ae..e5734df3b4a1 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1005,17 +1005,18 @@ void get_cpu_cap(struct cpuinfo_x86 *c)
 		c->x86_capability[CPUID_D_1_EAX] = eax;
 	}
 
-	/* AMD-defined flags: level 0x80000001 */
+	/*
+	 * Check if extended CPUID leaves are implemented: Max extended
+	 * CPUID leaf must be in the 0x80000001-0x8000ffff range.
+	 */
 	eax = cpuid_eax(0x80000000);
-	c->extended_cpuid_level = eax;
+	c->extended_cpuid_level = ((eax & 0xffff0000) == 0x80000000) ? eax : 0;
 
-	if ((eax & 0xffff0000) == 0x80000000) {
-		if (eax >= 0x80000001) {
-			cpuid(0x80000001, &eax, &ebx, &ecx, &edx);
+	if (c->extended_cpuid_level >= 0x80000001) {
+		cpuid(0x80000001, &eax, &ebx, &ecx, &edx);
 
-			c->x86_capability[CPUID_8000_0001_ECX] = ecx;
-			c->x86_capability[CPUID_8000_0001_EDX] = edx;
-		}
+		c->x86_capability[CPUID_8000_0001_ECX] = ecx;
+		c->x86_capability[CPUID_8000_0001_EDX] = edx;
 	}
 
 	if (c->extended_cpuid_level >= 0x80000007) {
-- 
2.49.0

