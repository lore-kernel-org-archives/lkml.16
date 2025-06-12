Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE902E92B1
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771706; cv=none; b=iNvQREpzbmOouIfWKtv04qWORJMObpxTI2+eBAF/eJ+NotnQ0EzznfZhENr1hs+NYwh9SE8Fagcq5IGtsQ8wcCR7Grr003Kc/H3GcsLNh5SiHJcMsu9GcDUfFHHl4UxdYZ5dt7sNR9kfI2qtebJiH9iviOJfjrnCbrOa2TMbZTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771706; c=relaxed/simple;
	bh=GxUUBUz9xnjBH1SiZKleVg0aLiELrmJZFMUrgj2GWPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KTHxOhec00PnZcUZbq72afZMEm/ZlUHUCqibnVP5Se8xb23ilmloxEEOHMVTD07qZayqC+jlYCLPZNl3dGivEPrpwK6ZjRgq5eLsTqWGM+lEQkx2Sx0IPqaZM9Ow8TRBn3dvuBhwrRZA4/TWFo5bYEFEmA03q374hQp2TkSRW9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MlOvnSgN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u2torbeN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MlOvnSgN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u2torbeN"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFv6MLNTZNByU7fUhT79iIPGJmtLlz5VVmjMAqBlUqY=;
	b=MlOvnSgNClgBOpU4INaO9kJE+eNWiUZgV8aiMUQ8K4hvskjavmOznNI2eRZyoLAGcDz46G
	F7DwSayBm9j6YgIadA/s2amzbX2cFmhY0IlS3UmNwijOOv2ch13mD9ItUou/68KryhdhZS
	P2sspvLU8DVytRlrxGFKgUd33Pqxc9OPvoEw4LP2K6+SCSKCxS07qteOSzw6uf4l9pcq+I
	4dew/tcxguTNMiKYJLPd/1lX6rfrbt72gQ7EittAmBcR3mgFdrWDlgdLmd439xgl13bCka
	tYHNhuyFlGwqprd10tzI8m0VZNEglL83l7p0l5JdlNZcPSvopDHJl+kzlfWlOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFv6MLNTZNByU7fUhT79iIPGJmtLlz5VVmjMAqBlUqY=;
	b=u2torbeNu31LIwNV8bozio+4xtv75vLtL0OuQ7n+B+E65WD5wTIbn1/MAxCM/1lX5qLwmd
	03fGr9ogBMS1/HCw==
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
Subject: [PATCH v3 25/44] x86/cpu: Use parsed CPUID(0x80000000)
Date: Fri, 13 Jun 2025 01:39:51 +0200
Message-ID: <20250612234010.572636-26-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x80000000) access instead of a direct CPUID query.

The affected code has the check:

	(eax & 0xffff0000) == 0x80000000

to protect against Intel 32-bit CPUs that lack extended CPUID support.  A
similar check is already done at the CPUID(0x80000000) scanner read
function at cpuid_parser.c:

	/*
	 * Protect against 32-bit CPUs lacking extended CPUID support: Max
	 * extended CPUID leaf must be in the 0x80000001-0x8000ffff range.
	 */
	if ((l->max_ext_leaf & 0xffff0000) != 0x80000000) {
		// Handle error
	}

Thus, just check that the parsed CPUID macro:

	cpuid_leaf(c, 0x80000000)

does not return NULL, thus providing a sanity check similar to the
original code.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 234d0f5de39e..b3408ae2b144 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -972,6 +972,7 @@ static void init_speculation_control(struct cpuinfo_x86 *c)
 
 void get_cpu_cap(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x80000000_0 *el0;
 	u32 eax, ebx, ecx, edx;
 
 	/* Intel-defined flags: level 0x00000001 */
@@ -1007,12 +1008,8 @@ void get_cpu_cap(struct cpuinfo_x86 *c)
 		c->x86_capability[CPUID_D_1_EAX] = eax;
 	}
 
-	/*
-	 * Check if extended CPUID leaves are implemented: Max extended
-	 * CPUID leaf must be in the 0x80000001-0x8000ffff range.
-	 */
-	eax = cpuid_eax(0x80000000);
-	c->extended_cpuid_level = ((eax & 0xffff0000) == 0x80000000) ? eax : 0;
+	el0 = cpuid_leaf(c, 0x80000000);
+	c->extended_cpuid_level = (el0) ? el0->max_ext_leaf : 0;
 
 	if (c->extended_cpuid_level >= 0x80000001) {
 		cpuid(0x80000001, &eax, &ebx, &ecx, &edx);
-- 
2.49.0

