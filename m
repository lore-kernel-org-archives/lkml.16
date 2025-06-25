Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6965F3FD1;
	Wed, 25 Jun 2025 06:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750832713; cv=none; b=ppq+otA+zAaYxH6EIVRa88ZsiDRvxQICutHa2MxJbwwWVm6Ta3qFh2sJ3/48B9tza+qdGGnUtvGGC0xK7g9y2XXLIVonT0APZDcS2mIANwIIvtO+PVzgK2wyc23zvEHQwGlaBUdJlzGqLkJGe/RKLeFKFaD72ZbexyAHk9Sbf18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750832713; c=relaxed/simple;
	bh=dZKm5KfQtYHI7vcG17oCgjnMxBUz/7Dny5uT0z3+jpo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pAGG8j4aOHvyq5ACeBNH+/z+Mrn+Ri7PQ40Dv0AgGTf/58fkU+KZ9y+SIgTL0tZja54JG75h1X552AINS4gpB0qF5X462zZ/YarhxOtp91v1gFUh+8bJOA8op0wHZg790WwBEhFWXmlPPv+Xt91ojgIVJf63kixopxR+e0T7eCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bRsBl6DrfzSjSt;
	Wed, 25 Jun 2025 14:20:47 +0800 (CST)
Received: from kwepemk100010.china.huawei.com (unknown [7.202.194.58])
	by mail.maildlp.com (Postfix) with ESMTPS id 4E8F4180064;
	Wed, 25 Jun 2025 14:25:07 +0800 (CST)
Received: from workspace-z00536909-5022804397323726849.huawei.com
 (7.151.123.135) by kwepemk100010.china.huawei.com (7.202.194.58) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 25 Jun
 2025 14:25:06 +0800
From: zhangjianrong <zhangjianrong5@huawei.com>
To: <andreas.noever@gmail.com>, <michael.jamet@intel.com>,
	<mika.westerberg@linux.intel.com>, <YehezkelShB@gmail.com>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <guhengsheng@hisilicon.com>, <caiyadong@huawei.com>,
	<xuetao09@huawei.com>, <lixinghang1@huawei.com>
Subject: [PATCH] thunderbolt: Process xdomain response packets synchronously
Date: Wed, 25 Jun 2025 14:25:05 +0800
Message-ID: <20250625062505.1596787-1-zhangjianrong5@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk100010.china.huawei.com (7.202.194.58)

Xdomain response packets don't belong to async event. It seems
no harm now but better to be fixed.

Signed-off-by: zhangjianrong <zhangjianrong5@huawei.com>
---
 drivers/thunderbolt/ctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 4bdb2d45e0bf..1873b64caf7c 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -461,6 +461,7 @@ static void tb_ctl_rx_callback(struct tb_ring *ring, struct ring_frame *frame,
 	case TB_CFG_PKG_ERROR:
 	case TB_CFG_PKG_OVERRIDE:
 	case TB_CFG_PKG_RESET:
+	case TB_CFG_PKG_XDOMAIN_RESP:
 		if (*(__be32 *)(pkg->buffer + frame->size) != crc32) {
 			tb_ctl_err(pkg->ctl,
 				   "RX: checksum mismatch, dropping packet\n");
@@ -474,7 +475,6 @@ static void tb_ctl_rx_callback(struct tb_ring *ring, struct ring_frame *frame,
 		break;
 
 	case TB_CFG_PKG_EVENT:
-	case TB_CFG_PKG_XDOMAIN_RESP:
 	case TB_CFG_PKG_XDOMAIN_REQ:
 		if (*(__be32 *)(pkg->buffer + frame->size) != crc32) {
 			tb_ctl_err(pkg->ctl,
-- 
2.34.1

