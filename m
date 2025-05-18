Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3422F218ABD;
	Sun, 18 May 2025 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565478; cv=none; b=D0EnWRaXTFUqlIvtGeDF6ctUklc/K3QLa7a6l5rQJYvHBEQC0kKcRoas1IIlVoxzjd7iOqEf6yRQH2TWcNi5PBuKZrZGS7Ma2XNwmDTJonH4ryUTW4oyDqUdoCAlBjxQ/Cua1xJBRvpS9WSbYVaJVFBSYjIiJPLVyLxGF3CdJAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565478; c=relaxed/simple;
	bh=SwU7Igjk1OKbEDVoSx0S67xb5ZjoJ9Fk34L5QbHSCFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XdAKYcveISYQm7YjoPzJhPimnueSy5+njkiJNXwVBpl6nn1WH0sLMw+KgmWNelcFGNAEx3DrfQeqLdMqvb05aaaVIEXn1We7jADzW26X920r6VCNRgYkyVH19RQw3Yrga8HmRrZotUpabz9f7eZ3noreP17DCIAhHn70eBDcKNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJsU2Uzp; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJsU2Uzp"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-231e21d3b63so25757265ad.3;
        Sun, 18 May 2025 03:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565476; x=1748170276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g13jfsVMMfWu8pewYbMs0wefEJmwd0O3Dz3BH7Y5ODY=;
        b=RJsU2UzpvJsiCl4go9owJVFfzUYrBcGercUFQZWO7gT632zgiknzKTMv5r3KlwCsBm
         tUo6fEFp9siKw2diL65+IvQRgAl5qxf7k1toEAnj2A0jgYiA+WKu7Qr0to8fmz/Iqc64
         ILQkrBMAmKJSXx2zuP2a8+RnH3XDtH14LJNk1zNOCt1MadKLKfrHx9PMGJCSFidW1LCI
         DJb1CGYMUOYUVKikf0sQ9rEqstRduFACkllzo/Y9LeogIAWJeR7YuiAr0oZcLjP5x76W
         70zAcxlAzgvpo10ockuH9dpn1YLYqDl59HOCFHC70P/03tpKy9pryQAdemmw7KkgmVZb
         0mPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565476; x=1748170276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g13jfsVMMfWu8pewYbMs0wefEJmwd0O3Dz3BH7Y5ODY=;
        b=WY0A0U+A9F4pM+DysNJml8XJ1/yVDzu9sAMlzafxJCcfYcLhzhahTNyuoc5VaAtPXV
         VQA+SjppL7dffokSyEN40P+wtW9JLXM8R9Qw6/1uhOReMhyXu3KDfuZcKsxV1oKlmDcV
         taMNZUaEFDODFlp7zIZOHD+5PNMi42QMSaou11MIDPfR4K5IE5ktHe7twu6llUHedqt5
         vTMUtFYFN1MKDWLPZIckdpeFi9sbgin/lu7d9AoJawQDcs0VqQjhkVt8h1JVWoygJFpH
         UL90mUER+UEvnI0wZHmBl0+EhF+BbaaIIOF9Q9vpTuyI2l4XS5tn6lBkRLfPl7mAiS8a
         /8QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHWrAHE8X3RIezg+XHYvz1HJCKfAP0b4vSTFWBgY2VpIEVGadzAc583Mg5xb62VtJov5DwpkPhaBil4YQ=@vger.kernel.org, AJvYcCVpKLXIwftQp9hR8AorYpkAGktT1jVRrYh/lTIF4sAXiZiMDIx4ocEO7X/aPVBY7L6+ZBfDoiBarEsHcWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjvW0M6yhOKDpLejCZ4dEGBQ48Yvl3y6AuLUreB5VlxWKgYVRW
	d55GhzWcyFgeM3FO/VRlV6LVIY0IumRVZ9+P8SI3Q0stDU9CPlFTDlegRyS9jw==
X-Gm-Gg: ASbGnctfrG//Y4f8eM2xpFCpxLcdMi0FfuI9O0EfCnh/E9pAFrXgFTuIHhdaHY5FZi+
	XyavjeLSxj1zSnCOsRSM8iqUle7DekyJZRFqf5u5SCJ5MFsegwimthEhNClDQVRJ6+/nNk5I4yX
	s7C4q0SZLEl76XbYdol2moSeNaQYreEr6FdoGJ4GeyxDx/+YYNqpuDqZ9YXo4nTSlONlLGIEm7p
	nj1mCpOqXyPzO0tktXOeA71WMDNtib4t3OAygQZLjNszS06wUAC7C2wWbTmz8Y6tX7od3P5pi+U
	bfxF0NKfnFPckoBUX6Powx3pTLgvdJ/NsMDoJg9yCxG17pfoLXgOJ3EkChMDRr9SQULnpX7uC90
	+K79kJSop3O2JcPh1npzXhKnqsWusd0pq2J93XMC9JgtT5g==
X-Google-Smtp-Source: AGHT+IH0++ZEekfseuEpGWz7SUdCTKKDqWzyZxz5uA1rOlUbjvPfNHqeN14zJ3GRIw57pcl2hG74Og==
X-Received: by 2002:a17:903:1b6d:b0:223:f639:69df with SMTP id d9443c01a7336-231de3ba65amr146473675ad.41.1747565476301;
        Sun, 18 May 2025 03:51:16 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:16 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 May 2025 20:50:47 +1000
Subject: [PATCH 2/9] ASoC: apple: mca: use readx_poll_timeout to check for
 cluster reset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-mca-fixes-v1-2-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2194;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=SwU7Igjk1OKbEDVoSx0S67xb5ZjoJ9Fk34L5QbHSCFM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBmau6dfETisfvmXRu8ftgalvxu5ls8+nWX8ppvz4M+pv
 JNyYo60d5SyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjARtkCGP5zvRdMsbmsaLlsm
 JCWguLUqM2PJPbY1NQ+Wzf3El1qykoORoX3jArYPKebGUReTteTKPr7y0yi/5LyUUWXN9QCxmnY
 nLgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

MCA clusters should take no longer than 1 microsecond to reset, however
it has been observed to take longer on very rare occasions.

Rather than just add an unreasonably long usleep(), use readx_poll_timeout
to poll the status register for a clear reset bit. This lets us have a
very safe maximum wait time, but continue early if we are ready to do so.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 5dd24ab90d0f052bb48f451cf009dc2e9128014d..7113da4bdea7b687c0d44d2bbf3a511b8299056f 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -24,6 +24,7 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/init.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -197,6 +198,7 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 	int serdes_unit = is_tx ? CLUSTER_TX_OFF : CLUSTER_RX_OFF;
 	int serdes_conf =
 		serdes_unit + (is_tx ? REG_TX_SERDES_CONF : REG_RX_SERDES_CONF);
+	int ret, status;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -211,11 +213,15 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   SERDES_STATUS_RST);
 		/*
 		 * Experiments suggest that it takes at most ~1 us
-		 * for the bit to clear, so wait 2 us for good measure.
+		 * for the bit to clear, however this has been seen to fail.
+		 * Wait up to 50 us for the reset bit to clear.
 		 */
-		udelay(2);
-		WARN_ON(readl_relaxed(cl->base + serdes_unit + REG_SERDES_STATUS) &
-			SERDES_STATUS_RST);
+		ret = readx_poll_timeout(readl_relaxed,
+					 cl->base + serdes_unit + REG_SERDES_STATUS,
+					 status, !(status & SERDES_STATUS_RST), 2, 50);
+		if (ret || (status & SERDES_STATUS_RST))
+			dev_warn(cl->host->dev, "MCA cluster failed to reset\n");
+
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, 0));
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,

-- 
2.49.0

