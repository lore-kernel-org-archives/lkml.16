Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B535D2E973A;
	Tue, 17 Jun 2025 13:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165535; cv=none; b=adDSqWKIH7yeaBuyLnTTSQsnhB0sdO6R/dJQRy8ZmmbaU2bwTXnpAGrAfx0+NCcikRgrIMA+9RG7unVTIXy9S2IGOoRjzLzZYAnfIO17k89Td5PWnYrk2WS6zcjCOW74SerU9/W9xf2WcZnhZDfz5l2IuWp1lv+6X3vlBOk87Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165535; c=relaxed/simple;
	bh=O2wcZfEghBL4o0hs351DQn+d1BMaIjzNvULr3vmMvbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KHES/0HZRM+OxQpr54340svDf0tqgrDVBp4uG7622ieqN0wS0/U4iP+0RpHHsIx8GBbhhFz6Ijt7HRUmiEiODnVXLngaqJqBozLRj2TCb5QIshnq5Bc507+xTaSWmChkWTa1Gb7LjRAbYQX1LcGqJ14EBJ38YxhIgsAi0E2kXX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkNpCsZ7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkNpCsZ7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so70827465e9.1;
        Tue, 17 Jun 2025 06:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165532; x=1750770332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6n6KBuEMwScCfdTc5bm4Wfj5mczAlbliacsP6nODpNs=;
        b=fkNpCsZ79/TnsAsw45wCe4MjaSzbswOk3SKj7z+nPv7o1pUZt8G0nTBdOMXfEyYOgC
         KoNi94xLtXxUHRCPz7Fc6XcLimHZiE8bV+dcGQlJHvllA7WJlKZJJB6fJEWBHZ3NWb2d
         lxnXHD5rCLd83w0JH4pq+sqVpmdDieAhs2TzxSRnYgQrhrcAwwmCH1GZjfGXLjTY8t5w
         O99yCULxxmUXISl+q3BlQC07tAHeELCovKu1I2s8f+AheGz+xSw5hMtRyF9TERe65QFE
         XjyYN4uzUtPlezf9w9IB1aGdCFXpANChQR/g9H9r7A/7QicfNEkMjpyfCpgMSGYdu5Rp
         FAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165532; x=1750770332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6n6KBuEMwScCfdTc5bm4Wfj5mczAlbliacsP6nODpNs=;
        b=d+7EYjAi8XF7IjYeF5VBiI9xkh9G7RBr2pvf4oscrr4hyPHr6d78YSQ504GwiIYm8h
         yjV5FJiYjJnM6bsvwJq7OZIC/Xb/eW7IYg9mA2Jsef+B+DbIU6VjgsEKz53IyCWO5lCl
         WF1edkunj2HAYOrg11GgOv85iLGQzdTfCccLPENjSxySD/wRHTjJ2b9Z4pwPrIIrGMlP
         KHeRGTkkUL3Ev0KuVIm9dIbAm0Zn7BEdgwq0oVct3b91vlbtRA5DyHjSwpOepeM519z4
         n4rYvCkHNqWt//WCHwa6VcNybIzxyYlT/+82wk9AZljasfx+ykWUPMz/0+Tsut2EFjOy
         rtgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW14+X7elMWlRntsC1g7IyeMz5KAD6r73ujC8B6F+bWqTlAxwHTEotjEYMcYWbzxIh7DdPiLSejI0cJ@vger.kernel.org, AJvYcCWneOJkPmr1O9wNp5tXkTnI1U6sqqSLR+3WD4BFvmU9RAVsgC7ye3T5mEp9o3zpfSB6eBlLGDrBmAB2tBKU@vger.kernel.org, AJvYcCXQ8zua8s0MQlJ+KoqGyDj4bGiddZWWA6dePHCYWISim8AlVQJ6OdxaVLIR++SSY7dz1BCj6CGsnZRL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxf7TtBOiFwxSWotp420jApOuNOSGNAoail3Vhab+9pCJyEKqL
	DLcA5Kh+hVkEU8w32MTRPTeyejU+qiWLWhSDpjoiuS0yFj8Rk7Wnzi1XKA/Rcw==
X-Gm-Gg: ASbGncvVPNHU5TKM4zA6XyBLdnKAZ60bNOcX8zQJs94lXzDtbSVue45a5VHSOj8fYAL
	UWNp3N2IG5G56EMU8NZbO9inlqOJv2CBzYkhtjCKPfiU7Dj5biE8trc00G+ATY5lla213LBS4zP
	to6UzPwO8osRAaGGGwxq/3I35luEsuAniWMUck6LJGWPUQ9Mm1K/ksB4TZCSTbEcwR3cW5fuX3f
	SLGoDf3mZx+ECikUIGZZ63+vOrh1pG1k+qwmGtXjuZc+dBNKIVifd32GH9VVXTuk5cEAVSjIAEP
	wTH0Hg6YNpBo0v2YXewTnd2MyunOsk34npVGCbY9ksfUGgbFvAoCguzc4KKxjzAqz9TfCJcqxbG
	KjUaItXkPJdBxnXJtSHvLG5zXBkHuDjY=
X-Google-Smtp-Source: AGHT+IEMQvWMlCfJyefCK7DPf6UlJlVMBkYQR3jgRfaXXu+WEw+jdmMda2UeQQQ4jppqU3msd5ChAw==
X-Received: by 2002:a05:600c:3ba6:b0:450:d012:df7a with SMTP id 5b1f17b1804b1-4533cab857cmr107301975e9.28.1750165530133;
        Tue, 17 Jun 2025 06:05:30 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4532e24b0c8sm173809435e9.24.2025.06.17.06.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:05:29 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 04/10] clk: en7523: add support for .set_rate
Date: Tue, 17 Jun 2025 15:04:47 +0200
Message-ID: <20250617130455.32682-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250617130455.32682-1-ansuelsmth@gmail.com>
References: <20250617130455.32682-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for EN7523 driver to configure rate. The SoC expose both
base clock selector and clock divisor hence it's possible to change the
rate.

This will be especially needed for new SoC AN7583 that require changes
for the MDIO and the eMMC.

The clock were assumed correctly configured by the bootloader but this
goes against the rule of "kernel should not depend on external
configuration".

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 141 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 10fb0dcdc88b..54c0462c0dee 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -506,8 +506,149 @@ static unsigned long en75xx_recalc_rate(struct clk_hw *hw,
 	return rate / en7523_get_div(desc, val);
 }
 
+static int en75xx_get_base_val_for_rate(const struct en_clk_desc *desc,
+					int div, unsigned long rate)
+{
+	int i;
+
+	/* Single base rate */
+	if (!desc->base_bits) {
+		if (rate != desc->base_value / div)
+			goto err;
+
+		return 0;
+	}
+
+	/* Check every base rate with provided divisor */
+	for (i = 0; i < desc->n_base_values; i++)
+		if (rate == desc->base_values[i] / div)
+			return i;
+
+err:
+	return -EINVAL;
+}
+
+static int en75xx_get_vals_for_rate(const struct en_clk_desc *desc,
+				    unsigned long rate,
+				    u32 *base_val, u32 *div_val)
+{
+	int tmp_base_val = 0;
+	int tmp_div_val = 0;
+
+	if (!desc->base_bits && !desc->div_bits)
+		return -EINVAL;
+
+	/* Divisor not supported, just search in base rate */
+	if (!desc->div_bits) {
+		tmp_base_val = en75xx_get_base_val_for_rate(desc, 1, rate);
+		if (tmp_base_val < 0) {
+			pr_err("Invalid rate for clock %s\n",
+			       desc->name);
+			return -EINVAL;
+		}
+
+		goto exit;
+	}
+
+	/* Check if div0 satisfy the request */
+	if (desc->div_val0) {
+		tmp_base_val = en75xx_get_base_val_for_rate(desc,
+							    desc->div_val0,
+							    rate);
+		if (tmp_base_val >= 0)
+			goto exit;
+
+		/* Skip checking first divisor val */
+		tmp_div_val = 1;
+	}
+
+	/* Simulate rate with every divisor supported */
+	for (; tmp_div_val < BIT(desc->div_bits) - 1; tmp_div_val++) {
+		int div = (tmp_div_val + desc->div_offset) * desc->div_step;
+
+		tmp_base_val = en75xx_get_base_val_for_rate(desc, div,
+							    rate);
+		if (tmp_base_val >= 0)
+			goto exit;
+	}
+
+	if (tmp_div_val == BIT(desc->div_bits) - 1) {
+		pr_err("Invalid rate for clock %s\n",
+		       desc->name);
+		return -EINVAL;
+	}
+
+exit:
+	*base_val = tmp_base_val;
+	*div_val = tmp_div_val;
+
+	return 0;
+}
+
+static long en75xx_round_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long *parent_rate)
+{
+	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
+	u32 div_val, base_val;
+	int err;
+
+	/* Just check if the rate is possible */
+	err = en75xx_get_vals_for_rate(en_clk->desc, rate,
+				       &base_val, &div_val);
+	if (err)
+		return err;
+
+	return rate;
+}
+
+static int en75xx_set_rate(struct clk_hw *hw, unsigned long rate,
+			   unsigned long parent_rate)
+{
+	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = en_clk->desc;
+	struct regmap *map = en_clk->map;
+	u32 base_val, div_val;
+	u32 reg, val, mask;
+	int err;
+
+	err = en75xx_get_vals_for_rate(en_clk->desc, rate,
+				       &base_val, &div_val);
+	if (err)
+		return err;
+
+	if (desc->div_bits) {
+		reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+
+		mask = (BIT(desc->div_bits) - 1) << desc->div_shift;
+		val = div_val << desc->div_shift;
+
+		err = regmap_update_bits(map, reg, mask, val);
+		if (err) {
+			pr_err("Failed to update div reg for clock %s\n",
+			       desc->name);
+			return -EINVAL;
+		}
+	}
+
+	if (desc->base_bits) {
+		mask = (BIT(desc->base_bits) - 1) << desc->base_shift;
+		val = base_val << desc->base_shift;
+
+		err = regmap_update_bits(map, desc->base_reg, mask, val);
+		if (err) {
+			pr_err("Failed to update reg for clock %s\n",
+			       desc->name);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 static const struct clk_ops en75xx_clk_ops = {
 	.recalc_rate = en75xx_recalc_rate,
+	.round_rate = en75xx_round_rate,
+	.set_rate = en75xx_set_rate,
 };
 
 static int en75xx_register_clocks(struct device *dev,
-- 
2.48.1

