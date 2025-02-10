Received: from out-187.mta0.migadu.com (unknown [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C9F1F560D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188801; cv=none; b=Pq+2Ns1n6YpCDjzzuUsexgb39BKTR/cC2sR1vaPsyN2hlB56PdSJcO4tLoCtiksue07kvN/CAQaauWsYE5uc4vtHoKg9cK2I2l7RtjkSPrZychIdyY0nLoR4BecggC53m1MMteA+7gG+U0gYE/gBHlDu+9rY/lOD6TkGoZKCU0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188801; c=relaxed/simple;
	bh=FhxXjDRdxSWnX37H0WG4vdC6U/pFMmEVNq0rLKT/hd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ro8DsONYudiBPkSPBr6DgFDuT/3ROPofxfGqZT+lQ2BfybvaU3yQQweHA4TConzY3KbNvKctFgr/GSz0LpPB34iAOdLWEpnvvsWQi4I0eRK5IntSBj13nX+XOh1mcovjvqzY108OSgRELCvtDwZ3UumPdWUs2XsnjPTErzmBU6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=WHEQ7HFS; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="WHEQ7HFS"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739188784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=772Fd8+eXiEEEfRWevbGdOh2O07C16dyje+SuDaIbvQ=;
	b=WHEQ7HFSzbFLjTDqFiDSiA85skroY9V9ME22FiwlHc+hwmUM61aPgphClFCxTDOkscaSUl
	XIQUHZXE6WclApAUkIoOKbFRNupt6ye/AquCpjRqz5Mgs4d6z2tkwukvp0OITg5EPSUfUU
	D7DZBNaLdW4us4Tr3yfv2ahL2aNbViM=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: tscs454: Use str_enable_disable() in pll_power_event()
Date: Mon, 10 Feb 2025 12:59:37 +0100
Message-ID: <20250210115937.53654-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_enable_disable() helper
function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/codecs/tscs454.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index 850e5de9271e..da2f3cb1cd13 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -10,6 +10,7 @@
 #include <linux/i2c.h>
 #include <linux/err.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/mutex.h>
@@ -737,9 +738,7 @@ static int pll_power_event(struct snd_soc_dapm_widget *w,
 	ret = snd_soc_component_update_bits(component, R_PLLCTL, msk, val);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to %s PLL %d  (%d)\n",
-				enable ? "enable" : "disable",
-				pll1 ? 1 : 2,
-				ret);
+			str_enable_disable(enable), pll1 ? 1 : 2, ret);
 		return ret;
 	}
 
-- 
2.48.1

