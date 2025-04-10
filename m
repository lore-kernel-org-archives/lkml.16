Received: from unicom146.biz-email.net (unicom146.biz-email.net [210.51.26.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A629326A0D1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744282397; cv=none; b=J80smSs9Y1H8zBnzrckJEsw653TdTLrUtEJfr0/hfx7+uKIw2ChGDRQZ7Nwrw3yLqXtMiFTpMaKi2RRkv8GEXKqnnq7eQkYXfLhcjQXbMebrq4LZF07Izc8+V5y703YVftjfo+ofbQI9GBg4J7ulEq1k5HKySQRtaftr1U8QsmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744282397; c=relaxed/simple;
	bh=saLwZDaFm21NvOGF1F8Bm1iSGBrAFhk4rdT1D6/TGEg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y+ofCnamxW+fEFhDIC9CxuUEsjzaxr+xft3S8QkFidgN2TUHx+tr7uD9C4NL5QveZ+VL4Vg8OvOfwQ3gWfs9S3+4QWpMa9Yrg5aQt9Emt7SOgmGZg0FRwxBGtRpNvam6QanKFRAeNwupdQSuypnuwlJXZfYGqVVIR59ZBTiQM9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201601.home.langchao.com
        by unicom146.biz-email.net ((D)) with ASMTP (SSL) id 202504101853013014;
        Thu, 10 Apr 2025 18:53:01 +0800
Received: from locahost.localdomain.com (10.94.12.92) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server id
 15.1.2507.39; Thu, 10 Apr 2025 18:53:03 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <arnd@arndb.de>, <gregkh@linuxfoundation.org>, <jpanis@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] misc: tps6594-pfsm: Add NULL check in tps6594_pfsm_probe
Date: Thu, 10 Apr 2025 18:52:53 +0800
Message-ID: <20250410105256.70310-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 202541018530270b4723268073f9a138e02d94a0d95f7
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
 drivers/misc/tps6594-pfsm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/misc/tps6594-pfsm.c b/drivers/misc/tps6594-pfsm.c
index 0a24ce44cc37..05c4e081a8d2 100644
--- a/drivers/misc/tps6594-pfsm.c
+++ b/drivers/misc/tps6594-pfsm.c
@@ -281,6 +281,11 @@ static int tps6594_pfsm_probe(struct platform_device *pdev)
 	pfsm->miscdev.minor = MISC_DYNAMIC_MINOR;
 	pfsm->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "pfsm-%ld-0x%02x",
 					    tps->chip_id, tps->reg);
+	if (!pfsm->miscdev.name) {
+		devm_kfree(dev, pfsm);
+		return -ENOMEM;
+	}
+
 	pfsm->miscdev.fops = &tps6594_pfsm_fops;
 	pfsm->miscdev.parent = dev->parent;
 	pfsm->chip_id = tps->chip_id;
-- 
2.43.0

