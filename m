Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0901AA1D2;
	Fri,  7 Feb 2025 08:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917425; cv=none; b=KSLR5LCIhtAub1jw7rkaUnIJrtNjLSLh23MQ/lKbs5LAHzNwAFFILJtM0kBMkkb1di40ol0GcMKPwanMajqeUI8L0aP266Q7hHENQEe1B0sKUj2JqGAgJWZVxqpAfe5h6OuMWHHuBrbs7o8Knuq1eA/6FL//HDmVue7N/FVLBlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917425; c=relaxed/simple;
	bh=nUQ3+jitWLH6y6mXfI79SLskec02P+euF2e6YXUZ73I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k0dMSlyfiTRMU73lrUedcODLkHE/7Rqs2BnJmXdRtmm2Lu4Bx7Lf4igyuU9Ie0b9WLUysytS4q+aOgnWfwEuFr0hqDo8pa73zlqNYREz+juLOaDJ/Sug3v4HsHRxKn4VLr9WJCOMZEs6WFBhXrYrFivy12IHUPQ5Oa71xUcKY+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=Q6tiOkBx; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ML4qHaj/ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="Q6tiOkBx";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ML4qHaj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917424; x=1770453424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q3LyG1mkg7NlCAYeLHiZsZMLil8RCSZiCNMrxGuaTsk=;
  b=Q6tiOkBxli0YbOtROIf7IRfR6CzElKSaLiYN0a6chIwrbUna49639L6F
   F/UeVz66ziizYYFP0rQCJNu7VfEJC1uy8QzNtooN1SpCm7lL3WCgItKzC
   iWEPxxhaU+FYAgjNyONtqSpNqNKmtcMiV9vIwc2lD9FbiE9sCWh/PHkIb
   dIWJ8NeNbGMafVhQu0Jv4Ofu6b/d6YjPociZL0s6gyGZ/aOHRBNBsZ8zf
   3M0cCUfCWBdK+yHQrTg7i25IZsvOzw7mvKoo3e1/XXtDDfeqo4SBtQrpx
   7n3PT3XxwsAZTHUgxFC7/cgAa9aBoW4iuuKkUwH9IcsM12ZG2oz+ggs99
   Q==;
X-CSE-ConnectionGUID: vpSVzm22RyO5Zr0U+CasfA==
X-CSE-MsgGUID: 3H5g9f8PSaa/MPkbu7lblQ==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636074"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:36:38 +0100
X-CheckPoint: {67A5C615-0-7A8FD441-CBCD789D}
X-MAIL-CPID: 66C78CBF8FFC8EE94A2495468FCDC6F7_3
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C276168331;
	Fri,  7 Feb 2025 09:36:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3LyG1mkg7NlCAYeLHiZsZMLil8RCSZiCNMrxGuaTsk=;
	b=ML4qHaj/+G+iPMqG7hy85nGYawKwktErwhj0TGxUNBfGJktZS+6BlIGuBLvZOwd1JX5Tfm
	VKS19bWSBMEjY9WBG/CTIvWdVOS09LONWi3fKfe+5Tm96bB30WafxXrFTbt2J0RSUCh4yR
	cPg50xa1p378DJL4DXKIDvhu9wwt7EFEjfMBGa3Q/I6O63xislEILXtXObA89EzmyoBYXU
	JGTX5kUmTzV59i34mlZED/N2HL2uNmev1hQZIWKspdNa0dpvYfqxyIDTl2du4ia58Az9JC
	/cf5FxYX5wHf8CbUTf4gPN+0o01UgAlVb6qBsaQMajpn0e2CIrlJz2A2k++zAA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/10] nvmem: imx-ocotp: Support accessing controller for i.MX8M
Date: Fri,  7 Feb 2025 09:36:07 +0100
Message-Id: <20250207083616.1442887-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
References: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

i.MX8M OCOTP supports a specific peripheral or function being fused
which means disabled, so
 - Introduce disable_fuse for a list of possible fused peripherals.
 - Iterate all nodes to check accessing permission. If not
   allowed to be accessed, detach the node

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/nvmem/Kconfig     |  3 ++
 drivers/nvmem/imx-ocotp.c | 74 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 8671b7c974b93..ba5c928cab520 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -84,6 +84,9 @@ config NVMEM_IMX_OCOTP
 	  This driver can also be built as a module. If so, the module
 	  will be called nvmem-imx-ocotp.
 
+	  If built as modules, any other driver relying on this working
+	  as access controller also needs to be a module as well.
+
 config NVMEM_IMX_OCOTP_ELE
 	tristate "i.MX On-Chip OTP Controller support"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index c5086a16450ac..b15cbdae66a7c 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -589,6 +589,74 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
 	cell->read_post_process = imx_ocotp_cell_pp;
 }
 
+static int imx_ocotp_check_access(struct ocotp_priv *priv, u32 addr, u32 bit)
+{
+	u32 mask, ret, val;
+
+	mask = BIT(bit);
+
+	ret = imx_ocotp_read(priv, addr, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	/* true means disabled */
+	if (val & mask)
+		return -EACCES;
+
+	return 0;
+}
+
+static int imx_ocotp_grant_access(struct ocotp_priv *priv, struct device_node *parent)
+{
+	struct device *dev = priv->dev;
+
+	for_each_available_child_of_node_scoped(parent, child) {
+		struct of_phandle_args args;
+		u32 idx = 0;
+		u32 addr;
+		u32 bit;
+
+		while (!of_parse_phandle_with_args(child, "access-controllers",
+						   "#access-controller-cells",
+						   idx++, &args)) {
+			of_node_put(args.np);
+			if (args.np != dev->of_node)
+				continue;
+
+			/* Only support one cell */
+			if (args.args_count != 2) {
+				dev_err(dev, "wrong args count\n");
+				continue;
+			}
+
+			addr = args.args[0];
+			bit = args.args[1];
+
+			dev_dbg(dev, "Checking node: %pOF disable fuse addr: %u, bit %u\n", child, addr, bit);
+
+			if (imx_ocotp_check_access(priv, addr, bit)) {
+				of_detach_node(child);
+				dev_info(dev, "%pOF: disabled by fuse, device driver will not be probed\n",
+					 child);
+			}
+		}
+
+		imx_ocotp_grant_access(priv, child);
+	}
+
+	return 0;
+}
+
+static int imx_ocotp_access_control(struct ocotp_priv *priv)
+{
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+
+	if (WARN_ON(!root))
+		return -EINVAL;
+
+	return imx_ocotp_grant_access(priv, root);
+}
+
 static int imx_ocotp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -622,9 +690,13 @@ static int imx_ocotp_probe(struct platform_device *pdev)
 	imx_ocotp_clr_err_if_set(priv);
 	clk_disable_unprepare(priv->clk);
 
+	platform_set_drvdata(pdev, priv);
+
 	nvmem = devm_nvmem_register(dev, &imx_ocotp_nvmem_config);
+	if (IS_ERR(nvmem))
+		return PTR_ERR(nvmem);
 
-	return PTR_ERR_OR_ZERO(nvmem);
+	return imx_ocotp_access_control(priv);
 }
 
 static struct platform_driver imx_ocotp_driver = {
-- 
2.34.1

