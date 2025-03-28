Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D450C1EF387
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195764; cv=none; b=WNi9zPdNvRsYKS4G6Xttws901OkDNvOnDXVv1BC5mV5BupIQYUyvz0wXuurZa0Iijr+UB0EIP67+e+XF9ukiir0Y/8TDcjzORD0khDLNj2X2WGxRzrPHRH/aLanIYhFZ40UODU2fcrxRWAlHWOcKABZrLW21C13jqY65ARCMwko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195764; c=relaxed/simple;
	bh=6FlCg2/7rbYUWEjOuL3AL98oCZf3VJwOCkyx0uJUr8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8c3HTYDVVRw2Fsqw3nzq37Jy0+4Z8dU/FbOGQlSzSRZKVEyCaIM7bmP9IyAJQ7NSWWEvS55oLOfFyJ7E9pr6H7TQZaEGptIHSVt4wBheA3yIbvD/AlMUsZBOiM/U0U7ickzOmWBFPArlEIvZRDDvJ43I41HXUQRYNk7b9QDuVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=dlQs8QIW; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="dlQs8QIW"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3cf8e017abcso9576865ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195762; x=1743800562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FIUpk1T7UnnKdNmxEWfla8NigtjlAU2jHuPthzllD9o=;
        b=dlQs8QIWWWwFZHQCnFSo7noCU+2KS7Vhhn688oQvogEOqtkD7DsU3bqLtjDDOq0N4A
         e2pdOlaJ1pnXrYvdt/RAFmWU4X+XT7iC25NrqzHccUXxFI0hSRSwsMD99Dhgr6QHx7Xg
         sjLTxfzNzpn0fKkKpbEAZxzhET4W2aOKrux8U0FYhXtHv6SgaGjdFIAetHNOqkoBsMr+
         ERVKi3MD4Qmdss8oAd4AP2bN05whuM1qRA5PzGC8U5F4nKUczraNvrAtlipF6GA6kyxg
         V1Exc1KlA/VsM8rB1sCfKR26c1Ob65Vum8PmbSZ7TbKOvEuPvT5n8a/1KBXtPcSplA8I
         QvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195762; x=1743800562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FIUpk1T7UnnKdNmxEWfla8NigtjlAU2jHuPthzllD9o=;
        b=hyrLHF2UCn2LFYTk3efE+IXH44vKrzBFnAjDp+9RemParrtUZsJdA9vsjvd/r8nNWA
         Fv36s2iJoB437uNmE4TM/Tbtz0lhKFFZXsk9dc2YNrr0mEZAlDi0KxOxFtuM8HHPFnOL
         eFVw9F3lPUS8cYuDAtCMCCPebEXpl4fkYEIddrOBmJCBGtOzHCfX7ZW4Xf+tbBB1NpOJ
         mVMbhBnlpKfqP0bxViso2d3B9CahfaJT0E6B3AvFZ0L6ApKvRKohrPRuxsdukv+fjW3C
         zi9LreANfpzAfDLlQ+Z4AXfJMp5kqf7hLZ/faCF6nWu25lSWu0QgYYvNhxg8TAkHFjzj
         QVCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIu0RMk5NTqbnRpm6OEOuXmSP8xhzXMSO5vCBmNg1OxW/ZbFXSbLS5LRBShhMEsgnZDHpcyIZo/kztgME=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzPBxrwsSjEScHLTSjdiQwbDwkPchkJzNTzP4f5zyfTux4Dzdd
	gi1ZNgr7rmYflKeKs2fKUxEF5lh/RVSL9OJtqUrHNusUSuDcxhKgOcSzjarfBXA=
X-Gm-Gg: ASbGncsbxIELBW0ywTHZHfNRNf3TXV2MPIg2rPxLIuAMAlrrI8K4TOFXFEVSQ6YWBmV
	StP4gGz4ffwYoZ8T608AEgl03Q2gpVwg3vkyEj4uM1mVVQFjf40F/whBxBxQa1LPgwLU7tm9vf8
	DhyIaYFw5wU5J3EjBi9YnA24hy5sY0DWgKQmHsO3AGI8N0OCXwAzO1beR+bL92j+p0fP5IyUfAr
	0HgmIdlej1CfZtlAmZw60ZsmMzhM3+ShQgB4FbrIGEUY9HBKZCfmAnQNVR8wXT6+nzIFxLmTbpk
	me4fkeNT9Zyajf7fCbHPbw//7CCfzw6U/Hi5ESrQv1skKjA+6lhVISCs6J1FzTkXl+1T4T4TRiY
	T44S8XdBHlBFvU3XAJHXo+04pV+KZ
X-Google-Smtp-Source: AGHT+IECKvdnGHV+2dD/S9BOB5FzsYtTtuEs5MGoEBeKOGx5i4Vk45Sjo1VplD8ywIkPbA8ikLjZxg==
X-Received: by 2002:a05:6e02:3d04:b0:3d0:4e2b:9bbb with SMTP id e9e14a558f8ab-3d5e0a0063cmr13188765ab.21.1743195761696;
        Fri, 28 Mar 2025 14:02:41 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:41 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
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
Subject: [PATCH v2 3/7] clk: spacemit: add reset controller support
Date: Fri, 28 Mar 2025 16:02:28 -0500
Message-ID: <20250328210233.1077035-4-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328210233.1077035-1-elder@riscstar.com>
References: <20250328210233.1077035-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define ccu_reset_data as a structure that contains the constant
register offset and bitmasks used to assert and deassert a reset
control on a SpacemiT K1 CCU. Define ccu_reset_controller_data as
a structure that contains the address of an array of those structures
and a count of the number of elements in the array.

Add a pointer to a ccu_reset_controller_data structure to the
spacemit_ccu_data structure.  Reset support is optional for
SpacemiT CCUs; the new pointer field will be null for CCUs
without any resets.

Finally, define a new ccu_reset_controller structure, which (for
a CCU with resets) contains a pointer to the constant reset data,
the regmap to be used for the controller, and an embedded a reset
controller structure.

Each reset control is asserted or deasserted by updating bits in
a register.  The bits used are defined by an assert mask and a
deassert mask.  In some cases, one (non-zero) mask asserts reset
and a different (non-zero) mask deasserts it.  Otherwise one mask
is nonzero, and the other is zero.  Either way, the bits in
both masks are cleared, then either the assert mask or the deassert
mask is set in a register to affect the state of a reset control.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Use regmap_update_bits() to safely update a register
    - Symbols are named RESET* and reset* rather than RST* and rst*
    - Reordered some assignments in the registration function
    - Allowed some longs to exceed 80 column width

 drivers/clk/spacemit/ccu-k1.c | 83 +++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 5cadb395a7dd6..9c7c7108cfe38 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -10,6 +10,7 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/reset-controller.h>
 
 #include "ccu_common.h"
 #include "ccu_pll.h"
@@ -134,8 +135,26 @@ struct spacemit_ccu_clk {
 	struct clk_hw *hw;
 };
 
+struct ccu_reset_data {
+	u32 offset;
+	u32 assert_mask;
+	u32 deassert_mask;
+};
+
+struct ccu_reset_controller_data {
+	u32 count;
+	const struct ccu_reset_data *data;	/* array */
+};
+
 struct spacemit_ccu_data {
 	struct spacemit_ccu_clk *clk;		/* array with sentinel */
+	const struct ccu_reset_controller_data *reset_data;
+};
+
+struct ccu_reset_controller {
+	struct regmap *regmap;
+	const struct ccu_reset_controller_data *data;
+	struct reset_controller_dev rcdev;
 };
 
 /*	APBS clocks start	*/
@@ -1630,6 +1649,39 @@ static const struct spacemit_ccu_data k1_ccu_apmu_data = {
 	.clk		= k1_ccu_apmu_clks,
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
+	data = &controller->data->data[id];
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
 				 struct regmap *regmap, struct regmap *lock_regmap,
 				 struct spacemit_ccu_clk *clks)
@@ -1675,6 +1727,33 @@ static int spacemit_ccu_register(struct device *dev,
 	return ret;
 }
 
+static int spacemit_reset_controller_register(struct device *dev,
+					      struct regmap *regmap,
+					      const struct ccu_reset_controller_data *data)
+{
+	struct ccu_reset_controller *controller;
+	struct reset_controller_dev *rcdev;
+
+	/* Resets are optional */
+	if (!data)
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
+	rcdev->nr_resets = data->count;
+
+	return devm_reset_controller_register(dev, rcdev);
+}
+
 static int k1_ccu_probe(struct platform_device *pdev)
 {
 	struct regmap *base_regmap, *lock_regmap = NULL;
@@ -1708,6 +1787,10 @@ static int k1_ccu_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = spacemit_reset_controller_register(dev, base_regmap, data->reset_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register reset controller\n");
+
 	return 0;
 }
 
-- 
2.45.2

