Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE46188A0E;
	Mon,  7 Apr 2025 06:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007091; cv=none; b=QGgbBKtr6CE/UePaMQ90gqiTL1f9d4g+wYmtEguhXqNS7pmMHSKNOnRpXR4VzMAGuImkZiOTBTAli50m08/aNVPadCieK/CmCEDAkX9pXfhUoU2uap8KHAb2b82BP3xhCPN0GjqDRCVTH+X/xK0LRk2pO0+okC19j18G+1IkJPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007091; c=relaxed/simple;
	bh=JXgUrF4nrWx7Zygv7RhQXfb2sqjBHu0OJ3p4aMH81YM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jQPm+oG8Fulk9bZog87sRqjcE+S79ggBfsgLZRb3adwg+cCIZuJVt31oiakHdTh03Tnk6T/AFPgYXTRh/SleY5+edhlqwK7D/Jed5oMLRIWXBELIe8PNqKLU+JqQW8muIu5TD1OwIwFbOQsMrxoNTjJAyey7jn7b5QHY7OdjqZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowABHdv6kb_Nn4QjQBg--.9517S2;
	Mon, 07 Apr 2025 14:24:37 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shenghao-ding@ti.com,
	colin.i.king@gmail.com,
	linus.walleij@linaro.org,
	afd@ti.com,
	robh@kernel.org,
	viro@zeniv.linux.org.uk,
	gehao@kylinos.cn
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: pcm6240: Remove unnecessary NULL check before release_firmware()
Date: Mon,  7 Apr 2025 14:23:52 +0800
Message-Id: <20250407062352.2771861-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABHdv6kb_Nn4QjQBg--.9517S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw18ZF4ktr4xXry8JrW5KFg_yoW3JrX_A3
	48u3ykXF4FqrZrZ34jyr4SyrZ3ZF93uFW0vFn2yrWUJFn7uF4Fqw1UX398ua1fX3yxJa43
	ZFnI9r1UAryUKjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbfxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
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
 sound/soc/codecs/pcm6240.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index b2bd2f172ae7..75af12231d1d 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -1642,8 +1642,7 @@ static int pcmdevice_comp_probe(struct snd_soc_component *comp)
 	}
 	ret = pcmdev_profile_ctrl_add(pcm_dev);
 out:
-	if (fw_entry)
-		release_firmware(fw_entry);
+	release_firmware(fw_entry);
 
 	mutex_unlock(&pcm_dev->codec_lock);
 	return ret;
-- 
2.25.1

