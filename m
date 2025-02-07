Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D721802DD;
	Fri,  7 Feb 2025 16:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945405; cv=none; b=nj8TKGQxjoM7cbkPtJ7n+RASgdkHzeRQLF6HbhAGfcFWlSB40XnyOZ60Z8EshDpubJIjpKPAAd8BrQHx93yOGsVcxNt1As+BMbRryVqKnS/9VzFmzku6mzwEZl5EM8JwPZ+gtRiG5H/v7RRdkrbu/r98GigcobQG6OHVzgjFP9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945405; c=relaxed/simple;
	bh=PEuVWugRgtLUA75K6wA9ZwAQaYPSpnzYiEtdDdSl1VU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jza98hfkqE8QBizM73DYfqeicVIT9bznAoD3rbqpfcDfs93dKFKF9eBX7rm+eRGrhHuPE2bQk+q1ejy4Jmayxb2CKhGBrPISkVm+jxo5V8nAgn53LE4+WoV5PaOyg8WOLUOXCp5Gf/F9PwmpkL4C70TysxzzH0fDDCILwKfGjkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jskHPYRj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jskHPYRj"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dcae0d6dcso492407f8f.1;
        Fri, 07 Feb 2025 08:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738945401; x=1739550201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwW+pKnnpV1POh+1ow/dtiPXV42t0ksFdubKgFZRUjs=;
        b=jskHPYRjWZhT5nvuRlPShThChU+7h59u0ZLnFJ20M/7yHRQJyTmnyJCVxvjd8IZ1rM
         shxqr+kLgD8NTDPki9b+PUBCnHonQHHWl+nFtPd5mkl32TzOdDlGpS+1uJTkne0Oy8Ml
         VyUFGKcvXa1Ern4AEFlzgZhKY1T0jZ0yEySgoYppApzy80Ay1o9MsTgu/bplYVUYSJmc
         o8RaZvMqLtsYV0qqxGE6uBCjiX/NbEszyJ5AR4i9zjXwH7kG2B935xrdw0AzgTBpXvlz
         RGlXbZZjJ5Ko/cqACV9PtglCguYYG2OrvBBZORJFY+J5iwlLvshGqCoq+sEx+4BEFbBV
         8Tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945401; x=1739550201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwW+pKnnpV1POh+1ow/dtiPXV42t0ksFdubKgFZRUjs=;
        b=nVtI4vaDrr0V60mZsinLec9y8nJo9rjiU3NLUe+k0KSR6GK7IWbbBUn9kro/aE53nC
         zGf97z72s5QSKwgRr3QyL/xlXxRaPn8eO/JavZv6XoPV+MvogRQYtS3m87+d0YUbm99C
         CQ+J0twHWznVDmBpEEomBUPVXiUKOVoqyRa/USrnivJNXKfwxF9EunpqHwQVJnlYbXh8
         gWGXAY6ELGmauj7qLDC58OB2OlTVn+Z4q/8Jcn8T2tCigZifYYNVi+Z5XaqBmM+P+EU7
         M9UOZ0omXXv7yNsUeCLEcz6uHXSWPpocA/7bcAhZTTBRUcW65/EaE3dBHDw7bUNj+1vK
         kC8w==
X-Forwarded-Encrypted: i=1; AJvYcCXgSrAwXIliNV7AdK2k6jFSZJpKIki+zCIzrpVriSaMXD3Cb3hOd/kQby0wsCTOUCIAN+NNJnnqpIWQkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEVakzwZW+z5Q5vM3LG2pDkcxHTW7sapRZ9vO/1KoCRH8aEbTO
	moJV+8RM1KKQG0EE21soTXpIg1dp3VDw6CUcwCnVCKSHBbyZ0fB+
X-Gm-Gg: ASbGncthhaAoDQp/QFV/42JBuoShXovtiXVcJIT6dkfb1eK5FDBJUVYx+ERCWJn2D3f
	R7+yotoYT9HTBdzVtpC0UwTFqCf8lZH21q53xAGbmmQVukn4Iz0m/RldPf7TYtP22PeXHSlgW3b
	XmqURRDCIWZUsaw5orVTibqie1+yH/NeL+Ipei5FqGzOaypWgFrx0fd0LSmZg+35KgSXi/07vG0
	YdFSSEq+bnhXCHOd5886bi1P3Sca2hOIXR0vxsX4AChICd7n/9vUgNSU7is9jyNGLY9KxvJ6J1W
	mDRlJSYEg1l9egCNscit4HQcpc2nCcgIVYgIbmRQEG0fiimWr2h1tg==
X-Google-Smtp-Source: AGHT+IHNQDNAGqTnyJ1qG4eOSSCQ+GYGu2hAL7BmD/21wymyp+ealOkyOFN9vb9Mn7E34fHjMIQhjQ==
X-Received: by 2002:a5d:648b:0:b0:38d:ca76:9e68 with SMTP id ffacd0b85a97d-38dca76a05dmr2031446f8f.49.1738945401196;
        Fri, 07 Feb 2025 08:23:21 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da9652bsm61260825e9.2.2025.02.07.08.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:23:20 -0800 (PST)
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
Subject: [PATCH v3 1/7] ASoC: SOF: imx: introduce more common structures and functions
Date: Fri,  7 Feb 2025 11:22:40 -0500
Message-Id: <20250207162246.3104-2-laurentiumihalcea111@gmail.com>
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

The SOF drivers for imx chips have a lot of duplicate code and
routines/code snippets that could certainly be reused among drivers.

As such, introduce a new set of structures and functions that will help
eliminate the redundancy and code size of the drivers.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 sound/soc/sof/imx/imx-common.c | 431 ++++++++++++++++++++++++++++++++-
 sound/soc/sof/imx/imx-common.h | 151 ++++++++++++
 2 files changed, 581 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index fce6d9cf6a6b..82057af1436c 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -1,11 +1,16 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
-// Copyright 2020 NXP
+// Copyright 2020-2025 NXP
 //
 // Common helpers for the audio DSP on i.MX8
 
+#include <linux/firmware/imx/dsp.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/pm_domain.h>
 #include <sound/sof/xtensa.h>
+
 #include "../ops.h"
 
 #include "imx-common.h"
@@ -74,5 +79,429 @@ void imx8_dump(struct snd_sof_dev *sdev, u32 flags)
 }
 EXPORT_SYMBOL(imx8_dump);
 
+static void imx_handle_reply(struct imx_dsp_ipc *ipc)
+{
+	struct snd_sof_dev *sdev;
+	unsigned long flags;
+
+	sdev = imx_dsp_get_data(ipc);
+
+	spin_lock_irqsave(&sdev->ipc_lock, flags);
+	snd_sof_ipc_process_reply(sdev, 0);
+	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
+}
+
+static void imx_handle_request(struct imx_dsp_ipc *ipc)
+{
+	struct snd_sof_dev *sdev;
+	u32 panic_code;
+
+	sdev = imx_dsp_get_data(ipc);
+
+	if (get_chip_info(sdev)->ipc_info.has_panic_code) {
+		sof_mailbox_read(sdev, sdev->debug_box.offset + 0x4,
+				 &panic_code,
+				 sizeof(panic_code));
+
+		if ((panic_code & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
+			snd_sof_dsp_panic(sdev, panic_code, true);
+			return;
+		}
+	}
+
+	snd_sof_ipc_msgs_rx(sdev);
+}
+
+static struct imx_dsp_ops imx_ipc_ops = {
+	.handle_reply = imx_handle_reply,
+	.handle_request = imx_handle_request,
+};
+
+static int imx_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
+{
+	struct imx_common_data *common = sdev->pdata->hw_pdata;
+
+	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data, msg->msg_size);
+	imx_dsp_ring_doorbell(common->ipc_handle, 0x0);
+
+	return 0;
+}
+
+static int imx_get_bar_index(struct snd_sof_dev *sdev, u32 type)
+{
+	switch (type) {
+	case SOF_FW_BLK_TYPE_IRAM:
+	case SOF_FW_BLK_TYPE_SRAM:
+		return type;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int imx_get_mailbox_offset(struct snd_sof_dev *sdev)
+{
+	return get_chip_info(sdev)->ipc_info.boot_mbox_offset;
+}
+
+static int imx_get_window_offset(struct snd_sof_dev *sdev, u32 id)
+{
+	return get_chip_info(sdev)->ipc_info.window_offset;
+}
+
+static int imx_set_power_state(struct snd_sof_dev *sdev,
+			       const struct sof_dsp_power_state *target)
+{
+	sdev->dsp_power_state = *target;
+
+	return 0;
+}
+
+static int imx_common_resume(struct snd_sof_dev *sdev)
+{
+	struct imx_common_data *common;
+	int ret, i;
+
+	common = sdev->pdata->hw_pdata;
+
+	ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
+	if (ret)
+		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
+
+	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
+		imx_dsp_request_channel(common->ipc_handle, i);
+
+	/* done. If need be, core will be started by SOF core immediately after */
+	return 0;
+}
+
+static int imx_common_suspend(struct snd_sof_dev *sdev)
+{
+	struct imx_common_data *common;
+	int i, ret;
+
+	common = sdev->pdata->hw_pdata;
+
+	ret = imx_chip_core_shutdown(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to shutdown core: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
+		imx_dsp_free_channel(common->ipc_handle, i);
+
+	clk_bulk_disable_unprepare(common->clk_num, common->clks);
+
+	return 0;
+}
+
+static int imx_runtime_resume(struct snd_sof_dev *sdev)
+{
+	const struct sof_dsp_power_state target_state = {
+		.state = SOF_DSP_PM_D0,
+	};
+	int ret;
+
+	ret = imx_common_resume(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to runtime common resume: %d\n", ret);
+		return ret;
+	}
+
+	return snd_sof_dsp_set_power_state(sdev, &target_state);
+}
+
+static int imx_resume(struct snd_sof_dev *sdev)
+{
+	const struct sof_dsp_power_state target_state = {
+		.state = SOF_DSP_PM_D0,
+	};
+	int ret;
+
+	ret = imx_common_resume(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "failed to common resume: %d\n", ret);
+		return ret;
+	}
+
+	if (pm_runtime_suspended(sdev->dev)) {
+		pm_runtime_disable(sdev->dev);
+		pm_runtime_set_active(sdev->dev);
+		pm_runtime_mark_last_busy(sdev->dev);
+		pm_runtime_enable(sdev->dev);
+		pm_runtime_idle(sdev->dev);
+	}
+
+	return snd_sof_dsp_set_power_state(sdev, &target_state);
+}
+
+static int imx_runtime_suspend(struct snd_sof_dev *sdev)
+{
+	const struct sof_dsp_power_state target_state = {
+		.state = SOF_DSP_PM_D3,
+	};
+	int ret;
+
+	ret = imx_common_suspend(sdev);
+	if (ret < 0)
+		dev_err(sdev->dev, "failed to runtime common suspend: %d\n", ret);
+
+	return snd_sof_dsp_set_power_state(sdev, &target_state);
+}
+
+static int imx_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
+{
+	const struct sof_dsp_power_state target_power_state = {
+		.state = target_state,
+	};
+	int ret;
+
+	if (!pm_runtime_suspended(sdev->dev)) {
+		ret = imx_common_suspend(sdev);
+		if (ret < 0) {
+			dev_err(sdev->dev, "failed to common suspend: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return snd_sof_dsp_set_power_state(sdev, &target_power_state);
+}
+
+static int imx_region_name_to_blk_type(const char *region_name)
+{
+	if (!strcmp(region_name, "iram"))
+		return SOF_FW_BLK_TYPE_IRAM;
+	else if (!strcmp(region_name, "dram"))
+		return SOF_FW_BLK_TYPE_DRAM;
+	else if (!strcmp(region_name, "sram"))
+		return SOF_FW_BLK_TYPE_SRAM;
+	else
+		return -EINVAL;
+}
+
+static int imx_parse_ioremap_memory(struct snd_sof_dev *sdev)
+{
+	const struct imx_chip_info *chip_info;
+	struct reserved_mem *reserved;
+	struct platform_device *pdev;
+	struct device_node *res_np;
+	phys_addr_t base, size;
+	struct resource *res;
+	int i, blk_type, ret;
+
+	pdev = to_platform_device(sdev->dev);
+	chip_info = get_chip_info(sdev);
+
+	for (i = 0; chip_info->memory[i].name; i++) {
+		blk_type = imx_region_name_to_blk_type(chip_info->memory[i].name);
+		if (blk_type < 0)
+			return dev_err_probe(sdev->dev, blk_type,
+					     "no blk type for region %s\n",
+					     chip_info->memory[i].name);
+
+		if (!chip_info->memory[i].reserved) {
+			res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+							   chip_info->memory[i].name);
+			if (!res)
+				return dev_err_probe(sdev->dev, -ENODEV,
+						     "failed to fetch %s resource\n",
+						     chip_info->memory[i].name);
+
+			base = res->start;
+			size = resource_size(res);
+		} else {
+			ret = of_property_match_string(pdev->dev.of_node,
+						       "memory-region-names",
+						       chip_info->memory[i].name);
+			if (ret < 0)
+				return dev_err_probe(sdev->dev, ret,
+						     "no valid index for %s\n",
+						     chip_info->memory[i].name);
+
+			res_np = of_parse_phandle(pdev->dev.of_node,
+						  "memory-region",
+						  ret);
+			if (!res_np)
+				return dev_err_probe(sdev->dev, -ENODEV,
+						     "failed to parse phandle %s\n",
+						     chip_info->memory[i].name);
+
+			reserved = of_reserved_mem_lookup(res_np);
+			of_node_put(res_np);
+			if (!reserved)
+				return dev_err_probe(sdev->dev, -ENODEV,
+						     "failed to get %s reserved\n",
+						     chip_info->memory[i].name);
+
+			base = reserved->base;
+			size = reserved->size;
+		}
+
+		sdev->bar[blk_type] = devm_ioremap(sdev->dev, base, size);
+		if (IS_ERR(sdev->bar[blk_type]))
+			return dev_err_probe(sdev->dev,
+					     PTR_ERR(sdev->bar[blk_type]),
+					     "failed to ioremap %s region\n",
+					     chip_info->memory[i].name);
+	}
+
+	return 0;
+}
+
+static void imx_unregister_action(void *data)
+{
+	struct imx_common_data *common;
+	struct snd_sof_dev *sdev;
+
+	sdev = data;
+	common = sdev->pdata->hw_pdata;
+
+	if (get_chip_info(sdev)->has_dma_reserved)
+		of_reserved_mem_device_release(sdev->dev);
+
+	platform_device_unregister(common->ipc_dev);
+}
+
+static int imx_probe(struct snd_sof_dev *sdev)
+{
+	struct dev_pm_domain_attach_data domain_data = {
+		.pd_names = NULL, /* no filtering */
+		.pd_flags = PD_FLAG_DEV_LINK_ON,
+	};
+	struct imx_common_data *common;
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = to_platform_device(sdev->dev);
+
+	common = devm_kzalloc(sdev->dev, sizeof(*common), GFP_KERNEL);
+	if (!common)
+		return dev_err_probe(sdev->dev, -ENOMEM,
+				     "failed to allocate common data\n");
+
+	common->ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
+							PLATFORM_DEVID_NONE,
+							pdev, sizeof(*pdev));
+	if (IS_ERR(common->ipc_dev))
+		return dev_err_probe(sdev->dev, PTR_ERR(common->ipc_dev),
+				     "failed to create IPC device\n");
+
+	if (get_chip_info(sdev)->has_dma_reserved) {
+		ret = of_reserved_mem_device_init_by_name(sdev->dev,
+							  pdev->dev.of_node,
+							  "dma");
+		if (ret) {
+			platform_device_unregister(common->ipc_dev);
+
+			return dev_err_probe(sdev->dev, ret,
+					     "failed to bind DMA region\n");
+		}
+	}
+
+	/* let the devres API take care of the cleanup */
+	ret = devm_add_action_or_reset(sdev->dev,
+				       imx_unregister_action,
+				       sdev);
+	if (ret)
+		return dev_err_probe(sdev->dev, ret, "failed to add devm action\n");
+
+	common->ipc_handle = dev_get_drvdata(&common->ipc_dev->dev);
+	if (!common->ipc_handle)
+		return dev_err_probe(sdev->dev, -EPROBE_DEFER,
+				     "failed to fetch IPC handle\n");
+
+	ret = imx_parse_ioremap_memory(sdev);
+	if (ret < 0)
+		return dev_err_probe(sdev->dev, ret,
+				     "failed to parse/ioremap memory regions\n");
+
+	if (!sdev->dev->pm_domain) {
+		ret = devm_pm_domain_attach_list(sdev->dev,
+						 &domain_data, &common->pd_list);
+		if (ret < 0)
+			return dev_err_probe(sdev->dev, ret, "failed to attach PDs\n");
+	}
+
+	ret = devm_clk_bulk_get_all(sdev->dev, &common->clks);
+	if (ret < 0)
+		return dev_err_probe(sdev->dev, common->clk_num,
+				     "failed to fetch clocks\n");
+	common->clk_num = ret;
+
+	ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
+	if (ret < 0)
+		return dev_err_probe(sdev->dev, ret, "failed to enable clocks\n");
+
+	common->ipc_handle->ops = &imx_ipc_ops;
+	imx_dsp_set_data(common->ipc_handle, sdev);
+
+	sdev->num_cores = 1;
+	sdev->pdata->hw_pdata = common;
+	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
+	sdev->dsp_box.offset = get_chip_info(sdev)->ipc_info.boot_mbox_offset;
+
+	return imx_chip_probe(sdev);
+}
+
+static void imx_remove(struct snd_sof_dev *sdev)
+{
+	struct imx_common_data *common;
+	int ret;
+
+	common = sdev->pdata->hw_pdata;
+
+	if (!pm_runtime_suspended(sdev->dev)) {
+		ret = imx_chip_core_shutdown(sdev);
+		if (ret < 0)
+			dev_err(sdev->dev, "failed to shutdown core: %d\n", ret);
+
+		clk_bulk_disable_unprepare(common->clk_num, common->clks);
+	}
+}
+
+const struct snd_sof_dsp_ops sof_imx_ops = {
+	.probe = imx_probe,
+	.remove = imx_remove,
+
+	.run = imx_chip_core_kick,
+	.reset = imx_chip_core_reset,
+
+	.block_read = sof_block_read,
+	.block_write = sof_block_write,
+
+	.mailbox_read = sof_mailbox_read,
+	.mailbox_write = sof_mailbox_write,
+
+	.send_msg = imx_send_msg,
+	.get_mailbox_offset = imx_get_mailbox_offset,
+	.get_window_offset = imx_get_window_offset,
+
+	.ipc_msg_data = sof_ipc_msg_data,
+	.set_stream_data_offset = sof_set_stream_data_offset,
+
+	.get_bar_index = imx_get_bar_index,
+	.load_firmware = snd_sof_load_firmware_memcpy,
+
+	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
+
+	.pcm_open = sof_stream_pcm_open,
+	.pcm_close = sof_stream_pcm_close,
+
+	.runtime_suspend = imx_runtime_suspend,
+	.runtime_resume = imx_runtime_resume,
+	.suspend = imx_suspend,
+	.resume = imx_resume,
+
+	.set_power_state = imx_set_power_state,
+
+	.hw_info = SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_PAUSE |
+		SNDRV_PCM_INFO_BATCH |
+		SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
+};
+EXPORT_SYMBOL(sof_imx_ops);
+
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF helpers for IMX platforms");
diff --git a/sound/soc/sof/imx/imx-common.h b/sound/soc/sof/imx/imx-common.h
index 13d7f3ef675e..9bd711dbb5d0 100644
--- a/sound/soc/sof/imx/imx-common.h
+++ b/sound/soc/sof/imx/imx-common.h
@@ -4,10 +4,159 @@
 #define __IMX_COMMON_H__
 
 #include <linux/clk.h>
+#include <linux/of_platform.h>
+#include <sound/sof/xtensa.h>
+
+#include "../sof-of-dev.h"
+#include "../ops.h"
 
 #define EXCEPT_MAX_HDR_SIZE	0x400
 #define IMX8_STACK_DUMP_SIZE 32
 
+/* chip_info refers to the data stored in struct sof_dev_desc's chip_info */
+#define get_chip_info(sdev)\
+	((const struct imx_chip_info *)((sdev)->pdata->desc->chip_info))
+
+/* chip_pdata refers to the data stored in struct imx_common_data's chip_pdata */
+#define get_chip_pdata(sdev)\
+	(((struct imx_common_data *)((sdev)->pdata->hw_pdata))->chip_pdata)
+
+/* can be used if:
+ *	1) The only supported IPC version is IPC3.
+ *	2) The default paths/FW name match values below.
+ *
+ * otherwise, just explicitly declare the structure
+ */
+#define IMX_SOF_DEV_DESC(mach_name, of_machs,				\
+			 mach_chip_info, mach_ops, mach_ops_init)	\
+static struct sof_dev_desc sof_of_##mach_name##_desc = {		\
+	.of_machines = of_machs,					\
+	.chip_info = mach_chip_info,					\
+	.ipc_supported_mask = BIT(SOF_IPC_TYPE_3),			\
+	.ipc_default = SOF_IPC_TYPE_3,					\
+	.default_fw_path = {						\
+		[SOF_IPC_TYPE_3] = "imx/sof",				\
+	},								\
+	.default_tplg_path = {						\
+		[SOF_IPC_TYPE_3] = "imx/sof-tplg",			\
+	},								\
+	.default_fw_filename = {					\
+		[SOF_IPC_TYPE_3] = "sof-" #mach_name ".ri",		\
+	},								\
+	.ops = mach_ops,						\
+	.ops_init = mach_ops_init,					\
+}
+
+/* to be used alongside IMX_SOF_DEV_DESC() */
+#define IMX_SOF_DEV_DESC_NAME(mach_name) sof_of_##mach_name##_desc
+
+/* dai driver entry w/ playback and capture caps. If one direction is missing
+ * then set the channels to 0.
+ */
+#define IMX_SOF_DAI_DRV_ENTRY(dai_name, pb_cmin, pb_cmax, cap_cmin, cap_cmax)	\
+{										\
+	.name = dai_name,							\
+	.playback = {								\
+		.channels_min = pb_cmin,					\
+		.channels_max = pb_cmax,					\
+	},									\
+	.capture = {								\
+		.channels_min = cap_cmin,					\
+		.channels_max = cap_cmax,					\
+	},									\
+}
+
+/* use if playback and capture have the same min/max channel count */
+#define IMX_SOF_DAI_DRV_ENTRY_BIDIR(dai_name, cmin, cmax)\
+	IMX_SOF_DAI_DRV_ENTRY(dai_name, cmin, cmax, cmin, cmax)
+
+struct imx_ipc_info {
+	/* true if core is able to write a panic code to the debug box */
+	bool has_panic_code;
+	/* offset to mailbox in which firmware initially writes FW_READY */
+	int boot_mbox_offset;
+	/* offset to region at which the mailboxes start */
+	int window_offset;
+};
+
+struct imx_chip_ops {
+	/* called after clocks and PDs are enabled */
+	int (*probe)(struct snd_sof_dev *sdev);
+	/* used directly by the SOF core */
+	int (*core_kick)(struct snd_sof_dev *sdev);
+	/* called during suspend()/remove() before clocks are disabled */
+	int (*core_shutdown)(struct snd_sof_dev *sdev);
+	/* used directly by the SOF core */
+	int (*core_reset)(struct snd_sof_dev *sdev);
+};
+
+struct imx_memory_info {
+	const char *name;
+	bool reserved;
+};
+
+struct imx_chip_info {
+	struct imx_ipc_info ipc_info;
+	/* does the chip have a reserved memory region for DMA? */
+	bool has_dma_reserved;
+	struct imx_memory_info *memory;
+	struct snd_soc_dai_driver *drv;
+	int num_drv;
+	/* optional */
+	const struct imx_chip_ops *ops;
+};
+
+struct imx_common_data {
+	struct platform_device *ipc_dev;
+	struct imx_dsp_ipc *ipc_handle;
+	/* core may have no clocks */
+	struct clk_bulk_data *clks;
+	int clk_num;
+	/* core may have no PDs */
+	struct dev_pm_domain_list *pd_list;
+	void *chip_pdata;
+};
+
+static inline int imx_chip_core_kick(struct snd_sof_dev *sdev)
+{
+	const struct imx_chip_ops *ops = get_chip_info(sdev)->ops;
+
+	if (ops && ops->core_kick)
+		return ops->core_kick(sdev);
+
+	return 0;
+}
+
+static inline int imx_chip_core_shutdown(struct snd_sof_dev *sdev)
+{
+	const struct imx_chip_ops *ops = get_chip_info(sdev)->ops;
+
+	if (ops && ops->core_shutdown)
+		return ops->core_shutdown(sdev);
+
+	return 0;
+}
+
+static inline int imx_chip_core_reset(struct snd_sof_dev *sdev)
+{
+	const struct imx_chip_ops *ops = get_chip_info(sdev)->ops;
+
+	if (ops && ops->core_reset)
+		return ops->core_reset(sdev);
+
+	return 0;
+}
+
+static inline int imx_chip_probe(struct snd_sof_dev *sdev)
+{
+	const struct imx_chip_ops *ops = get_chip_info(sdev)->ops;
+
+	if (ops && ops->probe)
+		return ops->probe(sdev);
+
+	return 0;
+}
+
 void imx8_get_registers(struct snd_sof_dev *sdev,
 			struct sof_ipc_dsp_oops_xtensa *xoops,
 			struct sof_ipc_panic_info *panic_info,
@@ -15,4 +164,6 @@ void imx8_get_registers(struct snd_sof_dev *sdev,
 
 void imx8_dump(struct snd_sof_dev *sdev, u32 flags);
 
+extern const struct snd_sof_dsp_ops sof_imx_ops;
+
 #endif
-- 
2.34.1

