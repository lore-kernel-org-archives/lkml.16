Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35431E50E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 12:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743857938; cv=none; b=DkNMq8Ehp2Rqs3tPQX+VCixJWuEbarwwRtEylKkPPWMydE237oqMKf7X5ocCHi66GUhbvXs+HWCU/poJ4du0PjEPUGiquaLZ93OmDFp+8SSdClw4FHgknxhdYbOZf6FVewHvj2c8t9bHPqPw/+mZjUU7kxlHEP3frcnphgFA+WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743857938; c=relaxed/simple;
	bh=GUViWYYdKTZHr0Gn9ORHbM4/ix+UCbYRAIxNA0YkJXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fhd6Bd6WTf51i5YjOELt9SVIoO9hfcPD1V7PhWQXlDp7eMIDvy4+Xdfjgc5HnNDRPOvFj/ZhqfQTnUgQV+9Vgh4YDIDmwLd59a+c2nXrsMh8bSEK16ufg7go+CYf1jAnOcCz79R6BHywBDLh+jtFlSmh8fF0KoSJIP6UzMPAABU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KYIA5Is2; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KYIA5Is2"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743857933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1NJBKM+fN9fIhE7HQ2RfwJhpXBWQXz//Hsz9SXGiE5M=;
	b=KYIA5Is2ARMW/BW6beF4GM+njF6xOKnIEV/zbciJncZVSn35/FaR9QwCf0t03ZtCOT/qwS
	RJPl/ObE/nAKFUfJVtayW0YeHD7s6lInmrrDtX3FnWGb3z7E/jc7+INpuuHFqSWd/GBt9v
	p+qYsFzqr+O9QmxUBzxDPs0u+jk7zwY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: rt5677: Use secs_to_jiffies() instead of msecs_to_jiffies()
Date: Sat,  5 Apr 2025 14:58:08 +0200
Message-ID: <20250405125808.302259-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use secs_to_jiffies() instead of msecs_to_jiffies() and avoid scaling
'delay' to milliseconds.

Since 'delay' isn't a compile-time constant, secs_to_jiffies() expands
to much simpler code compared to msecs_to_jiffies(), reducing the size
of 'snd-soc-rt5677-spi.ko' by 472 bytes.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
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

