Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EDE1ACECD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616774; cv=none; b=GmipGt24vv0+RnfjZBOxBsE35griuRU6slS0nM+nRwR4sMEpiiAozwvego2GXsROUdzp3SrnWQOl+wqIbAzH6cIpLcrleezWNpNtxDuLHL21fP0C7yc4WXKswJMYQQilL4g44CmnsJOz3Aoa/UPZZDpENb6yMGTa2Iej0a6biLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616774; c=relaxed/simple;
	bh=Qt9vm15NOFrVEOnQCkSKBMaB9nTQJBHet842UoDQ0/0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T9JAHcZpFku9FKMVkW0QVD0yS047t+zaxuCQqLIliu7pjrwRasILdb3ySAfk+CTTi+gML7paEbuP0LrSO1eC6J/rCjbhPHsIoXBOUlQjCZAV1d5f54GmDt7tj6chosL0j4Dukr97+qW+Qlq4BNCEYc0AG8O6XY26eERCgp+I06o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowABHgQlBvfxnV+_nCA--.16083S2;
	Mon, 14 Apr 2025 15:46:09 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: eli.billauer@gmail.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] char: xillybus: Use to_delayed_work()
Date: Mon, 14 Apr 2025 15:45:59 +0800
Message-Id: <20250414074559.3954142-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABHgQlBvfxnV+_nCA--.16083S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw1xJF4xuF18Cr1UuryrXrb_yoWfXrc_u3
	409r47Wr1Fy34vkw1Ykws3ury8tw1fZ3Z5Gr1vg3W5A3y5Ar4UCry8uryDu345Gr4vvFy7
	G39rArW5uFsxKjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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
 drivers/char/xillybus/xillybus_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/char/xillybus/xillybus_core.c b/drivers/char/xillybus/xillybus_core.c
index 11b7c4749274..efb1ae834265 100644
--- a/drivers/char/xillybus/xillybus_core.c
+++ b/drivers/char/xillybus/xillybus_core.c
@@ -1184,8 +1184,7 @@ static int xillybus_flush(struct file *filp, fl_owner_t id)
 
 static void xillybus_autoflush(struct work_struct *work)
 {
-	struct delayed_work *workitem = container_of(
-		work, struct delayed_work, work);
+	struct delayed_work *workitem = to_delayed_work(work);
 	struct xilly_channel *channel = container_of(
 		workitem, struct xilly_channel, rd_workitem);
 	int rc;
-- 
2.25.1

