Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C3F17993
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747403394; cv=none; b=uqYffvjocjz+RYXGbEy5cZJyh4LYVZQuwNQfk9uz2fIJkx6+uBddclWjwh5gL2zXZ5pp/fIUaRKiPuxW6eSaUNY5pmFy45yPyLAYhGG235hM5YPcF6eIii0qxsq7YBqo/r9Z6ETnF1oVxwEEiCTnB4JeyRWy0nM4MdaGz+7bRj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747403394; c=relaxed/simple;
	bh=Nie+wA2lEKwH2I614ELhqO2d8Vq+8E2sjK5/V77zdAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rqqOXQND24nQjQXflY6Sc3Uif8jQ6RPimgkmNmVP7htyI/fmPj4gRq/jCViTDIfmE1s4lwzQ9rPXKKCbFaOTD3Z2JM49rCw5QBO/9VWzEvXC3csG31aEJiJ9eRmOIRxjIZ4Z1DV0Z/kbfzGLRTSrLUhKFnDJpWZW3xy5ebOn6yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KTPjnA+b; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KTPjnA+b"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f62d3ed994so3984416a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747403391; x=1748008191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+uWwuTYRifAYGUlGh3WRUvzHiTmLTWvHkuePmubcIY=;
        b=KTPjnA+bF2/Q/ezQujB5JOF1TKpjrYvhCdJNfSzyn7G1sCJbG+LRhsmczVGxI6cGHa
         RxC2uMiIh6oLpFLhMxsEq6tQ/g9opDv9gSHu0n5QxGkjNBeyvnk4D0zxdjdc/bY+y03A
         ioq+zGV/kTBbPAi4vR0xsjSTASaTMPZd8w32k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747403391; x=1748008191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+uWwuTYRifAYGUlGh3WRUvzHiTmLTWvHkuePmubcIY=;
        b=DhtWfnRxz8OHxR9x0e+Fwf9eo4Mrl96aB64zY7zqH03Ml2M6D2+4Prbf+cJmAg/aR0
         vf3PZU7vYUT1c9TXruGnWJCli9bhg3YfpYBUAnnqIpopYtR7PIEz7uHti+il+P5gcM27
         zUb3uMSeoDX9q7dPLfYt7MQ6Wag44f3RZFnPLVCqYzarcacv6dIhgNEaWXuWMPbHipqy
         /kLRE3aMp9zeSChobLmOoCUYoVBQhMcoiog5igKfgMyMqpBONh3FBAbQvzHeQFANqojR
         CdWEKkFqAfsdPLhT72BNmyprxPJi7CIAi67MMkn2gJqGX/5oms3c9RBNbzvdMwPWOdmQ
         5lAw==
X-Gm-Message-State: AOJu0Yz+LPCmdQ1QENQUB+Rga2rZAepOJRCFE2OBrXV639Cknyoak2Gm
	Snje1o/WC8uMC4t7hoJc37I0UClHDuC8sqS7enqAzmldOQEaxYUDLLhqBYXa0YPBHm8AM9K3FAU
	u15NPO1Y=
X-Gm-Gg: ASbGncsXB7jZpHYLUN2ovw0cWoKs70TZAZgxN9PyqZRuFy3+y1eQfTo3jpx73QcwGys
	8cX3g6O877n4sxqNAI/jYBdelZvO5J2gdh5j/dv1shq4LdHjvI+twXUB95uaHuUbtT/1brzmt0/
	KLMss3q0zMfmamMfbV0qB63H7mu+MtOuEGvT4Y9EdyLTOv3t40gI0hA4mZnzWQdGPyxvGKxyODj
	ae5Ka8+eUIqzp1DJ4O1XXze1xmr/b0RL5YVwIt9nbDuNw9q7pwSEmi1ue3Q4OoHOk6EjTuH14sm
	PFwofG2HzOF2X1hHL053qMN+vY+ShaG1uwbpI0HqYUucPq9UKbpbrVQAkUQRWB71W8UlwMszsGG
	Fak6Adlqx+BPQAi8IHlHny9gAFfU=
X-Google-Smtp-Source: AGHT+IFoN5V5sXxRw1p11CkmgQLqoxiXH8inT8H8fElyYIKPtuQteQwDowZG6nwQRuFNGWvPp8sSnA==
X-Received: by 2002:a05:6402:27d1:b0:5fc:966b:23fa with SMTP id 4fb4d7f45d1cf-6008a39c9b8mr2906162a12.4.1747403391082;
        Fri, 16 May 2025 06:49:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([62.19.60.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6e6389sm1562951a12.45.2025.05.16.06.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 06:49:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Mark Brown <broonie@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [linux-next, 1/1] clk: imx: imx8mm-anatop: probe only on i.MX8MM platforms
Date: Fri, 16 May 2025 15:49:27 +0200
Message-ID: <20250516134945.14692-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9c1e388af87c ("clk: imx: add support for i.MX8MM anatop clock
driver") breaks boot on i.MX8M{P,N} platforms.

Here's the log for a board based on the i.MX8MP platform:

[    1.439320] i.MX clk 1: register failed with -2
[    1.441014] i.MX clk 2: register failed with -2
[    1.445610] imx8mm-anatop 30360000.clock-controller: NXP i.MX8MM anatop clock driver probed
[    1.455068] Unable to handle kernel paging request at virtual address fffffffffffffffe

...

[    1.634650] Call trace:
[    1.637102]  __clk_get_hw+0x4/0x18 (P)
[    1.640862]  imx8mp_clocks_probe+0xdc/0x2f50
[    1.645152]  platform_probe+0x68/0xc4
[    1.648827]  really_probe+0xbc/0x298
[    1.652413]  __driver_probe_device+0x78/0x12c

In the imx8mp.dtsi device tree, the anatop compatible string is:

compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";

So, in configurations like arm64 defconfig, where CONFIG_CLK_IMX8MP and
CONFIG_CLK_IMX8MM as well as CONFIG_CLK_IMX8MN are enabled, the driver
for the i.MX8MM anatop is incorrectly loaded.

The patch fixes the regression by ensuring that the i.MX8MM anatop
driver only probes on i.MX8MM platforms.

Fixes: 9c1e388af87c ("clk: imx: add support for i.MX8MM anatop clock driver")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/clk/imx/clk-imx8mm-anatop.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mm-anatop.c b/drivers/clk/imx/clk-imx8mm-anatop.c
index 4ac870df6370..90ff11a93fe5 100644
--- a/drivers/clk/imx/clk-imx8mm-anatop.c
+++ b/drivers/clk/imx/clk-imx8mm-anatop.c
@@ -37,6 +37,19 @@ static const char * const clkout_sels[] = {"audio_pll1_out", "audio_pll2_out", "
 static struct clk_hw_onecell_data *clk_hw_data;
 static struct clk_hw **hws;
 
+static int is_really_imx8mm(struct device_node *np)
+{
+	const char *compat;
+	struct property *p;
+
+	of_property_for_each_string(np, "compatible", p, compat) {
+		if (strcmp(compat, "fsl,imx8mm-anatop"))
+			return -EFAULT;
+	}
+
+	return 0;
+}
+
 static int imx8mm_anatop_clocks_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -44,6 +57,10 @@ static int imx8mm_anatop_clocks_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int ret;
 
+	ret = is_really_imx8mm(np);
+	if (ret)
+		return ret;
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_err(dev, "failed to get base address\n");
-- 
2.43.0

base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
branch: fix-imx8mm-probing
