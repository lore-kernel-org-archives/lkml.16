Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B121C7081F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750681796; cv=none; b=Ud+fZbHuD5uKhG8s5Igtd7NpyZ/g7ma6UQ+Z4vEzOoD44ZeAzXRM0djJwv5wdFv/fBL7kBGa5vO3dmmAeyqt3gZE4u7SC+myJUxxvTq7dg6bKkS3kDkAOQbbZEmhNi3CC7A6DSBAw3rYqo7H5r5hBr9Ce3H5lDyrOh7nSaonOb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750681796; c=relaxed/simple;
	bh=i9mgmZCowBJf7D6VH94m7N4iq4ToxXJ9baGkvlw8tXo=;
	h=Date:Message-ID:Mime-Version:From:To:Cc:Subject:Content-Type; b=AoKkMrY9e94hFHxhZdZIOiD++tCG0XBJw219VyEvegWi9Jk8EK7zzAlUxW4bm/51AI//JnauWzDXe+fdJb9WMmETe2hmCZABMiOoOYJrDx8EQAXiv7Fye9oj7wKL+6rI8UzWbgpGhh+Cusal72G3B0r0gm5ObyMcFnWPPUEOZSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bQnTW55fcz5FHS1;
	Mon, 23 Jun 2025 20:29:51 +0800 (CST)
Received: from njy2app01.zte.com.cn ([10.40.12.136])
	by mse-fl2.zte.com.cn with SMTP id 55NCTfS1075714;
	Mon, 23 Jun 2025 20:29:41 +0800 (+08)
	(envelope-from long.yunjian@zte.com.cn)
Received: from mapi (njb2app07[null])
	by mapi (Zmail) with MAPI id mid201;
	Mon, 23 Jun 2025 20:29:44 +0800 (CST)
Date: Mon, 23 Jun 2025 20:29:44 +0800 (CST)
X-Zmail-TransId: 2aff685948b875a-50da9
X-Mailer: Zmail v1.0
Message-ID: <20250623202944425TQzPdeMtYA8qRtlrnwiR8@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <long.yunjian@zte.com.cn>
To: <arnd@arndb.de>
Cc: <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
        <fang.yumeng@zte.com.cn>, <mou.yi@zte.com.cn>, <xu.lifeng1@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBtaXNjOiBlbmNsb3N1cmU6IFVzZSBzdHJfb25fb2ZmKCkgaGVscGVy?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55NCTfS1075714
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 685948BF.000/4bQnTW55fcz5FHS1

From: Yumeng Fang <fang.yumeng@zte.com.cn>

Remove hard-coded strings by using the str_on_off() helper.

Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
---
 drivers/misc/enclosure.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/enclosure.c b/drivers/misc/enclosure.c
index 76511d279aff..ca4c420e4a2f 100644
--- a/drivers/misc/enclosure.c
+++ b/drivers/misc/enclosure.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>

 static LIST_HEAD(container_list);
 static DEFINE_MUTEX(container_list_lock);
@@ -592,7 +593,7 @@ static ssize_t get_component_power_status(struct device *cdev,
 	if (ecomp->power_status == -1)
 		return (edev->cb->get_power_status) ? -EIO : -ENOTTY;

-	return sysfs_emit(buf, "%s\n", ecomp->power_status ? "on" : "off");
+	return sysfs_emit(buf, "%s\n", str_on_off(ecomp->power_status));
 }

 static ssize_t set_component_power_status(struct device *cdev,
-- 
2.25.1
