Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009D02741A9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913579; cv=none; b=Faap7XgIgmbWh/MSlG/vBcoVuoOgroIDbl+fVViZdT7ckcAQHBBwBoXZquw3IT1BrAaEXC9wREBmsA7BdKZJuI0l40HPCy2nGlDyuVd1M67WO6XNU+F5xQuap8cgLABa9YDREd8foTA5uj6f+020aWV9lIqOrX0TNuCN8rsK9hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913579; c=relaxed/simple;
	bh=a8/bR03nWNNF0h9DLNiIrMGQ5h6mLdK3xsw9vE+jHVo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kirc4me/jXfUEMGUNJ/2IFHaV7PC3IOJsTKTSu0QWjrdeLFIQxsH/7eyZfspY3nTc6uCtaTbTPh90COFALdznK+2IQ8Wyz8xO9/LF5VqmebbOOnXW1SP/G85Jyut9Q8McbN7vkqxgyRn90t6qfdbRQsGfodWquYkYguUY1t3wIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Zmt3m6mGXz1d19h;
	Tue, 29 Apr 2025 15:58:28 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 75BEE1402ED;
	Tue, 29 Apr 2025 15:59:35 +0800 (CST)
Received: from huawei.com (10.67.174.162) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 29 Apr
 2025 15:59:34 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <xiang@kernel.org>, <chao@kernel.org>, <zbestahu@gmail.com>,
	<jefflexu@linux.alibaba.com>
CC: <dhavale@google.com>, <linux-erofs@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH v2] erofs: remove unused enum type
Date: Tue, 29 Apr 2025 07:50:56 +0000
Message-ID: <20250429075056.689570-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.22.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemo500009.china.huawei.com (7.202.194.199)

Opt_err is not used in EROFS, we can remove it.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
v1: https://lore.kernel.org/all/20250428142631.488431-1-lihongbo22@huawei.com/
  - Keep the trailing ','.
---
 fs/erofs/super.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index cadec6b1b554..da6ee7c39290 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -357,7 +357,6 @@ static void erofs_default_options(struct erofs_sb_info *sbi)
 enum {
 	Opt_user_xattr, Opt_acl, Opt_cache_strategy, Opt_dax, Opt_dax_enum,
 	Opt_device, Opt_fsid, Opt_domain_id, Opt_directio,
-	Opt_err
 };
 
 static const struct constant_table erofs_param_cache_strategy[] = {
-- 
2.22.0

