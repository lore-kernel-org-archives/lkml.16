Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ACA266B4A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388202; cv=none; b=Vvxi9YMDTxZlxYrwSD/YDZAK8Su634KU17xxzCYe2p1t79nGX5YrZS1WrFcoxu5qmMz7bS6+yr5DgfF/98N9LZkG0zlQd4eiE+yW6c9ERKOdZueSbtLDD5x98GYoPimjAbT1N+hsz6u7u9zM+F6ie2It0bkFusFVUVWn3+YgN9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388202; c=relaxed/simple;
	bh=A9lxpmsAbqnMpnvpZv8O0xwRu5C4Ak5u2VysSqN3ap8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fUdGVqRX27hsKPskhQNTef5ALR0Krqm/x99s1pu4MP94atuJZ4etRjkSd5Us0Bl9vQHxnDV85g143qjbbCjGdLI8bOS1DpnesgZknNfxDLsb8QY/Kz5PBTM2X6lwsWMpLdLI9fbZQGRM7+WaRbbSgCO5iMCF41urNfFDHEiBURY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=IrUmeKwd; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="IrUmeKwd"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acbb85ce788so440661366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388196; x=1745992996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfZ5VJ6qb0NpiRbaX9YIg52ms+e9e+AdJT0SfT5UEvw=;
        b=IrUmeKwdCVn8fD4Qp+aYL7zVA+7bC+ZsTV3ra8ITEQXdNOUxB9dIUTG7I/80B/92XM
         8vVhX2m2PtN6CM+0TfI+8PTLu1KpTktZDjp+lpvlmF3Ie4tGqltMxZ+/QCc+1VlJoliD
         z/NQImDE3DSVxu8PT5V9jYrHzxD5SRU+zeaFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388196; x=1745992996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfZ5VJ6qb0NpiRbaX9YIg52ms+e9e+AdJT0SfT5UEvw=;
        b=HlSM4YBnKI52PXQ2CsFWYuZ3s/mNzqyWcn/0Td4tZyMTgeU0EsYwKSNBzeLRXznYVK
         teOVQV6cD3Byke26pevOPj2xv/3axib7eptrsrIFaX0ztGx4rll3v9QKADIwSIT84trK
         9pkwCmPexSjHL/tzf+kbzvA0G+oPXmu1CcrEo33hdyBxEzsodBwNO9W54GeXzTfB5bF+
         UOUlNhuCDkLfRKaiT20lNwlxdSr/taWYyGh10bIwQ5buSX2XUDE/getKMictZK2jwjuS
         njxalDMvqxtlos3HHjMGIdm3biKsc3+stHOMPr32KCHRAbis1zm7i44hYIaegoNvUOME
         kSTg==
X-Gm-Message-State: AOJu0YwtpHZ6mYO76opEioU/QfbLR6lAOnIQdD06mMGxt09pyrmiO80T
	F8Iy/+jyiPm+wqOZycNbfIQa/E4SvjDCDW34hBIX5dfM9doIE0IuvxUn5g4arhAo9DXzR3sdHHr
	P
X-Gm-Gg: ASbGncvSAEN2PF0xb1arlvn5OFeZuFYxVynXL4JmUBvNRfKDHf3YuI8iopZMaWQW4/8
	zlYaucDCjyyMg62PKUBO8eQXLZGJdwRydT73uDNUIBwgHy+aPi4e+/IOKKv8DeX652/WPNxt1XB
	KRBB4O6tesrxbkkXDyCN00E9PjY9O0GbOePN9XHu2W+8RmldNKW7k2W70tbl5Ki9RIT3Tqq+1Tj
	DdtZolWGk0Z6q2VJ3m3+E7qe8T1I7M70cx2xV8ZsgeGKlfuLAi8JDaAaVTfGTXiJecS7zmK7cgl
	i60pN/2+06r+eIFWa+TokuHk8Wlzk4X0syuFx9wK6vA65MfGehs8UWqX/40XKBl38Ozi7SVxQZm
	V3aui
X-Google-Smtp-Source: AGHT+IF1ovFsF4TRt+teMBKVIRpd8ak2ZsbbdwH/hmG1MWn7tnvlDVSH+67RlUSdm/Shx8sgkUorCg==
X-Received: by 2002:a17:906:f58c:b0:ac3:17bb:34fc with SMTP id a640c23a62f3a-acb74df33b6mr1412911366b.52.1745388196336;
        Tue, 22 Apr 2025 23:03:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:15 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v11 13/18] clk: imx: add support for i.MX8MP anatop clock driver
Date: Wed, 23 Apr 2025 08:02:30 +0200
Message-ID: <20250423060241.95521-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support NXP i.MX8P anatop PLL module which generates PLLs to CCM root.
By doing so, we also simplify the CCM driver code. The changes are
backward compatible.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>

---

Changes in v11:
- Add 'Reviewed-by' tag of Peng Fan
- Fix conflict while rebasing on master

 drivers/clk/imx/Makefile            |   2 +-
 drivers/clk/imx/clk-imx8mp-anatop.c | 306 ++++++++++++++++++++++++++++
 drivers/clk/imx/clk-imx8mp.c        | 188 ++++++++---------
 3 files changed, 391 insertions(+), 105 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mp-anatop.c

diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
index 8e0f42a0c69c..311a557900a9 100644
--- a/drivers/clk/imx/Makefile
+++ b/drivers/clk/imx/Makefile
@@ -27,7 +27,7 @@ obj-$(CONFIG_MXC_CLK) += mxc-clk.o
 
 obj-$(CONFIG_CLK_IMX8MM) += clk-imx8mm-anatop.o clk-imx8mm.o
 obj-$(CONFIG_CLK_IMX8MN) += clk-imx8mn-anatop.o clk-imx8mn.o
-obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o clk-imx8mp-audiomix.o
+obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp-anatop.o clk-imx8mp.o clk-imx8mp-audiomix.o
 obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
 
 obj-$(CONFIG_CLK_IMX93) += clk-imx93.o
diff --git a/drivers/clk/imx/clk-imx8mp-anatop.c b/drivers/clk/imx/clk-imx8mp-anatop.c
new file mode 100644
index 000000000000..ac23fcf92fd1
--- /dev/null
+++ b/drivers/clk/imx/clk-imx8mp-anatop.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * clk-imx8mp-anatop.c - NXP i.MX8MP anatop clock driver
+ *
+ * Copyright (c) 2025 Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/of_platform.h>
+
+#include "clk.h"
+
+#define IMX8MP_ANATOP_CLK_END		(IMX8MP_ANATOP_CLK_CLKOUT2 + 1)
+
+static const char * const pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
+static const char * const audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
+static const char * const audio_pll2_bypass_sels[] = {"audio_pll2", "audio_pll2_ref_sel", };
+static const char * const video_pll_bypass_sels[] = {"video_pll", "video_pll_ref_sel", };
+static const char * const dram_pll_bypass_sels[] = {"dram_pll", "dram_pll_ref_sel", };
+static const char * const gpu_pll_bypass_sels[] = {"gpu_pll", "gpu_pll_ref_sel", };
+static const char * const vpu_pll_bypass_sels[] = {"vpu_pll", "vpu_pll_ref_sel", };
+static const char * const arm_pll_bypass_sels[] = {"arm_pll", "arm_pll_ref_sel", };
+static const char * const sys_pll1_bypass_sels[] = {"sys_pll1", "sys_pll1_ref_sel", };
+static const char * const sys_pll2_bypass_sels[] = {"sys_pll2", "sys_pll2_ref_sel", };
+static const char * const sys_pll3_bypass_sels[] = {"sys_pll3", "sys_pll3_ref_sel", };
+static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll_out",
+					   "dummy", "dummy", "gpu_pll_out", "vpu_pll_out",
+					   "arm_pll_out", "sys_pll1_out", "sys_pll2_out",
+					   "sys_pll3_out", "dummy", "dummy", "osc_24m",
+					   "dummy", "osc_32k"};
+
+static struct clk_hw_onecell_data *clk_hw_data;
+static struct clk_hw **hws;
+
+static int imx8mp_anatop_clocks_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	void __iomem *base;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base)) {
+		dev_err(dev, "failed to get base address\n");
+		return PTR_ERR(base);
+	}
+
+	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws,
+						    IMX8MP_ANATOP_CLK_END),
+				   GFP_KERNEL);
+	if (WARN_ON(!clk_hw_data))
+		return -ENOMEM;
+
+	clk_hw_data->num = IMX8MP_ANATOP_CLK_END;
+	hws = clk_hw_data->hws;
+
+	hws[IMX8MP_ANATOP_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
+	hws[IMX8MP_ANATOP_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
+	hws[IMX8MP_ANATOP_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
+
+	hws[IMX8MP_ANATOP_AUDIO_PLL1_REF_SEL] =
+		imx_clk_hw_mux("audio_pll1_ref_sel", base + 0x0, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_AUDIO_PLL2_REF_SEL] =
+		imx_clk_hw_mux("audio_pll2_ref_sel", base + 0x14, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_VIDEO_PLL_REF_SEL] =
+		imx_clk_hw_mux("video_pll_ref_sel", base + 0x28, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_DRAM_PLL_REF_SEL] =
+		imx_clk_hw_mux("dram_pll_ref_sel", base + 0x50, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_GPU_PLL_REF_SEL] =
+		imx_clk_hw_mux("gpu_pll_ref_sel", base + 0x64, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_VPU_PLL_REF_SEL] =
+		imx_clk_hw_mux("vpu_pll_ref_sel", base + 0x74, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_ARM_PLL_REF_SEL] =
+		imx_clk_hw_mux("arm_pll_ref_sel", base + 0x84, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_SYS_PLL1_REF_SEL] =
+		imx_clk_hw_mux("sys_pll1_ref_sel", base + 0x94, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_SYS_PLL2_REF_SEL] =
+		imx_clk_hw_mux("sys_pll2_ref_sel", base + 0x104, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+	hws[IMX8MP_ANATOP_SYS_PLL3_REF_SEL] =
+		imx_clk_hw_mux("sys_pll3_ref_sel", base + 0x114, 0, 2,
+			       pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
+
+	hws[IMX8MP_ANATOP_AUDIO_PLL1] =
+		imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel",
+				   base, &imx_1443x_pll);
+	hws[IMX8MP_ANATOP_AUDIO_PLL2] =
+		imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel",
+				   base + 0x14, &imx_1443x_pll);
+	hws[IMX8MP_ANATOP_VIDEO_PLL] =
+		imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel",
+				   base + 0x28, &imx_1443x_pll);
+	hws[IMX8MP_ANATOP_DRAM_PLL] =
+		imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel",
+				   base + 0x50, &imx_1443x_dram_pll);
+	hws[IMX8MP_ANATOP_GPU_PLL] =
+		imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel",
+				   base + 0x64, &imx_1416x_pll);
+	hws[IMX8MP_ANATOP_VPU_PLL] =
+		imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel",
+				   base + 0x74, &imx_1416x_pll);
+	hws[IMX8MP_ANATOP_ARM_PLL] =
+		imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel",
+				   base + 0x84, &imx_1416x_pll);
+	hws[IMX8MP_ANATOP_SYS_PLL1] =
+		imx_clk_hw_pll14xx("sys_pll1", "sys_pll1_ref_sel",
+				   base + 0x94, &imx_1416x_pll);
+	hws[IMX8MP_ANATOP_SYS_PLL2] =
+		imx_clk_hw_pll14xx("sys_pll2", "sys_pll2_ref_sel",
+				   base + 0x104, &imx_1416x_pll);
+	hws[IMX8MP_ANATOP_SYS_PLL3] =
+		imx_clk_hw_pll14xx("sys_pll3", "sys_pll3_ref_sel",
+				   base + 0x114, &imx_1416x_pll);
+
+	hws[IMX8MP_ANATOP_AUDIO_PLL1_BYPASS] =
+		imx_clk_hw_mux_flags("audio_pll1_bypass", base, 16, 1,
+				     audio_pll1_bypass_sels,
+				     ARRAY_SIZE(audio_pll1_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_AUDIO_PLL2_BYPASS] =
+		imx_clk_hw_mux_flags("audio_pll2_bypass", base + 0x14,
+				     16, 1, audio_pll2_bypass_sels,
+				     ARRAY_SIZE(audio_pll2_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_VIDEO_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("video_pll_bypass", base + 0x28,
+				     16, 1, video_pll_bypass_sels,
+				     ARRAY_SIZE(video_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_DRAM_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("dram_pll_bypass", base + 0x50,
+				     16, 1, dram_pll_bypass_sels,
+				     ARRAY_SIZE(dram_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_GPU_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("gpu_pll_bypass", base + 0x64,
+				     28, 1, gpu_pll_bypass_sels,
+				     ARRAY_SIZE(gpu_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_VPU_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("vpu_pll_bypass", base + 0x74,
+				     28, 1, vpu_pll_bypass_sels,
+				     ARRAY_SIZE(vpu_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_ARM_PLL_BYPASS] =
+		imx_clk_hw_mux_flags("arm_pll_bypass", base + 0x84,
+				     28, 1, arm_pll_bypass_sels,
+				     ARRAY_SIZE(arm_pll_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_SYS_PLL1_BYPASS] =
+		imx_clk_hw_mux_flags("sys_pll1_bypass", base + 0x94,
+				     28, 1, sys_pll1_bypass_sels,
+				     ARRAY_SIZE(sys_pll1_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_SYS_PLL2_BYPASS] =
+		imx_clk_hw_mux_flags("sys_pll2_bypass", base + 0x104,
+				     28, 1, sys_pll2_bypass_sels,
+				     ARRAY_SIZE(sys_pll2_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+	hws[IMX8MP_ANATOP_SYS_PLL3_BYPASS] =
+		imx_clk_hw_mux_flags("sys_pll3_bypass", base + 0x114,
+				     28, 1, sys_pll3_bypass_sels,
+				     ARRAY_SIZE(sys_pll3_bypass_sels),
+				     CLK_SET_RATE_PARENT);
+
+	hws[IMX8MP_ANATOP_AUDIO_PLL1_OUT] =
+		imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass",
+				base, 13);
+	hws[IMX8MP_ANATOP_AUDIO_PLL2_OUT] =
+		imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass",
+				base + 0x14, 13);
+	hws[IMX8MP_ANATOP_VIDEO_PLL_OUT] =
+		imx_clk_hw_gate("video_pll_out", "video_pll_bypass",
+				base + 0x28, 13);
+	hws[IMX8MP_ANATOP_DRAM_PLL_OUT] =
+		imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass",
+				base + 0x50, 13);
+	hws[IMX8MP_ANATOP_GPU_PLL_OUT] =
+		imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass",
+				base + 0x64, 11);
+	hws[IMX8MP_ANATOP_VPU_PLL_OUT] =
+		imx_clk_hw_gate("vpu_pll_out", "vpu_pll_bypass",
+				base + 0x74, 11);
+	hws[IMX8MP_ANATOP_ARM_PLL_OUT] =
+		imx_clk_hw_gate("arm_pll_out", "arm_pll_bypass",
+				base + 0x84, 11);
+	hws[IMX8MP_ANATOP_SYS_PLL3_OUT] =
+		imx_clk_hw_gate("sys_pll3_out", "sys_pll3_bypass",
+				base + 0x114, 11);
+
+	hws[IMX8MP_ANATOP_SYS_PLL1_OUT] =
+		imx_clk_hw_gate("sys_pll1_out", "sys_pll1_bypass",
+				base + 0x94, 11);
+
+	hws[IMX8MP_ANATOP_SYS_PLL1_40M] =
+		imx_clk_hw_fixed_factor("sys_pll1_40m", "sys_pll1_out", 1, 20);
+	hws[IMX8MP_ANATOP_SYS_PLL1_80M] =
+		imx_clk_hw_fixed_factor("sys_pll1_80m", "sys_pll1_out", 1, 10);
+	hws[IMX8MP_ANATOP_SYS_PLL1_100M] =
+		imx_clk_hw_fixed_factor("sys_pll1_100m", "sys_pll1_out", 1, 8);
+	hws[IMX8MP_ANATOP_SYS_PLL1_133M] =
+		imx_clk_hw_fixed_factor("sys_pll1_133m", "sys_pll1_out", 1, 6);
+	hws[IMX8MP_ANATOP_SYS_PLL1_160M] =
+		imx_clk_hw_fixed_factor("sys_pll1_160m", "sys_pll1_out", 1, 5);
+	hws[IMX8MP_ANATOP_SYS_PLL1_200M] =
+		imx_clk_hw_fixed_factor("sys_pll1_200m", "sys_pll1_out", 1, 4);
+	hws[IMX8MP_ANATOP_SYS_PLL1_266M] =
+		imx_clk_hw_fixed_factor("sys_pll1_266m", "sys_pll1_out", 1, 3);
+	hws[IMX8MP_ANATOP_SYS_PLL1_400M] =
+		imx_clk_hw_fixed_factor("sys_pll1_400m", "sys_pll1_out", 1, 2);
+	hws[IMX8MP_ANATOP_SYS_PLL1_800M] =
+		imx_clk_hw_fixed_factor("sys_pll1_800m", "sys_pll1_out", 1, 1);
+
+	hws[IMX8MP_ANATOP_SYS_PLL2_OUT] =
+		imx_clk_hw_gate("sys_pll2_out", "sys_pll2_bypass",
+				base + 0x104, 11);
+
+	hws[IMX8MP_ANATOP_SYS_PLL2_50M] =
+		imx_clk_hw_fixed_factor("sys_pll2_50m", "sys_pll2_out", 1, 20);
+	hws[IMX8MP_ANATOP_SYS_PLL2_100M] =
+		imx_clk_hw_fixed_factor("sys_pll2_100m", "sys_pll2_out", 1, 10);
+	hws[IMX8MP_ANATOP_SYS_PLL2_125M] =
+		imx_clk_hw_fixed_factor("sys_pll2_125m", "sys_pll2_out", 1, 8);
+	hws[IMX8MP_ANATOP_SYS_PLL2_166M] =
+		imx_clk_hw_fixed_factor("sys_pll2_166m", "sys_pll2_out", 1, 6);
+	hws[IMX8MP_ANATOP_SYS_PLL2_200M] =
+		imx_clk_hw_fixed_factor("sys_pll2_200m", "sys_pll2_out", 1, 5);
+	hws[IMX8MP_ANATOP_SYS_PLL2_250M] =
+		imx_clk_hw_fixed_factor("sys_pll2_250m", "sys_pll2_out", 1, 4);
+	hws[IMX8MP_ANATOP_SYS_PLL2_333M] =
+		imx_clk_hw_fixed_factor("sys_pll2_333m", "sys_pll2_out", 1, 3);
+	hws[IMX8MP_ANATOP_SYS_PLL2_500M] =
+		imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_out", 1, 2);
+	hws[IMX8MP_ANATOP_SYS_PLL2_1000M] =
+		imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
+
+	hws[IMX8MP_ANATOP_CLK_CLKOUT1_SEL] =
+		imx_clk_hw_mux2("clkout1_sel", base + 0x128, 4, 4,
+				clkout_sels, ARRAY_SIZE(clkout_sels));
+	hws[IMX8MP_ANATOP_CLK_CLKOUT1_DIV] =
+		imx_clk_hw_divider("clkout1_div", "clkout1_sel", base + 0x128,
+				   0, 4);
+	hws[IMX8MP_ANATOP_CLK_CLKOUT1] =
+		imx_clk_hw_gate("clkout1", "clkout1_div", base + 0x128, 8);
+	hws[IMX8MP_ANATOP_CLK_CLKOUT2_SEL] =
+		imx_clk_hw_mux2("clkout2_sel", base + 0x128, 20, 4,
+				clkout_sels, ARRAY_SIZE(clkout_sels));
+	hws[IMX8MP_ANATOP_CLK_CLKOUT2_DIV] =
+		imx_clk_hw_divider("clkout2_div", "clkout2_sel", base + 0x128,
+				   16, 4);
+	hws[IMX8MP_ANATOP_CLK_CLKOUT2] =
+		imx_clk_hw_gate("clkout2", "clkout2_div", base + 0x128, 24);
+
+	imx_check_clk_hws(hws, IMX8MP_ANATOP_CLK_END);
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
+	if (ret < 0) {
+		imx_unregister_hw_clocks(hws, IMX8MP_ANATOP_CLK_END);
+		return dev_err_probe(dev, ret,
+				     "failed to register anatop clock provider\n");
+	}
+
+	dev_info(dev, "NXP i.MX8MP anatop clock driver probed\n");
+	return 0;
+}
+
+static const struct of_device_id imx8mp_anatop_clk_of_match[] = {
+	{ .compatible = "fsl,imx8mp-anatop" },
+	{ /* Sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, imx8mp_anatop_clk_of_match);
+
+static struct platform_driver imx8mp_anatop_clk_driver = {
+	.probe = imx8mp_anatop_clocks_probe,
+	.driver = {
+		.name = "imx8mp-anatop",
+		/*
+		 * Disable bind attributes: clocks are not removed and
+		 * reloading the driver will crash or break devices.
+		 */
+		.suppress_bind_attrs = true,
+		.of_match_table = imx8mp_anatop_clk_of_match,
+	},
+};
+
+module_platform_driver(imx8mp_anatop_clk_driver);
+
+MODULE_AUTHOR("Dario Binacchi <dario.binacchi@amarulasolutions.com>");
+MODULE_DESCRIPTION("NXP i.MX8MP anatop clock driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
index 99cac3d5e5b0..3fa6241dede9 100644
--- a/drivers/clk/imx/clk-imx8mp.c
+++ b/drivers/clk/imx/clk-imx8mp.c
@@ -21,18 +21,6 @@ static u32 share_count_media;
 static u32 share_count_usb;
 static u32 share_count_audio;
 
-static const char * const pll_ref_sels[] = { "osc_24m", "dummy", "dummy", "dummy", };
-static const char * const audio_pll1_bypass_sels[] = {"audio_pll1", "audio_pll1_ref_sel", };
-static const char * const audio_pll2_bypass_sels[] = {"audio_pll2", "audio_pll2_ref_sel", };
-static const char * const video_pll_bypass_sels[] = {"video_pll", "video_pll_ref_sel", };
-static const char * const dram_pll_bypass_sels[] = {"dram_pll", "dram_pll_ref_sel", };
-static const char * const gpu_pll_bypass_sels[] = {"gpu_pll", "gpu_pll_ref_sel", };
-static const char * const vpu_pll_bypass_sels[] = {"vpu_pll", "vpu_pll_ref_sel", };
-static const char * const arm_pll_bypass_sels[] = {"arm_pll", "arm_pll_ref_sel", };
-static const char * const sys_pll1_bypass_sels[] = {"sys_pll1", "sys_pll1_ref_sel", };
-static const char * const sys_pll2_bypass_sels[] = {"sys_pll2", "sys_pll2_ref_sel", };
-static const char * const sys_pll3_bypass_sels[] = {"sys_pll3", "sys_pll3_ref_sel", };
-
 static const char * const imx8mp_a53_sels[] = {"osc_24m", "arm_pll_out", "sys_pll2_500m",
 					       "sys_pll2_1000m", "sys_pll1_800m", "sys_pll1_400m",
 					       "audio_pll1_out", "sys_pll3_out", };
@@ -398,12 +386,6 @@ static const char * const imx8mp_sai7_sels[] = {"osc_24m", "audio_pll1_out", "au
 
 static const char * const imx8mp_dram_core_sels[] = {"dram_pll_out", "dram_alt_root", };
 
-static const char * const imx8mp_clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "video_pll_out",
-						  "dummy", "dummy", "gpu_pll_out", "vpu_pll_out",
-						  "arm_pll_out", "sys_pll1_out", "sys_pll2_out",
-						  "sys_pll3_out", "dummy", "dummy", "osc_24m",
-						  "dummy", "osc_32k"};
-
 static struct clk_hw **hws;
 static struct clk_hw_onecell_data *clk_hw_data;
 
@@ -549,18 +531,11 @@ static void imx8mp_clocks_apply_constraints(const struct imx8mp_clock_constraint
 static int imx8mp_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np;
-	void __iomem *anatop_base, *ccm_base;
+	struct device_node *np = dev->of_node, *anp;
+	void __iomem *ccm_base;
 	const char *opmode;
 	int err;
 
-	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
-	anatop_base = devm_of_iomap(dev, np, 0, NULL);
-	of_node_put(np);
-	if (WARN_ON(IS_ERR(anatop_base)))
-		return PTR_ERR(anatop_base);
-
-	np = dev->of_node;
 	ccm_base = devm_platform_ioremap_resource(pdev, 0);
 	if (WARN_ON(IS_ERR(ccm_base)))
 		return PTR_ERR(ccm_base);
@@ -572,88 +547,92 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 	clk_hw_data->num = IMX8MP_CLK_END;
 	hws = clk_hw_data->hws;
 
-	hws[IMX8MP_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
-	hws[IMX8MP_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
-	hws[IMX8MP_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
+	anp = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
+	if (!anp)
+		return dev_err_probe(dev, -ENODEV, "missing anatop\n");
+
+	of_node_put(anp);
+
+	hws[IMX8MP_CLK_DUMMY] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_DUMMY);
+	hws[IMX8MP_CLK_24M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_24M);
+	hws[IMX8MP_CLK_32K] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_32K);
 	hws[IMX8MP_CLK_EXT1] = imx_get_clk_hw_by_name(np, "clk_ext1");
 	hws[IMX8MP_CLK_EXT2] = imx_get_clk_hw_by_name(np, "clk_ext2");
 	hws[IMX8MP_CLK_EXT3] = imx_get_clk_hw_by_name(np, "clk_ext3");
 	hws[IMX8MP_CLK_EXT4] = imx_get_clk_hw_by_name(np, "clk_ext4");
 
-	hws[IMX8MP_AUDIO_PLL1_REF_SEL] = imx_clk_hw_mux("audio_pll1_ref_sel", anatop_base + 0x0, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_AUDIO_PLL2_REF_SEL] = imx_clk_hw_mux("audio_pll2_ref_sel", anatop_base + 0x14, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_VIDEO_PLL_REF_SEL] = imx_clk_hw_mux("video_pll_ref_sel", anatop_base + 0x28, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_DRAM_PLL_REF_SEL] = imx_clk_hw_mux("dram_pll_ref_sel", anatop_base + 0x50, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_GPU_PLL_REF_SEL] = imx_clk_hw_mux("gpu_pll_ref_sel", anatop_base + 0x64, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_VPU_PLL_REF_SEL] = imx_clk_hw_mux("vpu_pll_ref_sel", anatop_base + 0x74, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_ARM_PLL_REF_SEL] = imx_clk_hw_mux("arm_pll_ref_sel", anatop_base + 0x84, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_SYS_PLL1_REF_SEL] = imx_clk_hw_mux("sys_pll1_ref_sel", anatop_base + 0x94, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_SYS_PLL2_REF_SEL] = imx_clk_hw_mux("sys_pll2_ref_sel", anatop_base + 0x104, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-	hws[IMX8MP_SYS_PLL3_REF_SEL] = imx_clk_hw_mux("sys_pll3_ref_sel", anatop_base + 0x114, 0, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels));
-
-	hws[IMX8MP_AUDIO_PLL1] = imx_clk_hw_pll14xx("audio_pll1", "audio_pll1_ref_sel", anatop_base, &imx_1443x_pll);
-	hws[IMX8MP_AUDIO_PLL2] = imx_clk_hw_pll14xx("audio_pll2", "audio_pll2_ref_sel", anatop_base + 0x14, &imx_1443x_pll);
-	hws[IMX8MP_VIDEO_PLL] = imx_clk_hw_pll14xx("video_pll", "video_pll_ref_sel", anatop_base + 0x28, &imx_1443x_pll);
-	hws[IMX8MP_DRAM_PLL] = imx_clk_hw_pll14xx("dram_pll", "dram_pll_ref_sel", anatop_base + 0x50, &imx_1443x_dram_pll);
-	hws[IMX8MP_GPU_PLL] = imx_clk_hw_pll14xx("gpu_pll", "gpu_pll_ref_sel", anatop_base + 0x64, &imx_1416x_pll);
-	hws[IMX8MP_VPU_PLL] = imx_clk_hw_pll14xx("vpu_pll", "vpu_pll_ref_sel", anatop_base + 0x74, &imx_1416x_pll);
-	hws[IMX8MP_ARM_PLL] = imx_clk_hw_pll14xx("arm_pll", "arm_pll_ref_sel", anatop_base + 0x84, &imx_1416x_pll);
-	hws[IMX8MP_SYS_PLL1] = imx_clk_hw_pll14xx("sys_pll1", "sys_pll1_ref_sel", anatop_base + 0x94, &imx_1416x_pll);
-	hws[IMX8MP_SYS_PLL2] = imx_clk_hw_pll14xx("sys_pll2", "sys_pll2_ref_sel", anatop_base + 0x104, &imx_1416x_pll);
-	hws[IMX8MP_SYS_PLL3] = imx_clk_hw_pll14xx("sys_pll3", "sys_pll3_ref_sel", anatop_base + 0x114, &imx_1416x_pll);
-
-	hws[IMX8MP_AUDIO_PLL1_BYPASS] = imx_clk_hw_mux_flags("audio_pll1_bypass", anatop_base, 16, 1, audio_pll1_bypass_sels, ARRAY_SIZE(audio_pll1_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_AUDIO_PLL2_BYPASS] = imx_clk_hw_mux_flags("audio_pll2_bypass", anatop_base + 0x14, 16, 1, audio_pll2_bypass_sels, ARRAY_SIZE(audio_pll2_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_VIDEO_PLL_BYPASS] = imx_clk_hw_mux_flags("video_pll_bypass", anatop_base + 0x28, 16, 1, video_pll_bypass_sels, ARRAY_SIZE(video_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_DRAM_PLL_BYPASS] = imx_clk_hw_mux_flags("dram_pll_bypass", anatop_base + 0x50, 16, 1, dram_pll_bypass_sels, ARRAY_SIZE(dram_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_GPU_PLL_BYPASS] = imx_clk_hw_mux_flags("gpu_pll_bypass", anatop_base + 0x64, 28, 1, gpu_pll_bypass_sels, ARRAY_SIZE(gpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_VPU_PLL_BYPASS] = imx_clk_hw_mux_flags("vpu_pll_bypass", anatop_base + 0x74, 28, 1, vpu_pll_bypass_sels, ARRAY_SIZE(vpu_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_ARM_PLL_BYPASS] = imx_clk_hw_mux_flags("arm_pll_bypass", anatop_base + 0x84, 28, 1, arm_pll_bypass_sels, ARRAY_SIZE(arm_pll_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_SYS_PLL1_BYPASS] = imx_clk_hw_mux_flags("sys_pll1_bypass", anatop_base + 0x94, 28, 1, sys_pll1_bypass_sels, ARRAY_SIZE(sys_pll1_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_SYS_PLL2_BYPASS] = imx_clk_hw_mux_flags("sys_pll2_bypass", anatop_base + 0x104, 28, 1, sys_pll2_bypass_sels, ARRAY_SIZE(sys_pll2_bypass_sels), CLK_SET_RATE_PARENT);
-	hws[IMX8MP_SYS_PLL3_BYPASS] = imx_clk_hw_mux_flags("sys_pll3_bypass", anatop_base + 0x114, 28, 1, sys_pll3_bypass_sels, ARRAY_SIZE(sys_pll3_bypass_sels), CLK_SET_RATE_PARENT);
-
-	hws[IMX8MP_AUDIO_PLL1_OUT] = imx_clk_hw_gate("audio_pll1_out", "audio_pll1_bypass", anatop_base, 13);
-	hws[IMX8MP_AUDIO_PLL2_OUT] = imx_clk_hw_gate("audio_pll2_out", "audio_pll2_bypass", anatop_base + 0x14, 13);
-	hws[IMX8MP_VIDEO_PLL_OUT] = imx_clk_hw_gate("video_pll_out", "video_pll_bypass", anatop_base + 0x28, 13);
-	hws[IMX8MP_DRAM_PLL_OUT] = imx_clk_hw_gate("dram_pll_out", "dram_pll_bypass", anatop_base + 0x50, 13);
-	hws[IMX8MP_GPU_PLL_OUT] = imx_clk_hw_gate("gpu_pll_out", "gpu_pll_bypass", anatop_base + 0x64, 11);
-	hws[IMX8MP_VPU_PLL_OUT] = imx_clk_hw_gate("vpu_pll_out", "vpu_pll_bypass", anatop_base + 0x74, 11);
-	hws[IMX8MP_ARM_PLL_OUT] = imx_clk_hw_gate("arm_pll_out", "arm_pll_bypass", anatop_base + 0x84, 11);
-	hws[IMX8MP_SYS_PLL3_OUT] = imx_clk_hw_gate("sys_pll3_out", "sys_pll3_bypass", anatop_base + 0x114, 11);
-
-	hws[IMX8MP_SYS_PLL1_OUT] = imx_clk_hw_gate("sys_pll1_out", "sys_pll1_bypass", anatop_base + 0x94, 11);
-
-	hws[IMX8MP_SYS_PLL1_40M] = imx_clk_hw_fixed_factor("sys_pll1_40m", "sys_pll1_out", 1, 20);
-	hws[IMX8MP_SYS_PLL1_80M] = imx_clk_hw_fixed_factor("sys_pll1_80m", "sys_pll1_out", 1, 10);
-	hws[IMX8MP_SYS_PLL1_100M] = imx_clk_hw_fixed_factor("sys_pll1_100m", "sys_pll1_out", 1, 8);
-	hws[IMX8MP_SYS_PLL1_133M] = imx_clk_hw_fixed_factor("sys_pll1_133m", "sys_pll1_out", 1, 6);
-	hws[IMX8MP_SYS_PLL1_160M] = imx_clk_hw_fixed_factor("sys_pll1_160m", "sys_pll1_out", 1, 5);
-	hws[IMX8MP_SYS_PLL1_200M] = imx_clk_hw_fixed_factor("sys_pll1_200m", "sys_pll1_out", 1, 4);
-	hws[IMX8MP_SYS_PLL1_266M] = imx_clk_hw_fixed_factor("sys_pll1_266m", "sys_pll1_out", 1, 3);
-	hws[IMX8MP_SYS_PLL1_400M] = imx_clk_hw_fixed_factor("sys_pll1_400m", "sys_pll1_out", 1, 2);
-	hws[IMX8MP_SYS_PLL1_800M] = imx_clk_hw_fixed_factor("sys_pll1_800m", "sys_pll1_out", 1, 1);
-
-	hws[IMX8MP_SYS_PLL2_OUT] = imx_clk_hw_gate("sys_pll2_out", "sys_pll2_bypass", anatop_base + 0x104, 11);
-
-	hws[IMX8MP_SYS_PLL2_50M] = imx_clk_hw_fixed_factor("sys_pll2_50m", "sys_pll2_out", 1, 20);
-	hws[IMX8MP_SYS_PLL2_100M] = imx_clk_hw_fixed_factor("sys_pll2_100m", "sys_pll2_out", 1, 10);
-	hws[IMX8MP_SYS_PLL2_125M] = imx_clk_hw_fixed_factor("sys_pll2_125m", "sys_pll2_out", 1, 8);
-	hws[IMX8MP_SYS_PLL2_166M] = imx_clk_hw_fixed_factor("sys_pll2_166m", "sys_pll2_out", 1, 6);
-	hws[IMX8MP_SYS_PLL2_200M] = imx_clk_hw_fixed_factor("sys_pll2_200m", "sys_pll2_out", 1, 5);
-	hws[IMX8MP_SYS_PLL2_250M] = imx_clk_hw_fixed_factor("sys_pll2_250m", "sys_pll2_out", 1, 4);
-	hws[IMX8MP_SYS_PLL2_333M] = imx_clk_hw_fixed_factor("sys_pll2_333m", "sys_pll2_out", 1, 3);
-	hws[IMX8MP_SYS_PLL2_500M] = imx_clk_hw_fixed_factor("sys_pll2_500m", "sys_pll2_out", 1, 2);
-	hws[IMX8MP_SYS_PLL2_1000M] = imx_clk_hw_fixed_factor("sys_pll2_1000m", "sys_pll2_out", 1, 1);
-
-	hws[IMX8MP_CLK_CLKOUT1_SEL] = imx_clk_hw_mux2("clkout1_sel", anatop_base + 0x128, 4, 4,
-						      imx8mp_clkout_sels, ARRAY_SIZE(imx8mp_clkout_sels));
-	hws[IMX8MP_CLK_CLKOUT1_DIV] = imx_clk_hw_divider("clkout1_div", "clkout1_sel", anatop_base + 0x128, 0, 4);
-	hws[IMX8MP_CLK_CLKOUT1] = imx_clk_hw_gate("clkout1", "clkout1_div", anatop_base + 0x128, 8);
-	hws[IMX8MP_CLK_CLKOUT2_SEL] = imx_clk_hw_mux2("clkout2_sel", anatop_base + 0x128, 20, 4,
-						      imx8mp_clkout_sels, ARRAY_SIZE(imx8mp_clkout_sels));
-	hws[IMX8MP_CLK_CLKOUT2_DIV] = imx_clk_hw_divider("clkout2_div", "clkout2_sel", anatop_base + 0x128, 16, 4);
-	hws[IMX8MP_CLK_CLKOUT2] = imx_clk_hw_gate("clkout2", "clkout2_div", anatop_base + 0x128, 24);
+	hws[IMX8MP_AUDIO_PLL1_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL1_REF_SEL);
+	hws[IMX8MP_AUDIO_PLL2_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL2_REF_SEL);
+	hws[IMX8MP_VIDEO_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VIDEO_PLL_REF_SEL);
+	hws[IMX8MP_DRAM_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_DRAM_PLL_REF_SEL);
+	hws[IMX8MP_GPU_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_GPU_PLL_REF_SEL);
+	hws[IMX8MP_VPU_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VPU_PLL_REF_SEL);
+	hws[IMX8MP_ARM_PLL_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_ARM_PLL_REF_SEL);
+	hws[IMX8MP_SYS_PLL1_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_REF_SEL);
+	hws[IMX8MP_SYS_PLL2_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_REF_SEL);
+	hws[IMX8MP_SYS_PLL3_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL3_REF_SEL);
+
+	hws[IMX8MP_AUDIO_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL1);
+	hws[IMX8MP_AUDIO_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL2);
+	hws[IMX8MP_VIDEO_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VIDEO_PLL);
+	hws[IMX8MP_DRAM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_DRAM_PLL);
+	hws[IMX8MP_GPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_GPU_PLL);
+	hws[IMX8MP_VPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VPU_PLL);
+	hws[IMX8MP_ARM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_ARM_PLL);
+	hws[IMX8MP_SYS_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1);
+	hws[IMX8MP_SYS_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2);
+	hws[IMX8MP_SYS_PLL3] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL3);
+
+	hws[IMX8MP_AUDIO_PLL1_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL1_BYPASS);
+	hws[IMX8MP_AUDIO_PLL2_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL2_BYPASS);
+	hws[IMX8MP_VIDEO_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VIDEO_PLL_BYPASS);
+	hws[IMX8MP_DRAM_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_DRAM_PLL_BYPASS);
+	hws[IMX8MP_GPU_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_GPU_PLL_BYPASS);
+	hws[IMX8MP_VPU_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VPU_PLL_BYPASS);
+	hws[IMX8MP_ARM_PLL_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_ARM_PLL_BYPASS);
+	hws[IMX8MP_SYS_PLL1_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_BYPASS);
+	hws[IMX8MP_SYS_PLL2_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_BYPASS);
+	hws[IMX8MP_SYS_PLL3_BYPASS] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL3_BYPASS);
+
+	hws[IMX8MP_AUDIO_PLL1_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL1_OUT);
+	hws[IMX8MP_AUDIO_PLL2_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_AUDIO_PLL2_OUT);
+	hws[IMX8MP_VIDEO_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VIDEO_PLL_OUT);
+	hws[IMX8MP_DRAM_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_DRAM_PLL_OUT);
+	hws[IMX8MP_GPU_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_GPU_PLL_OUT);
+	hws[IMX8MP_VPU_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_VPU_PLL_OUT);
+	hws[IMX8MP_ARM_PLL_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_ARM_PLL_OUT);
+	hws[IMX8MP_SYS_PLL3_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL3_OUT);
+
+	hws[IMX8MP_SYS_PLL1_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_OUT);
+
+	hws[IMX8MP_SYS_PLL1_40M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_40M);
+	hws[IMX8MP_SYS_PLL1_80M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_80M);
+	hws[IMX8MP_SYS_PLL1_100M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_100M);
+	hws[IMX8MP_SYS_PLL1_133M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_133M);
+	hws[IMX8MP_SYS_PLL1_160M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_160M);
+	hws[IMX8MP_SYS_PLL1_200M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_200M);
+	hws[IMX8MP_SYS_PLL1_266M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_266M);
+	hws[IMX8MP_SYS_PLL1_400M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_400M);
+	hws[IMX8MP_SYS_PLL1_800M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL1_800M);
+
+	hws[IMX8MP_SYS_PLL2_OUT] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_OUT);
+
+	hws[IMX8MP_SYS_PLL2_50M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_50M);
+	hws[IMX8MP_SYS_PLL2_100M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_100M);
+	hws[IMX8MP_SYS_PLL2_125M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_125M);
+	hws[IMX8MP_SYS_PLL2_166M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_166M);
+	hws[IMX8MP_SYS_PLL2_200M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_200M);
+	hws[IMX8MP_SYS_PLL2_250M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_250M);
+	hws[IMX8MP_SYS_PLL2_333M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_333M);
+	hws[IMX8MP_SYS_PLL2_500M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_500M);
+	hws[IMX8MP_SYS_PLL2_1000M] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_SYS_PLL2_1000M);
+
+	hws[IMX8MP_CLK_CLKOUT1_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_CLKOUT1_SEL);
+	hws[IMX8MP_CLK_CLKOUT1_DIV] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_CLKOUT1_DIV);
+	hws[IMX8MP_CLK_CLKOUT1] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_CLKOUT1);
+	hws[IMX8MP_CLK_CLKOUT2_SEL] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_CLKOUT2_SEL);
+	hws[IMX8MP_CLK_CLKOUT2_DIV] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_CLKOUT2_DIV);
+	hws[IMX8MP_CLK_CLKOUT2] = imx_anatop_get_clk_hw(anp, IMX8MP_ANATOP_CLK_CLKOUT2);
 
 	hws[IMX8MP_CLK_A53_DIV] = imx8m_clk_hw_composite_core("arm_a53_div", imx8mp_a53_sels, ccm_base + 0x8000);
 	hws[IMX8MP_CLK_A53_SRC] = hws[IMX8MP_CLK_A53_DIV];
@@ -875,6 +854,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
 
 	imx_register_uart_clocks();
 
+	dev_info(dev, "NXP i.MX8MP ccm clock driver probed\n");
 	return 0;
 }
 
-- 
2.43.0

