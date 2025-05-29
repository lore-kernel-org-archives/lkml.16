Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9DF20DD48
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 08:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748506791; cv=none; b=urF7NvlgIPXIWk38fjCbBrPsHgqvoRiWVs2iIM5ktWFJTStDSphEg6eiCm4rcWWBRt0ygwKBuSEDX+WbjI65kji4CiOXqNzHexyDYQ2c1acRRW9dx0hMJWoT98oXHiwq1THBh8KWhoU3js0xL9s8rMC1gBJno764XDxv6i3pdR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748506791; c=relaxed/simple;
	bh=TXdSGgKg8tlVTyqVp+omVz/ZTcvkuQxgTBlz7bCUH5w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ljO8zfPHb87LlnyphLyWzDKIMs5FQk0ASa7UFuM8wVJQ4u2NfaCLTwbf2jPDYaMWzw7rpT0Q6sZyH3379WkJIwhetZZ+cBej3vF/Gpj7cwh1LvZhm+yCztdfBo0r0bxr4qJ1xep50QYnMa6QN8Uxf2JE2efpZK9zRDDEaX0JVDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4b7K5214ngztRcm
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:18:30 +0800 (CST)
Received: from dggpemf500006.china.huawei.com (unknown [7.185.36.235])
	by mail.maildlp.com (Postfix) with ESMTPS id 4E605140134
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:19:44 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 dggpemf500006.china.huawei.com (7.185.36.235) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 29 May 2025 16:19:43 +0800
From: Yang Shen <shenyang39@huawei.com>
To: <xuwei5@huawei.com>, <prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<f.fangjian@huawei.com>
CC: <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: Update HiSilicon LPC BUS driver maintainer
Date: Thu, 29 May 2025 16:19:29 +0800
Message-ID: <20250529081929.455172-1-shenyang39@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500006.china.huawei.com (7.185.36.235)

Add Yang Shen as the maintainer of the HiSilicon LPC BUS driver,
replacing Jay Fang.

Signed-off-by: Yang Shen <shenyang39@huawei.com>
Reviewed-by: Jay Fang <f.fangjian@huawei.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d2074d16107..37ae93625dcf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10795,7 +10795,7 @@ F:	drivers/soc/hisilicon/kunpeng_hccs.c
 F:	drivers/soc/hisilicon/kunpeng_hccs.h
 
 HISILICON LPC BUS DRIVER
-M:	Jay Fang <f.fangjian@huawei.com>
+M:	Yang Shen <shenyang39@huawei.com>
 S:	Maintained
 W:	http://www.hisilicon.com
 F:	Documentation/devicetree/bindings/arm/hisilicon/low-pin-count.yaml
-- 
2.33.0

