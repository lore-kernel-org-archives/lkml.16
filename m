Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EAE12A177
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745457078; cv=none; b=I30U/iDF9miRflAE+q2cAU5hzxQijcbEQ5nLDjRg6Vdc43xmZZ+CXA9fGWqFyk6njwo1UgD50AUXxFafC4gOBXX7Cqn5z8xr++0rM/H3DKMXzhCGUmM2pl5PpH9Bzrf9myU8trBYOmKDCqAm75DTwM8zhQ41WpRSlIE92tOfXe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745457078; c=relaxed/simple;
	bh=WHkzM1lzXHEIzuPT8aq9kUuZQMvEn1Iv1aRiT7u9618=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cZLZbAUju21K9PGk3ZJKfSoY4enXRCx8XfMVDtzZiw3/7/74eGNBCdfDgffPZd71wzPVDdrr+fhz1fTlOfX2qSZDW4uXayQZqeFOZvY244AaWwewKURV1DDnkj7LYi30fj/fNydzZCS2TKqSZzhHoiLbCn3zMEV5HAqKpNlcdpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201622.home.langchao.com
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202504240911055127;
        Thu, 24 Apr 2025 09:11:05 +0800
Received: from localhost.localdomain (10.94.12.14) by
 jtjnmail201622.home.langchao.com (10.100.2.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Apr 2025 09:11:05 +0800
From: Bo Liu <liubo03@inspur.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Bo Liu <liubo03@inspur.com>
Subject: [PATCH] regulator: pf9453: convert to use maple tree register cache
Date: Wed, 23 Apr 2025 21:08:55 -0400
Message-ID: <20250424010855.2662-1-liubo03@inspur.com>
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
tUid: 2025424091105dadff58113dded5f31e254f5a7637797
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache.

Signed-off-by: Bo Liu <liubo03@inspur.com>
---
 drivers/regulator/pf9453-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/pf9453-regulator.c b/drivers/regulator/pf9453-regulator.c
index b58c9c0a5022..be627f49b617 100644
--- a/drivers/regulator/pf9453-regulator.c
+++ b/drivers/regulator/pf9453-regulator.c
@@ -214,7 +214,7 @@ static const struct regmap_config pf9453_regmap_config = {
 	.val_bits = 8,
 	.volatile_table = &pf9453_volatile_regs,
 	.max_register = PF9453_MAX_REG - 1,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 /*
-- 
2.31.1

