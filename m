Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE9F26157E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201366; cv=none; b=SEv8zipxBX2XcZ3yT/++4IjaJWimK0C5b/O7aKXl8QgpwBhVONHFeC4dQ1hHuRvBQ0s6m94iOI5uGiUSKyyVFHGB7J66clbnt1yGF8NQOHTy4edg2HT+Eez7elIBPLuRu7a1dbtct/vLphKKZSecVNnZTjjynlwVF+0TPIWELIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201366; c=relaxed/simple;
	bh=ardz7KIirKoNESRrAcakMlL3X1UAbC/18FVFaR5RTRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=be4ixIaDjdOvHb6x2CtpMwH3h1DHyi6TBk+4wEmcgoqJbSj/ll3YM5t04iJwfpa+IaPGvBDtPFg/cMOkVajAZoUeFwnm7H9Ab41ovERztipAHtj+51kI/XDWMgFJrVBB/C0kT+4GFmRHGAdKth2iXYpUVeyvLnQpVUZdRN+zqCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=V9uLV+ob; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OdmolsO7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="V9uLV+ob";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OdmolsO7"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744201361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WQsbjCvdNtCVEADB8V6oJZCRiRUpMBzibOwy8DYpBSU=;
	b=V9uLV+obTuCj+28NmEvfwWOyvyZ6zwcN+KQNuNA9x2yZqPtYFRii8t7SsZPLSnLVSDIkQV
	tPtJLaHLGW5H2CqTphhJVH8N5YoVCuGCEXqRNMeNzqkQ13fr3r5CX1WmT4Ac6ujaSBX4mT
	a/khfR8wbDy15+xH+b4J6pAu0MH7Z4xt+6lagzP3wBkK+1S8BenNrLAnseC86Tgtxf9E2e
	z8RBCEsbe8qx1XQzLn439zKlH/178393w9FPMznPZ/Y4g9z6cx1czRI1xCEAguL+pUA1cn
	thj1tq4abb/eq3cyTGabFHqaR3OiRJzMYufoJYTuLrdu1kLD97E6QgTPyr2hRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744201361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WQsbjCvdNtCVEADB8V6oJZCRiRUpMBzibOwy8DYpBSU=;
	b=OdmolsO7pYejkSKLi8S3Lt41J/ejjYCWCG/RKFuNthVeXH1p4K4k98bNyPTIBcUnYp4+lG
	Bpi3SMAiFJbijCBw==
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
Subject: [PATCH v2 2/2] x86/cacheinfo: Properly parse CPUID(0x80000006) L2/L3 associativity
Date: Wed,  9 Apr 2025 14:22:31 +0200
Message-ID: <20250409122233.1058601-3-darwi@linutronix.de>
In-Reply-To: <20250409122233.1058601-1-darwi@linutronix.de>
References: <20250409122233.1058601-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete the AMD CPUID(4) emulation logic, which uses CPUID(0x80000006)
for L2/L3 cache info and an assocs[] associativity mapping array, by
adding entries for 3-way caches and 6-way caches.

Properly handle the case where CPUID(0x80000006) returns an L2/L3
associativity of 9.  This is not real associativity, but a marker to
indicate that the respective L2/L3 cache information should be retrieved
from CPUID(0x8000001d) instead.  If such a marker is encountered, return
early from legacy_amd_cpuid4(), thus effectively emulating an "invalid
index" CPUID(4) response with a cache type of zero.

When checking if CPUID(0x80000006) L2/L3 cache info output is valid, and
given the associtivity marker 9 above, do not just check if the whole
ECX/EDX register is zero.  Rather, check if the associativity is zero or
9.  An associativity of zero implies no L2/L3 cache, which make it the
more correct check anyway vs. a zero check of the whole output register.

Fixes: a326e948c538 ("x86, cacheinfo: Fixup L3 cache information for AMD multi-node processors")
Cc: stable@vger.kernel.org
Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
---
 arch/x86/kernel/cpu/cacheinfo.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index f4817cd50cfb..52727f8c0006 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -89,9 +89,13 @@ static const enum cache_type cache_type_map[] = {
 /*
  * Fallback AMD CPUID(4) emulation
  * AMD CPUs with TOPOEXT can just use CPUID(0x8000001d)
+ *
+ * @AMD_L2_L3_INVALID_ASSOC: cache info for the respective L2/L3 cache should
+ * be determined from CPUID(0x8000001d) instead of CPUID(0x80000006).
  */
 
 #define AMD_CPUID4_FULLY_ASSOCIATIVE	0xffff
+#define AMD_L2_L3_INVALID_ASSOC		0x9
 
 union l1_cache {
 	struct {
@@ -128,7 +132,9 @@ union l3_cache {
 static const unsigned short assocs[] = {
 	[1]		= 1,
 	[2]		= 2,
+	[3]		= 3,
 	[4]		= 4,
+	[5]		= 6,
 	[6]		= 8,
 	[8]		= 16,
 	[0xa]		= 32,
@@ -172,7 +178,7 @@ static void legacy_amd_cpuid4(int index, union _cpuid4_leaf_eax *eax,
 		size_in_kb	= l1->size_in_kb;
 		break;
 	case 2:
-		if (!l2.val)
+		if (!l2.assoc || l2.assoc == AMD_L2_L3_INVALID_ASSOC)
 			return;
 
 		/* Use x86_cache_size as it might have K7 errata fixes */
@@ -182,7 +188,7 @@ static void legacy_amd_cpuid4(int index, union _cpuid4_leaf_eax *eax,
 		size_in_kb	= __this_cpu_read(cpu_info.x86_cache_size);
 		break;
 	case 3:
-		if (!l3.val)
+		if (!l3.assoc || l3.assoc == AMD_L2_L3_INVALID_ASSOC)
 			return;
 
 		assoc		= assocs[l3.assoc];
-- 
2.49.0

