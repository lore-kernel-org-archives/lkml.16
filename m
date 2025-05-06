Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F1027CCC9
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507935; cv=none; b=EnprklnFVJPJa4xTjxYyyOUzjzkbV0yXp5AJbajVG1mD2fzicE/VFPxuP4NyaJrbj//bINDWQgvvU3SLomBkHMfhMsm0HzlKiq04h8unHtHEnpeT1dM8C2QYjpwvWq6WNXI404rcgPgbkmAKr9X2e8rm1bjCXXudM25h78EopBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507935; c=relaxed/simple;
	bh=sACZGtGKwnorJcWfQ9Im/15JY/EywX/6HE+DwVKfJi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qwY0kVGcRbsZtEPnQDiEeFx+BttQp0fCmzAa1v7cuZVIOH6P+YQAmr9EQQQM1ZU41hEQZKjVqtlNUDhSt7o2EGtpaCbEET1IfJKvGaH6khZeptOIQ1dBpgogMJa7hXl1aCI3wSnZdJTScvGRiWzblSPilUWHOFApgkW7zDmnWMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=od6Jbgjq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qEnwB3Xd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="od6Jbgjq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qEnwB3Xd"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746507932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7ae9pw/uCasqPZv0rurqmDANNmRejCfDVqjK5oM3ag=;
	b=od6JbgjqLuhLSTS96I3R45eqGdB8VDSnADYOob0PifTm6uWESO/RSl1bvBeGMuvMIH3BQ3
	kCEUOxw6KBdAAI+9l9x2KLs6OtgbBQMdTskKPo95au6NVUBPSs/AeJjagzL3T6T+pO7uRI
	Hum6mZHLPfWN5MUG0FivmXMMuqssqAps1sos4X+9riA3R0RZequAOH3St/GirNAWUx6fJY
	ozAvpCVMxk/6ZAY62edAx7kH44hw+6PJUf1ldvjC/OiInm2GaWz5hyh9cKRAGLdenDVaV6
	6BFZ+b2b/ECGPgKj2SJfVxZ8Zr+TURjdT81GHYGv4YnFYixABE3BOmZf1rrgpg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746507932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7ae9pw/uCasqPZv0rurqmDANNmRejCfDVqjK5oM3ag=;
	b=qEnwB3XdNHTRrNNV5BarQFrcZIjVVuGjs3zNK0GygNqG47GHPgMlIvHVM/rBRB9usM5sM8
	HM0QdjRV2eVHV6AA==
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
Subject: [PATCH v1 15/26] x86/cpu: Use scanned CPUID(0x2)
Date: Tue,  6 May 2025 07:04:26 +0200
Message-ID: <20250506050437.10264-16-darwi@linutronix.de>
In-Reply-To: <20250506050437.10264-1-darwi@linutronix.de>
References: <20250506050437.10264-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use scanned CPUID(0x2) access instead of direct CPUID queries.

Remove the max standard CPUID level check since the NULL check of
cpudata_cpuid_regs()'s result is equivalent.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/intel.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index a6493f60b3f2..24b506a28ce8 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -710,14 +710,14 @@ static void intel_tlb_lookup(const struct leaf_0x2_table *entry)
 static void intel_detect_tlb(struct cpuinfo_x86 *c)
 {
 	const struct leaf_0x2_table *entry;
-	union leaf_0x2_regs regs;
+	struct cpuid_regs *regs;
 	u8 *ptr;
 
-	if (c->cpuid_level < 2)
+	regs = cpudata_cpuid_regs(c, 0x2);
+	if (!regs)
 		return;
 
-	cpuid_get_leaf_0x2_regs(&regs);
-	for_each_leaf_0x2_entry(regs, ptr, entry)
+	for_each_scanned_leaf_0x2_entry(regs, ptr, entry)
 		intel_tlb_lookup(entry);
 }
 
-- 
2.49.0

