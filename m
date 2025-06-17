Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5269B26AEC;
	Tue, 17 Jun 2025 04:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750134012; cv=none; b=DOhUPW5mZrryJYtW2CKS430edjCzfNR4Q1g3Bwoui8c3WsuD96FMoVuRrQlKia1idaZ+XQ1Rra7kq9wubQQK6sivcgrTIrt1Lnhutcn7Z90FWIC6f7ZJtFmFm7oTi97NSshwx28d8d4SK/CvhyLJnU17pT0KKigeNEJrd8G+pno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750134012; c=relaxed/simple;
	bh=E5x/K6RBVhHi2ah4F/edQfdOIfJu8cGZ3tetcEFuuZs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rFsAKwahthCiNla/qPAlBK/LckBaSuEUL+ATBh4Pcb65K8OLysPyGQFmOdVhlGblUUX53BjEFIxHGvZWXPZbDgsccglYQMed336V/j07J44EJlbWlFRqt9eZc0wvddWo3twTFJsbJ29ZKxTbXD4h1LsPdXLmDjTDpYvNKNaLtwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowACn9k7U7FBoRoUTBw--.127S2;
	Tue, 17 Jun 2025 12:19:32 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	u.kleine-koenig@baylibre.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: fsl-mph-dr-of: Remove unnecessary NULL check before clk_disable_unprepare()
Date: Tue, 17 Jun 2025 12:19:17 +0800
Message-Id: <20250617041917.1930885-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACn9k7U7FBoRoUTBw--.127S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XFyrKF1DXryUCFyrury5XFb_yoW3AFc_CF
	n8Gr4DWFykCr909r15KF13Ar4q9as0vr4ku3Z7t345GFyDXrs5Z34v9rWrWasxG3y8AF98
	Cws8Wr4rC3yxZjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbskFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfU80PfDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

clk_disable_unprepare() already checks NULL by using IS_ERR_OR_NULL.
Remove unneeded NULL check for clk here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/host/fsl-mph-dr-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
index 4e67b9471986..edfb63543029 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -327,8 +327,7 @@ static void fsl_usb2_mpc5121_exit(struct platform_device *pdev)
 
 	pdata->regs = NULL;
 
-	if (pdata->clk)
-		clk_disable_unprepare(pdata->clk);
+	clk_disable_unprepare(pdata->clk);
 }
 
 static struct fsl_usb2_platform_data fsl_usb2_mpc5121_pd = {
-- 
2.25.1

