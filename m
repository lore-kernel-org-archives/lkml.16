Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFA879D2;
	Thu, 27 Mar 2025 03:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743044436; cv=none; b=nbrzZa7JbXmRxcmmqTSO5Xas+ZLXejqWjZTjAgh94bN0Y81rW1ftd25sm3+7JJqqJXACcDSbVYbHIIaWbY/jakHnB3uWrnqb8IP6SwM/F0SBT84eyi41qAJuW+diXeOq+2Yo9BPXhwdKJBrIp8n92nMlmcQ3uNnta6RAxMbY0Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743044436; c=relaxed/simple;
	bh=CMJd+9o4+q29ENHNqItOTyNLYXdYFlHP3WK83cvC9CM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X/2l9/VIc31Q9jFohLrJFOoO61IxCa0F3Xm1cSb8EYRVVdKk0i/jCBB+8pdGJuJzimWWtRY5ErlltQH9T+cy1KiZ9JK0uBRs1CY435/qO5kAadEmRxY27mS5QIvZPqt20yp23YPGlt/DpZZdyne8AGo+sodkuU/ach4lCy9K3CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowACn5g5Jv+RnKPEdAg--.2200S2;
	Thu, 27 Mar 2025 11:00:25 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: mitltlatltl@gmail.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	bryan.odonoghue@linaro.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] platform: arm64: huawei-gaokun-ec: Remove unneeded semicolon
Date: Thu, 27 Mar 2025 10:52:44 +0800
Message-Id: <20250327025244.1790897-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACn5g5Jv+RnKPEdAg--.2200S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWDuF4rXw4DAr17uFy8Zrb_yoW3Jrg_ur
	1kGFs7Jr18CF9Ikw15Ca93uFyqyasruw1xWF1ftas3Z3yaq3yrZryI93yfCan8ZrW5CFy7
	Cw4DKrW5CrWa9jkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AF
	wI0_JF0_Jw1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUjHqcUUUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/platform/arm64/huawei-gaokun-ec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c b/drivers/platform/arm64/huawei-gaokun-ec.c
index 97c2607f8d9f..7e5aa7ca2403 100644
--- a/drivers/platform/arm64/huawei-gaokun-ec.c
+++ b/drivers/platform/arm64/huawei-gaokun-ec.c
@@ -651,7 +651,7 @@ static int gaokun_ec_resume(struct device *dev)
 			break;
 
 		msleep(100); /* EC need time to resume */
-	};
+	}
 
 	ec->suspended = false;
 
-- 
2.25.1

