Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAA120D516;
	Mon,  3 Feb 2025 17:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603150; cv=none; b=mMS/pPB85xivvo7ZZ2znFtK/oEv2EatWnwlPS8vMDV5fcmqtIFnxfZMSDWn/GeZeEGhQgFd+Lr7MDgJaGRyoCvbKKQe87BBwOtRcls5dkCm/U7+NmIP3sgyiuaj27gz//YYRKo49/51P4JZixWH7IWV5b1FHelEmZc438D3tNeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603150; c=relaxed/simple;
	bh=VNs1yTCL8ASYwgaEioSkbavqaPwUFc/eFJ0jyKYTTC4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sW53jXCOShWhg93uv5OWQqOZ8m4Gj4Ks13RXOBBg1tQm5ZHiANd1onoK5yIFb0h540k0W78+0fjcrtXK/glNoe4zsLvBEX9Cp9labxNkQCoIj5kYu2KVjWKQ4ivboOGKLgv8YeqYEhNzVmrFjqyR32GWsLpl1HMS9oFUo/Cne20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TDm/mBP/; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TDm/mBP/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dcb060ca2dso1982882a12.2;
        Mon, 03 Feb 2025 09:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738603147; x=1739207947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P34NMvrc2uhxkk2+6CwvtqHEG5loNfpYNkGJ1/e/fKQ=;
        b=TDm/mBP/Shktv0/EBbZJXy/Dn4tKyIVFBf9b/9wyR+jmd9+30UJw69DCO9agbzfzqg
         TqrEiwEe9YXcPO2AMB04sIsYfpKDIORJWnH78Db2LVSDi+odMxV3j8cP0HS42EYTEWyY
         6P5UYE328S0Xa7Nu4YjQwJ+WsxXqqYxD3yzF4ip80Ew/vy1spveDPyXXK+M/pb8+BlOG
         Jl9/T4I8hHehEDg9qaAoYqgU339j/qfAZWq2qElNPeWcUxKIqWpC5l0MNiCiwXl4HhIi
         eNDs9B7rlSCsjBUSPwr1WGqzpqO2sMu3iqys2OZ4UVFFs0bl879i4dVHLY2tt+cW2TVN
         FmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603147; x=1739207947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P34NMvrc2uhxkk2+6CwvtqHEG5loNfpYNkGJ1/e/fKQ=;
        b=EQQ6xssKnHG/kKLuVERxToE39mXSIVQwq8mi9u7ZkqOuDGpxb3ybMtlzL5iGoLwezG
         HAGleWTXJ2LdQZYNr4TArG7FNJO2SzS0b0kjlCMTyUvoh0IVnN/Lgd2By2KfhXTEIiRE
         3wxAPDWO2OW4MFmaAYDDdp6jSh0xf0oyVOY3YXAuw5C0LCZazP8oYEnb1PxxKz3fymvt
         zgLRBkkmO6ohywXKpiRk52JHinqWyuWkTLNI3S7rdhjRX0/wGAZN2dNdPHT05EDZN2g/
         6x6j3Mp214ytMs9l4vo/BQH8movNwx47eheBOBeyRXhGoT/g9IXEQB910Ytqoa+jENEZ
         xLTg==
X-Forwarded-Encrypted: i=1; AJvYcCUZMnHIM4sUZWiFYHMoW5MhK9vo0a6yESi8el99ZjcRwY/dRVJSS231/6thQPCSoViLNdkkjGDH0OJ0sg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4X1Ln6HEh8bMY0qyWqW4XSv9J3hAYqOJTxpEmiAQ41YUGbo5Y
	ijg9Lyw4R55c9NgD66sDeZUopAWqPtyLruiU7dPGc3qTjAp+fuNw
X-Gm-Gg: ASbGncu2Vr7t1nHuxluF+g05yBViFgoiKsEc+kxmbh3mvdEwe+jxsH32p1WeAzWC0k1
	GKSu+A5GyYF9MG4G3n7uYJRtowydOzQH3iuikDPchBE8D9ODIPXIXPwwXU9xQnLZJbofWwjHmyv
	ItPxunRp5059XN/1zQnFNKOKt/6Q9JLnDkzrWPho0uRPlr/9dSsjBZq+ID18lPw9aMaaFY9pSBG
	nEYqnWneXW3JbKpDmmBSObSW82Tyk5R1DMOwWL9Zi4nmV+UlwHS0WkvinMbXBZyFqeoJ5uTfFQj
	4SIK6at5d1tqnC7NMrA10nawV25Rv7raxNBBTnGT7uDYP+Ia3Q==
X-Google-Smtp-Source: AGHT+IEdHXc+fPM0xVNULF/V/H9tGXzO0UkrXEfKGHXOEa7lVWvXt/Sg1j5c1jXanaNrw8TTK2W3kg==
X-Received: by 2002:a17:906:6a17:b0:ab3:2b85:5d5 with SMTP id a640c23a62f3a-ab6cfdc6186mr2164326366b.49.1738603146473;
        Mon, 03 Feb 2025 09:19:06 -0800 (PST)
Received: from playground.localdomain ([92.120.5.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47d21aasm784253866b.74.2025.02.03.09.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:19:05 -0800 (PST)
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
Subject: [PATCH 3/9] ASoC: SOF: imx8: use IMX_SOF_* macros
Date: Mon,  3 Feb 2025 12:18:02 -0500
Message-Id: <20250203171808.4108-4-laurentiumihalcea111@gmail.com>
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

The definition of 'struct sof_dev_desc' has the following properties
for imx chips:

  1) FW path is the same for all chips.
  2) Topology path is the same for all chips.
  3) FW name can be written as: "sof-${machine_name}.ri"
  4) IPC3 is the only supported protocol

The structure takes quite a few lines of code. Since the intention
is to add support for more imx8 chips in the same driver, we need
to try and reduce the number of lines taken by information that's
not particularly useful. As such, we can use 'IMX_SOF_DEV_DESC()'
to reduce the declaration of the structure to just one line. The
only information that's particularly useful can be seen from the
parameters of the macro.

Of course, if any of the assumptions don't apply anymore, driver
writers can simply declare the 'struct sof_dev_desc' the "old
fashioned way". No reason to make the macro suit multiple needs.

The same logic applies to the array of 'struct snd_soc_dai_driver'.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 71 +++++++---------------------------------
 1 file changed, 11 insertions(+), 60 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index a44c3004a537..05c4d70cd116 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -119,28 +119,8 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 }
 
 static struct snd_soc_dai_driver imx8_dai[] = {
-{
-	.name = "esai0",
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 8,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 8,
-	},
-},
-{
-	.name = "sai1",
-	.playback = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-	.capture = {
-		.channels_min = 1,
-		.channels_max = 32,
-	},
-},
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("esai0", 1, 8),
+	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai1", 1, 32),
 };
 
 static struct snd_sof_dsp_ops sof_imx8_ops;
@@ -234,47 +214,18 @@ static struct snd_sof_of_mach sof_imx8_machs[] = {
 	{}
 };
 
-static struct sof_dev_desc sof_of_imx8qxp_desc = {
-	.of_machines	= sof_imx8_machs,
-	.chip_info	= &imx8x_chip_info,
-	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
-	.ipc_default		= SOF_IPC_TYPE_3,
-	.default_fw_path = {
-		[SOF_IPC_TYPE_3] = "imx/sof",
-	},
-	.default_tplg_path = {
-		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
-	},
-	.default_fw_filename = {
-		[SOF_IPC_TYPE_3] = "sof-imx8x.ri",
-	},
-	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
-	.ops = &sof_imx8_ops,
-	.ops_init = imx8_ops_init,
-};
+IMX_SOF_DEV_DESC(imx8, sof_imx8_machs, &imx8_chip_info, &sof_imx8_ops, imx8_ops_init);
+IMX_SOF_DEV_DESC(imx8x, sof_imx8_machs, &imx8x_chip_info, &sof_imx8_ops, imx8_ops_init);
 
-static struct sof_dev_desc sof_of_imx8qm_desc = {
-	.of_machines	= sof_imx8_machs,
-	.chip_info	= &imx8_chip_info,
-	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
-	.ipc_default		= SOF_IPC_TYPE_3,
-	.default_fw_path = {
-		[SOF_IPC_TYPE_3] = "imx/sof",
-	},
-	.default_tplg_path = {
-		[SOF_IPC_TYPE_3] = "imx/sof-tplg",
+static const struct of_device_id sof_of_imx8_ids[] = {
+	{
+		.compatible = "fsl,imx8qxp-dsp",
+		.data = &IMX_SOF_DEV_DESC_NAME(imx8x),
 	},
-	.default_fw_filename = {
-		[SOF_IPC_TYPE_3] = "sof-imx8.ri",
+	{
+		.compatible = "fsl,imx8qm-dsp",
+		.data = &IMX_SOF_DEV_DESC_NAME(imx8),
 	},
-	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
-	.ops = &sof_imx8_ops,
-	.ops_init = imx8_ops_init,
-};
-
-static const struct of_device_id sof_of_imx8_ids[] = {
-	{ .compatible = "fsl,imx8qxp-dsp", .data = &sof_of_imx8qxp_desc},
-	{ .compatible = "fsl,imx8qm-dsp", .data = &sof_of_imx8qm_desc},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sof_of_imx8_ids);
-- 
2.34.1

