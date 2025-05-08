Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E7C27AC5A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716584; cv=none; b=tf1CZhR5Nsga4q+ddjregn+avJsgBgr+21eL4R18YWwS8XLTTAxOL0+l+9Ik2l4zT6XmVon/nrA6WCVkEoLeChwgjKxgQqe4h15UlQ5R6b++40Z/II3W+bdBNsaDUJOuKBA6D9YB6chlbG9+BP9Y0mrvisKWKgntaCH1a/7IW2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716584; c=relaxed/simple;
	bh=9AHgtL8RG7TPRu1Y6JSuPxMQpmSKTLNx3uaNOw+XK10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QRCeZdpGvsueyjmbbyhLnpX4O8mrsIav2n6Pmm6x8pFyzel6ZV0J6Vh9wDfKH9aTctxSHBKdbi3S7lJA9uc7O3HAlJhuTrI1qlxoXm3zLMghGQ5rs5E202LxgRFPP88EpP3LhRatiOhc3ICvYkwjWpyEKf09RQqduJ/2JaOQOeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WgC8lVG6; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cg8vMZze; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WgC8lVG6";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cg8vMZze"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746716581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FUL2DAK8gKuKEKvr1aqZE5KSLVlq28mMPWFiSzNt1C0=;
	b=WgC8lVG6VTC+ya1mpS+OxvcHnLhfSutLvAUYDCT+RnyrV1cHz6kiQcXRM/vFdWi370/SoU
	6GHK//zDSIXJiGX1BXQNNoaBMuY8Yr9Ffq798ysXxlrb5VHSa2ltUd3yH46kNx0q8dA6mt
	cq96gsAfMxZ+Jy5uHXfZPtrxhx89IL0zRmpx+sF48TizTLiIiIZeLwLv00M+oS/MwJIjNi
	8IRQnai2RONsG6qNjK6H+bUj+L5TuOK/xX2762CZfUyvun14KQNTIipf89kW12tMaflQbs
	0HRzU/k+APTwlMr42JPr8J1DIFk8kzF9B+jecNs0fikD0qneOcX0cWkz9ZIEog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746716581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FUL2DAK8gKuKEKvr1aqZE5KSLVlq28mMPWFiSzNt1C0=;
	b=cg8vMZzekLDr6A/n5CoNGTLIRKvXBtG5uDf+BUR30SCo+CyQgGyWRMyZKrJScB5+iK1j4B
	7UmgG+aSf006kwDg==
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
Subject: [PATCH v1 7/9] x86/cpu: Rename CPUID(0x2) descriptors iterator parameter
Date: Thu,  8 May 2025 17:02:36 +0200
Message-ID: <20250508150240.172915-8-darwi@linutronix.de>
In-Reply-To: <20250508150240.172915-1-darwi@linutronix.de>
References: <20250508150240.172915-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CPUID(0x2) descriptors iterator has been renamed from:

    for_each_leaf_0x2_entry()

to:

    for_each_cpuid_0x2_desc()

since it iterates over CPUID(0x2) cache and TLB "descriptors", not
"entries".

In the macro's x86/cpu call-site, rename the parameter denoting the
parsed descriptor at each iteration from 'entry' to 'desc'.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/intel.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index d4efca7e4bd6..cfcf9b3d270f 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -648,11 +648,11 @@ static unsigned int intel_size_cache(struct cpuinfo_x86 *c, unsigned int size)
 }
 #endif
 
-static void intel_tlb_lookup(const struct leaf_0x2_table *entry)
+static void intel_tlb_lookup(const struct leaf_0x2_table *desc)
 {
-	short entries = entry->entries;
+	short entries = desc->entries;
 
-	switch (entry->t_type) {
+	switch (desc->t_type) {
 	case STLB_4K:
 		tlb_lli_4k = max(tlb_lli_4k, entries);
 		tlb_lld_4k = max(tlb_lld_4k, entries);
@@ -709,7 +709,7 @@ static void intel_tlb_lookup(const struct leaf_0x2_table *entry)
 
 static void intel_detect_tlb(struct cpuinfo_x86 *c)
 {
-	const struct leaf_0x2_table *entry;
+	const struct leaf_0x2_table *desc;
 	union leaf_0x2_regs regs;
 	u8 *ptr;
 
@@ -717,8 +717,8 @@ static void intel_detect_tlb(struct cpuinfo_x86 *c)
 		return;
 
 	cpuid_leaf_0x2(&regs);
-	for_each_cpuid_0x2_desc(regs, ptr, entry)
-		intel_tlb_lookup(entry);
+	for_each_cpuid_0x2_desc(regs, ptr, desc)
+		intel_tlb_lookup(desc);
 }
 
 static const struct cpu_dev intel_cpu_dev = {
-- 
2.49.0

