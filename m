Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0907419D07A;
	Thu, 26 Jun 2025 08:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927274; cv=none; b=jWXaxiiXqsTUPJm/tJHJAITq9SMZMndDjkCrToPlzdCsy4Bs0jrcTn+kO0eNlYIEh/L5W8U3zybRysOX5ZgvqAFZfu7EZEcZ/hatLBsw96iKn98NCunu0t3HqE4pnOG5cCLB1g3xaQoOzVkVIoTKynqdis3pZ2ssBNfpleFV6Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927274; c=relaxed/simple;
	bh=xinQQrcuHzr483RDKEZo78Kp7bs45VB/+CibLt7BB6U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=myJ/Xw1ii3EUHvQR7Qdi5CVDcV9WHPhTg88AEdLyGVE7dvlTFVd7Z3obDKcxxW5iG524aV6rkFjznpCMw9cDhDb3+uGykBirHpZK6SFOBjvO9bifyQ0fgxEq4PopVkVGw1LMrLkZNAXiVVrR2c2O3R1Ahd+uEeZV3rJFHR/smow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bSX9g00WyzdbjH;
	Thu, 26 Jun 2025 16:37:10 +0800 (CST)
Received: from kwepemk100010.china.huawei.com (unknown [7.202.194.58])
	by mail.maildlp.com (Postfix) with ESMTPS id 34E31180080;
	Thu, 26 Jun 2025 16:41:09 +0800 (CST)
Received: from workspace-z00536909-5022804397323726849.huawei.com
 (7.151.123.135) by kwepemk100010.china.huawei.com (7.202.194.58) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 26 Jun
 2025 16:41:08 +0800
From: zhangjianrong <zhangjianrong5@huawei.com>
To: <andreas.noever@gmail.com>, <michael.jamet@intel.com>,
	<mika.westerberg@linux.intel.com>, <YehezkelShB@gmail.com>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <guhengsheng@hisilicon.com>, <caiyadong@huawei.com>,
	<xuetao09@huawei.com>, <lixinghang1@huawei.com>
Subject: [PATCH] thunderbolt: Confirm the necessity to configure asym link first
Date: Thu, 26 Jun 2025 16:41:07 +0800
Message-ID: <20250626084107.2710306-1-zhangjianrong5@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk100010.china.huawei.com (7.202.194.58)

Current implementation can cause allocation failures in
tb_alloc_dp_bandwidth() in some cases. For example:
allocated_down(30Gbps), allocated_up(50Gbps),
requested_down(10Gbps).

Signed-off-by: zhangjianrong <zhangjianrong5@huawei.com>
---
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

