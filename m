Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25D621CC68
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 05:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.138.36.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747372485; cv=none; b=egEIwsDglKDN5KsLZR1YudrURmXWjE8xFI+ine9nRIHjX33atbwjv68td9tcLq+Gp0bU5lB7u14+xZNYZrC1jK97BEzvZVLbTZOaubHYYs1mlU/RnXQAWmSiJnjKT1vihVjqa2nB+lKI4QQ8RUo34jgWkquhe8tKtr1j5uz6EOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747372485; c=relaxed/simple;
	bh=lX8IBABKB+hcZ5K9brK2O4tRa1tSiyuPsl1Qt280K1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UjByQoC9XCrCJXKU+HXIrFE3foPOp/dldqc3vzt4dUhxSII+pjdyKyDHtkvydQgqttMzBa49qHjAOb4XHYoKBTNJ1Cl8I1XGdIaoDwJJ0oKi1m4z2UrKNKWlvPIGC9DF2WDsvLiScfnZV0gVQy1OBbl0dhao5S6JOYwWwB7rSic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=f9B2p0hp; arc=none smtp.client-ip=139.138.36.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="f9B2p0hp"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747372483; x=1778908483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lX8IBABKB+hcZ5K9brK2O4tRa1tSiyuPsl1Qt280K1w=;
  b=f9B2p0hpWBdPEXaI+zAvszdQekQSl4goKhxXrEGz07PJL5LrA5xNkSth
   aqsGtVLr1d+Went8X5EQuUCrf4k3b/WmcvrWJHgfjg7BPGVnPENCTOCqq
   1h4KUZA7xCdF7bIj/y9V142nZxoQt+z6YvUiCaxunoSYuEmqIuSAXeFwh
   Zjd7PellzfFiwjt/aT0OJIMmSy7rt45uVxBDV8Km0/JM0Sg+6lifKne4S
   grl+MnP+URGZmoLap72LMCHoqL5tzsHpvcv3fL4OXov/AMrjP4F7+aKUe
   yKXwR8gD4h0MBMkn00DLuA7KgO/0Yx06B+AurN25ZxlEieRh3M8Fg8lPc
   Q==;
X-CSE-ConnectionGUID: tP5of6PtQwGKnM5WSMil2A==
X-CSE-MsgGUID: JXEGDY8sR+GURscH8ZR5lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="188046182"
X-IronPort-AV: E=Sophos;i="6.15,293,1739804400"; 
   d="scan'208";a="188046182"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 14:14:35 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C6CCD4809
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:14:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 00BA4D52D5
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:14:33 +0900 (JST)
Received: from iaas-rpma.. (unknown [10.167.135.44])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 52FCE1A009A;
	Fri, 16 May 2025 13:14:32 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: nvdimm@lists.linux.dev
Cc: dan.j.williams@intel.com,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	ira.weiny@intel.com,
	linux-kernel@vger.kernel.org,
	Li Zhijian <lizhijian@fujitsu.com>
Subject: [PATCH 2/2] nvdimm/btt: Fix memleaks in btt_init()
Date: Fri, 16 May 2025 13:13:18 +0800
Message-Id: <20250516051318.509064-2-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250516051318.509064-1-lizhijian@fujitsu.com>
References: <20250516051318.509064-1-lizhijian@fujitsu.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call free_arenas() to release the arena instances in btt->arena_list
in the error paths.

Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
---
 drivers/nvdimm/btt.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index a11e4e7e9a52..a85448273a9a 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1597,7 +1597,7 @@ static struct btt *btt_init(struct nd_btt *nd_btt, unsigned long long rawsize,
 	if (btt->init_state != INIT_READY && nd_region->ro) {
 		dev_warn(dev, "%s is read-only, unable to init btt metadata\n",
 				dev_name(&nd_region->dev));
-		return NULL;
+		goto out;
 	} else if (btt->init_state != INIT_READY) {
 		btt->num_arenas = (rawsize / ARENA_MAX_SIZE) +
 			((rawsize % ARENA_MAX_SIZE) ? 1 : 0);
@@ -1607,25 +1607,29 @@ static struct btt *btt_init(struct nd_btt *nd_btt, unsigned long long rawsize,
 		ret = create_arenas(btt);
 		if (ret) {
 			dev_info(dev, "init: create_arenas: %d\n", ret);
-			return NULL;
+			goto out;
 		}
 
 		ret = btt_meta_init(btt);
 		if (ret) {
 			dev_err(dev, "init: error in meta_init: %d\n", ret);
-			return NULL;
+			goto out;
 		}
 	}
 
 	ret = btt_blk_init(btt);
 	if (ret) {
 		dev_err(dev, "init: error in blk_init: %d\n", ret);
-		return NULL;
+		goto out;
 	}
 
 	btt_debugfs_init(btt);
 
 	return btt;
+
+out:
+	free_arenas(btt);
+	return NULL;
 }
 
 /**
-- 
2.47.0

