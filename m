Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFBF18FDD0;
	Fri,  7 Feb 2025 16:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945408; cv=none; b=bJWztmU/gzS8H+aZjDNivuA+2/LADZQOwS5epcFE+0qlkR5yGzRwbizULXmzzwUpUe8BYt3h8fjG9QCvGVXzgVHeZWtjAawsaPzBA9QA7O/nC1pdXiNh7Fxb1qZfFMzohIKv/pmLHOOPkTFBeKeVEvLUQjSXx8wi5SeSHxeqFuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945408; c=relaxed/simple;
	bh=XI8DYyfiLKvub4PmXw7TuJ1urUXl+IC9ImTSN0/1LcY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jFYQRpEC+eeVs98v9QfNVlAbbyeJQ1OJDGRJkqnH9U29yTQ4cSxPm3hWEQ2e5VOSuRi/PQ4ouVmR0BhU4sJGsnyTg51bVpRV+Dr/c9wU0ayPGwt2XJzebt7aUoeiQZCSp9wkXaBHmabljOpOeHfgF1N6uimQthCvQ92LOScxnVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6VjAXTV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6VjAXTV"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dcb7d6b69so390036f8f.3;
        Fri, 07 Feb 2025 08:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738945405; x=1739550205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5S2pc95h+xNAGYglrEbD/pDwanj3CMP4mZo1fmZSwIE=;
        b=K6VjAXTVJUNe/0bRpb0vqh+4pLR9xuA9NN1tVp7KeoNtdVv5KyUwbrCrLvJQRAlba+
         sPmiwpxXlZadJpeCLV310OttFBChCf4wj2Qm/SocBWfmGCrSXz1mIK6rg/DLhL+gRxik
         7n+ww0HNojM7bi4H7+8CLaCVAovE9pxCKa86ZWSkh40+xuQbSK3oPNon6Vg1h+BI4yyV
         zIgU2GLeSUJIx9sxaWjzjaaTdCihlWpV7guGhoUQ+fkjsnFrXPYuVwJwCRgMYDuJfwdG
         LGldmyUvpvLDFOi8c2eI70hIyqabBLaPIRuL4ARc6Wbe/aVKpQvWNrLIDZjEQZzYhUFO
         Ub3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945405; x=1739550205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5S2pc95h+xNAGYglrEbD/pDwanj3CMP4mZo1fmZSwIE=;
        b=ReuEUvU58cxv2Vxg3p2PgpcU9I3x+l29g32QHwaG1R9VEtFP+WModnoDYGV3DI6wV3
         SzZlWzSSPYto5IjQcIyrOspmBUFFxLljLUjZck2J8q2wEGyWV28SS+Swmnaw7PB++pAO
         +SNKJRKF4YAZJfWsttRNSZTXG8LCaKPoa+S6Th5vGFtrPpnDMVb/+MKaj8wwaaNYiVCZ
         h/wceY2fI9xhcAlVTqnM1TpGzpSfz1+QFhLoa6ZLmfunJAj1Tjylvb2tD5lzoztxdFLI
         ApUyw3ieup+PZKvaGdVMSB3iEADk2EiMEYe+C7AepP/AFpsoIfYBMGbiwEkvsKOVIU2+
         a5TQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9w1BEmJrEdUnP8FvJOEs/vdbc9ibyM9B7Z5uqRhlhfgHzv7Rvc9U0u93hIvpuI6PHFZJaFTsGFLPhwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye/OJzWxe2Di9ZSCs9va9XCpUv2fWOThKzcciMG1xdGpFoebCh
	e+Q1oK/1kFS4pf7AaYuuWQpaqrF+CKsijLJKiHh4qYMD9zrgJOTw
X-Gm-Gg: ASbGnctFhSKIQFWfO/HVgEhDZzaMjYAAcuSUKUEE+hKCZX9e0dRnBFQ7pLK4Q2/YJrZ
	ZUp/LMmutzffa9mxAT4tryW5qPQ7aHSP7ZUq0N1c2IzE12mNemdHqekQtrAPQ1Q6urSyfFtHdD+
	86srlPxUUKmYnxeIhC7dGgxr3hwGdUYZaBhjCwZpCsC0IKDndDZmjury2OcJtUCArNk0B9y9K8I
	D6rY/2HxmoN45BFh0585bMwatTvmj0fWvWzpqoyx77LkkpfLy87NHnSFG+uSs1BdDm9EtJKVl0I
	RJHKLUzLYgYCCeYYWdDIwTBawGuNzdZ9SGo4g4dRtEOt6cvcOkWd/w==
X-Google-Smtp-Source: AGHT+IHiwxYpJj114HuQLOINoNybbMY4FCCGqCLIK1FJir5YzqppK45hdCKArgkX2E2fc52bD6UWaw==
X-Received: by 2002:a5d:6d0c:0:b0:38d:b7b0:7087 with SMTP id ffacd0b85a97d-38dc90e5b9bmr2407211f8f.1.1738945404614;
        Fri, 07 Feb 2025 08:23:24 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9652bsm61260825e9.2.2025.02.07.08.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:23:24 -0800 (PST)
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
Subject: [PATCH v3 3/7] ASoC: SOF: imx8: use IMX_SOF_* macros
Date: Fri,  7 Feb 2025 11:22:42 -0500
Message-Id: <20250207162246.3104-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207162246.3104-1-laurentiumihalcea111@gmail.com>
References: <20250207162246.3104-1-laurentiumihalcea111@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 71 +++++++---------------------------------
 1 file changed, 11 insertions(+), 60 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 25e3296a1e5e..52dff369d9cf 100644
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
@@ -238,47 +218,18 @@ static struct snd_sof_of_mach sof_imx8_machs[] = {
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

