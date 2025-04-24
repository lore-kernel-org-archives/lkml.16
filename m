Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B4313A3F2;
	Thu, 24 Apr 2025 01:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745457117; cv=none; b=uI8qD0WuvSyFjdxoguKjeg+tJd4VkF/HYw46CoKaAUQeEbFrIUP/RJJoKfaHDX9YZHa95dVDlQmMYWvyPKtol1MGk6x/Qk5h71NOZ3djraY7BoS9Xh/wZTx38RlWTi9pThgC1wfY/ucMSP7cDmGMnYXNfs2U+EOxJWp8vTNx644=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745457117; c=relaxed/simple;
	bh=VQ9ADRqXAv9OIx0sN/Iwz4b/b4182DeUGxiXpu3LWkE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SfVBZAIVv8svOZWzWMQn663vLqvhdWuD0ATYgrAI8dQOSz9NrUUExCfJ93M3iqm/ARX5jal2egKwSp6qM+bEYXCXHW0KNix877+N/IzuPOPD8vZeum85ZIgrqdHgk8NOEngcgmF9SqcCpMtH/bh4NaTMBxVZWQKjWIoiXCaPqQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201622.home.langchao.com
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202504240910414881;
        Thu, 24 Apr 2025 09:10:41 +0800
Received: from localhost.localdomain (10.94.12.14) by
 jtjnmail201622.home.langchao.com (10.100.2.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Apr 2025 09:10:40 +0800
From: Bo Liu <liubo03@inspur.com>
To: <mail@carsten-spiess.de>, <jdelvare@suse.com>, <linux@roeck-us.net>,
	<kcfeng0@nuvoton.com>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Bo Liu
	<liubo03@inspur.com>
Subject: [PATCH] hwmon: convert to use maple tree register cache
Date: Wed, 23 Apr 2025 21:08:29 -0400
Message-ID: <20250424010829.2610-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: Jtjnmail201615.home.langchao.com (10.100.2.15) To
 jtjnmail201622.home.langchao.com (10.100.2.22)
tUid: 2025424091041df1b8c9d69ec004e4fe966f67a0a79a0
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache.

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 drivers/hwmon/isl28022.c | 2 +-
 drivers/hwmon/nct7363.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/isl28022.c b/drivers/hwmon/isl28022.c
index 1fb9864635db..0f27ac556f51 100644
--- a/drivers/hwmon/isl28022.c
+++ b/drivers/hwmon/isl28022.c
@@ -301,7 +301,7 @@ static const struct regmap_config isl28022_regmap_config = {
 	.writeable_reg = isl28022_is_writeable_reg,
 	.volatile_reg = isl28022_is_volatile_reg,
 	.val_format_endian = REGMAP_ENDIAN_BIG,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };
diff --git a/drivers/hwmon/nct7363.c b/drivers/hwmon/nct7363.c
index be7bf32f6e68..e13ab918b1ab 100644
--- a/drivers/hwmon/nct7363.c
+++ b/drivers/hwmon/nct7363.c
@@ -391,7 +391,7 @@ static const struct regmap_config nct7363_regmap_config = {
 	.val_bits = 8,
 	.use_single_read = true,
 	.use_single_write = true,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.volatile_reg = nct7363_regmap_is_volatile,
 };
 
-- 
2.31.1

