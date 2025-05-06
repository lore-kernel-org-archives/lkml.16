Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483C22550C1
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507920; cv=none; b=A2o7TnVcYcHoQTj8ATgukTFTjxZvRimj7yOR13ib16K+dWqH61fgurqlIzWdj5NdmJ9FH/ZQaUrwRUs+wiCzNdu6HQReArYlKYFjTQCnARJwqFJN5zoGDIFI0YvFHBsoSorGOOB6cij4WtQ+u74RPxSFmsRL/dYW4zvOsnZ695U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507920; c=relaxed/simple;
	bh=8ql8529khmmZGOpRcmqECHUjGX1UQnvjxo3pavVKocY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TLsJEhv1Tn4CeiV/Xfz/PqSd1mh/lM4w3As3mgjd1+omEXM8me0X4d7gZ/vuk4Vb/I43MW0Td/fyDOWIaKH4zYNljap1pmlEPQswmBiuUsK3PViczze5ub9dwOPHx6HKUgkebM2vlZQKFw5XL19SuIRgQBQropCTvRFmO0yLOvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=068Pbysa; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lLHykMP0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="068Pbysa";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lLHykMP0"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2kzbKmpHIm5COqa4o1fTefEQ8fXLVvcoJc99ZmhFW4=;
	b=068PbysaU/t3ScfjGK8cxy/pETDcVVuwk5ff8VdWXsvfNh9G54GODoCNXT2K90WcqrlWrs
	07CgB19naoIziJFOEiyUp260paLgOB6a7Lo0FBQfMNqnMjIYCqjoa2lUcGcOOtaR9+Dh30
	kyz+4WN42qRg9rsb9abBfl9v6ckuCJbSa+My6F6IZLnOfdt2H1dLYJ1zd1vjRciR+YiM7y
	DjO1SLbGCNVs6XNATvW7C70Jtdy6nWap0AAXgSVKy1waVTzMnuWTOFhaJ6NJSDqKQPWMF8
	Qx6JWwXQHpkn4Tl6oPOFKlbGcAO829FxEZdxwikt1bo9iMlhdPttOxTYDSbIZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X2kzbKmpHIm5COqa4o1fTefEQ8fXLVvcoJc99ZmhFW4=;
	b=lLHykMP0T6KIxEwKrKiBB6eYwKD4M8rGEaN/GjvcycuiS29yA2xsx/V7qrSfeXwGqOzd/l
	OekUjDhAUaXoFADg==
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
Subject: [PATCH v1 10/26] x86/cpu: Use scanned CPUID(0x80000001)
Date: Tue,  6 May 2025 07:04:21 +0200
Message-ID: <20250506050437.10264-11-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use scanned CPUID(0x80000001) access instead of a direct CPUID query.

The affected code has the check:

	(eax & 0xffff0000) == 0x80000000

to protect against 32-bit CPUs that lack extended CPUID support.  A
similar check is already done at the CPUID(0x80000001) scanner read
function at cpuid_scanner.c:

	/*
	 * Protect against 32-bit CPUs lacking extended CPUID support: Max
	 * extended CPUID leaf must be in the 0x80000001-0x8000ffff range.
	 */
	if ((el0->max_ext_leaf & 0xffff0000) != 0x80000000) {
		// Handle error
	}

Thus, just check that the scanned CPUID macro:

	cpudata_cpuid(c, 0x80000000)

does not return NULL, thus providing a sanity check similar to the
original code.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 16086725d722..59ddf6b074f2 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -971,6 +971,7 @@ static void init_speculation_control(struct cpuinfo_x86 *c)
 
 void get_cpu_cap(struct cpuinfo_x86 *c)
 {
+	const struct leaf_0x80000000_0 *el0;
 	u32 eax, ebx, ecx, edx;
 
 	/* Intel-defined flags: level 0x00000001 */
@@ -1006,12 +1007,8 @@ void get_cpu_cap(struct cpuinfo_x86 *c)
 		c->x86_capability[CPUID_D_1_EAX] = eax;
 	}
 
-	/*
-	 * Check if extended CPUID leaves are implemented: Max extended
-	 * CPUID leaf must be in the 0x80000001-0x8000ffff range.
-	 */
-	eax = cpuid_eax(0x80000000);
-	c->extended_cpuid_level = ((eax & 0xffff0000) == 0x80000000) ? eax : 0;
+	el0 = cpudata_cpuid(c, 0x80000000);
+	c->extended_cpuid_level = (el0) ? el0->max_ext_leaf : 0;
 
 	if (c->extended_cpuid_level >= 0x80000001) {
 		cpuid(0x80000001, &eax, &ebx, &ecx, &edx);
-- 
2.49.0

