Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B9025E44C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196087; cv=none; b=qp+6RGEwy+OJTjIGkZCucjgZnfvxdqSnZDupSH8kUm+9L6HeUX337IQLAPeNKOLLo9qByrNK28TzDME+2X7fhxZ+8OYZ/lB+TFcgxDStmZ+i27U3/86kyZQVpoE8sCrxju6Qm36MCtiRWIsb2bXBXKTK7EZE+6J9cDq0pnhMxMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196087; c=relaxed/simple;
	bh=pHflYcKqFoKG8cLoQ/9fnD6NmQ/Wt4RsX+dpA1DRZdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hxXmHZcUi3KLPRqFXOFFdGhJ5tMyV3nfEmFbIWRw9n8RR5exoiBMKGPRDyEhXZIQPJMV+zTeZuLtGV1b+bV+FHftds/K6b7GGW21om0i3kE2usPIi/AZarjzLDtkqalSZRYN073d3Z1oRri3cA8DcSZTyKo38OeyZTxU1He82uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cMZI7iKf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vd8kpkLt; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cMZI7iKf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vd8kpkLt"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744196082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsys2pZg1b9LKpYoW/QXl009adwTq+tVztT5ium1pgk=;
	b=cMZI7iKfSi3CmZHK88pNQOQmqk+hFZVyMLbt8/mbgWCbz50PwljRUVt85euhWplp/g8ArV
	vU9AA07s0kzIprA5txZLyWYL5iPkF3rjB9nqXVbxLgDv/oGgho94rR0QJUMJxKzFqKayvJ
	UfRvVYq3vyuAtvIOvKWqHDtD4lJF1ALqZ46hiPG9O1JjMZcpxsmm8Fb1in2EL3QxMH1oDF
	hvNkJqDibZWwI78N0Vn+jPkymIPxOrHaWfgaWyQUuKufgWp+MmjW78PmHEyatpaf9ncmsD
	iQwmSAiHwZ2BJsacJP6+Y2xkVK0QtWGd51dOmEq4390ioTPuV4NXTzRXhCh4PA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744196082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gsys2pZg1b9LKpYoW/QXl009adwTq+tVztT5ium1pgk=;
	b=vd8kpkLtAItLxWmAEHdHdLt6FGOJhk1u5EzHQwzv9on66iKYvsZPmkJdQFE1p824Wyf5VH
	O/KwZ8/4OuisIeAQ==
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
Subject: [PATCH v1 2/2] x86/cacheinfo: Properly parse CPUID(0x80000006) L2/L3 associativity
Date: Wed,  9 Apr 2025 12:54:25 +0200
Message-ID: <20250409105429.1048199-3-darwi@linutronix.de>
In-Reply-To: <20250409105429.1048199-1-darwi@linutronix.de>
References: <20250409105429.1048199-1-darwi@linutronix.de>
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
 arch/x86/kernel/cpu/cacheinfo.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/cacheinfo.c b/arch/x86/kernel/cpu/cacheinfo.c
index 7a95e1ce73f8..038f819da20e 100644
--- a/arch/x86/kernel/cpu/cacheinfo.c
+++ b/arch/x86/kernel/cpu/cacheinfo.c
@@ -208,13 +208,20 @@ union l3_cache {
 	unsigned val;
 };
 
+/*
+ * AMD_L2_L3_INVALID_ASSOC: Cache info for the respective L2/L3 cache should
+ * be determined from CPUID(0x8000001d) instead of CPUID(0x80000006).
+ */
 #define AMD_CPUID4_FULLY_ASSOCIATIVE	0xffff
+#define AMD_L2_L3_INVALID_ASSOC		0x9
 
 /* L2/L3 associativity mapping */
 static const unsigned short assocs[] = {
 	[1] = 1,
 	[2] = 2,
+	[3] = 3,
 	[4] = 4,
+	[5] = 6,
 	[6] = 8,
 	[8] = 16,
 	[0xa] = 32,
@@ -267,7 +274,7 @@ amd_cpuid4(int leaf, union _cpuid4_leaf_eax *eax,
 		size_in_kb = l1->size_in_kb;
 		break;
 	case 2:
-		if (!l2.val)
+		if (!l2.assoc || l2.assoc == AMD_L2_L3_INVALID_ASSOC)
 			return;
 		assoc = assocs[l2.assoc];
 		line_size = l2.line_size;
@@ -276,7 +283,7 @@ amd_cpuid4(int leaf, union _cpuid4_leaf_eax *eax,
 		size_in_kb = __this_cpu_read(cpu_info.x86_cache_size);
 		break;
 	case 3:
-		if (!l3.val)
+		if (!l3.assoc || l3.assoc == AMD_L2_L3_INVALID_ASSOC)
 			return;
 		assoc = assocs[l3.assoc];
 		line_size = l3.line_size;
-- 
2.49.0

