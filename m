Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5E0269D09
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745850920; cv=none; b=KmmhhewzyHg2tKTL9THpDTqP0bopgUPhrQRRG6o6DRBWFAyFyqLhUKFhFXl9raMcPbm9v26KCDuLyDFr8XKd5VGwHePmJTtlLv/1SYlu5O6qdMZUOmc3K6UCHVfFwmKuZQfOmVhkaA6K8sf3letCUEYAQm8FRrecue5BgJEqHH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745850920; c=relaxed/simple;
	bh=OHXiiyB9pgTh3t9DOWLqrzpqhUbN8SQqjluYJf0UWdg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GrtPFXfldwPi3wjzcVbbp1uTB2gW3wkPu0nKH7ak9btT4N3Aef1RbH3p3GIT7pLcILBFTjDnaLmxjUm0Bykrg3+gY06C9HBf7lY+3VCxfCEbfQ/TdNjRrtVB0SxiPCsgRKBMrRIe3Ox51naKkP55VXUT5ZacX0zXsssq5U+AYdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZmQvX3Wy2z2TS20;
	Mon, 28 Apr 2025 22:34:48 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id ABA681402CE;
	Mon, 28 Apr 2025 22:35:11 +0800 (CST)
Received: from huawei.com (10.67.174.162) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 28 Apr
 2025 22:35:11 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <xiang@kernel.org>, <chao@kernel.org>, <zbestahu@gmail.com>,
	<jefflexu@linux.alibaba.com>
CC: <dhavale@google.com>, <linux-erofs@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <lihongbo22@huawei.com>
Subject: [PATCH] erofs: remove unused enum type
Date: Mon, 28 Apr 2025 14:26:31 +0000
Message-ID: <20250428142631.488431-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.22.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemo500009.china.huawei.com (7.202.194.199)

Opt_err is not used in EROFS, we can remove it.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 fs/erofs/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/erofs/super.c b/fs/erofs/super.c
index c1c350c6fbf4..fd365a611f13 100644
--- a/fs/erofs/super.c
+++ b/fs/erofs/super.c
@@ -356,8 +356,7 @@ static void erofs_default_options(struct erofs_sb_info *sbi)
 
 enum {
 	Opt_user_xattr, Opt_acl, Opt_cache_strategy, Opt_dax, Opt_dax_enum,
-	Opt_device, Opt_fsid, Opt_domain_id, Opt_directio,
-	Opt_err
+	Opt_device, Opt_fsid, Opt_domain_id, Opt_directio
 };
 
 static const struct constant_table erofs_param_cache_strategy[] = {
-- 
2.22.0

