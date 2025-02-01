Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9699461;
	Sat,  1 Feb 2025 00:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738371035; cv=none; b=KtETC7/R+DLv3RBvXzZyYoHtoBnZPzP7k2stR4I430g7MCKF+OkmdVXGE1+2Y7fJyGJgNkCW2KR4uKpS+F6/Lz0ut/oBapGmULVRX9auU0FrhiPwzJ665shpSstq7JJhNEJQMMAtwEpYEOamreYiuX5ykAU234r8KkvipwULZdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738371035; c=relaxed/simple;
	bh=EGWr5fWgxUPJFS9FxvM4TAqLqvXd4TuJn5bJ/7OmLPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKbj7sLSm8OPYOXx15rPSuYLJZTrqesK9asetSPTUUbKKqGfe5lVevKgyHtiBzE9vLxI1bJHUbejQlOxEZCOC2GRRVv25MBLD2F5No/kVbtjjRcXfAjZSXWkzeMls+76FlhzpHRbH44COdoqYgC5VeVoq2CH274eHEijUxU8/JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=HUJcy39l; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="HUJcy39l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=yUp8gIamITNTXKVgHV8c7KipsP99RyQ4CH6ynQ6dYic=; b=HUJcy39lMxUXStXz
	6bUsXiUrd/32C/YFSorb+y7RKX6GZoMOhHg+GA5l4mbVhRYm6CK5gcj0UvwR7OSeuJmM9Q6DfzUpK
	XjSrJdpwrBOezf2U939lpIkEUkIeRACZWYKl7/Jd0jIHPI4Av/hKgFFxti4eILQlFTbYhRj49vl2q
	ygCL0ae+9L/9NfkDnuREx6JUU5surcQViAllbpnYIUSQjioDVCR6OiUkzFAwtWDWKkfN9eBd7pHy4
	0TzTnE1KkwMo9yxXaNgxnLEudxkk32i/mPKWpfBOIuS0HCT/mVn9IorxULM4ScLYysprtHXUjovYR
	rssdPKVQjOHqiAod6g==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1te1iH-00D1GY-2d;
	Sat, 01 Feb 2025 00:50:21 +0000
From: linux@treblig.org
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ASoC: mediatek: Remove unused mtk_memif_set_rate
Date: Sat,  1 Feb 2025 00:50:21 +0000
Message-ID: <20250201005021.447726-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

mtk_memif_set_rate() has been unused since it was added in the 2019
commit 9cdf85a19b3a ("ASoC: mediatek: common: add some helpers to control
mtk_memif")

Remove it.

(The _substream version is used, and is left in)

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 20 --------------------
 sound/soc/mediatek/common/mtk-afe-fe-dai.h |  2 --
 2 files changed, 22 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index 3044d9ab3d4d..3809068f5620 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -500,26 +500,6 @@ static int mtk_memif_set_rate_fs(struct mtk_base_afe *afe,
 	return 0;
 }
 
-int mtk_memif_set_rate(struct mtk_base_afe *afe,
-		       int id, unsigned int rate)
-{
-	int fs = 0;
-
-	if (!afe->get_dai_fs) {
-		dev_err(afe->dev, "%s(), error, afe->get_dai_fs == NULL\n",
-			__func__);
-		return -EINVAL;
-	}
-
-	fs = afe->get_dai_fs(afe, id, rate);
-
-	if (fs < 0)
-		return -EINVAL;
-
-	return mtk_memif_set_rate_fs(afe, id, fs);
-}
-EXPORT_SYMBOL_GPL(mtk_memif_set_rate);
-
 int mtk_memif_set_rate_substream(struct snd_pcm_substream *substream,
 				 int id, unsigned int rate)
 {
diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.h b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
index 8cec90671827..b6d0f2b27e86 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.h
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
@@ -42,8 +42,6 @@ int mtk_memif_set_addr(struct mtk_base_afe *afe, int id,
 		       size_t dma_bytes);
 int mtk_memif_set_channel(struct mtk_base_afe *afe,
 			  int id, unsigned int channel);
-int mtk_memif_set_rate(struct mtk_base_afe *afe,
-		       int id, unsigned int rate);
 int mtk_memif_set_rate_substream(struct snd_pcm_substream *substream,
 				 int id, unsigned int rate);
 int mtk_memif_set_format(struct mtk_base_afe *afe,
-- 
2.48.1

