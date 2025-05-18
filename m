Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9880A21B9C7;
	Sun, 18 May 2025 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565506; cv=none; b=EAK6YSI5gAyakWdAJ9W4FJs0PbgMd4b0oBDbydpL4CLp06thtGmfTZ58VGG74H4AxjCVmC9q2PVLN8+SqPl0ZIah0i5fdCvAfUwGyg0732q75GEOaSMf5gMQlKKa1EXfHFDOtXCVrzRgrp4cDlDIgqvqHvBNexVKwFnmwR0CHHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565506; c=relaxed/simple;
	bh=4tneEjrLLbDxLH5yuVt5982xVp3BOh9Iew7CW9SasfA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rzk9fYKrPHxY9tL9gzdy4KzrqFwz3f+e5UWX/I0p2JEAoc1RDvm9yqIg1u42ZuPmRoNOyEvOUWGMs86pSWx2TP4nM5bYTXAPrxPHJHH0zBPbdYbofVpNnp4560YpQgoaZNeBCNhJgS9sI0dGj6csddWImT4EPmWzV+2V0JaG+44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKsEXD4v; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKsEXD4v"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-231fd67a9aeso9277695ad.1;
        Sun, 18 May 2025 03:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565503; x=1748170303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=51qal+nEZuN8T7t3NgZ/LK0U2xqY70iM2If30xD70Os=;
        b=UKsEXD4v4PMB9mrAewCA+3g0lUFYMKdgUHYeevOGZg1VyD14pbst59VqJAVuuC9Cy3
         1Bh7zyHcb6MzYC69t/QAF75Siq/1uEx3LFDUDSLEgmiY/t/61+q/tS5Ce4MkYuEDxhRA
         lNjsVvQbks6BEa4UfsI31lNrBqoYoTsT/E34LDEUkx4XUgxco3qxyHLG7DitQSTZmS9k
         dt7OUCBCB/767ke7P4b8hjh4l01h4VsTtLwenWCRh8dEskXxqC4EhpKnu7UywEbFYjiy
         bHg8to0RQ7MSLtdzbRliGCqM8MzhQUvgi52obebzfBqm2bYyFh/O1Cq/8u0n4PDZicO5
         DqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565503; x=1748170303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51qal+nEZuN8T7t3NgZ/LK0U2xqY70iM2If30xD70Os=;
        b=KfuMCfDOp7OrC0ER9xQ2PCHhQo1wea+WDt6ZcTs7kC4M8u6paoUB8DK/MQaTBRdIcd
         SZ1sBorhQOCChx4ygpo+95jBWE4KByFma926N7U/hxGg/CfHLlXuBP9zeOc/jY4qzdyI
         8AX4X1Kv0dZOGBD/Ofwlktk0g/Aa0TXzwhNBUbDk4aDBUMLB2iPlCgrcR7LHlvFJbOjo
         hzSRDiyk4MOHs6x3WgMmB2S8qk/jZb4SBizK4kAHxRmXExvzfyu3qaFgHBlyhlvY2cMb
         cFziapUya5a3JXOl+7v4YdtyquAq4uyHunMDS+P2w6ZK88VeXd/UczYHlwY6bTG9qtf6
         CoZA==
X-Forwarded-Encrypted: i=1; AJvYcCUfZmC7H0W6gD60WZtTP3MZgs/5wL+7CbMfZTeEGFO49zW/B//l0TyP42XPTgu4tk/3sFvq7dV7xMalEtw=@vger.kernel.org, AJvYcCWrXZ3jcNESlevrDhrCs34LfBfnkU9sje8+TtvYCPNS6LY1KBawRbwXQYIeAAr2Q0+htZE1J57sZ9PwfjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP/h0LpSTrqR9ZmC8ibcY6TAmOSH1aJ9TnIPaw2OzIzP+O3Xue
	mZZAmOREgIimv8spaIMuDMj1cqSRW6Sv65BoXLq71E/kJPr2ihuYJoO4ygRCJQ==
X-Gm-Gg: ASbGncsjsCrdOKa7OHedXriv5Nh4OebMq0UFZU500baME8J4WAfcnQmayMQ4XmK8NPL
	aMBQgMczEsY3J6fUboEli+BimGeF0g7R/lsTZAOI7yRZ4RPhP3FFEYj++XEvN6YjAyDwbixSJWH
	oRW6p/u1QRWe6Axi3GtOhlMLb9pcWKWFpvmAzkHojfXHU3kogY5kBd3WXRf5CcxKZapdSXHuP0S
	T7rpqtkI3KoSVlrUW8h9DkAgm+6eB4+7LEsiEP87v6k/yHfPEBpWKwjKdJWRyNkt1BrQxxpcYca
	NvM7tBtnsMfhmfYYRvaKYMA6Qf99QTld7eM3Jvzv5MBGFghXbsRT8Fw11HGuwDue5lO7E60gTz/
	K66pxKG/qACq7AF7DkXj6SWLg32DqU3QUqA4x4JSkpAGVuQ==
X-Google-Smtp-Source: AGHT+IF+Y+vQADQsRgWRpYhwHELIYu7P2b0zFe6oPKNRetGepWzTVG+EAL/37OwVnj5EeXLmSUM1SA==
X-Received: by 2002:a17:903:1b48:b0:22e:4b74:5f68 with SMTP id d9443c01a7336-231b39acfbcmr214052775ad.19.1747565503634;
        Sun, 18 May 2025 03:51:43 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:42 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 May 2025 20:50:54 +1000
Subject: [PATCH 9/9] ASoC: apple: mca: Add delay after configuring clock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-mca-fixes-v1-9-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ekpJUrgwslgSSm//rnVrNbH1x1uOEDjoGU49rCtKwNc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBmau2dcNBfZyniLo7vUzoPHy1xpdcuznHhb69lLBLpuv
 vxX8jKmo5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgImU7WL4n6NfVFyh1Zrcv8H9
 2XSJGw4H/jy749UbaLyfJXrzBPGQFYwMHZr7Um2uGF5P9DrYfIOZxdJvxmwBg68eoqs+bd5s3Hi
 WBQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Right after the early FE setup, ADMAC gets told to start the DMA. This
can end up in a weird "slip" state with the channels transposed. Waiting
a bit fixes this; presumably this allows the clock to stabilize.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 25d04b3d8a57a8551f2ac1c0cd2dbf2997d907e8..1c664c204504174df1d0af3cafbe25235c678687 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -231,6 +231,12 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, 0));
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, cl->no + 1));
+		/*
+		 * ADMAC gets started right after this. This delay seems
+		 * to be needed for that to be reliable, e.g. ensure the
+		 * clock is stable?
+		 */
+		udelay(100);
 		break;
 	default:
 		break;

-- 
2.49.0

