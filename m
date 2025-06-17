Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2032BF014
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.54.90.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750122467; cv=none; b=n9M+c6PL96IdVSzm71jeyYMJ8CcrPIY8J8z2iRX4w3RX+vn3UsknIdrEg7DbBhU63oJUKgv+kYYiELN4/dq5cybnNJw8SwBTZMnuB7VgaDOEu3bVAYAapK/dJ10vlXm3htBV3LG7X2bcc/ar+5bLAo56ozpJb/dVj3VdcrvFnLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750122467; c=relaxed/simple;
	bh=AMbFJF773v6MXMZuZIEHM7FTlzlVUDfnGjPmW4p3nPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aa5/6BOIzwpUKfsrA4TyTUdUSq/d08eiHdsEz1IDO2I1kLNtpbV2HwSQbjMW5eAcq/20WwueZmIxgOZt7iBaC+v0HYVLYtcQ3nOS9gTkDKU5F7WLiYyKnDfuFzUA9CGIyFQrxtnRjz7rYzZRjKtcUYFm4y8T7gm9iLzWQIeDdOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com; spf=pass smtp.mailfrom=jp.fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=MBnfwFX6; arc=none smtp.client-ip=207.54.90.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="MBnfwFX6"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750122465; x=1781658465;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=AMbFJF773v6MXMZuZIEHM7FTlzlVUDfnGjPmW4p3nPM=;
  b=MBnfwFX6JVnC0saHJf3MX+EuwSPYS+EeVFAN16Nb29JCCKu2HdYXIxOD
   vA8CMAjoM/LXUmDW7eJLXwExVSvpXZyr4tIBCnFnyXypcd7lR1QOjPBeM
   q2+i1fsQN0bmgqMAcsLfoYQBCHfZgi9zPYV6BOMUmn6ilkpEHlBqOcODr
   eo/F5N6jU6BIX6Vo9PqtwDVJ6sCVUegiiGTQOre/Uvs2XELETLI5VcQfB
   URLTzSAENpPOrFirYgM2irZa0XxpA1js25Eod/Fb+4OGosdPLCtA4le66
   26cReJnetWKWx0X3IZBhunQyiTPueP1L97xLQZUDWeemfxSMKgjmBHraO
   A==;
X-CSE-ConnectionGUID: ELHiP8FwReSg0b3xKMtgNQ==
X-CSE-MsgGUID: MKkT5rVvTkiG2hR3xyTWjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="202966254"
X-IronPort-AV: E=Sophos;i="6.16,241,1744038000"; 
   d="scan'208";a="202966254"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 10:06:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 01DE5D4C31
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:06:32 +0900 (JST)
Received: from oym-om1.fujitsu.com (oym-om1.o.css.fujitsu.com [10.85.58.161])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id BF268D4C14
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:06:31 +0900 (JST)
Received: from sm-x86-amd03.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by oym-om1.fujitsu.com (Postfix) with ESMTP id BD4604007A465;
	Tue, 17 Jun 2025 10:06:30 +0900 (JST)
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
Subject: [PATCH] fs/resctrl: Optimize code in rdt_get_tree()
Date: Tue, 17 Jun 2025 10:06:00 +0900
Message-ID: <20250617010625.3805259-1-tan.shaopeng@jp.fujitsu.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

schemata_list_destroy() has to be called if schemata_list_create() fails.

rdt_get_tree() calls schemata_list_destroy() in two different ways:
directly if schemata_list_create() itself fails and
on the exit path via the out_schemata_free goto label.

Remove schemata_list_destroy() call on schemata_list_create() failure.
Use existing out_schemata_free goto label instead.

Signed-off-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Reviewed-by: James Morse <james.morse@arm.com>
---
 fs/resctrl/rdtgroup.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 1beb124e25f6..592d4f69fce9 100644
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
@@ -2683,7 +2681,6 @@ static int rdt_get_tree(struct fs_context *fc)
 	closid_exit();
 out_schemata_free:
 	schemata_list_destroy();
-out_ctx:
 	rdt_disable_ctx();
 out_root:
 	rdtgroup_destroy_root();
-- 
2.43.5

