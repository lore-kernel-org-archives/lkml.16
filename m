Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEB520E319;
	Mon,  3 Feb 2025 17:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603155; cv=none; b=GVbGfAleI/ikE+ZBi9IBGbJgb8V12s/ecDuHAil1bBQ3kew1jpnGn9GEhThMvAqhCGAYukswhfEuoNQPmV0k2bqa7LQR3ey63cHXG0ky5Oearrh9fgAEFW3Xq0YhsTwe4TMtzVgwcbNZZVZNLMq41j8K/y2r1R+nT/kuOL3jilY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603155; c=relaxed/simple;
	bh=PeuxyZN5kjCrUQCHuJkw757DhnqFYnYetNHttqFX2YM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Hu8tNKrjMerZT5ZmLIODJFPRTf2bMNxqriwYHTd7dEpwpKec9EBpQQ3MyxAc6JPP9WsYWWagX8h0mt4LrgclWQ3xheOo9AmOiMax24SiJBsayfsEO/GP08rNvRlLFJ/2ClVE7WOh5zWlLw/4N7PYIvJSpwQYQotjsZmR66x6lLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZWggm6u; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZWggm6u"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaec61d0f65so790945866b.1;
        Mon, 03 Feb 2025 09:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738603152; x=1739207952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1Pbs/J8b4Igknc5yqniTBPJ77aem92hsd265K55YQo=;
        b=dZWggm6uLaPA4XDCSHDohYGJlQ6oZ6DkakE1bDpzK1w9vRA4/ZWtzfVbdRd5abrDjV
         IluJeOIzONcLkh1k76B8CffWaS0iHXlQRQk8hpAOzfzBeSQgsRvbFPb50qWxkSTYWFPF
         wQqOIYWU3WxYrHXN1uJa6A90nPzsS15bV4p0e5Vw/o/wtOgwkn+U2THEnpwswJHEqcNX
         rhB1wnwGUphJHVAnSs83fEM6KR+KA9KysRT6MnETaviQjLE7txEhsw3li5vGk+T6Y6l7
         ugK/3gU0lf1NpAhWixeP4HBGLFNS4utLrPjoyEMUYFI5UzIby8bGt5kQ0zrs8tFSELkR
         aTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603152; x=1739207952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1Pbs/J8b4Igknc5yqniTBPJ77aem92hsd265K55YQo=;
        b=Aji7wXocv2hZXB/9gaCAFTGKXqoUzBlWtcTZSREwsc30A0I+CFqUrjKHyhRTSOg1bT
         IJuD4QpgZgmJiHIDwL8RNy2wLkzwIjiVg3MI7qrm0yaaO/3P1Jf4sKcL639AcbsrlOxE
         zh7UoyRIeaBGQSKSa8bvMeSFaAkKKGuErDPJjqFZbETBa0ADy/XyUmUyJMdyjLgFP8lM
         qsUmgCDlp8NTCiSOtzswGrxZVQMkGOt6rFEh26LVraxPizxpZ98WLaSRLgVzP6eCoRXZ
         WZoOUNlLG4frjpVK7gQXxKppoWO0MkBXP4MevWJ0Zwy0ejF43brTjuczmuLyfVbpPAbg
         HfHw==
X-Forwarded-Encrypted: i=1; AJvYcCWUUjHMkWIlELSPz258tPQcK6wAA881CoStBVDe12Xy6PI4HIRjeqilaQcq82KelrJmh40oNJvOLjqyfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1t60/EbxdhDBqK9CEv6T9fGJnjAzMsjw5ymZ+Q/DiFAxzl8J2
	33ET91pvEmiCbSE+b4YpsGehaDcSobp376JyOO28LdOeLuVrnd28
X-Gm-Gg: ASbGncuYFQnsf827N1LFX9ZCOCRmz/gpfGZQtwLF5teGZdW1D8kFRvL3SEJNCzW9lI2
	RQk6MA8nrjOpehi0V9pjNdk92cBFSVYXexk3uPxSO+tQo6pTYO2z8BLQQxyvgRD/jaKZM7iCXSX
	ilNAInsNBY5NYcecIluI7kg7CZr323UkRzzIxYFjquctw0tUM/JcErCEAk/V4EIuUbfjLbM9dan
	QqHaR3/0RTq02qc4wwAl5mcmZTDNDWp8LEan+AC3fj2kKugM67YejDf+RJnNFrQBhr+GmtIxVEi
	xqmBPzjZT9J22PwjLyZbXFYeq4+gAEJ4ZxrHMZifs/7NImKpvg==
X-Google-Smtp-Source: AGHT+IHsj5TahE0cdQFShWYL7mrK3YS4ctKQ2+LW9xf64gfjtdYuf+utJWLoKhoy+U8GkXjrFnKn1g==
X-Received: by 2002:a17:906:c10b:b0:aa6:6ea7:e5a7 with SMTP id a640c23a62f3a-ab6cfd0e4c4mr2419127566b.28.1738603152154;
        Mon, 03 Feb 2025 09:19:12 -0800 (PST)
Received: from playground.localdomain ([92.120.5.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d21aasm784253866b.74.2025.02.03.09.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:19:11 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 6/9] ASoC: SOF: imx8: make imx8_ops_init() an util function
Date: Mon,  3 Feb 2025 12:18:05 -0500
Message-Id: <20250203171808.4108-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
References: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The definition for the ops_init() operation is similar among the imx8
chips (namely: imx8, imx8x, imx8m, and imx8ulp). The only difference is
the name of the 'struct snd_soc_dai_driver' array used to fill the SOF
ops structure.

As such, 'imx8_ops_init()' can be made into an utility function that takes
the 'struct snd_soc_dai_driver' array and its size as parameters and fills
the SOF ops structure fields accordingly. This will allow us to reuse this
function when the other drivers (imx8m, imx8ulp) are merged into this one.

Since the definition of the function is changed, it can no longer be
used directly by the SOF core. Therefore, also introduce a wrapper:
'imx_ops_init()' that will call 'imx8_ops_init()' with the right
parameters based on the chip.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 1efdb169cf07..3ad20df351c2 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -19,7 +19,7 @@ static struct snd_soc_dai_driver imx8_dai[] = {
 
 static struct snd_sof_dsp_ops sof_imx8_ops;
 
-static int imx8_ops_init(struct snd_sof_dev *sdev)
+static void imx8_ops_init(struct snd_soc_dai_driver *dai_drv, uint32_t num_drv)
 {
 	/* first copy from template */
 	memcpy(&sof_imx8_ops, &sof_imx_ops, sizeof(sof_imx_ops));
@@ -31,8 +31,18 @@ static int imx8_ops_init(struct snd_sof_dev *sdev)
 		snd_sof_debugfs_add_region_item_iomem;
 
 	/* ... and finally set DAI driver */
-	sof_imx8_ops.drv = imx8_dai;
-	sof_imx8_ops.num_drv = ARRAY_SIZE(imx8_dai);
+	sof_imx8_ops.drv = dai_drv;
+	sof_imx8_ops.num_drv = num_drv;
+}
+
+static int imx_ops_init(struct snd_sof_dev *sdev)
+{
+	if (of_device_is_compatible(sdev->dev->of_node, "fsl,imx8qm-dsp") ||
+	    of_device_is_compatible(sdev->dev->of_node, "fsl,imx8qxp-dsp")) {
+		imx8_ops_init(imx8_dai, ARRAY_SIZE(imx8_dai));
+	} else {
+		return -EINVAL;
+	}
 
 	return 0;
 }
@@ -186,8 +196,8 @@ static struct snd_sof_of_mach sof_imx8_machs[] = {
 	{}
 };
 
-IMX_SOF_DEV_DESC(imx8, sof_imx8_machs, &imx8_chip_info, &sof_imx8_ops, imx8_ops_init);
-IMX_SOF_DEV_DESC(imx8x, sof_imx8_machs, &imx8x_chip_info, &sof_imx8_ops, imx8_ops_init);
+IMX_SOF_DEV_DESC(imx8, sof_imx8_machs, &imx8_chip_info, &sof_imx8_ops, imx_ops_init);
+IMX_SOF_DEV_DESC(imx8x, sof_imx8_machs, &imx8x_chip_info, &sof_imx8_ops, imx_ops_init);
 
 static const struct of_device_id sof_of_imx8_ids[] = {
 	{
-- 
2.34.1

