Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E708F2E7162;
	Tue, 17 Jun 2025 13:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165533; cv=none; b=Hh+P0P1RMTAyPHmPa5zGHB9rU5Y+ysXdqTAkYcrggILQRH0LB3hcM/0jDiWeDuBUrZo/zNkpXqqum3YiZ7TxuYBU/QlJsCtdSvSDo2dx7Tc9l2DPbcoFBy3DDr/2UCGIFN5Dh273N4plTLo0ZOBapWNTh47/OKxOIBS3pLqss/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165533; c=relaxed/simple;
	bh=B4TAIx1rgtby/2jj9Cmd9C47XENkcNTF+AL2SWt1SPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pqsB1vNyP8x0SxdM3IWbz8StnXYXXk/+bpO4VPi1lr/oA8zrP/QPeL5LsFrAPfo2LzM5XaYWMQohHLMt36hhewttQVZEqHzx1DAVXvsaRPj+KNZAWgZRve29CHLBDvcluVLDNCNSxQqjgPiT0x8tS8E959iaZ8zk7gqZqKtDG8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHuNS8W/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHuNS8W/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4530921461aso49153405e9.0;
        Tue, 17 Jun 2025 06:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750165530; x=1750770330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aq5Ks3xEslMh8Hagg4n72soXuTvN4URS/wP99DLszNU=;
        b=PHuNS8W/qEsukeNsMX38y14saFqvT4Hg2Nj1G7CzPdzq6V8aKhd2rSRjNYv8JCvqCE
         xN+08+iFdQhjbKk/kwM+Agq4whV7YWQK18XcGd/wkJQ0vStQthkBSjdcUigAVdzooHrs
         dx3rlXMNJ9Rs1Gx62YdwCxqX8+mLfcn6hGO8FLEmUOOiWxnOdjEKr8TaxEzLnx66W+R1
         Qb6n+yKCrkOWedIbciUt0owaU0Wd3zNgviC9uMjdTa/NOadvl3BPR/rYqJ4z4c8q7H4L
         dwufvBulZomu81b0M3BUj9+cCNwHJdxMr7R8irIwkzF4ghwtj9/q5vPCpb3+Ne04YTR0
         UQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165530; x=1750770330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aq5Ks3xEslMh8Hagg4n72soXuTvN4URS/wP99DLszNU=;
        b=SzXWKsS55UuWDilCcHe4iA4C+uF58vm4YcRc8qwy27yGDw2AoxAUqLZeu8fgZCFB2/
         /dzfB+mm0w44Lha/1sQuZSB/8+Utk09YYvDPUbUoMoXorVJzcmc/AFbeY3a+7K1GUkYy
         50kyhh+wpoYArdc6ql+k+gQDFOF68X8Iysv5PvolR54X7u7beaUEjAjxu1kA8P1m0Pd1
         5HO8ZblT3PB5CzDLrrXejOPj6X5+pJf+7mxDhVsrDe535A6c7M4Gs7YIUvzvrcotL/pO
         O83FcNs0oMMngnzJ4dUBs2V9uI5L6Ow0Q1WMJGhA5v8xMsBDeQIxktk1ZWV/zo5svMap
         xfbA==
X-Forwarded-Encrypted: i=1; AJvYcCUgFvaP/vGKIRVDckWe7/HFdJc9W6zwVY6XIQxEbGa5LZGy1KKM0toto6h83ULIWA7jHqquNVj6EOhX@vger.kernel.org, AJvYcCW0jy3uUpu+xFa+seZ16KBFOhd+Wls7x5dFBbNrvUO5rytWjibdUkn64GKMA12Wvv0SzGVr05jqLGzELiud@vger.kernel.org, AJvYcCWf+CSYCj7iRTazfTIS4MSb8oldacO/5QRk67vg8pVD7oXrTRHS/8Pl/YVtpjqFbvAYJg2BZWtcZkmw@vger.kernel.org
X-Gm-Message-State: AOJu0YxSWFa4FbkO0phjzkm7EEkr1vMt/QxSF+3XFyc/S5VQd9RZazsH
	7sq60RcZEpYUJDweZFAU9C5LJDavaVbIXHU5nf6suZ8e4mUPIPcUHHf6
X-Gm-Gg: ASbGncspo7jZllSpYnXU5zPlLJBWbwNdoZXEGu1An9sQ5Va36+m6cf256OjJYuBVPvy
	Xg/aNnyGHeyDPRAzilhQXncqhNY013LOZVXS80uF74nkrHEXNJOTLoF01dnLipO1LbIpeQYwSqt
	rrPNNu1o5xVf8AlkpmoS0ZTVT6DtOdnk3IN3Gl2QCwpeTuA/UAUVMX6i92uHVBMZubRz5/9i2y4
	v7q5C0lNr7sQHZ7WowkSX5M7tI/gI3itn1cvsh9Dxtetb2qeJ7l8BQfzcByan5GqHcDbKE5iF9+
	tL9yJlOzjjza3qsCqQC2SzYx/5oK3NFXc4yXqX9kJbUtJ8oqMCNU4NazvhvIgCCjI+/BPIf64+k
	mVGp3mgzodzil/as1T09mkXC8gsTB0Fc=
X-Google-Smtp-Source: AGHT+IHOPoHl4dnz43VE9R0qm8Uw7FvXwcs0B63ZvI3BrL8qNv9iwrujw/oJUOlKUrBnPPKVihOgng==
X-Received: by 2002:a05:600c:528f:b0:450:d3b9:a5fc with SMTP id 5b1f17b1804b1-4533cab1b53mr111893425e9.27.1750165528466;
        Tue, 17 Jun 2025 06:05:28 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4532e24b0c8sm173809435e9.24.2025.06.17.06.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:05:28 -0700 (PDT)
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
Subject: [PATCH v2 03/10] clk: en7523: convert to full clk_hw implementation
Date: Tue, 17 Jun 2025 15:04:46 +0200
Message-ID: <20250617130455.32682-4-ansuelsmth@gmail.com>
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

In preparation for support of .set_rate, convert the clock register
logic from fixed clock implementation to full clk_hw implementation with
dedicated OPs.

This is just a rework and no behaviour change is expected.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 83 ++++++++++++++++++++++++++++------------
 1 file changed, 59 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index b040f0f0d727..10fb0dcdc88b 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -69,6 +69,12 @@ struct en_clk_gate {
 	struct clk_hw hw;
 };
 
+struct en_clk {
+	struct regmap *map;
+	const struct en_clk_desc *desc;
+	struct clk_hw hw;
+};
+
 struct en_rst_data {
 	const u16 *bank_ofs;
 	const u16 *idx_map;
@@ -471,44 +477,73 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	return &cg->hw;
 }
 
+static unsigned long en75xx_recalc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	struct en_clk *c = container_of(hw, struct en_clk, hw);
+	const struct en_clk_desc *desc = c->desc;
+	struct regmap *map = c->map;
+	u32 val, reg;
+	u32 rate;
+	int err;
+
+	err = regmap_read(map, desc->base_reg, &val);
+	if (err) {
+		pr_err("Failed reading fixed clk rate %s: %d\n",
+		       desc->name, err);
+		return err;
+	}
+	rate = en7523_get_base_rate(desc, val);
+
+	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+	err = regmap_read(map, reg, &val);
+	if (err) {
+		pr_err("Failed reading fixed clk div %s: %d\n",
+		       desc->name, err);
+		return err;
+	}
+
+	return rate / en7523_get_div(desc, val);
+}
+
+static const struct clk_ops en75xx_clk_ops = {
+	.recalc_rate = en75xx_recalc_rate,
+};
+
 static int en75xx_register_clocks(struct device *dev,
 				  const struct en_clk_soc_data *soc_data,
 				  struct clk_hw_onecell_data *clk_data,
 				  struct regmap *map, struct regmap *clk_map)
 {
 	struct clk_hw *hw;
-	u32 rate;
 	int i;
 
 	for (i = 0; i < soc_data->num_clocks - 1; i++) {
 		const struct en_clk_desc *desc = &soc_data->base_clks[i];
-		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+		struct clk_init_data init = {
+			.ops = &en75xx_clk_ops,
+		};
+		struct en_clk *en_clk;
 		int err;
 
-		err = regmap_read(map, desc->base_reg, &val);
-		if (err) {
-			pr_err("Failed reading fixed clk rate %s: %d\n",
-			       desc->name, err);
-			return err;
-		}
-		rate = en7523_get_base_rate(desc, val);
+		en_clk = devm_kzalloc(dev, sizeof(*en_clk), GFP_KERNEL);
+		if (!en_clk)
+			return -ENOMEM;
 
-		err = regmap_read(map, reg, &val);
+		init.name = desc->name;
+
+		en_clk->map = map;
+		en_clk->desc = desc;
+		en_clk->hw.init = &init;
+
+		err = devm_clk_hw_register(dev, &en_clk->hw);
 		if (err) {
-			pr_err("Failed reading fixed clk div %s: %d\n",
+			pr_err("Failed to register clk %s: %d\n",
 			       desc->name, err);
 			return err;
 		}
-		rate /= en7523_get_div(desc, val);
-
-		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
-		if (IS_ERR(hw)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       desc->name, PTR_ERR(hw));
-			return PTR_ERR(hw);
-		}
 
-		clk_data->hws[desc->id] = hw;
+		clk_data->hws[desc->id] = &en_clk->hw;
 	}
 
 	hw = en7523_register_pcie_clk(dev, clk_map);
@@ -672,7 +707,7 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 {
 	struct regmap *map, *clk_map;
 	void __iomem *base;
-	int ret;
+	int err;
 
 	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
 	if (IS_ERR(map))
@@ -686,9 +721,9 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	if (IS_ERR(clk_map))
 		return PTR_ERR(clk_map);
 
-	ret = en75xx_register_clocks(&pdev->dev, soc_data, clk_data, map, clk_map);
-	if (ret)
-		return ret;
+	err = en75xx_register_clocks(&pdev->dev, soc_data, clk_data, map, clk_map);
+	if (err)
+		return err;
 
 	regmap_clear_bits(clk_map, REG_NP_SCU_SSTR,
 			  REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
-- 
2.48.1

