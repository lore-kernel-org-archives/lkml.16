Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6AF2260C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 03:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747192978; cv=none; b=NIfpTy0EqFZhMC2GSMC2qjFN/91EksURLjm2ADbvEjNqh+Vj7TYoF1FCUCN1tI2j+QeGJxkZRtg7A3SYIpWQoUxq0fhuU/S8NsxHLgX1POdTVvrLCis43SKeOwSdni+wsryajclaaBjZ9NbXrCmS/ixMrkhs9x//stUveOMartk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747192978; c=relaxed/simple;
	bh=JHjw40U/jLRTYa/Yaf6ozNMpJStR/ybWKAoPyGJvYU4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HwUMsJZh587UkaI0U9wSDYF7FwaYga1TNYHb7bhZQiSCc16oI8q1FEZE0AcWvqtJ7DdsBrYSjkwccWUDqElbzbsf9K/WwVHL2RsVnwmSwNfab/9VE4L160F8FkuEEcR8ltYNF0Ft3lgbFiOGN4V7lNVAwjutmdyw7GepV+k1MqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAAHRg6EDCRoqHoFFQ--.22191S2;
	Wed, 14 May 2025 11:22:44 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: phil@philpotter.co.uk
Cc: linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] cdrom: Remove unnecessary NULL check before unregister_sysctl_table()
Date: Wed, 14 May 2025 11:21:39 +0800
Message-Id: <20250514032139.2317578-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAAHRg6EDCRoqHoFFQ--.22191S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw18ZF4DKw4xCryrGw47twb_yoWxtrb_Ka
	40qr4xJryFyr1DWryjyw15uFWjk3Z09rna9F1jgrn8Ja4DZr48Wr4UZr1UXwsrWay8CFnx
	AryUXrya9rWj9jkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-xFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx
	8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIF
	xwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I
	0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
	GVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
	0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
	rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
	4UJbIYCTnIWIevJa73UjIFyTuYvjTREGQ6UUUUU
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

unregister_sysctl_table() checks for NULL pointers internally.
Remove unneeded NULL check here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/cdrom/cdrom.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
index b163e043c687..21a10552da61 100644
--- a/drivers/cdrom/cdrom.c
+++ b/drivers/cdrom/cdrom.c
@@ -3677,8 +3677,7 @@ static void cdrom_sysctl_register(void)
 
 static void cdrom_sysctl_unregister(void)
 {
-	if (cdrom_sysctl_header)
-		unregister_sysctl_table(cdrom_sysctl_header);
+	unregister_sysctl_table(cdrom_sysctl_header);
 }
 
 #else /* CONFIG_SYSCTL */
-- 
2.25.1

