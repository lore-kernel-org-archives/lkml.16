Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5D31E32C3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744271831; cv=none; b=D4VkoZI/uaUh8Q3Ml6Wdi6q2/HZCRxUfkNdvXwFjT8BKmCUssXfWxWlKoNFwoxirj0NMPziehKGmL2Nv8NlMkn/seBGuWi1VTEXH+vHc6zB5fborCq06XADwj9zjCFis8LCNAFilQcv+aNT3d6a6hwuLF1SsNeYGsfYL1Mbz1cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744271831; c=relaxed/simple;
	bh=qFfvB2rsue/WusNoGRjgVtox6CxU1YzCZbivxFrW/9s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q5UWtMe0/328xOLhD3uTLjPb5S5nl5QdjraD/nAPNIkFAfr6LzRf/h8trfjPRxRpsDFeVnxQTdmsFr/amzi8wUFUPOZM/kAxRIuDau5DK2Ywv4OvsgCoQ5CZCJLi4qbkXGa/SqoFGL5FZD0Vwm4lOqIh0tZpIQN5kBR+BXP3wns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowADHbf7NefdnZCDVBw--.12380S2;
	Thu, 10 Apr 2025 15:57:02 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: jens.wiklander@linaro.org,
	sumit.garg@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] tee: optee: smc: remove unnecessary NULL check before release_firmware()
Date: Thu, 10 Apr 2025 15:56:35 +0800
Message-Id: <20250410075635.3558712-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADHbf7NefdnZCDVBw--.12380S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw18ZF4ktr4xXry8CF17KFg_yoWxurg_Cr
	4kC3Z7Wr1rZrW8tw17AayfZryqgas8Zr4kZ3ZFyFW3KanrA3yY9FyjvFsxZas3Z39rKF90
	yr4UJr4UAas8ujkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUjyE_tUUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

release_firmware() checks for NULL pointers internally.
Remove unneeded NULL check for fmw here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/tee/optee/smc_abi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index f0c3ac1103bb..26f8f7bbbe56 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1551,8 +1551,7 @@ static int optee_load_fw(struct platform_device *pdev,
 		  data_pa_high, data_pa_low, 0, 0, 0, &res);
 	if (!rc)
 		rc = res.a0;
-	if (fw)
-		release_firmware(fw);
+	release_firmware(fw);
 	kfree(data_buf);
 
 	if (!rc) {
-- 
2.25.1

