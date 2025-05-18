Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3207D218EA1;
	Sun, 18 May 2025 10:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565497; cv=none; b=mJ9PN9TYLJpSMfDXzssUkW6jjo/tHNZLOSuJnTQlSyfmYgStKcMNOhdnnnAS73mSgxiugPCqX800ahwZHoj2ipVVugn7FF8yKKN1//f6i4ap7yXudH/AYY7fbP91vKANtbuWATzhqljmWELc3TzzWtzRlD53ORZXnQXc4qNT3zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565497; c=relaxed/simple;
	bh=PIZEaBz87MJdSw7eO9zCitJI2ND1grAk1GZ/kO5+Be8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iXRXa1jkp/+q47Yn1Y1LBy+a3boXf98dfn9FI04X/iQ8jEwDdB+JPo5hJbZyxo0bLabSeMRuO5drFIuER+xOpQuP475Ua7iH1Q5JzjNfSgAbdfoB76LBCT5mz7Cf1iFRQSl1IZPp3S7NI970eSeLAXQIlyOY+FEpHZGk/oR+kLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaFZwTEE; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaFZwTEE"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af59c920d32so2229679a12.0;
        Sun, 18 May 2025 03:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565495; x=1748170295; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ldh01POWj6tZC0Ymrmq06kriivz8DVjOcTeZNDTdnk8=;
        b=PaFZwTEElC1Au00idDw2SYBimDkDn0tBBrjjlxaTCb4B9iVlhHxDi8fam3a9dQjD8P
         pXSEmbbj3NVrMJ2yV4vSsMzhWhP3O9UEvE0VpbeC6EtU0lweUM+rOKGoVP8QxN7qCPMb
         n7mbrRpPj2uB1p+zAGfV06WihXr0SCZ04BDndPhagYwejdXdWs4loBW5RrecXgCwPZbY
         cjqjw/DR6eP7X7SkGxqSKFGMWD3LRNbRZ9QSxYl4C12r8UG2CeVlAEEx85OAm0cRJFx0
         MEP6Lnc3p9rRUq7XpyTbPz5wghSkvk4iSbqIj9gCo6b5hSwYIQeUKVU0a/mr6HBcX0h0
         bWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565495; x=1748170295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldh01POWj6tZC0Ymrmq06kriivz8DVjOcTeZNDTdnk8=;
        b=DEDQg+yTDYHjV6n6I9fchhV0MS4OcaKQJ39+MZQYD7untVWiEUQF/7AcbNPBv8WZUw
         kqXyfEjM02Qp/Y4s3BTNpE7akbfKrkNqn6etCUiDk/8+yNaka832Zee+WMCqBqj4v1iD
         Q4diXSl/kp1DkCKZ1J8H3oeT4HQ532Pqkeu+Oss7sVM00nqL0CdgdIPQbaqoLYSWl+uq
         g5u45rUGH9Q9nKsikISSZj76Ww3BAOv5DRFnmVy1gyT7e5S8jAslJi9DYUW3KvCs7tyZ
         7h/blXnE1MqThVJh5ZZHCV2vJm53slyrA8cHnQXcitsnEwhcojZBpQmYZ6bj7uBPOlTB
         iQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhKACF+i9Vc54QuHzMwAT9/xqk8CqpqPmhd3AdShWIwzVqCKv2gVLU/QePphdBcbS4W2/q/wAz6gp6nJo=@vger.kernel.org, AJvYcCW4tAVpwTkOHF/1krdShibuPehnckuHcQgrMJ+6rovErJSANpDVMVeADmx1DYPs51MCTlUVggI78XuIg7c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywyb5DvynN+qkgH+acvY1KB/LEBdrN1picknozyTVHSEcYopHn
	uHULO7XrsqqOhc/LXRlrk6UDjHAUWyVTc//2Lvlc6g8YY56tvu28MxZeSwNpEQ==
X-Gm-Gg: ASbGncvFYKCiBaCwuyyl1PVC5Fs8A/rHaAf73spYRwtcQgEfrdY02ZJgY4s2Qu4GzKF
	jgjZ8vFVMFi6Ug0j8YRKryMOdOV6hTVKzZQ1UqmBuz6AFsw3nlqom3N/Lnn1b3qtgPJnPJHqg8q
	lwEM5SNA0QsJFfVAcas7I3d7zN1TrZsE9uYmuDm2EmKQx4yZ/KiNMTw1iaXtjrMBVCywiI5BoBL
	wqM38tdmzMeYTl5kyMqX4EkmRBSRKLvatzhltg14r+gE+E+aWD+k+bMkbU6nctMSOT5RSZHubKS
	H0C6xHRjVbu1sjCG3nFy98a4srzOhY6AHTshwGVrBQKsrEK/s1jB0QIL+jWC2y4TEF0VygVGTF1
	BCZO/yWnDWE/4INC3/qQpMVHhabNEmK/znqS4iOENn3A8K0o97rzZGm0k
X-Google-Smtp-Source: AGHT+IFpn58gHw15Sq4sK88eTlsGZvNrZWJkEc3EHSOcZtUAiuMgcXKlRSwxIx/J9egajfGRIdbHmg==
X-Received: by 2002:a17:902:dad0:b0:22e:4b74:5f66 with SMTP id d9443c01a7336-231d45a9ae9mr103931835ad.42.1747565495172;
        Sun, 18 May 2025 03:51:35 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:34 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 May 2025 20:50:52 +1000
Subject: [PATCH 7/9] ASoC: apple: mca: Support capture on multiples BEs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250518-mca-fixes-v1-7-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3562;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=jssRvxpVtihkyIdNcxkCIk90/+e5Xkywb1sJNStLl1I=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBmau2fMPn3uofa6CKvfO73q5TkF9NVLShd/elgmN2H1z
 Yv7nJUaOkpZGMS4GGTFFFk2NAl5zDZiu9kvUrkXZg4rE8gQBi5OAZhIjhcjw+s52/fc0Ht+7LgV
 Z9Rvr5fNyU8ezdU5qv55S6pY7JNUwRKGf/qmSlP+vWJjSb7JuWzR5GOZIVO+P0l2WO3ZXFTNvcD
 ShxUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

When multiple BEs are linked to a FE, the former behavior was to source
the data line from the DIN pin of the first BE only. Change this to
ORing the DIN inputs of all linked BEs.

As long as the unused slots on each BE's line are zeroed out and the
slots on the BEs don't overlap, this will work out well.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 31 +++++++++++--------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index be6ff55203121808463846bebda682cdd97fc42d..441da5ef3de1c0be1dc607ff2490046206660e59 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -267,22 +267,19 @@ static int mca_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static int mca_fe_get_port(struct snd_pcm_substream *substream)
+static int mca_fe_get_portmask(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_pcm_runtime *be;
 	struct snd_soc_dpcm *dpcm;
+	int mask = 0;
 
-	be = NULL;
 	for_each_dpcm_be(fe, substream->stream, dpcm) {
-		be = dpcm->be;
-		break;
-	}
+		int no = mca_dai_to_cluster(snd_soc_rtd_to_cpu(dpcm->be, 0))->no;
 
-	if (!be)
-		return -EINVAL;
+		mask |= 1 << no;
+	}
 
-	return mca_dai_to_cluster(snd_soc_rtd_to_cpu(be, 0))->no;
+	return mask;
 }
 
 static int mca_fe_enable_clocks(struct mca_cluster *cl)
@@ -398,7 +395,7 @@ static int mca_fe_prepare(struct snd_pcm_substream *substream,
 
 	/* Turn on the cluster power domain if not already in use */
 	if (!cl->syncgen_in_use) {
-		int port = mca_fe_get_port(substream);
+		int port = ffs(mca_fe_get_portmask(substream)) - 1;
 
 		cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
 					      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
@@ -448,7 +445,7 @@ static unsigned int mca_crop_mask(unsigned int mask, int nchans)
 
 static int mca_configure_serdes(struct mca_cluster *cl, int serdes_unit,
 				unsigned int mask, int slots, int nchans,
-				int slot_width, bool is_tx, int port)
+				int slot_width, bool is_tx, int portmask)
 {
 	__iomem void *serdes_base = cl->base + serdes_unit;
 	u32 serdes_conf, serdes_conf_mask;
@@ -507,7 +504,7 @@ static int mca_configure_serdes(struct mca_cluster *cl, int serdes_unit,
 			       serdes_base + REG_RX_SERDES_SLOTMASK);
 		writel_relaxed(~((u32)mca_crop_mask(mask, nchans)),
 			       serdes_base + REG_RX_SERDES_SLOTMASK + 0x4);
-		writel_relaxed(1 << port,
+		writel_relaxed(portmask,
 			       serdes_base + REG_RX_SERDES_PORT);
 	}
 
@@ -644,7 +641,7 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 	unsigned long bclk_ratio;
 	unsigned int tdm_slots, tdm_slot_width, tdm_mask;
 	u32 regval, pad;
-	int ret, port, nchans_ceiled;
+	int ret, portmask, nchans_ceiled;
 
 	if (!cl->tdm_slot_width) {
 		/*
@@ -693,13 +690,13 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 		tdm_mask = (1 << tdm_slots) - 1;
 	}
 
-	port = mca_fe_get_port(substream);
-	if (port < 0)
-		return port;
+	portmask = mca_fe_get_portmask(substream);
+	if (!portmask)
+		return -EINVAL;
 
 	ret = mca_configure_serdes(cl, is_tx ? CLUSTER_TX_OFF : CLUSTER_RX_OFF,
 				   tdm_mask, tdm_slots, params_channels(params),
-				   tdm_slot_width, is_tx, port);
+				   tdm_slot_width, is_tx, portmask);
 	if (ret)
 		return ret;
 

-- 
2.49.0

