Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2974F1F5851;
	Thu,  5 Jun 2025 06:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105284; cv=none; b=An1oC490Rq29K7g/ECJmfn/RcNZGXrBGUt2xpVLwOzloIVWlW3m44I24JQMRW/w01uCyeYOHJchYMX1wEhQzNNG7Fn6Dxbmwgh+si2UqgtG1NJqjYsets7GFjZYOeiGDpJH7IlC2OKQ8d5R3kvcbtuXH9xhqFLvYW4QbFLZJh5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105284; c=relaxed/simple;
	bh=ErRqqOpxwfW0w7fNXw2IiWrQLMr6NeAPAay0w6kuoGI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=omY/TQacF8Dj3FI8sszVR+swBjoK0jF2b/ZB5eFFbDG9b5713eT0I7DOM5rtmcbte4M+vhnBJFH13vDCaJg4DnV8w2q767ulbKG8H3Q3JN8LlweE1CVCtHB3lgh35c2fEvsVxSh4855EP7OiX8V8t0F/hj04nTWjCTKQpTa2fYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UFJEjFg/; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UFJEjFg/"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5556YS3U4007522;
	Thu, 5 Jun 2025 01:34:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749105268;
	bh=IPhBSTGoRyJcgG/sdbW/2eUB7XpXWt8lVYIybtfRXgo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UFJEjFg/FjLdTVgfPr1hFvHe/u3v/ijr/APoEXTeEUNc7WtO5fAud9aIyEeR46/iU
	 EfODxF304M94H87/t/nLdJo73EjoZFydi4XV4511wZWVOqLuuHIjNyL0cAkrqG2B/b
	 QzoAPiZwihvk98OrUjRDZJrj1sLiraM/2JgUGbPw=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5556YSC82575129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 5 Jun 2025 01:34:28 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Jun 2025 01:34:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Jun 2025 01:34:27 -0500
Received: from localhost (chintan-thinkstation-p360-tower.dhcp.ti.com [172.24.227.220])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5556YQUu3267438;
	Thu, 5 Jun 2025 01:34:27 -0500
From: Chintan Vankar <c-vankar@ti.com>
To: Thorsten Blum <thorsten.blum@linux.dev>, Andrew Davis <afd@ti.com>,
        Chintan Vankar <c-vankar@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Peter Rosin <peda@axentia.se>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <s-vadapalli@ti.com>, <vigneshr@ti.com>, <nm@ti.com>,
        <danishanwar@ti.com>
Subject: [PATCH 2/2] mux: mmio: Extend mmio-mux driver to configure mux with mux-reg-masks-state
Date: Thu, 5 Jun 2025 12:04:22 +0530
Message-ID: <20250605063422.3813260-3-c-vankar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250605063422.3813260-1-c-vankar@ti.com>
References: <20250605063422.3813260-1-c-vankar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

MMIO mux driver is designed to parse "mux-reg-masks" and "idle-states"
property independently to configure mux. The current design is complex for
the devices with larger memory space, which requires synchronization
between the two properties.

Extend mmio-mux driver to support a single property, "mux-reg-masks-state"
which configures mux registers without above constraint.

Signed-off-by: Chintan Vankar <c-vankar@ti.com>
---
 drivers/mux/mmio.c | 144 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 118 insertions(+), 26 deletions(-)

diff --git a/drivers/mux/mmio.c b/drivers/mux/mmio.c
index 9993ce38a818..5ce9c16fd431 100644
--- a/drivers/mux/mmio.c
+++ b/drivers/mux/mmio.c
@@ -2,7 +2,7 @@
 /*
  * MMIO register bitfield-controlled multiplexer driver
  *
- * Copyright (C) 2017 Pengutronix, Philipp Zabel <kernel@pengutronix.de>
+ * Copyright (C) 2017-2025 Pengutronix, Philipp Zabel <kernel@pengutronix.de>
  */
 
 #include <linux/bitops.h>
@@ -39,10 +39,83 @@ static const struct regmap_config mux_mmio_regmap_cfg = {
 	.reg_stride = 4,
 };
 
+static int reg_mux_get_controllers(const struct device_node *np, char *prop_name)
+{
+	int ret;
+
+	ret = of_property_count_u32_elems(np, prop_name);
+	if (ret == 0 || ret % 2)
+		ret = -EINVAL;
+
+	return ret;
+}
+
+static int reg_mux_get_controllers_extended(const struct device_node *np, char *prop_name)
+{
+	int ret;
+
+	ret = of_property_count_u32_elems(np, prop_name);
+	if (ret == 0 || ret % 3)
+		ret = -EINVAL;
+
+	return ret;
+}
+
+static int reg_mux_parse_dt(const struct device_node *np, bool *mux_reg_masks_state,
+			    int *num_fields)
+{
+	int ret;
+
+	if (of_property_present(np, "mux-reg-masks-state")) {
+		*mux_reg_masks_state = true;
+		ret = reg_mux_get_controllers_extended(np, "mux-reg-masks-state");
+		if (ret < 0)
+			return ret;
+		*num_fields = ret / 3;
+	} else {
+		ret = reg_mux_get_controllers(np, "mux-reg-masks");
+		if (ret < 0)
+			return ret;
+		*num_fields = ret / 2;
+	}
+	return ret;
+}
+
+static int mux_reg_set_parameters(const struct device_node *np, char *prop_name, u32 *reg,
+				  u32 *mask, int index)
+{
+	int ret;
+
+	ret = of_property_read_u32_index(np, prop_name, 2 * index, reg);
+	if (!ret)
+		ret = of_property_read_u32_index(np, prop_name, 2 * index + 1, mask);
+
+	return ret;
+}
+
+static int mux_reg_set_parameters_extended(const struct device_node *np, char *prop_name, u32 *reg,
+					   u32 *mask, u32 *state, int index)
+{
+	int ret;
+
+	ret = of_property_read_u32_index(np, prop_name, 3 * index, reg);
+	if (ret < 0)
+		return ret;
+
+	ret = of_property_read_u32_index(np, prop_name, 3 * index + 1, mask);
+	if (ret < 0)
+		return ret;
+
+	ret = of_property_read_u32_index(np, prop_name, 3 * index + 2, state);
+
+	return ret;
+}
+
 static int mux_mmio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
+	bool mux_reg_masks_state = false;
 	struct regmap_field **fields;
 	struct mux_chip *mux_chip;
 	struct regmap *regmap;
@@ -70,15 +143,16 @@ static int mux_mmio_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(regmap),
 				     "failed to get regmap\n");
 
-	ret = of_property_count_u32_elems(np, "mux-reg-masks");
-	if (ret == 0 || ret % 2)
-		ret = -EINVAL;
+	ret = reg_mux_parse_dt(np, &mux_reg_masks_state, &num_fields);
 	if (ret < 0) {
-		dev_err(dev, "mux-reg-masks property missing or invalid: %d\n",
-			ret);
+		if (mux_reg_masks_state)
+			dev_err(dev, "mux-reg-masks-state property missing or invalid: %d\n",
+				ret);
+		else
+			dev_err(dev, "mux-reg-masks property missing or invalid: %d\n",
+				ret);
 		return ret;
 	}
-	num_fields = ret / 2;
 
 	mux_chip = devm_mux_chip_alloc(dev, num_fields, num_fields *
 				       sizeof(*fields));
@@ -90,19 +164,25 @@ static int mux_mmio_probe(struct platform_device *pdev)
 	for (i = 0; i < num_fields; i++) {
 		struct mux_control *mux = &mux_chip->mux[i];
 		struct reg_field field;
-		s32 idle_state = MUX_IDLE_AS_IS;
+		s32 state, idle_state = MUX_IDLE_AS_IS;
 		u32 reg, mask;
 		int bits;
 
-		ret = of_property_read_u32_index(np, "mux-reg-masks",
-						 2 * i, &reg);
-		if (!ret)
-			ret = of_property_read_u32_index(np, "mux-reg-masks",
-							 2 * i + 1, &mask);
-		if (ret < 0) {
-			dev_err(dev, "bitfield %d: failed to read mux-reg-masks property: %d\n",
-				i, ret);
-			return ret;
+		if (!mux_reg_masks_state) {
+			ret = mux_reg_set_parameters(np, "mux-reg-masks", &reg, &mask, i);
+			if (ret < 0) {
+				dev_err(dev, "bitfield %d: failed to read mux-reg-masks property: %d\n",
+					i, ret);
+				return ret;
+			}
+		} else {
+			ret = mux_reg_set_parameters_extended(np, "mux-reg-masks-state", &reg,
+							      &mask, &state, i);
+			if (ret < 0) {
+				dev_err(dev, "bitfield %d: failed to read custom-states property: %d\n",
+					i, ret);
+				return ret;
+			}
 		}
 
 		field.reg = reg;
@@ -126,16 +206,28 @@ static int mux_mmio_probe(struct platform_device *pdev)
 		bits = 1 + field.msb - field.lsb;
 		mux->states = 1 << bits;
 
-		of_property_read_u32_index(np, "idle-states", i,
-					   (u32 *)&idle_state);
-		if (idle_state != MUX_IDLE_AS_IS) {
-			if (idle_state < 0 || idle_state >= mux->states) {
-				dev_err(dev, "bitfield: %d: out of range idle state %d\n",
-					i, idle_state);
-				return -EINVAL;
+		if (!mux_reg_masks_state) {
+			of_property_read_u32_index(np, "idle-states", i,
+						   (u32 *)&idle_state);
+			if (idle_state != MUX_IDLE_AS_IS) {
+				if (idle_state < 0 || idle_state >= mux->states) {
+					dev_err(dev, "bitfield: %d: out of range idle state %d\n",
+						i, idle_state);
+					return -EINVAL;
+				}
+
+				mux->idle_state = idle_state;
+			}
+		} else {
+			if (state != MUX_IDLE_AS_IS) {
+				if (state < 0 || state >= mux->states) {
+					dev_err(dev, "bitfield: %d: out of range idle state %d\n",
+						i, state);
+					return -EINVAL;
+				}
+
+				mux->idle_state = state;
 			}
-
-			mux->idle_state = idle_state;
 		}
 	}
 
-- 
2.34.1

