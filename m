Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76B72144A3;
	Wed,  5 Feb 2025 20:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787461; cv=none; b=ksX1gFEk3bi7EXePeHMpLDYagxJOhUkKAIg8HCUbSis8HJN37BPapmB6o4kDcOzaB+Q0R9h4+PZ0bitkOYcMQN0ARTmKvDaxom/7utnsCiI0GJSudGUVIrje9+5u1rknMNeJfLzwYYjZ+K6xnvSr7Dz1sk1S3YX4lEtZRsl6yo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787461; c=relaxed/simple;
	bh=DERUkf3Ndnn80VwfyhwE0RxeXuKQ4vhj1CUs/t/WHsc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hRsNBVDRbcIlWwfBcT+z32Qg9WcJyUMC7guosSBgzioIgqK0lqsFPzLshIxOB268eeBtfkHD7BIAf2WxEaLGq5vBSHJZxXE71t0BveIeFguW/toRITDZx8/gNrY7FKR3CRMJi6Ev+/Yf6RCadSoOd4bW7A7AqDmxeEy1dRptaD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiEll0Kn; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiEll0Kn"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dce27a72e8so446947a12.2;
        Wed, 05 Feb 2025 12:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738787458; x=1739392258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDTMpJw6LcKOnZi/nrJKAK8RACzjtMQBi0otBSlqOMY=;
        b=HiEll0KnNUj5as9/OkZfdrQD+8KuhFVlUsO/T4KtW+nPeGQhEIPsmEFMfBGazhg679
         5hyEWaNdOq05v3RmFqTk5HnqMmRC90xo5+yY2oRVNqmAWo0bjc76sLdlYykjjglwJswr
         hQ6kWVF4S3U0yvArplyAR4o0ekji6JkVOV5RUuGe0nsSfCovvj6QpH8uVVXT9Ok2pUjI
         ruZmYxKk/KUfIE9m1JX2cLkASRxjm/xCZO6soZydmid9Yr9RNTEJcDspfWriFIuQl9gA
         gx2WJj84BnX4IEpLSNARLyt+kaemzhdGG1b+SiyapDi3FqfQ/hI+G1dCXo0pu7xCvkLY
         NIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787458; x=1739392258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDTMpJw6LcKOnZi/nrJKAK8RACzjtMQBi0otBSlqOMY=;
        b=UiTcqluhK7UPZ+c0AB3vtZok6KoW7mHua2mZe+NB00X4Z0G7EsPbn3ZkAeZ7Gggrsf
         z6c3eb5BWkQyt2GUfSxQb7JVCfU4zHPUDkwXGyqCwHHitw9mD6rB6AIJrk/ux/F2ypqN
         lPS3OhV+V6DArDXdC+FycRVxiv0ADS7y3UG7SJumkpGIN33NeZ/HRWW8ijrd/j3oIGoh
         c+t6JYrNbQXViMdGdnmC+0lPtgzLN/wpNSCQSRaYUo/rW5ELuzKiaNNsf7OonQpl8Ogn
         zSHo+sZU59+a8qxgBa09qaaXQ5LrZDrCypqhmlW9A/LjvReflOgpOZODzwlqFWqI/gBp
         06AA==
X-Forwarded-Encrypted: i=1; AJvYcCVF9/+d8TsFhONR8SCz+eDekuOnS6UhO8iIMgy+CcE617UqKwdKxmShHC8kldU+qVlJbU6zelZisNg+oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyB6elrIqZ5BjAAgVRw55tet/tr7czIog6hjTFGVoxMLjLpAbpP
	WkCwmlHfrFvKjNfEbuuSFvOvuA3JM/n+qxk0rz6xgnQGM30nueP9
X-Gm-Gg: ASbGnctm4nfsGdhLkFImWypVc+G4fhOWV958lVhqGBFW35BLSdLToDRerGA99DuiwuK
	3lRv5KKPxMN1svHP6m2dnqeYHatSYixc/amzD58G4Smd7mqptbTO5SWbUTidyLmj7RGzDc+xFO1
	QH3d1fnyqbMbeJFpXuEAcIGKZjdHdHbPTEjzRX5RE20pFfgdyCHlMNiC2yhF5YPSckfz4sKxs/6
	gTAtrZqo2LqVnthwvN6rD8zaWtcmR72ph8jSFPyhG4ewQwnTkAwB0pF6CClcfcgjxlEp/uvXNrn
	ri7Sk+fv0froo8fPTrzOPA4hqXzNbK5ILx5pisAdFYsc2zd9Ou+trQ==
X-Google-Smtp-Source: AGHT+IGvoPHjemLgM1s7lxJyuJvRNxcx7Xo5a04p/jxjwtUIw/nEo5+h88xyo5nKAQp8DwQHUovsLQ==
X-Received: by 2002:a05:6402:4303:b0:5dc:7b59:445b with SMTP id 4fb4d7f45d1cf-5dcdb77f78dmr5903338a12.28.1738787457743;
        Wed, 05 Feb 2025 12:30:57 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd309f127sm2848014a12.40.2025.02.05.12.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:30:56 -0800 (PST)
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
Subject: [PATCH v2 3/8] ASoC: SOF: imx8: use IMX_SOF_* macros
Date: Wed,  5 Feb 2025 15:30:17 -0500
Message-Id: <20250205203022.2754-4-laurentiumihalcea111@gmail.com>
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

