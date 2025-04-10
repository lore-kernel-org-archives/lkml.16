Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46C62836B0
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285161; cv=none; b=pDa5dDzFAz1sV1zgO2xJ4bqIEeWADDi24tlgXywc+0rUNN/hvjjhJrbdalwaSjElj/h3tGdWEK3spqNsfbIqBL3xjhOAtKyPjOgC6qa4tO3PDDUWI9cZW4ApuT++obJj7Fdr6LPK1MRvcRHBEvbLXBWwKeelTigG793CDFD8Iig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285161; c=relaxed/simple;
	bh=qAei54Xa2x/J6syALssGYYM4t+XoYpbRyWi2COhabwM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=s6QUB2jmLoRvbVRNVCbgbaFUxqrRoC8zs11KxEuPaNXirIpIVJCo3WdIfj5V3FDu1zrLaO+F0TwXUbcuH8WnZ3gYfP+S6q7olPk470KazMbA+AzGTEWb3Nm1ew3btdH9bgZNfZxAvb5pkV1+lQtGI0vElcPwqHLKipBhZTzRGAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201601.home.langchao.com
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202504101939117181;
        Thu, 10 Apr 2025 19:39:11 +0800
Received: from locahost.localdomain.com (10.94.12.92) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server id
 15.1.2507.39; Thu, 10 Apr 2025 19:39:12 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <arnd@arndb.de>, <gregkh@linuxfoundation.org>, <jpanis@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH V2] misc: tps6594-pfsm: Add NULL check in tps6594_pfsm_probe
Date: Thu, 10 Apr 2025 19:39:11 +0800
Message-ID: <20250410113911.80495-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 2025410193911b664c2148255b42a5a797518920fa81b
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

devm_kasprintf() can return a NULL pointer on failure,but this
returned value in tps6594_pfsm_probe() is not checked.
Add NULL check in tps6594_pfsm_probe(), to handle kernel NULL
pointer dereference error.

Fixes: a0df3ef087f8 ("misc: tps6594-pfsm: Add driver for TI TPS6594 PFSM")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/misc/tps6594-pfsm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/misc/tps6594-pfsm.c b/drivers/misc/tps6594-pfsm.c
index 0a24ce44cc37..6db1c9d48f8f 100644
--- a/drivers/misc/tps6594-pfsm.c
+++ b/drivers/misc/tps6594-pfsm.c
@@ -281,6 +281,9 @@ static int tps6594_pfsm_probe(struct platform_device *pdev)
 	pfsm->miscdev.minor = MISC_DYNAMIC_MINOR;
 	pfsm->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "pfsm-%ld-0x%02x",
 					    tps->chip_id, tps->reg);
+	if (!pfsm->miscdev.name)
+		return -ENOMEM;
+
 	pfsm->miscdev.fops = &tps6594_pfsm_fops;
 	pfsm->miscdev.parent = dev->parent;
 	pfsm->chip_id = tps->chip_id;
-- 
2.43.0

