Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3264227A93D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716581; cv=none; b=r1yj+GT58Cxtze2SjXlPe8/PxnEsWUoyQz0UM2ZV/rotUNGri19qVMbz2+RPINddk0bzmT7wL09RJypxVPw/g5jHYScYOVO0MD9TV9e7nQbZeQSL1INosWNRzRJ8RozVN49Iz3mA/duWsJlHxuGcGIDcXSZbc1T4zaCvur+qd8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716581; c=relaxed/simple;
	bh=GzgoW8PqrF03rDB8xf2iF8PrYFL/CLMquTZ3aRxEwmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T7n/11NLuOWot+FWYZrNNIvZf+07EcGKeJthfThmmWPFN35B6ErTAW3WoN//dSt1iRfOMdiTAnLHKtvsSTQTzZdKQV1gtFhkQeoVP2yq8FOvLms4eRfH3CwpVPf39KQZkkCT1Kc3xdXH9Z/8bEbjRWMKVwObQ/0UlWgRJpLvZtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VYa2QzvQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HYw4GLgd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VYa2QzvQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HYw4GLgd"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746716578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rIHYuqP2jcIcSJGbBNU4Ojy+4pvtfK9eyLBqFfQA2Bg=;
	b=VYa2QzvQkTdPHyAEfpRUYs7aESmt2ZdpxxpmoVrBPbh2vw8J1ZRWUWDG90pwMbrnBXvq5C
	ZH9G+dvcol+DE/UFtM7BD5bXjrbcJFJzHiSbEF75l0DebuaaN1054rWo5i8lPLspFppb//
	dK9MOPurU6jAaR8Kcn04kQ6/YvkSaST+4WGzmKTpaL9p6MNba4eoylHOjqAere42fMQprC
	V6kzAqldBr1OMq10Blmpy15cK8f7i3EEIiNjKgbHaNOygoZbM7VQQU1FQn2avqS2ZBVInT
	mPFM9LyqzplrxDgE9aMHiDSaIi857Ck/HBPKXDSn6MDijJu5sD+K2L9cbd53fA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746716578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rIHYuqP2jcIcSJGbBNU4Ojy+4pvtfK9eyLBqFfQA2Bg=;
	b=HYw4GLgddtjzPGPJM7c0pUc0D66cIB4yBla4xYr4ryP4HZFO/gmTBpPNruzacwDeiYLr2o
	2mgwTVAat49+5LCw==
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
Subject: [PATCH v1 6/9] x86/cacheinfo: Rename CPUID(0x2) descriptors iterator parameter
Date: Thu,  8 May 2025 17:02:35 +0200
Message-ID: <20250508150240.172915-7-darwi@linutronix.de>
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

In the macro's x86/cacheinfo call-site, rename the parameter denoting the
parsed descriptor at each iteration from 'entry' to 'desc'.

Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index b6349c1792dd..adfa7e8bb865 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -381,7 +381,7 @@ static void intel_cacheinfo_done(struct cpuinfo_x86 *c, unsigned int l3,
 static void intel_cacheinfo_0x2(struct cpuinfo_x86 *c)
 {
 	unsigned int l1i = 0, l1d = 0, l2 = 0, l3 = 0;
-	const struct leaf_0x2_table *entry;
+	const struct leaf_0x2_table *desc;
 	union leaf_0x2_regs regs;
 	u8 *ptr;
 
@@ -389,12 +389,12 @@ static void intel_cacheinfo_0x2(struct cpuinfo_x86 *c)
 		return;
 
 	cpuid_leaf_0x2(&regs);
-	for_each_cpuid_0x2_desc(regs, ptr, entry) {
-		switch (entry->c_type) {
-		case CACHE_L1_INST:	l1i += entry->c_size; break;
-		case CACHE_L1_DATA:	l1d += entry->c_size; break;
-		case CACHE_L2:		l2  += entry->c_size; break;
-		case CACHE_L3:		l3  += entry->c_size; break;
+	for_each_cpuid_0x2_desc(regs, ptr, desc) {
+		switch (desc->c_type) {
+		case CACHE_L1_INST:	l1i += desc->c_size; break;
+		case CACHE_L1_DATA:	l1d += desc->c_size; break;
+		case CACHE_L2:		l2  += desc->c_size; break;
+		case CACHE_L3:		l3  += desc->c_size; break;
 		}
 	}
 
-- 
2.49.0

