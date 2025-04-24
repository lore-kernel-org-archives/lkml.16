Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7026189919
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745501869; cv=none; b=l3SDFB/545bvbTciyIoTY6OJMCCkriunjU+CgyHICOYnS2qrEOchugzFZ3QOSuJ2MXObPw+qYZJYCzcrzj90v84qEAHRwSOi84yTTlvRMAhVWpMC9fueQNq7HnRzOeXPjQryiW7oc/KYRtHa2V5miuhK0p+Mag3WwolXbWhht5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745501869; c=relaxed/simple;
	bh=0B08tQCDV/YYmOgIK6Ue4xy6kn4g5vJClte6djnepHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ARN1boYRmTuxaY4NExEOelbwxST8nNx5jycqCPorzayNWNclFfwu+gk6ZpAYQ4VfHU4IdSQ1K8QG6u/cUEITgmrKYIoK/2NK2SCdxgLj6dQtHbeXz18estcJlRdFzD5ihCLzDP23ZCZGQ5eLq/pMDiZljGrWWIVAq+kG6CWsLH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AHIPHdh0; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AHIPHdh0"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745501859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cUgeUuGuwZsJXWXL0X2PpcBzTbL1vlhXpdOq9KiwkCA=;
	b=AHIPHdh0Hoc8CUyvtohOmSv8X2zBRpftm+c5MW5HHSGG+Dlq9wD4g6r13CNNfu/RQZA2fh
	8BV3SnZmV1BuvXOr083sl0UvAIaVG0qJJYw/rV6tzO7QJkQC2FFwnsZzZRymdkt4Mt/FS/
	jU/R6SkB0uPjWdVEm1nvd/Zp8/z5Fi0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Walker Chen <walker.chen@starfivetech.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: starfive: Use max() to simplify code in jh7110_tdm_syncdiv()
Date: Thu, 24 Apr 2025 15:36:49 +0200
Message-ID: <20250424133648.86459-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use max() to simplify jh7110_tdm_syncdiv() and improve its readability.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/starfive/jh7110_tdm.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
index d38090e68df5..afdcde7df91a 100644
--- a/sound/soc/starfive/jh7110_tdm.c
+++ b/sound/soc/starfive/jh7110_tdm.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dmaengine.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
@@ -187,16 +188,8 @@ static int jh7110_tdm_syncdiv(struct jh7110_tdm_dev *tdm)
 {
 	u32 sl, sscale, syncdiv;
 
-	if (tdm->rx.sl >= tdm->tx.sl)
-		sl = tdm->rx.sl;
-	else
-		sl = tdm->tx.sl;
-
-	if (tdm->rx.sscale >= tdm->tx.sscale)
-		sscale = tdm->rx.sscale;
-	else
-		sscale = tdm->tx.sscale;
-
+	sl = max(tdm->rx.sl, tdm->tx.sl);
+	sscale = max(tdm->rx.sscale, tdm->tx.sscale);
 	syncdiv = tdm->pcmclk / tdm->samplerate - 1;
 
 	if ((syncdiv + 1) < (sl * sscale)) {
-- 
2.49.0

