Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD73621D3DF
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 21:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743976541; cv=none; b=oMHuB+ywJdczwBbkpG2Dc8x6L34+cJAOccUO0R9o3uwD4awyniovyEHfCBl236/0LPS/FL0IIXnD+psSIkYCHpR81qp8lk4+e/MODRsE6ONrhhMY8eBFV3zY7FNt+vJfa9Bu8w8lJD0cZVCB0rW6KdL0iwg+GFUT49hAHj4gFk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743976541; c=relaxed/simple;
	bh=0RZ7S4+U8lyoHosLegknHJ2WSpO8p8NE4ZBTqOs3wYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pqP9j8wfaOvH5yjJ8EZnn26IGQvRL95mOkbUD4TvQgsMAwLdryV8rQlJAlfjoRwcKogBZAKXtmbce5Vjd/UDu9cNSqaH49P7sw3MEXGg3nXDcdrv3O5EoNepDhnHEH+qYGV4pNv+NdzGr68xwfAX2XyWIk6F+DHtZ0sLwXvTFDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rH6zGRCQ; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rH6zGRCQ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743976526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1I0TLXFxyRwRuBF1RIATBCZZtK+cZSbYaj11uvPfth4=;
	b=rH6zGRCQmhi4ivNKRALGlOt0aP1NRJ8PaR2G2Cc5YgmY3+B8VTYt1ozFKahSkkkkpODsqE
	kfP+RMV80Ms8HeWXMS1EOYcKbllOQJxR4e5cF0mPjbvgAOAKS8kSHgcCgMjUkxLpDuh4TO
	E/3o/yLTT7GAl7fsjsAtlQF3nrgjSn8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: codecs: rt5677: Use secs_to_jiffies() instead of msecs_to_jiffies()
Date: Sun,  6 Apr 2025 23:55:01 +0200
Message-ID: <20250406215501.695875-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use secs_to_jiffies() instead of msecs_to_jiffies() and avoid scaling
'delay' to milliseconds. secs_to_jiffies() expands to simpler code and
reduces the size of 'snd-soc-rt5677-spi.ko'.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Remove the number of bytes saved from the patch description as this
  differs significantly by architecture, kernel config, etc.
- Link to v1: https://lore.kernel.org/lkml/20250405125808.302259-1-thorsten.blum@linux.dev/
---
 sound/soc/codecs/rt5677-spi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index abe0a5a95770..885edcf0a3a5 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -365,8 +365,8 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 		new_bytes -= copy_bytes;
 	}
 
-	delay = bytes_to_frames(runtime, period_bytes) / (runtime->rate / 1000);
-	schedule_delayed_work(&rt5677_dsp->copy_work, msecs_to_jiffies(delay));
+	delay = bytes_to_frames(runtime, period_bytes) / runtime->rate;
+	schedule_delayed_work(&rt5677_dsp->copy_work, secs_to_jiffies(delay));
 done:
 	mutex_unlock(&rt5677_dsp->dma_lock);
 }
-- 
2.49.0

