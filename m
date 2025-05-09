Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr [80.12.242.26])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCD3275106;
	Fri,  9 May 2025 09:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781811; cv=none; b=MVvSO+7jEvDBHaMQNiZ2S4rRtK6niiMqySP61nTbsuQBpLxUjnN0b6Z62OnPK6aZFHJc4zzVCVz2/nrydLUhZ8z+aopbdBtPT3pNIK14hCrRS/CPxXU1xuc4Z5BTFXze+b7kUimHFXas7JAtMFLZ3u3kAxfC3ZNdONte3kcY/rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781811; c=relaxed/simple;
	bh=hc89LVy2YgB2RbkxSw2z2iAGrxOpaXCRHJoRlySZKBs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B26ScbNqFCDg1mHBTk1ncVzaAXhcJBoRpZqxxsfrtgl3We/RdYOLQHGBRvrN8SlRwzwG4xT8PZgZDjE5PCmz25IJigbFDssyoI4ivTjytyxbuke+Y4f/7U4q40gPb1pqsre7apme7viAPHOdxo4UiDrnIYHtWIYOrtiXAFQq6n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=I9zSl3WC; arc=none smtp.client-ip=80.12.242.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="I9zSl3WC"
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id DJk5un7myQJEDDJk5uxqHD; Fri, 09 May 2025 11:10:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746781807;
	bh=pDLt5pxHxdGAut4aWtyDiVnW//QILcNDde9fKTiC3fg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=I9zSl3WCzuABu3i/hGxZY/D2z9pLRS0semJTJM25tfWlls394EMChFOS5WE/lYGT8
	 aiKvyYhxAcyNa621qncSSGJK340oZUVlrU9tbrtu0qtWWZOfi7LYZPpXkt+omOS2eK
	 r5/FOto+Uwg5CW/MnLUM3emlxM5aCboYd5pWf3wn7QaEXkkMayHURiGJK0BrYNMvn+
	 q4IXpMDiZ/vT3riAH+jdBgPhvFZzgsJubm+5CXb/c1NVNcLZpiR87ETnGGTrBYuioG
	 t3JYewPyX0yfM9raFim3uDyPb789zkRcADjq17PmzvHomYMyFQ4/KmcUDNMfxKnhTl
	 qR5vFNC0nhWyQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 09 May 2025 11:10:07 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] ASoC: qcom: qdsp6: Add an error handling path in q6usb_component_probe()
Date: Fri,  9 May 2025 11:09:55 +0200
Message-ID: <7338875b20cb41693f803c6b9673cf7f3e5f089a.1746781775.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs after a successful q6usb_dai_add_aux_device() call,
some resources should be released as already done in the remove function.

Add an error handling path in the probe and the missing clean-up.

Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/qcom/qdsp6/q6usb.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index adba0446f301..8044cb7e4dd8 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -327,8 +327,10 @@ static int q6usb_component_probe(struct snd_soc_component *component)
 		return ret;
 
 	usb = snd_soc_usb_allocate_port(component, &data->priv);
-	if (IS_ERR(usb))
-		return -ENOMEM;
+	if (IS_ERR(usb)) {
+		ret = -ENOMEM;
+		goto free_aux_devices;
+	}
 
 	usb->connection_status_cb = q6usb_alsa_connection_cb;
 	usb->update_offload_route_info = q6usb_update_offload_route;
@@ -337,6 +339,12 @@ static int q6usb_component_probe(struct snd_soc_component *component)
 	data->usb = usb;
 
 	return 0;
+
+free_aux_devices:
+	auxiliary_device_delete(&data->uauxdev);
+	auxiliary_device_uninit(&data->uauxdev);
+
+	return ret;
 }
 
 static void q6usb_component_remove(struct snd_soc_component *component)
-- 
2.49.0

