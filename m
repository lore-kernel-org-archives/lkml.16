Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6236625DCE0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196082; cv=none; b=cvmrKGxF0tghdhkSRVhamnrlW4/efA4Ow884IYpCkeqex26PmQdRA8Gyj7gfeApv6t6kpN9ByBMKKq0mKE4Ql42q9egrFLoJyjXHZ/upE5nmbhssuepRiBkYous0NpLJEd1elttQ4g1p5NBPD0/Ts32O6qCazwFEk2yvEatpDss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196082; c=relaxed/simple;
	bh=WE+fR5R5Le2F26iYDkYuRg3MPTRSQ5mwY9M7TxWrkFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9HH+KghSL9eMAVNpf4J8d75P7EvVGDaji3xof+T5lieM3DPhq+qF+5HVPQNVUhFtEdYl2VJwpK6u8dDtJzvtfrgncMhPQxEaX3fqXMfGsJ4mem66GCBEXHpwoOaQxMHlQPjjNYE6OxUMWuGmFeCT84NmxWmI5g44m7mflLfGTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=s3CHB2NB; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=XWyD4lLR; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="s3CHB2NB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="XWyD4lLR"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744196079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XvJ+dWA6n4Y9zbDSWY3pwiECtlWOSXm6zw8uMdiQHXw=;
	b=s3CHB2NB/qNITMhs6Z62BubXqDLM/AGqImnPEBsJtPFSmy9aR/oQYnBRo4UxW1gy7a5CFd
	T8HPLxqJG0a0KprySNdUUdIwI2F2lB8Qn6Arzkp0SSehWUIqfPmWXdE5hpn1fFWOaFcGkK
	7LNe6Ssas5IWMTNJewjmrzV7hOOJsyG/uNGOrai7TaHlb2FA9THl0USQh3KgljYz5kYK07
	G/4B9WU0aD4u3mu0xaQ8g4uOMnPafzcWFmiR8Mb46iGcajDY3cTdW7bC1zXHaWOJvFkHdk
	dFxg4M5X2cX7l9AIC3Xyn1nsQhyDyc8n0Nv3dMLNV6uN0fZ40PGabW0HiWRX0Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744196079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XvJ+dWA6n4Y9zbDSWY3pwiECtlWOSXm6zw8uMdiQHXw=;
	b=XWyD4lLRS6fJOg4OqWntbuC/rIE+ovupR4y5DgcN1smAbLX0rifow4pxT650S9IJ7oV7iw
	+sRd8H66vR0unmBA==
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
Subject: [PATCH v1 1/2] x86/cacheinfo: Properly parse CPUID(0x80000005) L1d/L1i associativity
Date: Wed,  9 Apr 2025 12:54:24 +0200
Message-ID: <20250409105429.1048199-2-darwi@linutronix.de>
In-Reply-To: <20250409105429.1048199-1-darwi@linutronix.de>
References: <20250409105429.1048199-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the AMD CPUID(4) emulation cache info logic, the same associativity
mapping array, assocs[], is used for both CPUID(0x80000005) and
CPUID(0x80000006).

This is incorrect since per the AMD manuals, the mappings for
CPUID(0x80000005) L1d/L1i associativity is:

   n = 0x1 -> 0xfe	n
   n = 0xff		fully associative

while assocs[] maps these values to:

   n = 0x1, 0x2, 0x4	n
   n = 0x3, 0x7, 0x9	0
   n = 0x6		8
   n = 0x8		16
   n = 0xa		32
   n = 0xb		48
   n = 0xc		64
   n = 0xd		96
   n = 0xe		128
   n = 0xf		fully associative

which is only valid for CPUID(0x80000006).

Parse CPUID(0x80000005) L1d/L1i associativity values as shown in the AMD
manuals.  Since the 0xffff literal is used to denote full associativity
at the AMD CPUID(4)-emulation logic, define AMD_CPUID4_FULLY_ASSOCIATIVE
for it instead of spreading that literal in more places.

Mark the assocs[] mapping array as only valid for CPUID(0x80000006) L2/L3
cache information.

Fixes: a326e948c538 ("x86, cacheinfo: Fixup L3 cache information for AMD multi-node processors")
Cc: stable@vger.kernel.org
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index b3a520959b51..7a95e1ce73f8 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -208,6 +208,9 @@ union l3_cache {
 	unsigned val;
 };
 
+#define AMD_CPUID4_FULLY_ASSOCIATIVE	0xffff
+
+/* L2/L3 associativity mapping */
 static const unsigned short assocs[] = {
 	[1] = 1,
 	[2] = 2,
@@ -219,7 +222,7 @@ static const unsigned short assocs[] = {
 	[0xc] = 64,
 	[0xd] = 96,
 	[0xe] = 128,
-	[0xf] = 0xffff /* fully associative - no way to show this currently */
+	[0xf] = AMD_CPUID4_FULLY_ASSOCIATIVE
 };
 
 static const unsigned char levels[] = { 1, 1, 2, 3 };
@@ -258,7 +261,7 @@ amd_cpuid4(int leaf, union _cpuid4_leaf_eax *eax,
 	case 0:
 		if (!l1->val)
 			return;
-		assoc = assocs[l1->assoc];
+		assoc = (l1->assoc == 0xff) ? AMD_CPUID4_FULLY_ASSOCIATIVE : l1->assoc;
 		line_size = l1->line_size;
 		lines_per_tag = l1->lines_per_tag;
 		size_in_kb = l1->size_in_kb;
@@ -295,7 +298,7 @@ amd_cpuid4(int leaf, union _cpuid4_leaf_eax *eax,
 	eax->split.num_cores_on_die = topology_num_cores_per_package();
 
 
-	if (assoc == 0xffff)
+	if (assoc == AMD_CPUID4_FULLY_ASSOCIATIVE)
 		eax->split.is_fully_associative = 1;
 	ebx->split.coherency_line_size = line_size - 1;
 	ebx->split.ways_of_associativity = assoc - 1;
-- 
2.49.0

