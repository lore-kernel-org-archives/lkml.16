Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191A12DFA49;
	Wed, 16 Apr 2025 04:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744776733; cv=none; b=dOp0aA3NjNe4DCL/Rh/TzTuFltjNBZnTlNo/vdKmcFeJgdY9Ah+F50ZlLDrs1csXXb+eS0udEPzHLOIZzwnjUm6aumiUWEuPOOo7p12JeCVz+VzMDNiNUqxtZKjhYhjE6oKihvqFbT5tiVMOjl/OK6YWHIel4d7N0ZK4NQUZgfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744776733; c=relaxed/simple;
	bh=KbD2l7HMWsXgSMotmp7Bo1+xa+qAwHmPMhxnFXaBnCs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t860L3AjUa069+txppxTOxx5Kd9lGmOfZM1dplYwgzoOoJ8Qz2tJv57Rz8flzzIBPUMKVV9fz+hK9pI4WQQpFrOT+Yeoo8juHVwjtOYOO2yHo0HacZi4xeoTU+0n8fT6wK5xVnxIhImMTVv+yRkUB236hHzSTrkJZQNiPtF7RNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowACHKvsGLv9n8gEuCQ--.1335S2;
	Wed, 16 Apr 2025 12:11:51 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	andriy.shevchenko@linux.intel.com,
	heiko@sntech.de,
	shengjiu.wang@nxp.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: ak4458: Remove useless return variable
Date: Wed, 16 Apr 2025 12:10:23 +0800
Message-Id: <20250416041023.546311-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACHKvsGLv9n8gEuCQ--.1335S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFW8Cw4xZr17CrW3CFyrXrb_yoWfKFc_C3
	yrWFW8XFyUtr9IyrWDtr1rAa9IvFnrA34vqrnIqFZrG348Jr4rJr9rJws3ua48Xr4Sya43
	G3ZIqry2yryxJjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbf8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r45MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjwFxUUUUUU==
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Remove unnecessary return variable and compress the return logic.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/soc/codecs/ak4458.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 5f3a68dfe7bd..6f648186408c 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -586,13 +586,9 @@ static const struct snd_pcm_hw_constraint_list ak4458_rate_constraints = {
 static int ak4458_startup(struct snd_pcm_substream *substream,
 			  struct snd_soc_dai *dai)
 {
-	int ret;
-
-	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
-					 SNDRV_PCM_HW_PARAM_RATE,
-					 &ak4458_rate_constraints);
-
-	return ret;
+	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+					  SNDRV_PCM_HW_PARAM_RATE,
+					  &ak4458_rate_constraints);
 }
 
 static const struct snd_soc_dai_ops ak4458_dai_ops = {
-- 
2.25.1

