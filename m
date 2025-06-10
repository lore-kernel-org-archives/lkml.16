Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3483351022
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.36.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749536955; cv=none; b=YFIZtZUu4v8H069Px7PxZnfXFT7slJlVY6jY6uYMB+gwa8AkZHLfTDHk7js+l7k/3KB0DxR7CZNwfQtme3/l8XckfSxPqKyM5RUvXRQ70kPxvP2YQzrrGb4h6F/gwKaHmR6RyNdxBJF5jZifsoWsXa54Me3yVFWFHIP9+YjcIN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749536955; c=relaxed/simple;
	bh=8Q+3ecZIOla7HmlI7e/qao3HRBpcoMYWCofrI5L6AQA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DZDIQHjlMFG/VMvdcT56okkMCxSyjhcL/mE/lHvCZQy4raNAsu/d3spre8Ci+hRdiH62rMLpbtfsjSUp+o2Ja7kksjIw6bYEdMOS68n/NJpx4u9dZrnqZYhFMcypmIg8yhQ4XXDxkyqFvURLyUxf9VLM1YCfqJyO03x1Q57vyyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=WeyidIYu; arc=none smtp.client-ip=139.138.36.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="WeyidIYu"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749536953; x=1781072953;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8Q+3ecZIOla7HmlI7e/qao3HRBpcoMYWCofrI5L6AQA=;
  b=WeyidIYuHQ0qn46GKfEbV5LjSm1lDLP0xUUaDC4v7w4IVvaEYsNxhjfQ
   GvfQQAO7q9GaLrCVi3H5YE3w3pcf11SjNQG+6cGvnGIcFFm5zy2hcCJTC
   79grZqy44Yl4cahbgQ4V4BXrwD2EBaidJzORbGsKiKoAa3ZV4jPyObtFY
   DUV2NhAvMk+xMTMlRtasxoItDpVWnsrFYQRt5A2PAP+lHisDOCQQGKJcc
   LnN3XB415uheSQV+2GtwXjxqebGTUIUjG76MZzH/FMsTyb6DDdY53lSXt
   xoJ0NbB/T9XKb5YBUZQ5mZEaR/cPjrJtjhGQiZfVosdKa0z82jQGGLYk2
   Q==;
X-CSE-ConnectionGUID: 1pcuRL0vSW+8NfEReXUxpg==
X-CSE-MsgGUID: N13mePTbT6+NvgCu2do5Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="189616285"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="189616285"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 15:28:02 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8378D32F11
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:28:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 24FD1BF3C1
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:28:00 +0900 (JST)
Received: from FNSTPC.g08.fujitsu.local (unknown [10.167.135.44])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 96B4E1A0071;
	Tue, 10 Jun 2025 14:27:58 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Li Zhijian <lizhijian@fujitsu.com>,
	Ying Huang <huang.ying.caritas@gmail.com>
Subject: [PATCH] mm/memory-tier: Fix abstract distance calculation overflow
Date: Tue, 10 Jun 2025 14:27:51 +0800
Message-ID: <20250610062751.2365436-1-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mt_perf_to_adistance(), the calculation of abstract distance (adist)
involves multiplying several int values including MEMTIER_ADISTANCE_DRAM.
```
*adist = MEMTIER_ADISTANCE_DRAM *
		(perf->read_latency + perf->write_latency) /
		(default_dram_perf.read_latency + default_dram_perf.write_latency) *
		(default_dram_perf.read_bandwidth + default_dram_perf.write_bandwidth) /
		(perf->read_bandwidth + perf->write_bandwidth);
```
Since these values can be large, the multiplication may exceed the maximum
value of an int (INT_MAX) and overflow (Our platform did), leading to an
incorrect adist.

Change MEMTIER_ADISTANCE_DRAM to be a long constant by writing it with the
'L' suffix. This prevents the overflow because the multiplication will then
be done in the long type which has a larger range.

Fixes: 3718c02dbd4c ("acpi, hmat: calculate abstract distance with HMAT")
Cc: Ying Huang <huang.ying.caritas@gmail.com>
Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
---
 include/linux/memory-tiers.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/memory-tiers.h b/include/linux/memory-tiers.h
index 0dc0cf2863e2..7a805796fcfd 100644
--- a/include/linux/memory-tiers.h
+++ b/include/linux/memory-tiers.h
@@ -18,7 +18,7 @@
  * adistance value (slightly faster) than default DRAM adistance to be part of
  * the same memory tier.
  */
-#define MEMTIER_ADISTANCE_DRAM	((4 * MEMTIER_CHUNK_SIZE) + (MEMTIER_CHUNK_SIZE >> 1))
+#define MEMTIER_ADISTANCE_DRAM	((4L * MEMTIER_CHUNK_SIZE) + (MEMTIER_CHUNK_SIZE >> 1))
 
 struct memory_tier;
 struct memory_dev_type {
-- 
2.41.0

