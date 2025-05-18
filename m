Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCA52185A0;
	Sun, 18 May 2025 10:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565475; cv=none; b=BlYdHAU93PwCAIxrbH8j5TBbEPGaORD6xB2YcGSb/lcB7OALi9+dRaAkxxjftVm5zQfP4yOK/GZSakEG+yxIwwdbVpAbl79kVL6OKjqg+diLgyP+/vPqkHJxI9GEvHJBtIvlcZ5LX08x4A3iurkYmkbTzVck1bFzKsB1XY0RUto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565475; c=relaxed/simple;
	bh=bloo4GYc4JNZLyBh0ddLz0+AExIZk3IijzAUg1B6IzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/TpKbv6LO9ha/AjNmV3HmPFWJiC5TmlGm9VJZIwox0gcxqaiwsxLKEeinzMP78l6uhNIV1K9oQSbneoiIdrleYHerLgh4kzdDEvyYR+3hUvUKjfDL46J54EXefZDa221gABnC9Aus+tcZF4oldDIrOWNuNoyeX7jNVAzEcYM8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3Y/9etV; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3Y/9etV"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-231e331baceso18928155ad.0;
        Sun, 18 May 2025 03:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565472; x=1748170272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHrWXETLPmMWvh88Pu4z3EEmfTBTODVAwS8fcOeK584=;
        b=M3Y/9etVrMEjgvUxJ5RsTnP3S8+E+W9uUZRdW3VmT8xTYVXHRqTitzsqAaKWM+WWKj
         Q6z2KsV/HIE2NssE+mv3iACgJzrBuQNJeCnZphEwcyXJUpZ1ZdE6DohCBfj6Ns6sorDL
         v0LibK+3sVnOB7XDjxdmvz1y4f9xh7JOQ4mgqevpZWQg1hWtILzPwC7M8zg+b0pS1rvX
         YWAdeq3rwUJwMODU4+pm4MxLqgxRQGK8lO6z+QHi8kPmEvyC1rJ9rUGLxWJ6LGyy5LYy
         bYaNBjpjaR4kD7d5T84WCtdjaWhkunlQkiSq3Hw7OLGO8hJxvYOzeV3SqN1ln+47SkzY
         u2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565472; x=1748170272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHrWXETLPmMWvh88Pu4z3EEmfTBTODVAwS8fcOeK584=;
        b=qHi7lIpLs6kuA0fv8c8VnWE059HRYmcfuzU0scWPE5Lz4DyytMXtRHjFy6mOVafdbC
         aEuBVF0MZ2mUmof5AWTHXJ+X26hzoySXl5Cpv2VuqDzqglztV/pMTWCv8NqUqJ/I7H05
         eqp8SkQR1r/vSmT+sF5m6DGPtxiozV5aXUgmKPR17mdH3lBiyNpSnquCb1e0CYqRTz2q
         8gV0gqt258kPOxea8kRYnst4GCQ+qjY004jSCE3qxy4Yv0SauDfiOV590zdSHHOOADmv
         MI+u5ZOKdqS6c+FH/EM3op5RWykSrpDe8cZg+zOgQSA++fKpSp1+XB9kjYXJ4e6o+Vus
         WYpA==
X-Forwarded-Encrypted: i=1; AJvYcCVNsNp5tfIlu0K3asU6iIi1UuY09j2e7Yk360R26IKCq6qoywKxvMALI73G0O5shbkOcvNQAWkm3k46nnU=@vger.kernel.org, AJvYcCXPTP9fyuJ+Mp6b7rTgweCfnvH7NbT9TUveAd8+nBlqElJQHAGzMNayFx4go6VT97vzE7ECkNlsVNOmea8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpaali0yI5ZQk0NN0NwN5hJRF5lyOPf23Lpc91aDEKcNpK24Ah
	f9Zc9YvBChV6EHZJ1qS+GImGrfqpTR1P9zgwEEbq3lh8itqovNCLV/ZWgW7iVw==
X-Gm-Gg: ASbGncsJ6HdoLOtdFW89uK1uEfdI2RJf3/fb9VHnxV6ejqQbbUeFYWzqmXCHIKT74cj
	VTadOfcLo35F/K/PnGQIlCk9jSVFhWHcPc+hHZqmnkz4okIQj15/mnhU5vhG+d6soZ+E/n1O7yn
	/5rq2wUhz+X2qUxqyqj6FhS1BH7HX9rpNKXEX5D6QaUNVd0qna5Dajbs/+2ahLGMrzDRK9WZcTQ
	LQYlfbje39+fc1tiM9ptGiKNRX7dcY1Y0mOqlLl97KMWcDleGaYPnCu+quyvA4SQder7roLikcb
	jsecu5et34+U6TaEeomupkiYfv8bP5ciEieKZ4jJcS4NH6iItJU6hqaHpKkU/ViNYwTXfkm7MSn
	qpLA8lxeQ6aRUwY2A4mAcVucFH5EIDLvdyEz6cWOMvIB9sg==
X-Google-Smtp-Source: AGHT+IHQKeN5K6oLu/Pr7bN73HTuOuOG1l8fm1K7G9wHj5VgQXjEmL3454BUhL6fVUoAR/0qXNb7SQ==
X-Received: by 2002:a17:903:24e:b0:22e:4a6c:fef2 with SMTP id d9443c01a7336-231d45ae355mr145745125ad.53.1747565472550;
        Sun, 18 May 2025 03:51:12 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:12 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 May 2025 20:50:46 +1000
Subject: [PATCH 1/9] ASoC: apple: mca: Constrain channels according to TDM
 mask
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250518-mca-fixes-v1-1-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1768;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ReyxWz52DKUtyFgDtnGw7HLoQFBnONuJgIIlcj1/Fzc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBmau6eL+D4tPLR0DrPSmfM3g5R/VZkpl0v0t/5forBWa
 HUjp554RykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABORS2T4n/HnUUKcdvWb5F1X
 tk3Mci5/zzxt3/Q+qY8LHzw93P5AayUjw3b9LGOfiX9dJe84/dAUa/8nkLSw4dmXvaHdUiZCl1K
 e8QAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

We don't (and can't) configure the hardware correctly if the number of
channels exceeds the weight of the TDM mask. Report that constraint in
startup of FE.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index b4f4696809dd231a64229114c5550bb5f237607f..5dd24ab90d0f052bb48f451cf009dc2e9128014d 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -464,6 +464,28 @@ static int mca_configure_serdes(struct mca_cluster *cl, int serdes_unit,
 	return -EINVAL;
 }
 
+static int mca_fe_startup(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	unsigned int mask, nchannels;
+
+	if (cl->tdm_slots) {
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			mask = cl->tdm_tx_mask;
+		else
+			mask = cl->tdm_rx_mask;
+
+		nchannels = hweight32(mask);
+	} else {
+		nchannels = 2;
+	}
+
+	return snd_pcm_hw_constraint_minmax(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_CHANNELS,
+					    1, nchannels);
+}
+
 static int mca_fe_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 			       unsigned int rx_mask, int slots, int slot_width)
 {
@@ -680,6 +702,7 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops mca_fe_ops = {
+	.startup = mca_fe_startup,
 	.set_fmt = mca_fe_set_fmt,
 	.set_bclk_ratio = mca_set_bclk_ratio,
 	.set_tdm_slot = mca_fe_set_tdm_slot,

-- 
2.49.0

