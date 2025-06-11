Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D7C17A2EE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.139.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749608302; cv=none; b=rmYSXDgnRfNndPo/OWdsZpRKeQ2WLOg+Oc8llNNMFROSuc9KZ45oQVyq1eExYNl/dqiBdKmTeKmaLVZcP/Zzg7DsmERfPsspXd8qhBXwtMjAwSxDvYPjFozp6SYJcd+2N8PE90ZoxPWwD+vksKxE/pwhlspjHOtEVu1UGRV0zPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749608302; c=relaxed/simple;
	bh=47FryM0n8vCaNjijOjTIR4zgLMY5SGBa2CfCuVDwt/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VzlS5zGg+ORx4YXELZBmhyXqEftFzUDc2BAAZ3iov545xLX3xBZNn/h1lniNtGTS42Em3ggNjuG/qC+Td5PLyMJe/wXK7Z/ar3jFkCdENKAQcgaBb04ubc1PHzcH3GWGQjezqKDcebKmLfCR6ymNUOhu2LB+weZF+X7ovy2PYMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com; spf=pass smtp.mailfrom=jp.fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=rsjzUJZD; arc=none smtp.client-ip=68.232.139.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="rsjzUJZD"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749608300; x=1781144300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=47FryM0n8vCaNjijOjTIR4zgLMY5SGBa2CfCuVDwt/0=;
  b=rsjzUJZDNAnZvJRACvoIyj2YVcPCv9z5SaMLLY9ojVd/K7c9R/z0c+rG
   sCPCm+HPs6haGRb5D7au7SDacx/olGbOSORIrDWbQwO9Zs8lfrddHAyRX
   sPtIZ2bLQx7UmWHI8oD4kZqF0n3bCzQqXRheG29t3qlLarDtN+lEDqrRv
   1FpelOa1Pw3atLWeKUpiwjsmUdLnngTAoXr2Q9sdfyjryMr+aEixnrPvV
   A/ov6kKFLeqAO/LNx37q9hIy4IX2kq0lfIukApt+OnPCwX52L2d5PimCI
   DDZhboB9YIAFb+5LO5ZJ9A28VPc9KuISE363KLfOo/8t35ra03gqxTp7r
   w==;
X-CSE-ConnectionGUID: 9CWJdtVGTEC3ffwTGA3DQg==
X-CSE-MsgGUID: 6Gk54wiNRoKicvJUmcGlCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="202795237"
X-IronPort-AV: E=Sophos;i="6.16,226,1744038000"; 
   d="scan'208";a="202795237"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 11:17:08 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 45D07E9ED3
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:17:05 +0900 (JST)
Received: from oym-om1.fujitsu.com (oym-om1.o.css.fujitsu.com [10.85.58.161])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1651FBF3C7
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:17:05 +0900 (JST)
Received: from sm-x86-amd03.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by oym-om1.fujitsu.com (Postfix) with ESMTP id 153784007A495;
	Wed, 11 Jun 2025 11:17:04 +0900 (JST)
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
Subject: [PATCH 2/2] x86/resctrl: Optimize code in rdt_get_tree()
Date: Wed, 11 Jun 2025 11:15:39 +0900
Message-ID: <20250611021547.2766889-3-tan.shaopeng@jp.fujitsu.com>
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

Inconsistent context format. Optimize it,
not only save a line and also make it easier to understand.

Signed-off-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
---
 fs/resctrl/rdtgroup.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 1beb124e25f6..8bf87211eadb 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2608,10 +2608,8 @@ static int rdt_get_tree(struct fs_context *fc)
 		goto out_root;
 
 	ret = schemata_list_create();
-	if (ret) {
-		schemata_list_destroy();
-		goto out_ctx;
-	}
+	if (ret)
+		goto out_schemata_free;
 
 	ret = closid_init();
 	if (ret)
-- 
2.43.5

