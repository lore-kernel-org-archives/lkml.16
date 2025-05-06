Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0513D2505A9
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507918; cv=none; b=TwAeju07Wcpd5JmzYNlemKIWch3JxS7ciYVN5cA4G0FylJcGDOatrbi+rYWJsk9PfipUPi387IgCpNNyjzOkaSgzn1y+YgOSpPsGY2PE4a0m9OdTWkWBYwdLSBLJtBjU+kmAPPd9GPWYC1jNIkvViymatFWsYpA6DiUYze1txv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507918; c=relaxed/simple;
	bh=KBQp1wpILPWYNFvofg4p6frhnvPuYghDxbDA6Spkfk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8uCHTDQ9XxzYOc6RyXCid7umCVxcd4hGWkgHJWD7QYox/u6Ry7VixYIQr6jWJhM/hSk1utRy0nERYq9CL47e3TDzlbkN8Y3KMftkqveXmoaggNjcfPD6Py7sePh20uj4ilg9/0lyxlWvUSepfZvGP//rWEg8lGJq6ddRPyY1ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=rCZREXq2; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wBAb+RTs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="rCZREXq2";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wBAb+RTs"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSzOS8VcKf/DsunpWy73WrszzeNwsYvFZ0VCYH8k2IY=;
	b=rCZREXq2fICSdqLbGKKpGd1phlj8vC4WPnE7zmHsE2A7Q/wrtAbZfpUzBhTINh5rjgSI/j
	+SjR7lqcxSmZznMirHmEZ3OkiCyr/C/CHNFw3V8hBwdNbdolGTefRDdEVEkFKd9+n7t1xd
	2A64hql+W6StSCI7npnjL3VdgJnMZKwt4LTl/OGx1y6g4xNrW/VNsKxiZOjdlEgXfJc2e8
	I1t36sk2Zl+OeQ5gYqCJwcipk+/iArPVjTXxtRjrK3AdnJWqPY1OrVCz0I/AQ0ZmUwix7o
	snirVUskS92LMr59KUcEOwMoIKOKP52ikz5LxVum378KcUycmZu+N17K0oObMg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507915;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KSzOS8VcKf/DsunpWy73WrszzeNwsYvFZ0VCYH8k2IY=;
	b=wBAb+RTsspKaSE44Mu0WkFj1G58u7kvuRe9WfZkvnWdzGip4JWkesWB9KrvWv6UeqWCyyS
	d5OvaADYOOgaxqAg==
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
Subject: [PATCH v1 09/26] x86/cpu: Use scanned CPUID(0x0)
Date: Tue,  6 May 2025 07:04:20 +0200
Message-ID: <20250506050437.10264-10-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use scanned CPUID(0x0) access instead of a direct CPUID query.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/common.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index f1e28ffbffec..16086725d722 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -894,11 +894,12 @@ void get_cpu_vendor(struct cpuinfo_x86 *c)
 
 void cpu_detect(struct cpuinfo_x86 *c)
 {
-	/* Get vendor name */
-	cpuid(0x00000000, (unsigned int *)&c->cpuid_level,
-	      (unsigned int *)&c->x86_vendor_id[0],
-	      (unsigned int *)&c->x86_vendor_id[8],
-	      (unsigned int *)&c->x86_vendor_id[4]);
+	const struct leaf_0x0_0 *l0 = cpudata_cpuid(c, 0x0);
+
+	c->cpuid_level = l0->max_std_leaf;
+	*(u32 *)&c->x86_vendor_id[0] = l0->cpu_vendorid_0;
+	*(u32 *)&c->x86_vendor_id[4] = l0->cpu_vendorid_1;
+	*(u32 *)&c->x86_vendor_id[8] = l0->cpu_vendorid_2;
 
 	c->x86 = 4;
 	/* Intel-defined flags: level 0x00000001 */
-- 
2.49.0

