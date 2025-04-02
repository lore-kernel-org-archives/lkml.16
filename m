Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DABD1514F6;
	Wed,  2 Apr 2025 09:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584460; cv=none; b=VCD9zLUwc9tS0wn4WbZ/7kAhVltDVx7AQXH1PTevNrKc/FNO/EOZLFKupbB8eYXjAFtoeYWYl9q9553x3zGtEci6c4//MkS7HKj9vV9TLxWjg+0bHl0kVut/DWZ5w9zwRBQW+oHZVW9BGN0jXK/WxsVOsEiGDwWWzzoLqat5Icw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584460; c=relaxed/simple;
	bh=G40FTHvvefX8hQBeAd4JXX9O6yhMx0LCfXFbr95mreo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qHZJp1hmrUr4flVADZx0foFrcZhyvRLFMURxEXRf60mhjyonmarQWdR4rkLcIFQDD0t/fZMUGR687KcU2RtELS7WqoFBI+0e0wE/Zeo9U7yQxuiNcWWjw+Q6CQvtYn6gk00/VVJXdLvsIGrYkIhyUqReUJnJAANpiCvLQSoBYdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZSJjY3wD6z13LHQ;
	Wed,  2 Apr 2025 17:00:17 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 4CAFC180116;
	Wed,  2 Apr 2025 17:00:49 +0800 (CST)
Received: from localhost.localdomain (10.90.30.45) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 2 Apr 2025 17:00:48 +0800
From: Jie Hai <haijie1@huawei.com>
To: <vkoul@kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <wangzhou1@hisilicon.com>,
	<liulongfang@huawei.com>
CC: <haijie1@huawei.com>
Subject: [PATCH] MAINTAINERS: Maintainer change for hisi_dma
Date: Wed, 2 Apr 2025 16:54:23 +0800
Message-ID: <20250402085423.347526-1-haijie1@huawei.com>
X-Mailer: git-send-email 2.30.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500004.china.huawei.com (7.202.181.242)

I am moving on to other things and longfang is going to
take over the role of hisi_dma maintainer. Update the
MAINTAINERS accordingly.

Signed-off-by: Jie Hai <haijie1@huawei.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0045ac4327b..a9866eefda15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10651,7 +10651,7 @@ F:	net/dsa/tag_hellcreek.c
 
 HISILICON DMA DRIVER
 M:	Zhou Wang <wangzhou1@hisilicon.com>
-M:	Jie Hai <haijie1@huawei.com>
+M:	Longfang Liu <liulongfang@huawei.com>
 L:	dmaengine@vger.kernel.org
 S:	Maintained
 F:	drivers/dma/hisi_dma.c
-- 
2.22.0

