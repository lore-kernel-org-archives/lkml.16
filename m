Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80399469D;
	Wed,  5 Feb 2025 01:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738719916; cv=none; b=qmVUmZI/IM0GEw4hrJB70h6wf+1c7lu7OVuWwfQUY3AMC9YFG8Wy1VaEC3sFic0W0L3wxrzwLngE7DnB/CdnMMrfeEm8vNfY7eVMeqV5QD8rGg1sZrWoFO5rZL66WxHAx7i2M/ZkRqy4MGob+BgBPunpajzhFU1qEevlnX8wEyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738719916; c=relaxed/simple;
	bh=0GhnJFOHkzGkQJTqPRFA/VmoMmXRNEohphQi7jKUBME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uK6rurXWssJiLzmL13kDSIgk3mGuIeUsU2p3GdC+VM0N7PD5vzI/yUH9hoHssggQDQUCF5Pw2PusmMHS2dLqThnbCaK2bfWsn7+krqvq+y9Il+DhZ4GeUkwQcOw/j68VgiLc7U820z9lTrQAlET61yKbOKzxXbah0Xy7n5kvt9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=OQDratbP; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="OQDratbP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=Hdny8KzGDrmulHMjBKcgteDWy/e+HEpHaiYxGxFOlZQ=; b=OQDratbPygA5Fdb6
	xF2NHtKxBKCEjC1Zq6np8x7E5uaNVvc+yJy6/IqMH833dpsOHYtOZQXoLVFkCmvUgGJSD7sH+GnYM
	1O29ZYQ3fc1ypSTWA6KFerjEPh+5WQEGX0K3JZx9TVmsK/nOgUYz6MJBe35j5bknB46gVq/5y+cKh
	wW+V2o4aAWBJs/WkMWb0a8FSabBbZ5X/G5e3jQkZNOlaxkDfCldbg3rZZvL3/6kqUDmWAi0PQVAPK
	1rfaL0ltoX27MhpeGPDw0QBFReVIdRJF48dDZLy1hbwSU01HaiqwFu1yJlvg15m6tDc6WMHgZRAqb
	hrpHyC1+x1N5393vrg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tfUTK-00Ddpr-1w;
	Wed, 05 Feb 2025 01:44:58 +0000
From: linux@treblig.org
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ASoC: max98095: Remove unused max98095_jack_detect
Date: Wed,  5 Feb 2025 01:44:58 +0000
Message-ID: <20250205014458.486207-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

max98095_jack_detect() was added in 2012 as part of
commit 9dd90c5db040 ("ASoC: max98095: add jack detection")
but hasn't been used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/soc/codecs/max98095.c | 29 -----------------------------
 sound/soc/codecs/max98095.h |  3 ---
 2 files changed, 32 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index cfb63fe69267..1d3464308ec4 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -1884,35 +1884,6 @@ static int max98095_jack_detect_disable(struct snd_soc_component *component)
 	return ret;
 }
 
-int max98095_jack_detect(struct snd_soc_component *component,
-	struct snd_soc_jack *hp_jack, struct snd_soc_jack *mic_jack)
-{
-	struct max98095_priv *max98095 = snd_soc_component_get_drvdata(component);
-	struct i2c_client *client = to_i2c_client(component->dev);
-	int ret = 0;
-
-	max98095->headphone_jack = hp_jack;
-	max98095->mic_jack = mic_jack;
-
-	/* only progress if we have at least 1 jack pointer */
-	if (!hp_jack && !mic_jack)
-		return -EINVAL;
-
-	max98095_jack_detect_enable(component);
-
-	/* enable interrupts for headphone jack detection */
-	ret = snd_soc_component_update_bits(component, M98095_013_JACK_INT_EN,
-		M98095_IDDONE, M98095_IDDONE);
-	if (ret < 0) {
-		dev_err(component->dev, "Failed to cfg jack irqs %d\n", ret);
-		return ret;
-	}
-
-	max98095_report_jack(client->irq, component);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(max98095_jack_detect);
-
 #ifdef CONFIG_PM
 static int max98095_suspend(struct snd_soc_component *component)
 {
diff --git a/sound/soc/codecs/max98095.h b/sound/soc/codecs/max98095.h
index 2af7e77021a2..782e351debe9 100644
--- a/sound/soc/codecs/max98095.h
+++ b/sound/soc/codecs/max98095.h
@@ -312,7 +312,4 @@
 /* Default Delay used in Slew Rate Calculation for Jack detection */
 #define M98095_DEFAULT_SLEW_DELAY		0x18
 
-extern int max98095_jack_detect(struct snd_soc_component *component,
-	struct snd_soc_jack *hp_jack, struct snd_soc_jack *mic_jack);
-
 #endif
-- 
2.48.1

