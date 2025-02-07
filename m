Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EC8189520;
	Fri,  7 Feb 2025 16:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945407; cv=none; b=pkeLihqGTlWCmgth3r7BKWwSaCUTGH3N6b2oCf1QZq9ghXbTLRcBQYNaWeiZagOODU/9jygPELPbMsYiDHabUWmBNa99IGkPTO4vmtTulik4HE6zmVD1a0o34FTltfrU3arSqE351N1W+jDdCCgRzdP6ByXY8OGb7nN3+yYRv5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945407; c=relaxed/simple;
	bh=9HLV7IHXzWJGSyHLuaXFna5AZqzxlSasoXzKVVS0Edc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mb42kS1nZG/m6v2Nyzlxxx5/RYg0nAta7mIzh8dWCrxdpapnQO60CTorF+DZzGIeQsRioD9LLP0sl8Ymz2MsVpb+hFN5hRty6iHojK5om9d1Y5l3vpWxZpFQ73aq3VS0I42qMSploVfPEUGDLy8qlRVVVill8mGCwmI/jGz2DOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ky/Uy1ux; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ky/Uy1ux"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso22596255e9.0;
        Fri, 07 Feb 2025 08:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738945403; x=1739550203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7yCL33ZE5Gfcs3hwx/9kFUK5S1ClXcHksGZsjVXJpo=;
        b=Ky/Uy1ux3n0JOZ1vWGH9pvHNa/FpJcvte2unHqLaP5oWGzbBqcv43zbFcXRWETppFF
         2LyxctTW6sLxGKrlFSlZF1vKt1ZnzSBlA10wD6MDxBJ+rYMdKOP++xGHxRMarGjTl4a2
         gMA251dU6H46sZepPHOCdSu7V8bZUPUVN459VkJyUJCM0IuuaU0VqnlKsl8rKW+j0C4q
         g5xMZnlTIv/4vf2BoeLzxHRmCQAkSt1pmLM/93MN7lh2W4NgbIyTQxplb0Kc2dQHNhcs
         hm0RalHs/QCKv16/klK8qZAsNbj4bavuulA/fa5lTvTLjJuQqHxbwYcCpr0bxzT34npf
         Sbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945403; x=1739550203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7yCL33ZE5Gfcs3hwx/9kFUK5S1ClXcHksGZsjVXJpo=;
        b=rK3WY+YTGOgMdUavU3n9Rv9Y0a4DKFrUXMqtxC5RvSG6pK1TYTwdp2ybjRZCSCcaSX
         X22M/L1870AuCqMBwyuJn8h/amQUkvxwZtGR+e1w2jEiGZuoYX6pZqPa48zclWvt54Dz
         phzfAu/h6oQvyI+6OKB2RTWNoBfeINHn5B/RXP4ZzGLfSaXakiuRNFECyRXCDKkNzsAK
         d5f1m/v6aLkgKz6chDoEGTnKZOfu4R85FogzA2WOacAOBTOzQBJAnsmLeciQYMU8uwZK
         2Yla2CkUhyq9mYuTFNdVRYsz+qQrcri5Irs/khNTmwpDQTOWEu2Q1fiNXC6DQCDi/SD7
         KUaA==
X-Forwarded-Encrypted: i=1; AJvYcCUOaN8RM9wllA2ZN9QTl3rFRz02lj7JVnPGMhNnafMG/uXDWSe2PA+/h4lo6fdNB3Y8jV0t1pTWrO4t3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVROrPWqcYFAx7Ie+72EKmHCkZBauz8QafBrknn2ZCXFyhfDpv
	eZKoK+DjyKI/D4CeszMi9y4bz5kHLoYTuAvwsPPt3sjlKwtZMcBf
X-Gm-Gg: ASbGncvYYFDozz5dHQgG+KeHerKsquG8HN6CJ9GPeSH6Vw2uaD09h8ua40VXXZ3E4Er
	/iLc69QLapu4Bgv9QoaNbfcbf+YN1WVrG5BLasr5TKiLsDhkI1HaB8ZLXE6gXFzkg/MX/ZZG6Kp
	1b8s/h67DElaiY/iTK/yEHlSAaJKST92aMWvywbehE3AcfJZCTevozZGmRwLMXZZfTM3TfjXQtT
	ecTAj6YOrpdydcTjJZ8m8wLUiGuIIH7s8CdrJJOOovaujz1c+8Zm9PuzEWy+3pNs/ZsYp3s7XLn
	PZ0J+uVm0OMQpsjYcqEGa773Ml/hnBStcdCJwzRNUHEbwce6/PuyOA==
X-Google-Smtp-Source: AGHT+IFWyr3cHKYblm3lpyiF0iZHIoOnWPUrt1EneB1gaznh3yX7ZDQqPgyCGjWw8Eg0n/CxoMmeWg==
X-Received: by 2002:a05:600c:4e44:b0:436:9227:915 with SMTP id 5b1f17b1804b1-4392498796dmr30243755e9.9.1738945402982;
        Fri, 07 Feb 2025 08:23:22 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9652bsm61260825e9.2.2025.02.07.08.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:23:22 -0800 (PST)
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
Subject: [PATCH v3 2/7] ASoC: SOF: imx8: use common imx chip interface
Date: Fri,  7 Feb 2025 11:22:41 -0500
Message-Id: <20250207162246.3104-3-laurentiumihalcea111@gmail.com>
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

The common interface for imx chips (defined in imx-common.c) contains the
definitions for a lot of functions required by the SOF core. As such, the
platform driver can just use the common definitions instead of duplicating
code by re-defining aforementioned functions.

Make the transition to the new common interface. This consists of:

  1) Removing unneeded functions, which are already defined in the
  common interface.

  2) Defining some chip-specific operations/structures required by the
  interface to work.

  3) Dropping structure definitions that are no longer needed.

  4) Adapting some existing functions to the new interface.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 522 +++++----------------------------------
 1 file changed, 65 insertions(+), 457 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 1e7bf00d7c46..25e3296a1e5e 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
-// Copyright 2019 NXP
+// Copyright 2019-2025 NXP
 //
 // Author: Daniel Baluta <daniel.baluta@nxp.com>
 //
@@ -41,100 +41,28 @@
 #define MBOX_OFFSET	0x800000
 #define MBOX_SIZE	0x1000
 
-struct imx8_priv {
-	struct device *dev;
-	struct snd_sof_dev *sdev;
-
-	/* DSP IPC handler */
-	struct imx_dsp_ipc *dsp_ipc;
-	struct platform_device *ipc_dev;
-
-	/* System Controller IPC handler */
-	struct imx_sc_ipc *sc_ipc;
-
-	/* Power domain handling */
-	int num_domains;
-	struct device **pd_dev;
-	struct device_link **link;
-
-	struct clk_bulk_data *clks;
-	int clk_num;
-};
-
-static int imx8_get_mailbox_offset(struct snd_sof_dev *sdev)
-{
-	return MBOX_OFFSET;
-}
-
-static int imx8_get_window_offset(struct snd_sof_dev *sdev, u32 id)
-{
-	return MBOX_OFFSET;
-}
-
-static void imx8_dsp_handle_reply(struct imx_dsp_ipc *ipc)
-{
-	struct imx8_priv *priv = imx_dsp_get_data(ipc);
-	unsigned long flags;
-
-	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
-	snd_sof_ipc_process_reply(priv->sdev, 0);
-	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
-}
-
-static void imx8_dsp_handle_request(struct imx_dsp_ipc *ipc)
-{
-	struct imx8_priv *priv = imx_dsp_get_data(ipc);
-	u32 p; /* panic code */
-
-	/* Read the message from the debug box. */
-	sof_mailbox_read(priv->sdev, priv->sdev->debug_box.offset + 4, &p, sizeof(p));
-
-	/* Check to see if the message is a panic code (0x0dead***) */
-	if ((p & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC)
-		snd_sof_dsp_panic(priv->sdev, p, true);
-	else
-		snd_sof_ipc_msgs_rx(priv->sdev);
-}
-
-static struct imx_dsp_ops dsp_ops = {
-	.handle_reply		= imx8_dsp_handle_reply,
-	.handle_request		= imx8_dsp_handle_request,
-};
-
-static int imx8_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
-{
-	struct imx8_priv *priv = sdev->pdata->hw_pdata;
-
-	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
-			  msg->msg_size);
-	imx_dsp_ring_doorbell(priv->dsp_ipc, 0);
-
-	return 0;
-}
-
 /*
  * DSP control.
  */
 static int imx8x_run(struct snd_sof_dev *sdev)
 {
-	struct imx8_priv *dsp_priv = sdev->pdata->hw_pdata;
 	int ret;
 
-	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
+	ret = imx_sc_misc_set_control(get_chip_pdata(sdev), IMX_SC_R_DSP,
 				      IMX_SC_C_OFS_SEL, 1);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Error system address offset source select\n");
 		return ret;
 	}
 
-	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
+	ret = imx_sc_misc_set_control(get_chip_pdata(sdev), IMX_SC_R_DSP,
 				      IMX_SC_C_OFS_AUDIO, 0x80);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Error system address offset of AUDIO\n");
 		return ret;
 	}
 
-	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
+	ret = imx_sc_misc_set_control(get_chip_pdata(sdev), IMX_SC_R_DSP,
 				      IMX_SC_C_OFS_PERIPH, 0x5A);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Error system address offset of PERIPH %d\n",
@@ -142,14 +70,14 @@ static int imx8x_run(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
+	ret = imx_sc_misc_set_control(get_chip_pdata(sdev), IMX_SC_R_DSP,
 				      IMX_SC_C_OFS_IRQ, 0x51);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Error system address offset of IRQ\n");
 		return ret;
 	}
 
-	imx_sc_pm_cpu_start(dsp_priv->sc_ipc, IMX_SC_R_DSP, true,
+	imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, true,
 			    RESET_VECTOR_VADDR);
 
 	return 0;
@@ -157,17 +85,16 @@ static int imx8x_run(struct snd_sof_dev *sdev)
 
 static int imx8_run(struct snd_sof_dev *sdev)
 {
-	struct imx8_priv *dsp_priv = sdev->pdata->hw_pdata;
 	int ret;
 
-	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
+	ret = imx_sc_misc_set_control(get_chip_pdata(sdev), IMX_SC_R_DSP,
 				      IMX_SC_C_OFS_SEL, 0);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Error system address offset source select\n");
 		return ret;
 	}
 
-	imx_sc_pm_cpu_start(dsp_priv->sc_ipc, IMX_SC_R_DSP, true,
+	imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, true,
 			    RESET_VECTOR_VADDR);
 
 	return 0;
@@ -175,272 +102,20 @@ static int imx8_run(struct snd_sof_dev *sdev)
 
 static int imx8_probe(struct snd_sof_dev *sdev)
 {
-	struct platform_device *pdev = to_platform_device(sdev->dev);
-	struct device_node *np = pdev->dev.of_node;
-	struct device_node *res_node;
-	struct resource *mmio;
-	struct imx8_priv *priv;
-	struct resource res;
-	u32 base, size;
-	int ret = 0;
-	int i;
-
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	sdev->num_cores = 1;
-	sdev->pdata->hw_pdata = priv;
-	priv->dev = sdev->dev;
-	priv->sdev = sdev;
-
-	/* power up device associated power domains */
-	priv->num_domains = of_count_phandle_with_args(np, "power-domains",
-						       "#power-domain-cells");
-	if (priv->num_domains < 0) {
-		dev_err(sdev->dev, "no power-domains property in %pOF\n", np);
-		return priv->num_domains;
-	}
-
-	priv->pd_dev = devm_kmalloc_array(&pdev->dev, priv->num_domains,
-					  sizeof(*priv->pd_dev), GFP_KERNEL);
-	if (!priv->pd_dev)
-		return -ENOMEM;
-
-	priv->link = devm_kmalloc_array(&pdev->dev, priv->num_domains,
-					sizeof(*priv->link), GFP_KERNEL);
-	if (!priv->link)
-		return -ENOMEM;
-
-	for (i = 0; i < priv->num_domains; i++) {
-		priv->pd_dev[i] = dev_pm_domain_attach_by_id(&pdev->dev, i);
-		if (IS_ERR(priv->pd_dev[i])) {
-			ret = PTR_ERR(priv->pd_dev[i]);
-			goto exit_unroll_pm;
-		}
-		priv->link[i] = device_link_add(&pdev->dev, priv->pd_dev[i],
-						DL_FLAG_STATELESS |
-						DL_FLAG_PM_RUNTIME |
-						DL_FLAG_RPM_ACTIVE);
-		if (!priv->link[i]) {
-			ret = -ENOMEM;
-			dev_pm_domain_detach(priv->pd_dev[i], false);
-			goto exit_unroll_pm;
-		}
-	}
-
-	ret = imx_scu_get_handle(&priv->sc_ipc);
-	if (ret) {
-		dev_err(sdev->dev, "Cannot obtain SCU handle (err = %d)\n",
-			ret);
-		goto exit_unroll_pm;
-	}
-
-	priv->ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
-						      PLATFORM_DEVID_NONE,
-						      pdev, sizeof(*pdev));
-	if (IS_ERR(priv->ipc_dev)) {
-		ret = PTR_ERR(priv->ipc_dev);
-		goto exit_unroll_pm;
-	}
-
-	priv->dsp_ipc = dev_get_drvdata(&priv->ipc_dev->dev);
-	if (!priv->dsp_ipc) {
-		/* DSP IPC driver not probed yet, try later */
-		ret = -EPROBE_DEFER;
-		dev_err(sdev->dev, "Failed to get drvdata\n");
-		goto exit_pdev_unregister;
-	}
-
-	imx_dsp_set_data(priv->dsp_ipc, priv);
-	priv->dsp_ipc->ops = &dsp_ops;
-
-	/* DSP base */
-	mmio = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (mmio) {
-		base = mmio->start;
-		size = resource_size(mmio);
-	} else {
-		dev_err(sdev->dev, "error: failed to get DSP base at idx 0\n");
-		ret = -EINVAL;
-		goto exit_pdev_unregister;
-	}
-
-	sdev->bar[SOF_FW_BLK_TYPE_IRAM] = devm_ioremap(sdev->dev, base, size);
-	if (!sdev->bar[SOF_FW_BLK_TYPE_IRAM]) {
-		dev_err(sdev->dev, "failed to ioremap base 0x%x size 0x%x\n",
-			base, size);
-		ret = -ENODEV;
-		goto exit_pdev_unregister;
-	}
-	sdev->mmio_bar = SOF_FW_BLK_TYPE_IRAM;
-
-	res_node = of_parse_phandle(np, "memory-region", 0);
-	if (!res_node) {
-		dev_err(&pdev->dev, "failed to get memory region node\n");
-		ret = -ENODEV;
-		goto exit_pdev_unregister;
-	}
-
-	ret = of_address_to_resource(res_node, 0, &res);
-	of_node_put(res_node);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to get reserved region address\n");
-		goto exit_pdev_unregister;
-	}
-
-	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev, res.start,
-							  resource_size(&res));
-	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
-		dev_err(sdev->dev, "failed to ioremap mem 0x%x size 0x%x\n",
-			base, size);
-		ret = -ENOMEM;
-		goto exit_pdev_unregister;
-	}
-	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
-
-	/* set default mailbox offset for FW ready message */
-	sdev->dsp_box.offset = MBOX_OFFSET;
-
-	ret = devm_clk_bulk_get_all(sdev->dev, &priv->clks);
-	if (ret < 0) {
-		dev_err(sdev->dev, "failed to fetch clocks: %d\n", ret);
-		goto exit_pdev_unregister;
-	}
-	priv->clk_num = ret;
-
-	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
-	if (ret < 0) {
-		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
-		goto exit_pdev_unregister;
-	}
-
-	return 0;
-
-exit_pdev_unregister:
-	platform_device_unregister(priv->ipc_dev);
-exit_unroll_pm:
-	while (--i >= 0) {
-		device_link_del(priv->link[i]);
-		dev_pm_domain_detach(priv->pd_dev[i], false);
-	}
-
-	return ret;
-}
-
-static void imx8_remove(struct snd_sof_dev *sdev)
-{
-	struct imx8_priv *priv = sdev->pdata->hw_pdata;
-	int i;
-
-	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
-	platform_device_unregister(priv->ipc_dev);
-
-	for (i = 0; i < priv->num_domains; i++) {
-		device_link_del(priv->link[i]);
-		dev_pm_domain_detach(priv->pd_dev[i], false);
-	}
-}
-
-/* on i.MX8 there is 1 to 1 match between type and BAR idx */
-static int imx8_get_bar_index(struct snd_sof_dev *sdev, u32 type)
-{
-	/* Only IRAM and SRAM bars are valid */
-	switch (type) {
-	case SOF_FW_BLK_TYPE_IRAM:
-	case SOF_FW_BLK_TYPE_SRAM:
-		return type;
-	default:
-		return -EINVAL;
-	}
-}
-
-static void imx8_suspend(struct snd_sof_dev *sdev)
-{
-	int i;
-	struct imx8_priv *priv = (struct imx8_priv *)sdev->pdata->hw_pdata;
-
-	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
-		imx_dsp_free_channel(priv->dsp_ipc, i);
-
-	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
-}
-
-static int imx8_resume(struct snd_sof_dev *sdev)
-{
-	struct imx8_priv *priv = (struct imx8_priv *)sdev->pdata->hw_pdata;
-	int ret;
-	int i;
-
-	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
-	if (ret < 0) {
-		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
-		return ret;
-	}
-
-	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
-		imx_dsp_request_channel(priv->dsp_ipc, i);
-
-	return 0;
-}
-
-static int imx8_dsp_runtime_resume(struct snd_sof_dev *sdev)
-{
+	struct imx_sc_ipc *sc_ipc_handle;
+	struct imx_common_data *common;
 	int ret;
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = SOF_DSP_PM_D0,
-	};
-
-	ret = imx8_resume(sdev);
-	if (ret < 0)
-		return ret;
-
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
-}
-
-static int imx8_dsp_runtime_suspend(struct snd_sof_dev *sdev)
-{
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = SOF_DSP_PM_D3,
-	};
-
-	imx8_suspend(sdev);
-
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
-}
 
-static int imx8_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
-{
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = target_state,
-	};
-
-	if (!pm_runtime_suspended(sdev->dev))
-		imx8_suspend(sdev);
+	common = sdev->pdata->hw_pdata;
 
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
-}
-
-static int imx8_dsp_resume(struct snd_sof_dev *sdev)
-{
-	int ret;
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = SOF_DSP_PM_D0,
-	};
-
-	ret = imx8_resume(sdev);
+	ret = imx_scu_get_handle(&sc_ipc_handle);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(sdev->dev, ret,
+				     "failed to fetch SC IPC handle\n");
 
-	if (pm_runtime_suspended(sdev->dev)) {
-		pm_runtime_disable(sdev->dev);
-		pm_runtime_set_active(sdev->dev);
-		pm_runtime_mark_last_busy(sdev->dev);
-		pm_runtime_enable(sdev->dev);
-		pm_runtime_idle(sdev->dev);
-	}
+	common->chip_pdata = sc_ipc_handle;
 
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
+	return 0;
 }
 
 static struct snd_soc_dai_driver imx8_dai[] = {
@@ -468,135 +143,64 @@ static struct snd_soc_dai_driver imx8_dai[] = {
 },
 };
 
-static int imx8_dsp_set_power_state(struct snd_sof_dev *sdev,
-				    const struct sof_dsp_power_state *target_state)
-{
-	sdev->dsp_power_state = *target_state;
-
-	return 0;
-}
+static struct snd_sof_dsp_ops sof_imx8_ops;
 
-/* i.MX8 ops */
-static const struct snd_sof_dsp_ops sof_imx8_ops = {
-	/* probe and remove */
-	.probe		= imx8_probe,
-	.remove		= imx8_remove,
-	/* DSP core boot */
-	.run		= imx8_run,
-
-	/* Block IO */
-	.block_read	= sof_block_read,
-	.block_write	= sof_block_write,
-
-	/* Mailbox IO */
-	.mailbox_read	= sof_mailbox_read,
-	.mailbox_write	= sof_mailbox_write,
-
-	/* ipc */
-	.send_msg	= imx8_send_msg,
-	.get_mailbox_offset	= imx8_get_mailbox_offset,
-	.get_window_offset	= imx8_get_window_offset,
+static int imx8_ops_init(struct snd_sof_dev *sdev)
+{
+	/* first copy from template */
+	memcpy(&sof_imx8_ops, &sof_imx_ops, sizeof(sof_imx_ops));
 
-	.ipc_msg_data	= sof_ipc_msg_data,
-	.set_stream_data_offset = sof_set_stream_data_offset,
+	/* then set common imx8 ops */
+	sof_imx8_ops.dbg_dump = imx8_dump;
+	sof_imx8_ops.dsp_arch_ops = &sof_xtensa_arch_ops;
+	sof_imx8_ops.debugfs_add_region_item =
+		snd_sof_debugfs_add_region_item_iomem;
 
-	.get_bar_index	= imx8_get_bar_index,
+	/* ... and finally set DAI driver */
+	sof_imx8_ops.drv = get_chip_info(sdev)->drv;
+	sof_imx8_ops.num_drv = get_chip_info(sdev)->num_drv;
 
-	/* firmware loading */
-	.load_firmware	= snd_sof_load_firmware_memcpy,
+	return 0;
+}
 
-	/* Debug information */
-	.dbg_dump = imx8_dump,
-	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
+static const struct imx_chip_ops imx8_chip_ops = {
+	.probe = imx8_probe,
+	.core_kick = imx8_run,
+};
 
-	/* stream callbacks */
-	.pcm_open = sof_stream_pcm_open,
-	.pcm_close = sof_stream_pcm_close,
+static const struct imx_chip_ops imx8x_chip_ops = {
+	.probe = imx8_probe,
+	.core_kick = imx8x_run,
+};
 
-	/* Firmware ops */
-	.dsp_arch_ops = &sof_xtensa_arch_ops,
+static struct imx_memory_info imx8_memory_regions[] = {
+	{ .name = "iram", .reserved = false },
+	{ .name = "sram", .reserved = true },
+	{ }
+};
 
-	/* DAI drivers */
+static const struct imx_chip_info imx8_chip_info = {
+	.ipc_info = {
+		.has_panic_code = true,
+		.boot_mbox_offset = 0x800000,
+		.window_offset = 0x800000,
+	},
+	.memory = imx8_memory_regions,
 	.drv = imx8_dai,
 	.num_drv = ARRAY_SIZE(imx8_dai),
-
-	/* ALSA HW info flags */
-	.hw_info =	SNDRV_PCM_INFO_MMAP |
-			SNDRV_PCM_INFO_MMAP_VALID |
-			SNDRV_PCM_INFO_INTERLEAVED |
-			SNDRV_PCM_INFO_PAUSE |
-			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
-
-	/* PM */
-	.runtime_suspend	= imx8_dsp_runtime_suspend,
-	.runtime_resume		= imx8_dsp_runtime_resume,
-
-	.suspend	= imx8_dsp_suspend,
-	.resume		= imx8_dsp_resume,
-
-	.set_power_state	= imx8_dsp_set_power_state,
+	.ops = &imx8_chip_ops,
 };
 
-/* i.MX8X ops */
-static const struct snd_sof_dsp_ops sof_imx8x_ops = {
-	/* probe and remove */
-	.probe		= imx8_probe,
-	.remove		= imx8_remove,
-	/* DSP core boot */
-	.run		= imx8x_run,
-
-	/* Block IO */
-	.block_read	= sof_block_read,
-	.block_write	= sof_block_write,
-
-	/* Mailbox IO */
-	.mailbox_read	= sof_mailbox_read,
-	.mailbox_write	= sof_mailbox_write,
-
-	/* ipc */
-	.send_msg	= imx8_send_msg,
-	.get_mailbox_offset	= imx8_get_mailbox_offset,
-	.get_window_offset	= imx8_get_window_offset,
-
-	.ipc_msg_data	= sof_ipc_msg_data,
-	.set_stream_data_offset = sof_set_stream_data_offset,
-
-	.get_bar_index	= imx8_get_bar_index,
-
-	/* firmware loading */
-	.load_firmware	= snd_sof_load_firmware_memcpy,
-
-	/* Debug information */
-	.dbg_dump = imx8_dump,
-	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
-
-	/* stream callbacks */
-	.pcm_open = sof_stream_pcm_open,
-	.pcm_close = sof_stream_pcm_close,
-
-	/* Firmware ops */
-	.dsp_arch_ops = &sof_xtensa_arch_ops,
-
-	/* DAI drivers */
+static const struct imx_chip_info imx8x_chip_info = {
+	.ipc_info = {
+		.has_panic_code = true,
+		.boot_mbox_offset = 0x800000,
+		.window_offset = 0x800000,
+	},
+	.memory = imx8_memory_regions,
 	.drv = imx8_dai,
 	.num_drv = ARRAY_SIZE(imx8_dai),
-
-	/* PM */
-	.runtime_suspend	= imx8_dsp_runtime_suspend,
-	.runtime_resume		= imx8_dsp_runtime_resume,
-
-	.suspend	= imx8_dsp_suspend,
-	.resume		= imx8_dsp_resume,
-
-	.set_power_state	= imx8_dsp_set_power_state,
-
-	/* ALSA HW info flags */
-	.hw_info =	SNDRV_PCM_INFO_MMAP |
-			SNDRV_PCM_INFO_MMAP_VALID |
-			SNDRV_PCM_INFO_INTERLEAVED |
-			SNDRV_PCM_INFO_PAUSE |
-			SNDRV_PCM_INFO_BATCH |
-			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP
+	.ops = &imx8x_chip_ops,
 };
 
 static struct snd_sof_of_mach sof_imx8_machs[] = {
@@ -636,6 +240,7 @@ static struct snd_sof_of_mach sof_imx8_machs[] = {
 
 static struct sof_dev_desc sof_of_imx8qxp_desc = {
 	.of_machines	= sof_imx8_machs,
+	.chip_info	= &imx8x_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
 	.ipc_default		= SOF_IPC_TYPE_3,
 	.default_fw_path = {
@@ -648,11 +253,13 @@ static struct sof_dev_desc sof_of_imx8qxp_desc = {
 		[SOF_IPC_TYPE_3] = "sof-imx8x.ri",
 	},
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
-	.ops = &sof_imx8x_ops,
+	.ops = &sof_imx8_ops,
+	.ops_init = imx8_ops_init,
 };
 
 static struct sof_dev_desc sof_of_imx8qm_desc = {
 	.of_machines	= sof_imx8_machs,
+	.chip_info	= &imx8_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
 	.ipc_default		= SOF_IPC_TYPE_3,
 	.default_fw_path = {
@@ -666,6 +273,7 @@ static struct sof_dev_desc sof_of_imx8qm_desc = {
 	},
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
 	.ops = &sof_imx8_ops,
+	.ops_init = imx8_ops_init,
 };
 
 static const struct of_device_id sof_of_imx8_ids[] = {
-- 
2.34.1

