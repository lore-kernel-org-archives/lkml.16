Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63162E7BAF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470057; cv=none; b=siz1XLwoFUtyOWOK2XdBYNIejTC5p4U/fERNX50cPIFeKoErgybEDXWqvib207Tgkq8ci/DO9UBfS6hpxr587xaVZ5PLIAi281v0wLl5ETpKB9r1c4c957h9XILhan7FjUTGX3RlFD0gLuXPfqoHKx4HLaSiWkENNjS2ZqxT9qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470057; c=relaxed/simple;
	bh=ey5cZdSnxDBMQWblcJDibJDA5OZgFBnUd6WG9uhMGLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=liIt79P06Q2IywtLNd0AGrRXNlwHGvfaDtS2AbKvebZcyFC55E2prJjPq0oWLpmOT7cSc1d64zbUtmKLukUVPto+LzU/mrNRbjto0Tl1HO3qeNkekwOAzmZiVeNLCKiP2ujZoJPs1tkLybYCEV1SwDXCDds4a9Y5rQeAjAUe7gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GUhqmKxU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GUhqmKxU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453066fad06so47757865e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470052; x=1752074852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKeGjfnHALhz/AAzO7aZ77kwy1JfZMTwKgyrIVs7M5M=;
        b=GUhqmKxU1w9uZWZfd/SXF2ItorgMj68BnPiCRDhNm/igFStitFFtLJcTKQpLLs/6XI
         khoWsGXkid3ZbmRp+7sjvL1owemVVX7MvfV3296EZEHi5ceKolBg4MAdhsIBoKE6qTyc
         G17nYQo9k0zqL7x43WbjM4tNShMBO9Edh2z0cl7L1q1OdrUUDqVHnrh9WcNFMfenSb2n
         eHcTVzAgVHw1V1TgVx8ZVA4iWrwqujPPAsOoHzd3tg9wLCCJT4v1qUPwrW+S1ilvcaJL
         Tf2EGbGnshPfCwS7NQjt/qffYhGozRoFA5d52dVSkK2XjKKCOpbSQf57pWqAZlVDlVCj
         CJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470052; x=1752074852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKeGjfnHALhz/AAzO7aZ77kwy1JfZMTwKgyrIVs7M5M=;
        b=sG+2juc4HOpO2qHYSP+MyiQ/lk4HfUjcsKQTtD2pV2UR9pMHVW3WTM03eQwUNcsNKH
         egRAXp2wawN4+JqHF1OqxcGghNzgOSNrIu84ZefcPcsz/cuvDjjC5lJddP1TWi4NLAqf
         4Uw/lqKDO5QcAGT/9iixjYi199Tmv7ARGoKF8QvstHnKfmCDcxvmSSP29lh6qS1/N0J7
         6dVS4oIk2BumR0K36fU7VAvR8D/kI1p/WGUllc5NLVFqFzRy3AYdqqjiHMNR5oX3qYp3
         sqeh7qoezHr3Zil+z/IedTbXGRGPwGRSTn2XIkcSx8L8pn5l8qRiPoL3PhBRfpuBh/Ns
         nJEw==
X-Forwarded-Encrypted: i=1; AJvYcCUEEs2Ck36vNHFOWE9LxsynCYLGeO0q2DLtmHzSStVoZKsz74ZoazTxgW5zKc2c5PdW8PMr4Co9xVGDJ3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTa+eooh+f0j4YyqLKvx6RzO8kCt1mjF++CA5lKMLTMRKuoO6H
	iNYFiB65tXaUbgvAw2U+N4wG4uWP2KB05MlX/YvvexlW+weSe8cXtRkg4sNX1p39DRo=
X-Gm-Gg: ASbGncvNvEZ5b7pbfMtv2Q45tpm+AE3DjrYO/RDmtoNtvXRclDgw5rDtUEY0Sjck3VY
	0atc23NS2/d/G9tLYXyq1bBFF4cI67BSHGsNfyR3Lxaq/7u8RUYh7bVi5YVldy1VUDhc0NkvCb6
	PlVjQYwAPWFgR692PMWswbZIWoovothGa4OvwoDE9RiCdR+f/BWlIkPAFILNu91U4hN0iM4w5ab
	bbtGzdqao+bzNsRYUZFGN/KoPkBiQnxpMkFrKVmX4zwIdmU2Ix5yRdKoKCW62kCM1N2w1juYWgj
	OjgjhB6n/DDQH/ZNegOfu7xS3vAad+SPlQ7D2xcKvla7z5SqagW9vT6vKh0LHn1Iq66OmOdYmS5
	M
X-Google-Smtp-Source: AGHT+IH8hCqw18xeYgyrSLAW0jVJ9qYOZglL9NBSV9/Ltql+Tf5mL1mq95DJrcwm8e69G8PvxlB8Vw==
X-Received: by 2002:a05:6000:481c:b0:3a4:e6bb:2d32 with SMTP id ffacd0b85a97d-3b1fe8a1292mr3034063f8f.22.1751470051649;
        Wed, 02 Jul 2025 08:27:31 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:16 +0200
Subject: [PATCH 18/26] clk: amlogic: aoclk: use clkc-utils syscon probe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-meson-clk-cleanup-24-v1-18-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5340; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ey5cZdSnxDBMQWblcJDibJDA5OZgFBnUd6WG9uhMGLo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/HhEXl1lNR+pJBqEROld+MDLL5evc868w0r
 AD46aejqJSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPxwAKCRDm/A8cN/La
 hV5TEACPFJ4/iWlXHkdmmbj0q3HTAxSfjEvUJ7n4JdO21V0AE32LTj3tfjqnYQvAU7ol9i8zvHl
 vKfTTY/569cOePeObq8lyuDNt+XOD0ZWwJ+gDJRGcVSoQHmARWeBuTByymecueefpPlJjNadq0d
 TStzOMn7+exOordbByBr1QiC6DzI+t20tZUDfIRh3ze7kUYevNqR5O9aWFi1Li/1P662KM6sKzN
 5K27uoeSMrNMVOStiFPwi5KRih8cp8cfqT1+uqIKlmjbB+7/72rgFjrCJCMFpogjVyNAbLLOIzG
 wuZ9hvGjAsrikJB3O/XFqANmJJXRqMjwBwUus+hg1oCtXAjDNienpR1TrTTutlbo9qVBwRSu3O1
 fpwFDfVIaVwJGVy3mq/ahV2CzM46aAtPiqg7aijDoGIBgXuUmPdwmTHaOL6cdqg52UHG5Pc8nPD
 /K6jFwbuJnnftmbRvn5o6bIYlkHRi60QjU0JNOzpT7Tlv4S2j2M4xTZpiGGs7fdbnhJtu1XQW0R
 PJAoMTdy6IG57tbOJ0GpmkPeiEvWRCc9IeYfC1tKamdJD6bTADWID3X8e725AwnQKPain6W4vTO
 FHhSgTYs/lY5htJmHFsAsznTs1Kw4R9e3n7SQC4vqDcqTroe2aHJCSGw8o0QzxVPuHAcxyUxfIc
 7tB0Kof9AA+8qcg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The clock related part of aoclk probe function duplicates what
the clkc-utils syscon helper does. Factorize this to have a single path to
maintain.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-aoclk.c   | 10 ++++++----
 drivers/clk/meson/g12a-aoclk.c  | 10 ++++++----
 drivers/clk/meson/gxbb-aoclk.c  | 10 ++++++----
 drivers/clk/meson/meson-aoclk.c | 32 ++++++++++++++------------------
 drivers/clk/meson/meson-aoclk.h |  2 +-
 5 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index a0c58dc8e950a05c340c3427af4f6ff7661fa84e..efc33fd18c197df233d537e5f8244a376d4d0924 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -300,16 +300,18 @@ static const struct meson_aoclk_data axg_ao_clkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
 	.num_reset	= ARRAY_SIZE(axg_ao_reset),
 	.reset		= axg_ao_reset,
-	.hw_clks	= {
-		.hws	= axg_ao_hw_clks,
-		.num	= ARRAY_SIZE(axg_ao_hw_clks),
+	.clkc_data	= {
+		.hw_clks = {
+			.hws	= axg_ao_hw_clks,
+			.num	= ARRAY_SIZE(axg_ao_hw_clks),
+		},
 	},
 };
 
 static const struct of_device_id axg_ao_clkc_match_table[] = {
 	{
 		.compatible	= "amlogic,meson-axg-aoclkc",
-		.data		= &axg_ao_clkc_data,
+		.data		= &axg_ao_clkc_data.clkc_data,
 	},
 	{ }
 };
diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
index 3eaf1db16f45a0adf0acd901ed7ae1f51a9c8dc1..872a7b800bb86bdf1ead56c3eec7e47f30637dbd 100644
--- a/drivers/clk/meson/g12a-aoclk.c
+++ b/drivers/clk/meson/g12a-aoclk.c
@@ -424,16 +424,18 @@ static const struct meson_aoclk_data g12a_ao_clkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
 	.num_reset	= ARRAY_SIZE(g12a_ao_reset),
 	.reset		= g12a_ao_reset,
-	.hw_clks	= {
-		.hws	= g12a_ao_hw_clks,
-		.num	= ARRAY_SIZE(g12a_ao_hw_clks),
+	.clkc_data = {
+		.hw_clks = {
+			.hws	= g12a_ao_hw_clks,
+			.num	= ARRAY_SIZE(g12a_ao_hw_clks),
+		},
 	},
 };
 
 static const struct of_device_id g12a_ao_clkc_match_table[] = {
 	{
 		.compatible	= "amlogic,meson-g12a-aoclkc",
-		.data		= &g12a_ao_clkc_data,
+		.data		= &g12a_ao_clkc_data.clkc_data,
 	},
 	{ }
 };
diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index 11b11fa7791eb1903938c0d3ee46121a23b94a46..ce8d2e9e071759ab8b8aa8619ad7400f1513c319 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -258,16 +258,18 @@ static const struct meson_aoclk_data gxbb_ao_clkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
 	.num_reset	= ARRAY_SIZE(gxbb_ao_reset),
 	.reset		= gxbb_ao_reset,
-	.hw_clks	= {
-		.hws	= gxbb_ao_hw_clks,
-		.num	= ARRAY_SIZE(gxbb_ao_hw_clks),
+	.clkc_data	= {
+		.hw_clks = {
+			.hws	= gxbb_ao_hw_clks,
+			.num	= ARRAY_SIZE(gxbb_ao_hw_clks),
+		},
 	},
 };
 
 static const struct of_device_id gxbb_ao_clkc_match_table[] = {
 	{
 		.compatible	= "amlogic,meson-gx-aoclkc",
-		.data		= &gxbb_ao_clkc_data,
+		.data		= &gxbb_ao_clkc_data.clkc_data,
 	},
 	{ }
 };
diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index 894c02fda072ddd0733165d5f60efe1d0da2388d..8f6bdea181197cc647398bd607d8b004ac81f747 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -37,15 +37,23 @@ static const struct reset_control_ops meson_aoclk_reset_ops = {
 int meson_aoclkc_probe(struct platform_device *pdev)
 {
 	struct meson_aoclk_reset_controller *rstc;
-	struct meson_aoclk_data *data;
+	const struct meson_clkc_data *clkc_data;
+	const struct meson_aoclk_data *data;
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
 	struct regmap *regmap;
-	int ret, clkid;
+	int ret;
 
-	data = (struct meson_aoclk_data *) of_device_get_match_data(dev);
-	if (!data)
-		return -ENODEV;
+	clkc_data = of_device_get_match_data(dev);
+	if (!clkc_data)
+		return -EINVAL;
+
+	ret = meson_clkc_syscon_probe(pdev);
+	if (ret)
+		return ret;
+
+	data = container_of(clkc_data, struct meson_aoclk_data,
+			    clkc_data);
 
 	rstc = devm_kzalloc(dev, sizeof(*rstc), GFP_KERNEL);
 	if (!rstc)
@@ -71,19 +79,7 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Register all clks */
-	for (clkid = 0; clkid < data->hw_clks.num; clkid++) {
-		if (!data->hw_clks.hws[clkid])
-			continue;
-
-		ret = devm_clk_hw_register(dev, data->hw_clks.hws[clkid]);
-		if (ret) {
-			dev_err(dev, "Clock registration failed\n");
-			return ret;
-		}
-	}
-
-	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(meson_aoclkc_probe, "CLK_MESON");
 
diff --git a/drivers/clk/meson/meson-aoclk.h b/drivers/clk/meson/meson-aoclk.h
index ea5fc61308af14c63489b7c72410d9d981d8745b..2c83e73d3a7753c2094d2acc7c75b524edb5bb9e 100644
--- a/drivers/clk/meson/meson-aoclk.h
+++ b/drivers/clk/meson/meson-aoclk.h
@@ -20,10 +20,10 @@
 #include "meson-clkc-utils.h"
 
 struct meson_aoclk_data {
+	const struct meson_clkc_data		clkc_data;
 	const unsigned int			reset_reg;
 	const int				num_reset;
 	const unsigned int			*reset;
-	struct meson_clk_hw_data		hw_clks;
 };
 
 struct meson_aoclk_reset_controller {

-- 
2.47.2

