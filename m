Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF6F188A0E;
	Mon,  7 Apr 2025 06:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744006850; cv=none; b=kqhGfvKNJAsbrVnlByzJoe1lTAoVpRZ3laDIjCGkkV/JYeIlwP7UNWa4yEZVLDqarymUC5HSpNQ9B/ei3lmLzziSngEqnZ5OB7MU2xSdkWVq8ZHoXX6PPjdnkS+Xi61Ms2TxteNM80KTr8awh3K25DjMui+d/5hksUN5Hp1LefI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744006850; c=relaxed/simple;
	bh=kxPU36NHbznjgMk9d+008xEfUM7BFBvgFh9CNVtNsrw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BwHYQURfmf/kZ8r5MxqXh5SsxK6sTVFGbYkQfmUjx+iJiVDM6CStVRa2KrOShsQPdmT2pjVdjKaUWBiCRY0dCA0gbmRm1xVTtCafHPvT1kcFLtTwkz3vyrolfKkGwvNcbiLaqeeoEwOVzzZ6ylTP0Y/pHiP7/CWsauATlGZnV+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowADnIwyvbvNn2NrPBg--.10924S2;
	Mon, 07 Apr 2025 14:20:31 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	dan.carpenter@linaro.org,
	baojun.xu@ti.com,
	broonie@kernel.org,
	ckeepax@opensource.cirrus.com,
	andriy.shevchenko@linux.intel.com,
	nathan@kernel.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ALSA: hda/tas2781: Remove unnecessary NULL check before release_firmware()
Date: Mon,  7 Apr 2025 14:19:39 +0800
Message-Id: <20250407061939.2771803-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADnIwyvbvNn2NrPBg--.10924S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw18ZF4ktr4xXry8Cry7Awb_yoW3Wrb_CF
	4rCr1kuF48X39Fqw13ZF1YvrWfXasrZryxWr1SkFWUJa93K3yFga4UCF1DWFZ8urWFk3sa
	grn8Ca1DAryqqjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8FApDUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

release_firmware() checks for NULL pointers internally.
Remove unneeded NULL check for fmw here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/pci/hda/tas2781_hda_spi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
index 399f2e4c3b62..25175ff4b3aa 100644
--- a/sound/pci/hda/tas2781_hda_spi.c
+++ b/sound/pci/hda/tas2781_hda_spi.c
@@ -1003,8 +1003,7 @@ static void tasdev_fw_ready(const struct firmware *fmw, void *context)
 	 */
 
 out:
-	if (fmw)
-		release_firmware(fmw);
+	release_firmware(fmw);
 	pm_runtime_mark_last_busy(tas_hda->priv->dev);
 	pm_runtime_put_autosuspend(tas_hda->priv->dev);
 }
-- 
2.25.1

