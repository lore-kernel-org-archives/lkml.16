Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34082F1FF1;
	Sat, 28 Jun 2025 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751114101; cv=none; b=RV5I+6OJGsgETEM4ndyL3aDaUTfpYKNAP8voHiylZUvs1DpXVffprQqFITDs+bkEaVQd6gskefr5LNPsG9H1uz6eNNdviOE9jh24d/l62t3sjWNOthNNfHdrOT9THjjveYGceSI6ESEmJmS4ML88K+c4kj5wByP8A9BMp9KrZiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751114101; c=relaxed/simple;
	bh=fZb7LpjsVrzlP1r+wCxPxMIKpckAHDhxLgbdubvkivY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u97WmOnSc5Qs97ikmq4V63RNKeRusVopw0F/ut8KLvDyREbF0OObttiHcUmfHQMJ338B5f2ym0A3BQeEcau1Mk0pG0epoiErXnlrpMEdYqQUCifsxv0iXrRY0ZNZ2dGAKBe8vzKIL6WyUVVFjJxwkM3wHDGJZA35h/Wxykd6WLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bTsN65C1Qz27hfZ;
	Sat, 28 Jun 2025 20:35:50 +0800 (CST)
Received: from kwepemk100010.china.huawei.com (unknown [7.202.194.58])
	by mail.maildlp.com (Postfix) with ESMTPS id F39541402C1;
	Sat, 28 Jun 2025 20:34:54 +0800 (CST)
Received: from workspace-z00536909-5022804397323726849.huawei.com
 (7.151.123.135) by kwepemk100010.china.huawei.com (7.202.194.58) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 28 Jun
 2025 20:34:54 +0800
From: zhangjianrong <zhangjianrong5@huawei.com>
To: <andreas.noever@gmail.com>, <michael.jamet@intel.com>,
	<mika.westerberg@linux.intel.com>, <YehezkelShB@gmail.com>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <guhengsheng@hisilicon.com>, <caiyadong@huawei.com>,
	<xuetao09@huawei.com>, <lixinghang1@huawei.com>
Subject: [PATCH v2] thunderbolt: Check whether bandwidth request needs asymmetric mode before check whether it can be done
Date: Sat, 28 Jun 2025 20:34:53 +0800
Message-ID: <20250628123453.770988-1-zhangjianrong5@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk100010.china.huawei.com (7.202.194.58)

Current implementation may cause allocation failures in
tb_alloc_dp_bandwidth() in some cases. This will happen
when requesting downstream bandwidth while total upstream
bandwidth usage on the link exceeds TB_ASYM_MIN (36 Gbps).
tb_configure_asym() will return -ENOBUFS while asymmetric
mode isn't necessary.

Fixes: 3e36528c1127 ("thunderbolt: Configure asymmetric link if needed and bandwidth allows")
Signed-off-by: zhangjianrong <zhangjianrong5@huawei.com>
---
v2: update subject and commit message
v1: initial submission

 drivers/thunderbolt/tb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index a7c6919fbf97..558455d9716b 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -1039,6 +1039,9 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 			break;
 
 		if (downstream) {
+			/* Does consumed + requested exceed the threshold */
+			if (consumed_down + requested_down < asym_threshold)
+				continue;
 			/*
 			 * Downstream so make sure upstream is within the 36G
 			 * (40G - guard band 10%), and the requested is above
@@ -1048,20 +1051,17 @@ static int tb_configure_asym(struct tb *tb, struct tb_port *src_port,
 				ret = -ENOBUFS;
 				break;
 			}
-			/* Does consumed + requested exceed the threshold */
-			if (consumed_down + requested_down < asym_threshold)
-				continue;
 
 			width_up = TB_LINK_WIDTH_ASYM_RX;
 			width_down = TB_LINK_WIDTH_ASYM_TX;
 		} else {
 			/* Upstream, the opposite of above */
+			if (consumed_up + requested_up < asym_threshold)
+				continue;
 			if (consumed_down + requested_down >= TB_ASYM_MIN) {
 				ret = -ENOBUFS;
 				break;
 			}
-			if (consumed_up + requested_up < asym_threshold)
-				continue;
 
 			width_up = TB_LINK_WIDTH_ASYM_TX;
 			width_down = TB_LINK_WIDTH_ASYM_RX;
-- 
2.34.1

