Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE508242D9C;
	Fri, 13 Jun 2025 19:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843819; cv=none; b=q14K8RE8wEaPemuPf76r7NfMb6U7/mMHclZvxRlojzjxRykzZX9mpfeZ3otKwb2Zf0t3YPgXr6qrgYnP9fYcIn0OyLAVJcL1Jw28HzyF/oOyFUTpGUc4fkHWd0dMgcnsRSayC+HmLs9fM/pU9AbBoYwYp89M+WeAOWcJpBE0hSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843819; c=relaxed/simple;
	bh=ZaoZKZQZADem2BCfh2iMDReIBn0a8RhtRJb8n9Q2ESk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MSga+L7pQryMjy0X8bFi6h1X9HjSPZ1tnHxx0pzhTZTwsjHnOThPw4WVFlVcqqKYxKsNM/bjD+4XUc0p99O2wZnUwH9XgY3wLaesZBHbMxrCdpLVirIIDzn7ikQzN13tuCw0XGXOegRKs1ESXYS4TeVZqcLE11KKbXiMEKOqQuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tt+LjpM5; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tt+LjpM5"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-adb2bb25105so424391166b.0;
        Fri, 13 Jun 2025 12:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749843816; x=1750448616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dgt/50QF/JqAiUR0QT0950rpV9eyWAU1dWz6lsV+G/U=;
        b=Tt+LjpM5OGXDxEHnXr8oifw6YZxGUx2XnZsMbRlRUbwp+6pTJv+5hmN5MA5EPdUbFK
         JeSDWUT0+F3pst8qeXFfR0mWlTOnG2LAZMGrsib578VunZ8psJxEnOtvZeezmbEbOBvL
         QJ2KX0j2OBVrMAXWGYCHVTvEL07tch0/lpUjxN9W+KJ+SII+eEXsojBvhxDIMIrpFBHy
         vKNc2A9ICgrdrly2pG7Q/g2C+b7m4yMFiLPeC4WjAbw37xqW01qlBkzEwREekQ7Zutls
         I8x/HfkwFKIg/oi4CbGq/vOxoNUsOcgVw57xuHVlq6DofvS8RXQF34m01vG95wjwwSzP
         j2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843816; x=1750448616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dgt/50QF/JqAiUR0QT0950rpV9eyWAU1dWz6lsV+G/U=;
        b=BHjIha6L1vgB5f6JsahkzMsQ0Ezlo5ef9BN5CjRfsrAUqDBWrp7poHAG3Ge4ttsV6j
         oj6nYoTm2G0ZhfTt1MdhcFrLmtppuGTkIjRQYWOPn2e/bO/t8etoJQGaLtOWG05Onnun
         ZWbBxOht89XhHMfxI19SgKi0rzXLFnGY65+O1pTG9y//tmrfS1OU0eQbBr92cdr38lFw
         v3M2X4mlLPl73RlIUz83uR5ayULNb6xWyj+m2AsBeKCQ6omCKPZaruzAepWeGxAOSlLr
         dHjSczJHOBdDD27wONgN2VBhPqRE5lzBq3QSS0dzyuY3DRcPZSbgBKA1jtTazIeXTE6k
         PmbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQM2f54c0jw6MZd7AIw6QFImd20zgtU60nAJTtTBaq5Jlw8GmfzmRshHriix1ISx+z8U0rcfJ0UFOKjAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXw0utYVsFA5A5ou2QKbxm20GJ3vThQ9YPzqpZYGpiLRP+RKx7
	Qk1S8FagrzFit8W/qtjNmP0ybX1yZYpvOvcqT6WMcq7gB0JzVxhMreoT7i6HMg==
X-Gm-Gg: ASbGncsz/DR/Rv+FEDIY2bSLblZJWZTgORaL85WNXALLOlwo5XDzsBC7ZxsZEoihGv7
	zlEUhCO9giVVspL/OKpSn+UaHcfyTZaLLgC4xBSSAnRtTGhih/4UqEnGI8NYPw0FnXKD9tmHDYw
	r9oKWpxTDghRkcfMyAJBUWeLbHMDdkYciirTOaJd9n0gjyxjWabFXiZvxgS2/QFx3zVG7WKkB/d
	Xqp7eU3dTYUnPR2cZm1mL8T2ZmbmoanB5NFubJHNg+MGbIsNm+J10pcRgMK+ylbS/Mk4WezAm9T
	AZ6uInr16xLSTxwPnchqNrHp2464YgyJJXGdfeEEy9653ZsjAJZeKAr41qA5g2zyBydl6HkWO5l
	FZfq+hkJDizkVN2aGKZxQ8qw=
X-Google-Smtp-Source: AGHT+IFpVmmbzidAFPH6s1at1uCKqw6CJ9ipqwmnxcHj1rMJRNOo8Y5nrc4qCBez3R9Guw5kAWM57w==
X-Received: by 2002:a17:907:785:b0:ade:7512:d9ba with SMTP id a640c23a62f3a-adfad358c88mr43903366b.26.1749843815851;
        Fri, 13 Jun 2025 12:43:35 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8159e24sm176836466b.34.2025.06.13.12.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 12:43:35 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: imx8: add core shutdown operation for imx8/imx8x
Date: Fri, 13 Jun 2025 15:43:10 -0400
Message-Id: <20250613194310.1128733-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Currently, the DSP core from i.MX8QM/i.MX8QXP is able to operate while the
firmware image is being loaded. Because of this, the DSP may change the
content of the firmware data just after it was loaded, thus leading to the
data having unexpected values when the DSP is reset (via run()).

Fix this by implementing the core_shutdown() operation that will put the
DSP in stall during suspend(). The stall will be removed during the run()
opertion, thus guaranteeing that the DSP core will not be able to run
while the firmware image is being loaded.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index a40a8047873e..b73dd91bd529 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -40,6 +40,19 @@ struct imx8m_chip_data {
 	struct reset_control *run_stall;
 };
 
+static int imx8_shutdown(struct snd_sof_dev *sdev)
+{
+	/*
+	 * Force the DSP to stall. After the firmware image is loaded,
+	 * the stall will be removed during run() by a matching
+	 * imx_sc_pm_cpu_start() call.
+	 */
+	imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, false,
+			    RESET_VECTOR_VADDR);
+
+	return 0;
+}
+
 /*
  * DSP control.
  */
@@ -281,11 +294,13 @@ static int imx8_ops_init(struct snd_sof_dev *sdev)
 static const struct imx_chip_ops imx8_chip_ops = {
 	.probe = imx8_probe,
 	.core_kick = imx8_run,
+	.core_shutdown = imx8_shutdown,
 };
 
 static const struct imx_chip_ops imx8x_chip_ops = {
 	.probe = imx8_probe,
 	.core_kick = imx8x_run,
+	.core_shutdown = imx8_shutdown,
 };
 
 static const struct imx_chip_ops imx8m_chip_ops = {
-- 
2.34.1

