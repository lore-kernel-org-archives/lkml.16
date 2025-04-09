Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C5125F98A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201361; cv=none; b=oY+/IxmKl6ZP4EseLp8XbbfpWm5edeZNVs9RAeFbr3x6a+bW1pEGRLSvD9dAmMbKi0txKzeDGHxvnlqBIQM1rltWLqhHP6EITjyWP1s8UeqY+VzfZNDVvMv+uOjd0jyLAx/GSLHZm7a7bwt9aWfjymi06/w+ze6J/GS8TmAOvno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201361; c=relaxed/simple;
	bh=oJ6F4PKN+iw8PYMmda6U1Aa8eTXvnEB4E+3FSw4zKQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=En6tiQk6Hhr/I1nrf+JcGX51r7asLfuax30vFT/+aCGDEDLoovDud01olRyhvnd46/FDbZib46+9g7GJzJ6cPx/7wEgVDphchVS2JTANscKMGpWl/jnXrg8nbo6hu4YMcMchwrC3xUA55PIHB1lbtx5D65iWdB1W+lCsYQ6J/lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eNNhXFO7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bqmpl6ta; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eNNhXFO7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bqmpl6ta"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744201358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Z01DDvTLc3A+iis9JwNmMtr4ZIHUaMbDJfUxv/Jvm0=;
	b=eNNhXFO7I9Br6pKz4Ig4rEsFKezz784jo1ArzvByjdJNztVlc0ws8OJRSgpXncDI8+Y2zp
	c2OzDoSsfwp57lm4BOSmWYVx3NE1AbbI24CB7NYWMPk//7XepNUTYdGribN9L47xdhLZ90
	CqSnNb4cx0GMYs9kZT4IbRidXuyuuQpkcpAlYqPGCKYrq9LCUVqr8ASw0o7MLDbxfaIRSR
	NRCv5FIcs5/uQHMyGuMrV6Hj4ij2MqFXFpLtAOWH7oOVvqC2ajx/4hypm3X+nn5vgLCbzL
	TmYEGNz1ftfcogxPUiyGup0fMljJDMtlHVg91tInWV7KCZWL8xz6VTOnQnpZjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744201358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Z01DDvTLc3A+iis9JwNmMtr4ZIHUaMbDJfUxv/Jvm0=;
	b=bqmpl6tae34wk5O+BskuD5hpCHSlhteuFyGonUbO3slvV7he5ugnVH2voV8JC/xNFkxUJl
	he4CC3UFfrbWFQBQ==
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
Subject: [PATCH v2 1/2] x86/cacheinfo: Properly parse CPUID(0x80000005) L1d/L1i associativity
Date: Wed,  9 Apr 2025 14:22:30 +0200
Message-ID: <20250409122233.1058601-2-darwi@linutronix.de>
In-Reply-To: <20250409122233.1058601-1-darwi@linutronix.de>
References: <20250409122233.1058601-1-darwi@linutronix.de>
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
index cd48d34ac04b..f4817cd50cfb 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -91,6 +91,8 @@ static const enum cache_type cache_type_map[] = {
  * AMD CPUs with TOPOEXT can just use CPUID(0x8000001d)
  */
 
+#define AMD_CPUID4_FULLY_ASSOCIATIVE	0xffff
+
 union l1_cache {
 	struct {
 		unsigned line_size	:8;
@@ -122,6 +124,7 @@ union l3_cache {
 	unsigned int val;
 };
 
+/* L2/L3 associativity mapping */
 static const unsigned short assocs[] = {
 	[1]		= 1,
 	[2]		= 2,
@@ -133,7 +136,7 @@ static const unsigned short assocs[] = {
 	[0xc]		= 64,
 	[0xd]		= 96,
 	[0xe]		= 128,
-	[0xf]		= 0xffff	/* Fully associative */
+	[0xf]		= AMD_CPUID4_FULLY_ASSOCIATIVE
 };
 
 static const unsigned char levels[] = { 1, 1, 2, 3 };
@@ -163,7 +166,7 @@ static void legacy_amd_cpuid4(int index, union _cpuid4_leaf_eax *eax,
 		if (!l1->val)
 			return;
 
-		assoc		= assocs[l1->assoc];
+		assoc		= (l1->assoc == 0xff) ? AMD_CPUID4_FULLY_ASSOCIATIVE : l1->assoc;
 		line_size	= l1->line_size;
 		lines_per_tag	= l1->lines_per_tag;
 		size_in_kb	= l1->size_in_kb;
@@ -201,7 +204,7 @@ static void legacy_amd_cpuid4(int index, union _cpuid4_leaf_eax *eax,
 	eax->split.num_threads_sharing		= 0;
 	eax->split.num_cores_on_die		= topology_num_cores_per_package();
 
-	if (assoc == 0xffff)
+	if (assoc == AMD_CPUID4_FULLY_ASSOCIATIVE)
 		eax->split.is_fully_associative = 1;
 
 	ebx->split.coherency_line_size		= line_size - 1;
-- 
2.49.0

