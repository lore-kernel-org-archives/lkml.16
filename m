Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CDE2F4A;
	Mon, 14 Apr 2025 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616893; cv=none; b=U1lubTeCibUew5J4AgaD7sEXHoKYm/VzCR4/9nD2doFzOCWJHch2UjpKmea8LQzv6pGhKwIg/7DChg6h9EZZfEO0ZMc7nTKgjcAqQI7NsJ6lqRRE71p062rKR5C9qLwYaDt+xZtP5SwiKU8Ki6/3hZOXXIkXAbmmZvce7GRj1ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616893; c=relaxed/simple;
	bh=WYwRR1Pc+EMmU7eSySZSDCumVjqm7uIRCv2bPRMdja8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lUFqFm08a/Sz9Om4yKgSftgjPSi17CMIsVh32VeWThCjKnlYUe3Cv0hRbG3Gjo7OL7yD4LbLBXaBrpZ9WDTvPPpm2ePBcxka5gCeoAta/77pvrls3yq6p4MikEcy4YnjjmlwCiP9R3QMuDVKLkXBrHWq879Oo88WQA97sv71Yz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowADnJA21vfxnc_znCA--.1690S2;
	Mon, 14 Apr 2025 15:48:05 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] hwmon: (lm90): Use to_delayed_work()
Date: Mon, 14 Apr 2025 15:47:39 +0800
Message-Id: <20250414074739.3954203-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADnJA21vfxnc_znCA--.1690S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw1xJF1kCFWktw1kJF4ktFb_yoW3Zwc_ur
	Wxury7ur45tFn3J3s8Cr43ZrWvywn5WFn2gFsYga98Z3ykJF1YvrW8ZrnrCr98WrW7AFnx
	G3sxWr45Cws7AjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUjb18PUUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Use to_delayed_work() instead of open-coding it.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/hwmon/lm90.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
index 75f09553fd67..c1f528e292f3 100644
--- a/drivers/hwmon/lm90.c
+++ b/drivers/hwmon/lm90.c
@@ -1235,7 +1235,7 @@ static int lm90_update_alarms(struct lm90_data *data, bool force)
 
 static void lm90_alert_work(struct work_struct *__work)
 {
-	struct delayed_work *delayed_work = container_of(__work, struct delayed_work, work);
+	struct delayed_work *delayed_work = to_delayed_work(__work);
 	struct lm90_data *data = container_of(delayed_work, struct lm90_data, alert_work);
 
 	/* Nothing to do if alerts are enabled */
-- 
2.25.1

