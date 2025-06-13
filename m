Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562E42DA75B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.90.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749800315; cv=none; b=LrXfzezmHgjEHcLCxOKPHIop3NO2MSRwBeR1SI0JEs2xq3zbaF9PYt48bSz1LQIAU8m7k/tv3qGUXe0By+EeKsW/vxxV2d//QUPZns9iph07P1vruioUf8svPJeLWOuNHiPbKDSsfY7jc6joskdNwWkLtJDSE8ySQqKFCGRiwls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749800315; c=relaxed/simple;
	bh=EnX1kQ7HMVoXEs7bkNHI6cFY5ASYYuC2t40p/S7lyT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=THrrdTsa5XCHo5mqJtaJttOnPjA8x+SPzCIES+/KCuerS/FW7BOK8blEsJ0V6fwHfKGjUaBhbfsRejxqNCPmi+lWao6q5C1SzCRir78dF1xMHbzUYuUoaT4eVw0jL07fGR6uRTJvl+Z4JXOqjfAadbx+St3Pl2Mt5YagMcjGRIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com; spf=pass smtp.mailfrom=jp.fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=o/WyLEwU; arc=none smtp.client-ip=207.54.90.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="o/WyLEwU"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749800314; x=1781336314;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EnX1kQ7HMVoXEs7bkNHI6cFY5ASYYuC2t40p/S7lyT4=;
  b=o/WyLEwUcUFBSXe8OV8U5F2A0Vjtwqk6LHTyBAwMBV1MNfBjGS8UsUy2
   coRS0mhwirfFpJF+ghZWu6EXnFo+lz/zJX3pbQkOVDmmGQGwmyOiRqfd5
   PGi2DPPgAxfZ/uQrtV2D2TRI3XkUlwkVibIQJMvIu3i7ZIq5pjiXcbSn5
   SeGpVB6tQHFo7pe7Rb1mm6ABLxRVEIf3jLrcRylQ/VsSd9PaREsrPLn6t
   VLGSWuj+6a0XZV69rbBkj4Ql7o1DMj9tGeHpJlszc76zhhd7ds7j1NkBb
   sEHgMTzrh1xkllGqoMmFDS8+DxToY6+o1khzg6haj7Ys7WeZo0UlUdCc2
   Q==;
X-CSE-ConnectionGUID: zh+RxpX5Tmm3oRDweftgfQ==
X-CSE-MsgGUID: Ib4Qlf00QeCvujHEUuFRwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="182117434"
X-IronPort-AV: E=Sophos;i="6.16,233,1744038000"; 
   d="scan'208";a="182117434"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 16:38:25 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 86B80D944F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:38:22 +0900 (JST)
Received: from yto-om3.fujitsu.com (yto-om3.o.css.fujitsu.com [10.128.89.164])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 488711043F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:38:22 +0900 (JST)
Received: from sm-x86-amd03.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by yto-om3.fujitsu.com (Postfix) with ESMTP id DF8F64005859E;
	Fri, 13 Jun 2025 16:38:21 +0900 (JST)
From: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
To: linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	James Morse <james.morse@arm.com>,
	Dave Martin <dave.martin@arm.com>,
	fenghuay@nvidia.com
Subject: [PATCH] cpumask: Remove unnecessary cpumask_nth_andnot()
Date: Fri, 13 Jun 2025 16:37:30 +0900
Message-ID: <20250613073733.3642679-1-tan.shaopeng@jp.fujitsu.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 94f753143028("x86/resctrl: Optimize cpumask_any_housekeeping()")
switched the only user of cpumask_nth_andnot() to other cpumask functions,
but left the function cpumask_nth_andnot() unused, delete it.

Signed-off-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
---
 include/linux/cpumask.h | 16 ----------------
 1 file changed, 16 deletions(-)

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
-- 
2.43.5

