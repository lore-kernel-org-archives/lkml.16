Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65C31E5729;
	Thu, 30 Jan 2025 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738242087; cv=none; b=rHOU3IH461VF0R8+cU2L4J5uDJqbmJq7CJICgaIlf0Tl49RaWwPnQgyug8OSu9ZLz1xuaPnzLQIwNUInEDJMy8weHJF3+4CmXbXlA3RGT6tyEHc+CbpQOKQLvSR2kv3oWUR3FYY7P4Mg0oz8brOoWYXDKDlTfzADjs2h2Cu7kw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738242087; c=relaxed/simple;
	bh=FZMM4uSzGo1xAgbI2jjgAzL0LHxvkef1Lz4E4kC6gr0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qo4/opAQXEpbLLx0tElPFQu9coDIRviFU7d/dn2a5v1a95SNh3xYVxlgyXWVvbDFgrvSce/fl/bfz2IMHHCPSb1ksQ44xQlZhcMPCh+Agw56En4kJDXQJx4HQ0YJg9mdD+Za3zs3bN11iLmQ9MkppnwazR7LbrajBknAzU7LGBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ejBcVXmg; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=E30/0s4c reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ejBcVXmg";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="E30/0s4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738242085; x=1769778085;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LyKkikvY80+GKiSyONnc9vcmv/5ZXa6vRuWd2+cvLNU=;
  b=ejBcVXmgYgriV21V5MYGG5GF14Tpvc4sM8E32JQ/tKsBn0UEPdA8tW/B
   MMEp2eavvqg7BwGLMg7wsdkI5ksA3sPx22cq4ciIDuaKwDyZJsPdIKjv2
   uF0722xgKnnJEBkKwo7yD2xfxIkiIjArT/xKmxX1R29sNvYBXYECJSugw
   yYvwgTUr5fm8diebbZms9P48+kKWkmtIksVc0Lh5XOmqcZbDSEu+Mf40K
   Co0FivOuIdjYwnotMZTrcHBmNFktjyvZ/fVuG+pn2cQoza7SFAXZAAVjs
   r9oU/d86HRCxytoH1OZnQlpZexYNlTwlLvruqGfAUkvVNxkgD3rwhe937
   A==;
X-CSE-ConnectionGUID: yIqcFOdySnOPsjZWKtoG3g==
X-CSE-MsgGUID: HrRJxZPMRCew96JoOAIhlg==
X-IronPort-AV: E=Sophos;i="6.13,245,1732575600"; 
   d="scan'208";a="41374617"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 30 Jan 2025 14:01:24 +0100
X-CheckPoint: {679B7824-E-1D00F64B-E6C57517}
X-MAIL-CPID: 2551D003E15F2F7538C09A8A99662D09_3
X-Control-Analysis: str=0001.0A682F1E.679B7824.0080,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8600B1675B4;
	Thu, 30 Jan 2025 14:01:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738242079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LyKkikvY80+GKiSyONnc9vcmv/5ZXa6vRuWd2+cvLNU=;
	b=E30/0s4co8oDMYj/gRd7177975fwdVx6WXD8jH+PJbApatPtxR0HyvIeQDaWKD+GDqiJFN
	pV6yr57uFgQpI9iknuLeDx2W1gF8Or+CQu6t8c9iU+2Q0KNmyoNhbI6iwXYr1jxfTTb3cu
	DAnhuMtVO46porBxvwv1k8RN3zRRKp9Sph6uhjA6uYWTvIgx5HpV+22lroeyAVrOsOoC9j
	2mEx7cWgKxv5ID7BJGIIRenf5dEMfrg0IERVqiia5WuNiUu9mjd8SvmiioWWauA1GZd5yB
	IfL5wnscsJIxuFRhnlPFfn5Ok8lb2benuljhQsurlELexW5JSYAs3K+3Q/pP5Q==
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
Subject: [PATCH 3/4] nvmem: imx-ocotp: Support accessing controller for i.MX8M Nano
Date: Thu, 30 Jan 2025 14:01:00 +0100
Message-Id: <20250130130101.1040824-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
References: <20250130130101.1040824-1-alexander.stein@ew.tq-group.com>
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
 drivers/nvmem/Kconfig     |   3 ++
 drivers/nvmem/imx-ocotp.c | 105 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 107 insertions(+), 1 deletion(-)

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
index c5086a16450ac..e3ea026a37d0d 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -23,6 +23,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <dt-bindings/nvmem/fsl,imx8mn-ocotp.h>
 
 #define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address of the
 					       * OTP Bank0 Word0
@@ -91,11 +92,20 @@ struct ocotp_ctrl_reg {
 	u32 bm_rel_shadows;
 };
 
+#define OCOTP_MAX_NUM_GATE_WORDS 4
+
+struct disable_fuse {
+	u32 fuse_addr;
+	u32 mask;
+};
+
 struct ocotp_params {
 	unsigned int nregs;
 	unsigned int bank_address_words;
 	void (*set_timing)(struct ocotp_priv *priv);
 	struct ocotp_ctrl_reg ctrl;
+	u32 num_disables;
+	struct disable_fuse *disables;
 };
 
 static int imx_ocotp_wait_for_busy(struct ocotp_priv *priv, u32 flags)
@@ -552,11 +562,25 @@ static const struct ocotp_params imx8mm_params = {
 	.ctrl = IMX_OCOTP_BM_CTRL_DEFAULT,
 };
 
+struct disable_fuse imx8mn_disable_fuse[] = {
+		[IMX8MN_OCOTP_M7_DISABLE]	= { .fuse_addr = 20, .mask = BIT(8) },
+		[IMX8MN_OCOTP_M7_MPU_DISABLE]	= { .fuse_addr = 20, .mask = BIT(9) },
+		[IMX8MN_OCOTP_M7_FPU_DISABLE]	= { .fuse_addr = 20, .mask = BIT(10) },
+		[IMX8MN_OCOTP_USB_OTG1_DISABLE]	= { .fuse_addr = 20, .mask = BIT(11) },
+		[IMX8MN_OCOTP_GPU3D_DISABLE]	= { .fuse_addr = 20, .mask = BIT(24) },
+		[IMX8MN_OCOTP_MIPI_DSI_DISABLE]	= { .fuse_addr = 20, .mask = BIT(28) },
+		[IMX8MN_OCOTP_ENET_DISABLE]	= { .fuse_addr = 20, .mask = BIT(29) },
+		[IMX8MN_OCOTP_MIPI_CSI_DISABLE]	= { .fuse_addr = 20, .mask = BIT(30) },
+		[IMX8MN_OCOTP_ASRC_DISABLE]	= { .fuse_addr = 20, .mask = BIT(31) },
+};
+
 static const struct ocotp_params imx8mn_params = {
 	.nregs = 256,
 	.bank_address_words = 0,
 	.set_timing = imx_ocotp_set_imx6_timing,
 	.ctrl = IMX_OCOTP_BM_CTRL_DEFAULT,
+	.num_disables = ARRAY_SIZE(imx8mn_disable_fuse),
+	.disables = imx8mn_disable_fuse,
 };
 
 static const struct ocotp_params imx8mp_params = {
@@ -589,6 +613,81 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
 	cell->read_post_process = imx_ocotp_cell_pp;
 }
 
+static int imx_ocotp_check_access(struct ocotp_priv *priv, u32 id)
+{
+	u32 addr, mask, ret, val;
+
+	if (id >= priv->params->num_disables) {
+		dev_err(priv->dev, "Index %d too large\n", id);
+		return -EACCES;
+	}
+
+	addr = priv->params->disables[id].fuse_addr;
+	mask = priv->params->disables[id].mask;
+
+	ret = imx_ocotp_read(priv, addr, &val, sizeof(val));
+	if (ret)
+		return ret;
+
+	dev_dbg(priv->dev, "id:%d addr:%#x mask:0x%08x\n", id, addr, mask);
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
+		u32 id, idx = 0;
+
+		while (!of_parse_phandle_with_args(child, "access-controllers",
+						   "#access-controller-cells",
+						   idx++, &args)) {
+			of_node_put(args.np);
+			if (args.np != dev->of_node)
+				continue;
+
+			/* Only support one cell */
+			if (args.args_count != 1) {
+				dev_err(dev, "wrong args count\n");
+				continue;
+			}
+
+			id = args.args[0];
+
+			dev_dbg(dev, "Checking node: %pOF disable ID: %d\n", child, id);
+
+			if (imx_ocotp_check_access(priv, id)) {
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
+	if (!priv->params->disables)
+		return 0;
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
@@ -622,9 +721,13 @@ static int imx_ocotp_probe(struct platform_device *pdev)
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

