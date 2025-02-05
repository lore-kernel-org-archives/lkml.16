Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659C32144C4;
	Wed,  5 Feb 2025 20:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787463; cv=none; b=OcoMHBhoKh2jld1MBQ7/gCWuFIB5P/hp2X6bV7BdG0Zm8xFVPhiFC6A9/P3IgWvgcdMlmG9axORdUWset22wxcVLyH5HaO4j1hwJpMkWhQRzWrQx4zwdr3lJmK/XknLCCg3XT7EBgY+1J2q7FYQNJHKn0smQ5xKfKG3t1XoHGes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787463; c=relaxed/simple;
	bh=ajnbZQ3e0D6V7M+mWPbwkUu44l/yDFphV3w4slUmg+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KZQaQydCw0MY33F6y0HEAhItEBDND3wP0W6yTSk57oJ5qfEFeojfJcNczk8339UKF+wqf9ORyQAqSAZw86FkpdTMjPjOOX/Zt5PlZtERIanv03fcW4aWkb62/H8aP/fbfyOKspV6uXFdtWkv/BtyqaYY2v7VAeXZWcGm4oLM/FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keYTwUvi; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keYTwUvi"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dce3763140so435713a12.3;
        Wed, 05 Feb 2025 12:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738787460; x=1739392260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q19BoYw1wFsQAgppIzeVmEiAEdoAgxK2A6QaivgZP44=;
        b=keYTwUvifTBZqRMT2CigCaT5l9FVhmmUniqE4w1jB4WBKGxiDN7guzcUqpQPbExXjs
         jKxycyaXXt/Y8ELbUQ0wyKHed3MfrbBoXWRfLX2rv+1skw2PdO8NMIlStUVbOu84A8az
         SpeXmIWP/xq+NYKEPQrqwuKi+2ggXx5FRLPy/Ql8A2PVhWiS8erBoSMljw2RXlMyUUCA
         BXNtFlAcL0sN1r0QOxAn4fR9yp2Wio/bJKasFrBLlMHuNLZuxouKxoO2Zhy1ErXQXO6n
         qvBHGI5N5kZyZbT+au2whZa3AfnZPpY/fxb43GFQSwLjpnBfg/wiCQ4gg7i4Tlhg17b3
         dD9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787460; x=1739392260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q19BoYw1wFsQAgppIzeVmEiAEdoAgxK2A6QaivgZP44=;
        b=tG2BGr0y88x/WtC8nuc1cU8c+I26dU8U2tiRHNamRZp0ABnxcWXASe6aU28Elesih+
         vZuB2JlpSIZEyiKv0TijQz31OICn7rK1LTIEdOzrAtspoTdWKuFkkcYtvMjVTbC35oIV
         OX5MSUQnbgWJ4qKUS9WdWA/rdJ+OQfgHoRE/Ygjl3B8bVS6RxkduNiRp6PxhT9lz3Fr2
         TM56uiqQU9tNS4TnDNHLCXbbgYFbPZNUEgy4P5WNy4ka5N991wxMS/GZSlmeXMaq338z
         QNcaaF9fEOXNPQDeZ9ZDJfbLUeRZmCjVUEPOtZIBWJvPrxddOQtdgk1v444JHSqFB7dh
         MEbg==
X-Forwarded-Encrypted: i=1; AJvYcCUU5/e2c1JeDZ4tYEHVlzSt+9q7NyBl66x9mBXt8CuutBn2/eyRCsET5X7LswLaH6njyDg/v/1wr4GaPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ZkrlSMadUq+ePDGOoO0DbzKwSOv3vLnBfpn1alerRKWTvnVk
	EP8mriDhgBkYN3gBPCA1N5gVpfCgkmR2aSLZz+qjB4EvjvbshaoV
X-Gm-Gg: ASbGncvnOowvXc/swge/rXuceWwJK4/TYHhCDh+F/wGh/W2QyphCwX8OxN9KBEbhiLu
	7rw6YpjvrVU4AiLSAj3uVB3ri/5k3b3DdE3A5GMB+0+Mv+Q9MVM5dJJFRDUln1E7rnjZ/wqsJWY
	RbMSAd8XEWGgOg8ge3Nc9oiq6qTbNZ0x1z7w5OxHU2xUdL6807qTypew8HdkpVujCEJRrqxxU1v
	3lpNZ5pzg+RleH6x1Y1Omrzd6oeg0Mtlt4StRSHj2awZKnH/rhmA646KbMPJJTHvSVt9j5tQI9K
	tO7nG1OecsOqna6PmIbEZPupysQUBVmLo4NCMPJFeXfsYl2U1uCL5Q==
X-Google-Smtp-Source: AGHT+IEBjBs4i+haD1xfHAP1IX5bkejMQc7mFjpZa3tEGNcYMVEupFXCWCioc5dl29D2w4W+wTqXlA==
X-Received: by 2002:a05:6402:2392:b0:5dc:e393:af63 with SMTP id 4fb4d7f45d1cf-5dce393afffmr1987522a12.16.1738787459589;
        Wed, 05 Feb 2025 12:30:59 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd309f127sm2848014a12.40.2025.02.05.12.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:30:59 -0800 (PST)
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
Subject: [PATCH v2 4/8] ASoC: SOF: imx8: shuffle structure and function definitions
Date: Wed,  5 Feb 2025 15:30:18 -0500
Message-Id: <20250205203022.2754-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
References: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Shuffle the definitions of some structures and functions such that
they are better grouped. This is purely a cosmetic change.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 86 ++++++++++++++++++++--------------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 52dff369d9cf..5d6524d695e2 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -41,6 +41,49 @@
 #define MBOX_OFFSET	0x800000
 #define MBOX_SIZE	0x1000
 
+static struct snd_soc_dai_driver imx8_dai[] = {
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("esai0", 1, 8),
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai1", 1, 32),
+};
+
+static struct snd_sof_dsp_ops sof_imx8_ops;
+
+static int imx8_ops_init(struct snd_sof_dev *sdev)
+{
+	/* first copy from template */
+	memcpy(&sof_imx8_ops, &sof_imx_ops, sizeof(sof_imx_ops));
+
+	/* then set common imx8 ops */
+	sof_imx8_ops.dbg_dump = imx8_dump;
+	sof_imx8_ops.dsp_arch_ops = &sof_xtensa_arch_ops;
+	sof_imx8_ops.debugfs_add_region_item =
+		snd_sof_debugfs_add_region_item_iomem;
+
+	/* ... and finally set DAI driver */
+	sof_imx8_ops.drv = get_chip_info(sdev)->drv;
+	sof_imx8_ops.num_drv = get_chip_info(sdev)->num_drv;
+
+	return 0;
+}
+
+static int imx8_probe(struct snd_sof_dev *sdev)
+{
+	struct imx_sc_ipc *sc_ipc_handle;
+	struct imx_common_data *common;
+	int ret;
+
+	common = sdev->pdata->hw_pdata;
+
+	ret = imx_scu_get_handle(&sc_ipc_handle);
+	if (ret < 0)
+		return dev_err_probe(sdev->dev, ret,
+				     "failed to fetch SC IPC handle\n");
+
+	common->chip_pdata = sc_ipc_handle;
+
+	return 0;
+}
+
 /*
  * DSP control.
  */
@@ -100,49 +143,6 @@ static int imx8_run(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-static int imx8_probe(struct snd_sof_dev *sdev)
-{
-	struct imx_sc_ipc *sc_ipc_handle;
-	struct imx_common_data *common;
-	int ret;
-
-	common = sdev->pdata->hw_pdata;
-
-	ret = imx_scu_get_handle(&sc_ipc_handle);
-	if (ret < 0)
-		return dev_err_probe(sdev->dev, ret,
-				     "failed to fetch SC IPC handle\n");
-
-	common->chip_pdata = sc_ipc_handle;
-
-	return 0;
-}
-
-static struct snd_soc_dai_driver imx8_dai[] = {
-	IMX_SOF_DAI_DRV_ENTRY_BIDIR("esai0", 1, 8),
-	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai1", 1, 32),
-};
-
-static struct snd_sof_dsp_ops sof_imx8_ops;
-
-static int imx8_ops_init(struct snd_sof_dev *sdev)
-{
-	/* first copy from template */
-	memcpy(&sof_imx8_ops, &sof_imx_ops, sizeof(sof_imx_ops));
-
-	/* then set common imx8 ops */
-	sof_imx8_ops.dbg_dump = imx8_dump;
-	sof_imx8_ops.dsp_arch_ops = &sof_xtensa_arch_ops;
-	sof_imx8_ops.debugfs_add_region_item =
-		snd_sof_debugfs_add_region_item_iomem;
-
-	/* ... and finally set DAI driver */
-	sof_imx8_ops.drv = get_chip_info(sdev)->drv;
-	sof_imx8_ops.num_drv = get_chip_info(sdev)->num_drv;
-
-	return 0;
-}
-
 static const struct imx_chip_ops imx8_chip_ops = {
 	.probe = imx8_probe,
 	.core_kick = imx8_run,
-- 
2.34.1

