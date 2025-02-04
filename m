Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6D225A659
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683257; cv=none; b=c08bJpJVKCrE7WSrUgq7OPzOPeHGpnh/KHAgT5WbKL16VnKHa+klmNFtmCjVGaSgXr0nu502o0c+RE4B/sdG7FSJTGejdPzs1L7vGuHbsQTGwZyN0SPIAHDiTAV1h8L5QHhZYczehDR1F6cK/XnN4F3glaq+5dHul6+6d6QnqXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683257; c=relaxed/simple;
	bh=VLMW/rKngckff43zklXzalVdgigJaUPwsmm6BS8phrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=da22hEsS4vGo4c8sPjmNoMSjoJhXAy8w/7Lnd5l7K6+93j+5ZG6sm45aMZO9IXnvJzxXNLv94Bx1sV8RgMu5LzZR1MgZfZlla2aQW5bZo7VEngI6vz3ehkqMEuGYxV66uSMyrNAzYyOGpVBDTyaM2mMQ/SNHvUpgkXUz2whAc9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X9y7nCc9; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X9y7nCc9"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738683243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AV7Kl1dUZpnbGIRCqNtPeYJtm97lNu4F+MxRiMNeYbU=;
	b=X9y7nCc9gJsgHVRO4dFndjl7mdvYtq/C1SAuHY/mGQE8LmEcBq0Yy0cZC2M3yI4XuK8Rz7
	9wvpDvxVrw1/QD/N5U3uITI7JS5emPExHU+qoXId1DjI1fEd+OKqp3ystzvvdVmheXBbgr
	aTyaz/RMXW10L7ybAviw0gkaioevx+A=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: amd: acp: Use str_low_high() helper function
Date: Tue,  4 Feb 2025 16:33:32 +0100
Message-ID: <20250204153333.3045-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove hard-coded strings by using the str_low_high() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index 2b0aa270a3e9..eb5d4a5baef2 100644
--- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
+++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/acpi.h>
 #include <linux/dmi.h>
+#include <linux/string_choices.h>
 #include "../acp-mach.h"
 #include "acp3x-es83xx.h"
 
@@ -241,9 +242,9 @@ static int acp3x_es83xx_configure_gpios(struct acp3x_es83xx_private *priv)
 
 	dev_info(priv->codec_dev, "speaker gpio %d active %s, headphone gpio %d active %s\n",
 		 priv->enable_spk_gpio.crs_entry_index,
-		 priv->enable_spk_gpio.active_low ? "low" : "high",
+		 str_low_high(priv->enable_spk_gpio.active_low),
 		 priv->enable_hp_gpio.crs_entry_index,
-		 priv->enable_hp_gpio.active_low ? "low" : "high");
+		 str_low_high(priv->enable_hp_gpio.active_low));
 	return 0;
 }
 
-- 
2.48.1

