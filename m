Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC4819A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749708050; cv=none; b=jk0opMeF80WnCZAOgsTdEOz78RFm7sxYonUpUrIsUMXmkso+HuuVRY8imJCVuK+G76gPoqhFSELsiiap1WoWki0xuQx67u1ZF6sBRbbQ128OM1dn29/cYfeoY4t9YtEXUBeY2r+y4y0rrjVTXjMOHX4UnjgaDESa1bbqMweYYxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749708050; c=relaxed/simple;
	bh=GDvuOTC1L83xOm6sqH/DJEmqE+NIMjdEDgDrSBYIUVw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PlpcKbp/kUOjp7HbVRRRpXqKjCTpgW4y58eFK0VHAa2EPCBKlJn/hWQ4t2l3DpU8dhSdikYDfgFMDbMAWNE0jmc6cOkFzY1rIul9Bn09zhL9aWWzblSM/ndxN0cAt3Au99eQGstece1eLAQJPaBuH0XaHd3pfwesS+g+G8k0wiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowACHNtX3bEpo1oH6BQ--.46002S2;
	Thu, 12 Jun 2025 14:00:23 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dmitry.baryshkov@oss.qualcomm.com,
	dianders@chromium.org,
	biju.das.jz@bp.renesas.com,
	luca.ceresoli@bootlin.com,
	tommaso.merciai.xr@bp.renesas.com,
	aford173@gmail.com,
	jesseevg@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] drm/bridge: adv7511: Convert comma to semicolon
Date: Thu, 12 Jun 2025 13:52:18 +0800
Message-Id: <20250612055218.1517952-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACHNtX3bEpo1oH6BQ--.46002S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr4rCw4kuw4kuw1xGrW3ZFb_yoWkJrXEkF
	1fu3Z7Xr1Yy3Wqkw13ArWYvFW2k3WUuFZ5u3Z3ta1ayr45Zr129w17Xr4kXF15uF4jkr15
	Jw1jqr4rAa47KjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbDxYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE14
	v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTiCJmxUUUU
	U
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace comma between expressions with semicolons.

Using a ',' in place of a ';' can have unintended side effects.
Although that is not the case here, it is seems best to use ';'
unless ',' is intended.

Found by inspection.
No functional change intended.
Compile tested only.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 9df18a8f2e37..418a403586f6 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1278,7 +1278,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 						  SNDRV_PCM_FMTBIT_S20_3LE |
 						  SNDRV_PCM_FMTBIT_S24_3LE |
 						  SNDRV_PCM_FMTBIT_S24_LE |
-						  SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE),
+						  SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE);
 	adv7511->bridge.hdmi_audio_spdif_playback = 1;
 	adv7511->bridge.hdmi_audio_dai_port = 2;
 #endif
-- 
2.25.1

