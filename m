Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98562EACF6
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749771726; cv=none; b=u7DGtYq+emlMgqv7vCjvZGnBtdGL3MB2ZIrdsgXcZh8ungJBfCJvL4roainIiVxgpEU6iL20KjoHKkMl3xg6uh4PPB5sPeZPCezhXihheYnkY70UQtU7RzJuJ29Pp2VYRubS/L93ZTvgW5W+vk3GbIPLxam1TGv4j0Q+HVRmTiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749771726; c=relaxed/simple;
	bh=Q6VUb++4XOTCTCjcxAP97gZhJFg//ThEY0Q6wlCmFQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WbJUoEwNIqsqD+A9d1ThYmkoJBF8e/hsaRB0EOSrBWRytz804qWwXs2Wt4bDsBrb+i56yo6NRoTs4Lo98VB+spKHtMLpsYjkwxzfRqvjEycc8wyVKcytwV4/BTE4Pich+QKkJKQhQT4URotzi0Eqz7sKDvZVHEG7tVUW4rbSySM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hptZ5t+p; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=pbTxUH6l; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hptZ5t+p";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pbTxUH6l"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749771723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rmtXB3vSta6fGqJCXxmMRAj9XLGXz6rgjPfCqdr78qY=;
	b=hptZ5t+pYwCmnsssTs3kV5p+jZ0m5ydkuqMpHln+/4EOvcc/F5UXzudfZ6iYmzGw1SicCn
	q8MhfSVTKewVDHWAtQoQLKBmrixWrJJQ08ObCG+W0L+8w2c7sqFJg7Wp16aFivW/dD/PIV
	GsBhaq2EkWWkzI/WJM0kjHQVR6OgAdrwO1vxxc8NqJiNG8w6HaxjRCDQJsq/qDMaq3rZaw
	QdYvy3kA9i5A4MpPVNcMpwR6o1+Jcef46FL1/NUo3CC8LdeEiAtFvn1gCgeiJS195Fr3Y1
	kGay/LjhAos7/MFrPqRFchA2kb90KwBOSbfh+CpXp/Y8meLiwaafGSf85ogIkg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749771723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rmtXB3vSta6fGqJCXxmMRAj9XLGXz6rgjPfCqdr78qY=;
	b=pbTxUH6l/rkZHujxFSfFNjT0CG3mIE9+TTUGhkeFZuclR+mcPGmFtTKlvpqiHAsYw+mA+E
	pigsH4JcBepjNEAQ==
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
Subject: [PATCH v3 31/44] x86/cacheinfo: Use parsed CPUID(0x2)
Date: Fri, 13 Jun 2025 01:39:57 +0200
Message-ID: <20250612234010.572636-32-darwi@linutronix.de>
In-Reply-To: <20250612234010.572636-1-darwi@linutronix.de>
References: <20250612234010.572636-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use parsed CPUID(0x2) access instead of direct CPUID queries.

Remove the max standard CPUID level check since the NULL check of
cpuid_leaf_regs()'s result is equivalent.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index adfa7e8bb865..39cd6db4f702 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -382,14 +382,14 @@ static void intel_cacheinfo_0x2(struct cpuinfo_x86 *c)
 {
 	unsigned int l1i = 0, l1d = 0, l2 = 0, l3 = 0;
 	const struct leaf_0x2_table *desc;
-	union leaf_0x2_regs regs;
+	struct cpuid_regs *regs;
 	u8 *ptr;
 
-	if (c->cpuid_level < 2)
+	regs = cpuid_leaf_regs(c, 0x2);
+	if (!regs)
 		return;
 
-	cpuid_leaf_0x2(&regs);
-	for_each_cpuid_0x2_desc(regs, ptr, desc) {
+	for_each_parsed_cpuid_0x2_desc(regs, ptr, desc) {
 		switch (desc->c_type) {
 		case CACHE_L1_INST:	l1i += desc->c_size; break;
 		case CACHE_L1_DATA:	l1d += desc->c_size; break;
-- 
2.49.0

