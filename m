Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3971D7989
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988053; cv=none; b=nY/zejj35IXrYiWlpwM+PqYjvC6VWIwVEL4kl5r9OBB1ub11n9aQ80qrJQtk2PNwuIzQBKUDir2/o3LMXCcpDNb824Uz1n3soiXNxzxJDwaI5Ds9L7iMznXbVaqIjXKlBlApeVGZR8JraPhnoKT1nXyM7pxXGK421wnU3UBbD2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988053; c=relaxed/simple;
	bh=LcM+0F3zugynCUcrEX7U/7HbeipG1GSteIItXQPdhjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a1FDd6f6BN9IAs7C0Q2AicpLVnJntxpdaJHIcnagXtmLc1J9k8K4ixrCI0tj46cdQtQrVPtuXfF58Tmw5wLd+S8JgSHz/o2F+/0mechwux1tP97Xb7TpXfnq1X014PEy2RCZdc88zhDM1FdluR8rN2D/Kr3qJVx3iT0N/LxY6dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Dzad+r+i; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Dzad+r+i"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476af5479feso20445811cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744988050; x=1745592850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaw5lt81qT1qo0WLXCCCbUzvwZO95HiGQh1l0h3tFD4=;
        b=Dzad+r+ihEY8oL0hhMMu/j0gpmvV4/9z84c9+WKOilLf4tXaC831eMjB4AdyDAF9Bf
         6ELsTCBm4jffPtFkY8yusTShbE8uyShLqY/m12zZ/tURkfn8+fUs2IqBfGMKS/A8ybcJ
         zX82dWUuXZ2yuV0jhl3ip/b2KEV39sdY+rM5FCoux/5hXiB0HroaEbnu62yAq/xYHC6L
         XCpuxWLxwyycggiWZUlvv3WTnAwpL0+/Do/2OGl3QAQcATv9pSb7Z+8Y4nXqxiv2peWb
         JVyPhbNr7W/WFzH9jUvzv+iJMpH+mkuh7l+8YZ885fXqN2QppgneKnhMX6JTwLVY/xXd
         plbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744988050; x=1745592850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yaw5lt81qT1qo0WLXCCCbUzvwZO95HiGQh1l0h3tFD4=;
        b=VbiuybNuRNnb/CyrOn8a7/oKXNrx3QV0YTYGKwCFP3/YBrBldlmTfj/Hk2TbChK/vA
         euA9apBgPUcBH3gwCNAoL6HDfqswKnRPGv0FzqwQVMgNpNxe9pCOUs1ePj9XU496vkE5
         dcE5kuoyTPxSFJCGsylhU0MxdW5HFabPsFjMorNVfG1kS/kpbNdEGD1yIoe+T54q34Kv
         yBJowNrzss1SBXqibZ21yAVx6ffYICvdm3/H2TVCeB/9gfyizVnWlxiCO/tDZwoOU1DF
         SMu3sAKdhjA461ZqzeDegpvChZnz+ssx7+tDhrgAg875yibOxnn8wQtufsfy61pQrWwK
         Wsjg==
X-Forwarded-Encrypted: i=1; AJvYcCVHTMEYkGr30Hph6ytGt1RF/uYAO3bn3p8ub36txzGRwfVkCMOOJJqIxr61qIsTQnKvVEj2W2zhgSHZ8nE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoPooyrASjEsfo++/MUquTlT7lJ8VOK9FyL0NlkkmmGPVkQXOj
	2ptidRPqoI2CmLh/WT/20/DkXay/cbnvFypjWiTstakPodGlPZUMmtyaW1Iqtdw=
X-Gm-Gg: ASbGncsDmBAdHju7t41sEJBTqwa7EXxqaCA+qna3Yxjvcup7qUwAtlWfRq3AxoBsK3i
	juT00aBebWnh/W9dKqT+C+gX42pUQdNebLDSZlRVte5s4ZJU97jA8uas9CriTlyQURr8uwfuhaF
	yADf2kGNavnNKozHxgLu2Wch/PLLDCBMgAkGASJtqtYVy8+46SIevQd6y7FT+aKWxxboVCxwk4F
	SBPf9IagEAVrf+uLt58A8N6f9ioXnwS0WC/LUKQvncK5f4TG8EX94cAM5lhN01UxPftP6C9FjKA
	Rsezdon5ZB9WGUzEu9ulWRsOHHrgJA8gln5jFZdASOYcvsYyuwbbAtQJURMy7WOyEn62FaR1sCx
	pmE4R2cM+CLPk/w==
X-Google-Smtp-Source: AGHT+IFvYy7PkzuSyv6/DahcPqSuURSVxow9I8GZ9PMmiSUagXcMHnpfEu6YrBdLJKJ9ltUJ181r5g==
X-Received: by 2002:ac8:57cf:0:b0:47a:e70c:e1ad with SMTP id d75a77b69052e-47aec399e28mr54297341cf.1.1744988050449;
        Fri, 18 Apr 2025 07:54:10 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c16ddesm11329201cf.3.2025.04.18.07.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:54:10 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/7] clk: spacemit: add reset controller support
Date: Fri, 18 Apr 2025 09:53:55 -0500
Message-ID: <20250418145401.2603648-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250418145401.2603648-1-elder@riscstar.com>
References: <20250418145401.2603648-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define ccu_reset_data as a structure that contains the constant
register offset and bitmasks used to assert and deassert a reset
control on a SpacemiT K1 CCU. Add a pointer to an array of those
structures to the spacemit_ccu_data structure, along with a field
indicating how many elements are in that array.  Resets will be
optional, and if none are defined the reset array pointer will be
null.

Define a new ccu_reset_controller structure, which (for a CCU with
resets) contains a pointer to the constant reset data, the regmap
to be used for the controller, and an embedded a reset controller
structure.

Each reset control is asserted or deasserted by updating bits in
a register.  The bits used are defined by an assert mask and a
deassert mask.  In some cases, one (non-zero) mask asserts reset
and a different (non-zero) mask deasserts it.  Otherwise one mask
is nonzero, and the other is zero.  Either way, the bits in
both masks are cleared, then either the assert mask or the deassert
mask is set in a register to affect the state of a reset control.

Signed-off-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/clk/spacemit/ccu-k1.c | 86 +++++++++++++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index a7712d1681a11..9152cce00ce90 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -11,6 +11,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/reset-controller.h>
 
 #include "ccu_common.h"
 #include "ccu_pll.h"
@@ -129,9 +130,23 @@
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
 #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
 
+struct ccu_reset_data {
+	u32 offset;
+	u32 assert_mask;
+	u32 deassert_mask;
+};
+
 struct spacemit_ccu_data {
-	struct clk_hw **clk_hws;
+	struct clk_hw **clk_hws;			/* array */
 	size_t clk_num;
+	const struct ccu_reset_data *reset_data;	/* array */
+	size_t reset_num;
+};
+
+struct ccu_reset_controller {
+	struct regmap *regmap;
+	const struct spacemit_ccu_data *data;
+	struct reset_controller_dev rcdev;
 };
 
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
@@ -1042,6 +1057,39 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.clk_num	= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
+static int spacemit_reset_update(struct reset_controller_dev *rcdev,
+				 unsigned long id, bool assert)
+{
+	struct ccu_reset_controller *controller;
+	const struct ccu_reset_data *data;
+	u32 mask;
+	u32 val;
+
+	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
+	data = &controller->data->reset_data[id];
+	mask = data->assert_mask | data->deassert_mask;
+	val = assert ? data->assert_mask : data->deassert_mask;
+
+	return regmap_update_bits(controller->regmap, data->offset, mask, val);
+}
+
+static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, true);
+}
+
+static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops spacemit_reset_control_ops = {
+	.assert		= spacemit_reset_assert,
+	.deassert	= spacemit_reset_deassert,
+};
+
 static int spacemit_ccu_register(struct device *dev,
 				 struct regmap *regmap,
 				 struct regmap *lock_regmap,
@@ -1090,9 +1138,37 @@ static int spacemit_ccu_register(struct device *dev,
 	return ret;
 }
 
+static int spacemit_reset_controller_register(struct device *dev,
+					      struct regmap *regmap,
+					      const struct spacemit_ccu_data *data)
+{
+	struct ccu_reset_controller *controller;
+	struct reset_controller_dev *rcdev;
+
+	/* Resets are optional */
+	if (!data->reset_data)
+		return 0;
+
+	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
+	if (!controller)
+		return -ENOMEM;
+
+	controller->regmap = regmap;
+	controller->data = data;
+
+	rcdev = &controller->rcdev;
+	rcdev->ops = &spacemit_reset_control_ops;
+	rcdev->owner = THIS_MODULE;
+	rcdev->of_node = dev->of_node;
+	rcdev->nr_resets = data->reset_num;
+
+	return devm_reset_controller_register(dev, rcdev);
+}
+
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
+	const struct spacemit_ccu_data *data;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -1121,11 +1197,15 @@ static int k1_ccu_probe(struct platform_device *pdev)
 					     "failed to get lock regmap\n");
 	}
 
-	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap,
-				    of_device_get_match_data(dev));
+	data = of_device_get_match_data(dev);
+	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = spacemit_reset_controller_register(dev, base_regmap, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register reset controller\n");
+
 	return 0;
 }
 
-- 
2.45.2

