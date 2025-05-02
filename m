Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585DE26FDB3;
	Fri,  2 May 2025 23:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746229952; cv=none; b=gdNaaJjpgd3vzN4pQ7PXJF4pc4NyIKa48/Wmt281W985wMYRKMYmC+YrYNor4+oFhU9C7ve1zzmN1eazEkNbT5LwVRi6UfXJi8YTBPaNNcW24AX4dN8CUe9WIVxm2uiaeSWpTitNz/pVpCh5NQW8LycnPmxBLkWOH0eYaVV95yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746229952; c=relaxed/simple;
	bh=zAgH+djeOGqxmUG5c4lAUFzNnTPXVg73UurfRPaFwNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cymQlv0tg2d+/P6syfhnMTT+aQa2Hu0hAdnij74FWwoHL4mPjTiIb+GdspE7bb13coNy2+zgPRdyzRdTb9xtRlbellP18yY5FEN4ZC+5/FPEb1Hn6YquQmn3vll3bG34L9Een4xNR55PVqCPMnyvS0a43kywDzYHfbi1NzezoT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Y9mOZNod; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Y9mOZNod"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=wOpoPXDanw7hWb8RG2ENxp7DtfIebhCQZJBYP6VGVF4=; b=Y9mOZNodDuqbFbKd
	xWbZnBM86eWn9XI6T25J/BLBms8jlsyXqFFQZcDg6ivR+KGWZAUw7N3wiYJIXrvysMH1PsBW5z13q
	FZN9amNeHhe1obWKJpfe7Rd7Lh+BAY4lJGiBT/606LsgQEzfKk84YlhJBcQoclCDuOelll+YRDEHM
	e5Ij7FJKQYEWJs+2ObGuifiht6V9rHZOQrUwLLYq1v+KOhEuO+neS3/larZ7GovfJ+uZHNP0+Uf6f
	cwlU8TpondBxX3MXxHyr95kwYmkeyLXOJ5ZvqJsW5Gu01sdmUYFOYteNkMX8IFCNwLxHxQQDipEv3
	wa8YQ7FjKuq1vUOK6A==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uB0B2-001BML-2g;
	Fri, 02 May 2025 23:52:20 +0000
From: linux@treblig.org
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/5] ALSA: pcm: Remove unused snd_pcm_rate_range_to_bits
Date: Sat,  3 May 2025 00:52:15 +0100
Message-ID: <20250502235219.1000429-2-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502235219.1000429-1-linux@treblig.org>
References: <20250502235219.1000429-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last use of snd_pcm_rate_range_to_bits() was removed in 2016 by
commit b6b6e4d670c9 ("ASoC: topology: Fix setting of stream rates, rate_min
and rate_max")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 include/sound/pcm.h   |  2 --
 sound/core/pcm_misc.c | 30 ------------------------------
 2 files changed, 32 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 8becb4504887..a268de860259 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1251,8 +1251,6 @@ unsigned int snd_pcm_rate_to_rate_bit(unsigned int rate);
 unsigned int snd_pcm_rate_bit_to_rate(unsigned int rate_bit);
 unsigned int snd_pcm_rate_mask_intersect(unsigned int rates_a,
 					 unsigned int rates_b);
-unsigned int snd_pcm_rate_range_to_bits(unsigned int rate_min,
-					unsigned int rate_max);
 
 /**
  * snd_pcm_set_runtime_buffer - Set the PCM runtime buffer
diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
index d3a08e292072..71eec32a7a0a 100644
--- a/sound/core/pcm_misc.c
+++ b/sound/core/pcm_misc.c
@@ -586,33 +586,3 @@ unsigned int snd_pcm_rate_mask_intersect(unsigned int rates_a,
 	return rates_a & rates_b;
 }
 EXPORT_SYMBOL_GPL(snd_pcm_rate_mask_intersect);
-
-/**
- * snd_pcm_rate_range_to_bits - converts rate range to SNDRV_PCM_RATE_xxx bit
- * @rate_min: the minimum sample rate
- * @rate_max: the maximum sample rate
- *
- * This function has an implicit assumption: the rates in the given range have
- * only the pre-defined rates like 44100 or 16000.
- *
- * Return: The SNDRV_PCM_RATE_xxx flag that corresponds to the given rate range,
- * or SNDRV_PCM_RATE_KNOT for an unknown range.
- */
-unsigned int snd_pcm_rate_range_to_bits(unsigned int rate_min,
-	unsigned int rate_max)
-{
-	unsigned int rates = 0;
-	int i;
-
-	for (i = 0; i < snd_pcm_known_rates.count; i++) {
-		if (snd_pcm_known_rates.list[i] >= rate_min
-			&& snd_pcm_known_rates.list[i] <= rate_max)
-			rates |= 1 << i;
-	}
-
-	if (!rates)
-		rates = SNDRV_PCM_RATE_KNOT;
-
-	return rates;
-}
-EXPORT_SYMBOL_GPL(snd_pcm_rate_range_to_bits);
-- 
2.49.0

