Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E83224AF9;
	Mon,  7 Apr 2025 06:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007277; cv=none; b=hvhkDa7fYLZgW2yvu5lVwtNVjMKznfXok64lbcHfBaKFKULKdZ/sk7UJ8reQJQmLiENK049S2mR8VlVA1FDtA0auUeO3NxJWuVxagAIkTyNAQHQGoE8R1s0BRjbOgiL+PNAkM6Kf5FfBHOdLAoFcwkELONlpYIOmpSNR5copkzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007277; c=relaxed/simple;
	bh=zoUVn8wIC8HyMX7A8Ub3RV6g1cPiQH7lrw8MYwAcj48=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CDHF3GgFy10gt1qrUyDR/MeYCJWiKlrzVtNv5SSTCyrOTuAc8phFctdVBi2FUImsaOWbGjdNVZh74w/lKi6+NbrMK3+AZ9757ZWDmCLhdqi/7AtcPd02Lz07guvT0HYqeVAiqC9quL8HhLpZSDZ4xybPPL1WkIexwDyBigA6ZF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowAC39g5icPNngCrQBg--.9691S2;
	Mon, 07 Apr 2025 14:27:46 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: tas2781-i2c: Remove unnecessary NULL check before release_firmware()
Date: Mon,  7 Apr 2025 14:27:25 +0800
Message-Id: <20250407062725.2771916-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC39g5icPNngCrQBg--.9691S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw18ZF4ktr4xXry8JrW5KFg_yoW3Arg_C3
	yru3ykuryrZrW3t3yYka15uFWIqFW3uaySvF4qkrWUJr1DJw4Fg3yUCr97uFW5WrWkAa43
	XF13GFWUAryYgjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbfxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU7uciUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

release_firmware() checks for NULL pointers internally.
Remove unneeded NULL check for fmw here.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/soc/codecs/tas2781-i2c.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index b950914b7d48..8d8a84a53766 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1505,8 +1505,7 @@ static void tasdevice_fw_ready(const struct firmware *fmw,
 		tasdevice_dsp_remove(tas_priv);
 	}
 	mutex_unlock(&tas_priv->codec_lock);
-	if (fmw)
-		release_firmware(fmw);
+	release_firmware(fmw);
 }
 
 static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
-- 
2.25.1

