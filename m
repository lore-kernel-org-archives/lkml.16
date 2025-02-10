Received: from out-176.mta1.migadu.com (unknown [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66A91F63DD
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739188748; cv=none; b=KjI8fpfnu+XdgnU7g+XA1Myb0PqA1yjhY8XueX1kblidZxsJ1AspjQRV+3mmc9EAEI/6PfGt/2h99BXKiPYLWczQncjQOmJh63ALs5aAdud7oBqIxdEZ9KVRSe/Guyz90SaEIfxD+Qns1ln26lqaB8VzjUZm55a6uGtH3dH7n9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739188748; c=relaxed/simple;
	bh=30Wf8ehLuNB2btq0eIwSJAyFUo55/cInR1bVv6Sng8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mTVat0OeYrne3+7K3dNv/iDJaFos1Nhz+JRWIZchrcwKJyhxB1IDmioAfLZ/0uqFnQJKWk0OU1u/V7MaYcjA6fRcUkV3XaQrHaNV5RUNFbGc9NtZY630MmydMdznc4vad3wDpvGvoYiqNQ+JDlzYbrkojjeVf9sH7b8TwmOzdd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DXiC9AFY; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DXiC9AFY"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739188728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=80KXFYtQ068eg5P9MnIf12q7bojormbuV9/fp40Iz9E=;
	b=DXiC9AFY3fw0MHOAnrmV23wOxeQrh3JUY5tp+sFlyW8LwEzvYk8xq1J1lCQqgSEBSXbTHc
	WkBa7zf1S65p+bnLjA9/QjLfbxqQ/7wZq0+2/BkW5h0dj6zlLGVIV4p4yGkJbYwjAevmrv
	GPSNCmy4bU+4CvN/aWfHD4Lp7V1pOLQ=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: wm_hubs: Use str_enable_disable() in wm_hubs_update_class_w()
Date: Mon, 10 Feb 2025 12:58:03 +0100
Message-ID: <20250210115804.53504-3-thorsten.blum@linux.dev>
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
 sound/soc/codecs/wm_hubs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm_hubs.c b/sound/soc/codecs/wm_hubs.c
index 0c881846f485..196ddb224e6d 100644
--- a/sound/soc/codecs/wm_hubs.c
+++ b/sound/soc/codecs/wm_hubs.c
@@ -14,6 +14,7 @@
 #include <linux/pm.h>
 #include <linux/i2c.h>
 #include <linux/mfd/wm8994/registers.h>
+#include <linux/string_choices.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -674,7 +675,7 @@ void wm_hubs_update_class_w(struct snd_soc_component *component)
 	if (hubs->check_class_w_digital && !hubs->check_class_w_digital(component))
 		enable = false;
 
-	dev_vdbg(component->dev, "Class W %s\n", enable ? "enabled" : "disabled");
+	dev_vdbg(component->dev, "Class W %s\n", str_enabled_disabled(enable));
 
 	snd_soc_component_update_bits(component, WM8993_CLASS_W_0,
 			    WM8993_CP_DYN_V | WM8993_CP_DYN_FREQ, enable);
-- 
2.48.1

