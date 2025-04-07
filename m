Received: from unicom145.biz-email.net (unicom145.biz-email.net [210.51.26.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF6C14A82;
	Mon,  7 Apr 2025 09:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.26.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017627; cv=none; b=WfUEsIKQR8Ctom8wX6qq7cJDajdlw+gyIcHGTdMjmgzY8ezj80Lh1ZBLgx+dAARLGE1ywSTtil/Kp08X1LCxZzpb8OBVpp246otRWP0dnJsb07wRXQr5fDeC1lxsEOGD0TzP60kiOr4rP9O3EUyWhuy1nzAKxsVaJEJBVP3I7BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017627; c=relaxed/simple;
	bh=CPl8INMgGOzAvADQEx3BjbU2JRCbAKK6DKHGg6oiJ6w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r6x2AYcxe7lcmBrMhmAmcZW9DCIQGPDVFeSKwCp9JIO9UBzLbURPHFkiDbV+/KeO8JPsnXkKLY6yzIAIjXumOmi8RTev9SvKozc2bjxxfSZZeh9KXJff8WEgsQWnwftAMvcBDtunu43Yp7DhMvkdNWr/7TOnQkt/1MwLqD9vBJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.26.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201606.home.langchao.com
        by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202504071720120934;
        Mon, 07 Apr 2025 17:20:12 +0800
Received: from locahost.localdomain.com (10.94.5.217) by
 jtjnmail201606.home.langchao.com (10.100.2.6) with Microsoft SMTP Server id
 15.1.2507.39; Mon, 7 Apr 2025 17:20:11 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <david@lechnology.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Charles Han
	<hanchunchao@inspur.com>
Subject: [PATCH] clk: davinci: Add NULL check in davinci_lpsc_clk_register
Date: Mon, 7 Apr 2025 17:20:10 +0800
Message-ID: <20250407092010.6243-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 2025407172012fc51091f3a1ce8619daa09151724fcbe
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

devm_kasprintf() can return a NULL pointer on failure,but this
returned value in davinci_lpsc_clk_register() is not checked.
Add NULL check in davinci_lpsc_clk_register(), to handle kernel
NULL pointer dereference error.

Fixes: c6ed4d734bc7 ("clk: davinci: New driver for davinci PSC clocks")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/clk/davinci/psc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/davinci/psc.c b/drivers/clk/davinci/psc.c
index b48322176c21..872fed50dece 100644
--- a/drivers/clk/davinci/psc.c
+++ b/drivers/clk/davinci/psc.c
@@ -277,6 +277,11 @@ davinci_lpsc_clk_register(struct device *dev, const char *name,
 
 	lpsc->pm_domain.name = devm_kasprintf(dev, GFP_KERNEL, "%s: %s",
 					      best_dev_name(dev), name);
+	if (!lpsc->pm_domain.name) {
+		kfree(lpsc);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	lpsc->pm_domain.attach_dev = davinci_psc_genpd_attach_dev;
 	lpsc->pm_domain.detach_dev = davinci_psc_genpd_detach_dev;
 	lpsc->pm_domain.flags = GENPD_FLAG_PM_CLK;
-- 
2.43.0

