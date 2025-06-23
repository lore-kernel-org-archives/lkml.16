Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5831B1CCB40
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.61.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665082; cv=none; b=GvdYajdwVZ8nRwBvSl10zIWX+Xf029/MgR9b8/NPC2t6X8lXP7u8CuLRS6+Qn8P2/N2HEBz5+BWAI/9iwe6BuZWOvdABPLorsLZ+ZQnc0NGfOm1DGtQWDHBy9vJoxOU0IM9QLY6ONcaldpxEI4m3ab6elxrKyKUsBhrKhIjA/HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665082; c=relaxed/simple;
	bh=hx7qGnPvOWaNPSN5nsWU92ufEv2GtSCXhLf/L7w+eg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pQ+EA/199XgWECV7Bb6qj84/2BTKoZcLdAgbEc36LCvqKTS77iPbx6cImJqrjEOL91/Pf2QxyRFW3qSz0Sxu5zB6dNuwAlcJiU7L5VI9HfmthGo0sncfg1SbKosaIYOr5xrxzaegoo52yekwFrtJ26fQPohycoq7BXrckDbzqHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com; spf=pass smtp.mailfrom=jp.fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=LRz8CC2l; arc=none smtp.client-ip=139.138.61.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jp.fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="LRz8CC2l"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750665080; x=1782201080;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hx7qGnPvOWaNPSN5nsWU92ufEv2GtSCXhLf/L7w+eg0=;
  b=LRz8CC2lqF8MZexuwpbVCLGPPh1pIEdlAinRBAH9gcEfzJs4L6BMfKdB
   DjxE8fdwQ71g4y9govf7vTa9/3gVZ+9SP3TeJhjwrDPS2CnOuaZ3hjZ3H
   fQhf6uRU4dW5AlA3N5MHsCMzh1/QBJMmwKoHlXYyqhQle0usw1QyTezTJ
   gKJxkiLofoVdzuWB9HIkmBfx8dEwQn083KRfOREiKEg9k+F7MrxhQcGjX
   moo2mZogvXLDwZzGgz7Xr86vhuoyokQotiqsoNC1kFAQC+h1lvdRYxtHq
   PoENNbSQRnQcMGILpYs+OfqQvIbLehpg06OU6BFjNcn2nFoVY+MWQZ1ZE
   w==;
X-CSE-ConnectionGUID: uLjTMbAvRfCeR4YNT2tmoA==
X-CSE-MsgGUID: XjeFhhFsR/SbCNF4Igy3LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="191579518"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="191579518"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:51:12 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 045A0E495E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:51:10 +0900 (JST)
Received: from oym-om4.fujitsu.com (oym-om4.o.css.fujitsu.com [10.85.58.164])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CAD3AD88D9
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:51:09 +0900 (JST)
Received: from sm-x86-amd03.ssoft.mng.com (sm-x86-stp01.soft.fujitsu.com [10.124.178.20])
	by oym-om4.fujitsu.com (Postfix) with ESMTP id CECCB400589E4;
	Mon, 23 Jun 2025 16:51:08 +0900 (JST)
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
Subject: [PATCH v2] fs/resctrl: Optimize code in rdt_get_tree()
Date: Mon, 23 Jun 2025 16:50:50 +0900
Message-ID: <20250623075051.3610592-1-tan.shaopeng@jp.fujitsu.com>
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
index 77d08229d855..5f0b7cfa1cc2 100644
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

