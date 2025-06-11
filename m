Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE15EEA9
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.139.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749608299; cv=none; b=CuKL8mGnke2e19S9Qb5ViTNtxpDvb/9/zSH2I29wa7jjCEqdxCo9yYJifSLkH8M/TPpDTO1BnQu1LhMn/ZUqtKPuJJdJxe0Jwe74ikFdMxcPd0RXjBOt0I7wo/EJ7FGaNcotk+x+h0Pz2S+hZqVEDhQ1kwK1rGHEtZ8D8uA/cPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749608299; c=relaxed/simple;
	bh=xSfht9KRPJIN3XKnJcISniqHonnzom51ddjqLydjIOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9N9FP1H0+F8YEAI2pgCe1rN98mBOt6K35/j4UKTid6vT3PKldZhJ7+XXGgE2QancUR+9mCygf3MJF73kHtM9NMd2HGBtZXsD+BVI8IejhtiWuywiKuSAWbX6d3ObsiBP41Hr/kjn9XzI12NiHedj2y9UYNqZEwWJpEIWauxHEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com; spf=pass smtp.mailfrom=jp.fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=p+TwdXpz; arc=none smtp.client-ip=68.232.139.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="p+TwdXpz"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749608298; x=1781144298;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xSfht9KRPJIN3XKnJcISniqHonnzom51ddjqLydjIOE=;
  b=p+TwdXpzMVX3WI0dv6UDjKNkjyx96+JKHYuqZnWZ4BX4N4MQZZuALeLN
   ZkXGdSsTizijpWwuvj47mVBQu+sPWN8vQbMVkhLfSmmbiGJE0ZqIg3xDI
   2sbUKE+lg4A4lEbKHZdML1btAQxt1msolD55JUQz9UuotMI+eXZ0dDIRQ
   orGIJGm4qdChaxg4zGoK3gXnvhg0Dj7lEzbf1Xt8hqfydw635ToU7hIZj
   GXsRIEsEwVG7Gz78Ucn+wz5RYkGV09UW3XScGbYPVrqUM96n9qFGkr/3E
   Os9NE0x3ay6qvTxy66lmOz3HFntd1zDUaPP+4q+0u+C/F84rTIE3koPgN
   w==;
X-CSE-ConnectionGUID: bZ25ZASURlCitz4rKQmyNw==
X-CSE-MsgGUID: HOLmiDGzTHCTgCx41IdDDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="201563999"
X-IronPort-AV: E=Sophos;i="6.16,226,1744038000"; 
   d="scan'208";a="201563999"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 11:17:06 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 56E6CC68FB
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:17:04 +0900 (JST)
Received: from oym-om1.fujitsu.com (oym-om1.o.css.fujitsu.com [10.85.58.161])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 228FCD3F13
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:17:04 +0900 (JST)
Received: from sm-x86-amd03.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by oym-om1.fujitsu.com (Postfix) with ESMTP id BB9FE40072E3A;
	Wed, 11 Jun 2025 11:17:02 +0900 (JST)
From: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
To: x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Reinette Chatre <reinette.chatre@intel.com>,
	James Morse <james.morse@arm.com>,
	Yury Norov <yury.norov@gmail.com>,
	Dave Martin <dave.martin@arm.com>,
	fenghuay@nvidia.com,
	peternewman@google.com,
	Babu Moger <Babu.Moger@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	shameerali.kolothum.thodi@huawei.com,
	bobo.shaobowang@huawei.com,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	baolin.wang@linux.alibaba.com,
	lcherian@marvell.com,
	amitsinght@marvell.com,
	Ingo Molnar <mingo@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	H Peter Anvin <hpa@zytor.com>,
	Rex Nie <rex.nie@jaguarmicro.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	dfustini@baylibre.com,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 1/2] x86/resctrl: Remove unnecessary cpumask_nth_andnot()
Date: Wed, 11 Jun 2025 11:15:38 +0900
Message-ID: <20250611021547.2766889-2-tan.shaopeng@jp.fujitsu.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250611021547.2766889-1-tan.shaopeng@jp.fujitsu.com>
References: <20250611021547.2766889-1-tan.shaopeng@jp.fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 94f753143028("x86/resctrl: Optimize cpumask_any_housekeeping()"),
cpumask_any_andnot_but() replaced cpumask_nth_andnot(),
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

