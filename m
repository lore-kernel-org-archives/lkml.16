Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE5622F740
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.36.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750664839; cv=none; b=ZZDrdEIL8wf0WKXGtkFoOGTt93i3itQ2eueABId2ppYCfeqR+7Z1RsyODGX1/JoFOalw9UX9G5inkbq8cY5flNczq9LVgYQKZgSkzfSPqw41mmKVLslUGVYSGM8gmso6m7UuKrPWbVgT2QeCso2lhxYrHBL+uEY8I1brFvWnFQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750664839; c=relaxed/simple;
	bh=q1tUFDQM3GOdTQc0tnhFzx2pS5y9TKj+7wydnh5lR/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p8Gqyr3J7Ll815bS98R8WjqNWj+V/9xgVYzuvaMd+dTaIlT6btcEwhEx8+y7e6zMKPebK/pyjcoWLlyc4TLhVwUkTqN4ciBivz/mHqSoCPsCrnNESin+NMwiwODbHGm2F6dg7pT5VfPq6WYdoiKpU0JKEOoH1l/hHCSQXN8Yzlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com; spf=pass smtp.mailfrom=jp.fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=MLWEM8ne; arc=none smtp.client-ip=139.138.36.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="MLWEM8ne"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750664837; x=1782200837;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q1tUFDQM3GOdTQc0tnhFzx2pS5y9TKj+7wydnh5lR/Q=;
  b=MLWEM8ne/1iZRGhckyTx9SzSqCRKve2ybTuzdwWJ/3RtQm7UV+l6kApu
   GRwqs7Da5gSXanSjJZyjcqgvSTIDc8arPXkPGiupqx2uLffGNJcR4z39h
   q5Bt+/FNt0nwr05yV0B8MS0g9SnPMwFG4OJLdxt1u4sZxmFYxXMnz0H0w
   9nawK4C5au70Zcpfyu+RJhEsokPWFENx26jzPL5r+nH3HcozMtlDlC32I
   PuPNRQ1X9HGwulEetygPeZphq8ANfZp7IY+bCAfRbF/m35Aq8a3913faT
   kqKL/Tmk0NPW/MX6aHJp3itZxzTGYpP50cJeiXc/YHI+tYv5kRQPxwqFy
   g==;
X-CSE-ConnectionGUID: QTxBhSEaTsaDe1Ao272klg==
X-CSE-MsgGUID: wvvOozG0TUGtEC05M5zq4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="192073636"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="192073636"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:47:09 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2CCA7C68FB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:47:07 +0900 (JST)
Received: from oym-om1.fujitsu.com (oym-om1.o.css.fujitsu.com [10.85.58.161])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DFA14CFB68
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:47:06 +0900 (JST)
Received: from sm-x86-amd03.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by oym-om1.fujitsu.com (Postfix) with ESMTP id 7ED1B400753CB;
	Mon, 23 Jun 2025 16:47:06 +0900 (JST)
From: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
To: linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <dave.martin@arm.com>,
	fenghuay@nvidia.com
Subject: [PATCH v2] cpumask: Remove unnecessary cpumask_nth_andnot()
Date: Mon, 23 Jun 2025 16:46:45 +0900
Message-ID: <20250623074650.3534184-1-tan.shaopeng@jp.fujitsu.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 94f753143028("x86/resctrl: Optimize cpumask_any_housekeeping()")
switched the only user of cpumask_nth_andnot() to other cpumask
functions, but left the function cpumask_nth_andnot() unused.
This makes function find_nth_andnot_bit() unused as well. Delete them.

Signed-off-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
---
 include/linux/cpumask.h | 16 ----------------
 include/linux/find.h    | 27 ---------------------------
 2 files changed, 43 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 7ae80a7ca81e..498790f74fa8 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -546,22 +546,6 @@ unsigned int cpumask_nth_and(unsigned int cpu, const struct cpumask *srcp1,
 				small_cpumask_bits, cpumask_check(cpu));
 }
 
-/**
- * cpumask_nth_andnot - get the Nth cpu set in 1st cpumask, and clear in 2nd.
- * @srcp1: the cpumask pointer
- * @srcp2: the cpumask pointer
- * @cpu: the Nth cpu to find, starting from 0
- *
- * Return: >= nr_cpu_ids if such cpu doesn't exist.
- */
-static __always_inline
-unsigned int cpumask_nth_andnot(unsigned int cpu, const struct cpumask *srcp1,
-							const struct cpumask *srcp2)
-{
-	return find_nth_andnot_bit(cpumask_bits(srcp1), cpumask_bits(srcp2),
-				small_cpumask_bits, cpumask_check(cpu));
-}
-
 /**
  * cpumask_nth_and_andnot - get the Nth cpu set in 1st and 2nd cpumask, and clear in 3rd.
  * @srcp1: the cpumask pointer
diff --git a/include/linux/find.h b/include/linux/find.h
index 5a2c267ea7f9..dc93fc35dcac 100644
--- a/include/linux/find.h
+++ b/include/linux/find.h
@@ -267,33 +267,6 @@ unsigned long find_nth_and_bit(const unsigned long *addr1, const unsigned long *
 	return __find_nth_and_bit(addr1, addr2, size, n);
 }
 
-/**
- * find_nth_andnot_bit - find N'th set bit in 2 memory regions,
- *			 flipping bits in 2nd region
- * @addr1: The 1st address to start the search at
- * @addr2: The 2nd address to start the search at
- * @size: The maximum number of bits to search
- * @n: The number of set bit, which position is needed, counting from 0
- *
- * Returns the bit number of the N'th set bit.
- * If no such, returns @size.
- */
-static __always_inline
-unsigned long find_nth_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
-				unsigned long size, unsigned long n)
-{
-	if (n >= size)
-		return size;
-
-	if (small_const_nbits(size)) {
-		unsigned long val =  *addr1 & (~*addr2) & GENMASK(size - 1, 0);
-
-		return val ? fns(val, n) : size;
-	}
-
-	return __find_nth_andnot_bit(addr1, addr2, size, n);
-}
-
 /**
  * find_nth_and_andnot_bit - find N'th set bit in 2 memory regions,
  *			     excluding those set in 3rd region
-- 
2.43.5

