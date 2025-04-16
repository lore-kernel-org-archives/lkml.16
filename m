Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B771B808;
	Wed, 16 Apr 2025 04:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744776923; cv=none; b=RvLsPlN+SKDrRdChpc8QivszsgDRpYjozSgakcspUUF9+I4KcOjjdDC9xNhG22+3Ka5p93Gq9iJNty5VlMVh/PXdW3azR5lsEYGoCHV4dMC0+NBW46F3EPxEskb5Aa6XaRpKqaWCzT+ok2498ncPjoiKgbhTXCsj9yPSy+FQ33Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744776923; c=relaxed/simple;
	bh=DhIJdKETu2svIn7GUJc3RqlkweRMS9CsMO84APKw/t4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dYxHv+3DX9bsyA3Moe5ZidRxF2YMatAcDqddnYSIuIuNgMk6oIeriOm++DhLkOLn78mU16gUAoe/B/tNZFJaHOiiG2dT2kUdM5q6ByfeC0KRfbadVpvJpNGJtjbPqqvF9VxtTMFiym3uSNg/ias1rzAQCJ1r18bJpqfb1J9d2yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowABXAgPQLv9nRi8uCQ--.13988S2;
	Wed, 16 Apr 2025 12:15:12 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: fsl_rpmsg: Remove useless return variable
Date: Wed, 16 Apr 2025 12:14:31 +0800
Message-Id: <20250416041431.546370-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABXAgPQLv9nRi8uCQ--.13988S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFW8Cw47WryxJF4rGw1kGrg_yoWDJrg_Gw
	4FgrWYqFWj939YyF1DCw47JFWY9FsFyw4qqrsFqanxG398tr4rXr9rtrs3u3s5Wr1rJ3yr
	GwsIqr93AFyxXjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb6xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8Xw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
	vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUcvtZUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Remove unnecessary return variable and compress the return logic.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/soc/fsl/fsl_rpmsg.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index 0a551be3053b..6d67db4e0581 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -97,13 +97,9 @@ static int fsl_rpmsg_hw_free(struct snd_pcm_substream *substream,
 static int fsl_rpmsg_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *cpu_dai)
 {
-	int ret;
-
-	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
-					 SNDRV_PCM_HW_PARAM_RATE,
-					 &fsl_rpmsg_rate_constraints);
-
-	return ret;
+	return snd_pcm_hw_constraint_list(substream->runtime, 0,
+					  SNDRV_PCM_HW_PARAM_RATE,
+					  &fsl_rpmsg_rate_constraints);
 }
 
 static const struct snd_soc_dai_ops fsl_rpmsg_dai_ops = {
-- 
2.25.1

