Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA4E24E01B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897480; cv=none; b=EbdBl8Au0iTpModMBTm1ELMMGRLhmL7XpAvwh/Z2t9AVze3gVCNEsSyC/VEVXTkuyzNd6VXD5NFoAJw5EdN1NMgSjbPv1+HWwEi5vggOxPsxPBARk9Uua+oGdD0S7D4AKSjZxPuR1eBdFLyhsPF0yBXMC1flifFo+flGNtqg6xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897480; c=relaxed/simple;
	bh=bcoaky/HTFP4ksRtpG6D1VnRxj/D8LQuMTnAPldjPDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hV0oA+Y8uOf07xliGy/va+Ny2cWu3zYVF/TRrQ624r7qtTKZQJswQ2k48Wshn3cswFz54qxryRL91zKzYz21mJVREccHb+ZZB4zeHoVJpqPemN6ND4ukK9OG6JR62Hf6Lai7Gsjkb7LLfI22F3S6FYZTnhU6GV1jQI2yfvhcmoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=R/PF0h/k; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="R/PF0h/k"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1001581f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744897476; x=1745502276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6KNxmkmKvGGHIR3RSugxIYVnEcO8QhyFFMZjWRyqRU=;
        b=R/PF0h/kC7BPo3qjLxJJsopurMDWBr7Od/27kAwMKVdvERln2FsmraT9HizTQO9yL8
         +1FUL/YQv3gCLt6y8uJlKNJXi7MyKLastMCM5aoAQe1bfc/vW1TJo6JM5nZBf+t25j+j
         vZxbX/n3ZtXcMKVj62Awz5Qsp6BK/4HhvdnbKiN0VoN6ucEw0ACcqd/MWVZlxTdGBz0U
         MKvpzHvVj7gcV46TFarU2qvEckrbAjDExhd9Pi62iXsMWGnJQHojNmBPUusL3ds2VmR/
         3TLo8g++V2z94W/hLisuQN0KjoTUaL5jjF17jfRFYoSkXkq0s6zsjjAKKg2i+qUEvig3
         yYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744897476; x=1745502276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6KNxmkmKvGGHIR3RSugxIYVnEcO8QhyFFMZjWRyqRU=;
        b=ijgAINRbmHANxWSvVwo8FMFQouT5kBLlpX9s/6FrKfVlQm43KiS4k7/P21QZto7+yQ
         dI0MpS6t7bgLRWPXYwkKxglQAcaw6r+fJmYU5QCr67rDIzLFJ8ZAakTr5WUnc89cubK+
         qLlYK4ukPH6FMksJ2lt+azbof+13GXcDeMfY51GvRiIikqz90IrBuaFxtDXFrKOuY/cg
         ZAvCt+03QWGDKFPoqoG2n2puNVDiwHdoUv6AGr49luyq9jYltur5QJo+Mk+3o4dv0uAF
         SdMsvkSQxPqw2RUDveC0NAQeUVRj8+if0yh08Qd73eUQ2E2Uk0wr4afM6fRLj+9dXNEp
         EzdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqn4dbi1XNKDdDu9/Eae8MgqlGY0vq1is0r5PaOgI7qBAw1MNSdWnnksCNtdG3IOQNGH6MMOsIcrpRvDo=@vger.kernel.org
X-Gm-Message-State: AOJu0YySCmmdIG1XJpvSB0SjcZMUIbOBWi69CxWrX1QAT1YlHvkoBOR6
	ndrCmp2w7HbVCFeTMzXo8jwbcFASgQ3fXdNnK6OdVFH2zxgyuGPNg6O2Kq4zRAQ=
X-Gm-Gg: ASbGnct6ozDXsvlEX5zfHlOLEcOWTfF2CRTdN6xmWDaD4/btKqqFGyyUi7KSm01oGRR
	1x6Dho4ixeUUqlQ8gMpPUpiibqLBxpdywL1CoC3OeLK+3eFJRsMZksWA3NWoi6Bt5K7SxxQnuxR
	NuqNMMO2VB2e9E1Q73RpnlP779C9YHVWb9hfLquoy+AxEF7UUEWHaadsFpoTrxaNylBamGLae9X
	TsvsCf+bJ4+1uIvMljbObkEPulYEWngHqfVIgTFMX/1j3veXKTZDb0wW+xWX2Onl8eadSEHQ0hC
	HKH1HpmFdADHf4onInQv2hFXF7Xs5oQslHVXd07denRbFM5ohxcez90=
X-Google-Smtp-Source: AGHT+IG8leHzZDDAqD6wl7UGZlqgN7XxHjcUdFJR9ahS8Ild8oGEO2LO4TM21ZJhD12iJZeGcJIZfA==
X-Received: by 2002:a05:6000:420b:b0:39c:1efc:1c1c with SMTP id ffacd0b85a97d-39ee5b1c966mr5127991f8f.34.1744897475770;
        Thu, 17 Apr 2025 06:44:35 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:2167:2c91:1c64:6619])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4405b4f3227sm54667495e9.20.2025.04.17.06.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 06:44:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 17 Apr 2025 15:44:23 +0200
Subject: [PATCH 2/2] clk: tests: add clk_hw_get_dev() and
 clk_hw_get_of_node() tests
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-clk-hw-get-helpers-v1-2-7743e509612a@baylibre.com>
References: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
In-Reply-To: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11247; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=bcoaky/HTFP4ksRtpG6D1VnRxj/D8LQuMTnAPldjPDg=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoAQXAjsx/8+Oq66qO78gkYXxLjvbFof+fuaR60
 tto2jCAA4+JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaAEFwAAKCRDm/A8cN/La
 hd07D/44sehEmyR0qcKydYPy2eLfavRZmL67HuiIxuPP0vz8alhfEGTIvj7nkvISG2Bix3AMjhP
 n1XFpryjoITp91F45clrhXwaodI42VLIFxl6r2UFyC3T+gKBNyq5BRjrVwUsSXDVcCb/3G91BxZ
 9CK5eUit+JEpCnloow9lAKIyz3vmeTc/TKL6xru87KyykB99ezdqCpajrTm378C9bmO9rQ5q2Ps
 ickenafVfMsDdlWnxSMz/qLdgPNr5gjkN96JjQQHUxcyp+6MPvvtBQY7TjbDW/t/KDBeRmgiG5n
 X2YUhstTYNMCboYdsgeIx7L/BUw5Ca88zgGlP6GAAgMbXrlYzUnsqh9nVpMYu538ryYOVkRIzoa
 nSh08elkE7Tv98/20HyqXOB90erSp2My4aYKpksjehk4wzVbAEKLe6d6wM23ccKrZ47GE+oppCx
 HDbU8idWMwvZSMAOFrYKoHYYJhrD7nYGeTqHzsT/8ssXmhBU9ThvqwfwqdXccwwV9SQxNUxLWSC
 yrtPPN0RpPFHSg7uEW1ABZQx3vq6sFgLuyCUstSzqs3Sv4Jkt29BoDxu6P+JMLQjj3fsHpMnd3S
 ReDlfNekWWXVA7rsKehVMyRhsBK4k8Xf8kpp5QMESCx2by+pDdD3Ie7nQQgNbci6Sd2WcWE08MY
 i9s3dxP3/hWxUMw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add kunit test suites clk_hw_get_dev() and clk_hw_get_of_node()
for clocks registered with clk_hw_register() and of_clk_hw_register()

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk_test.c                        | 215 ++++++++++++++++++++++++--
 drivers/clk/kunit_clk_hw_get_dev_of_node.dtso |  10 ++
 3 files changed, 209 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index bf4bd45adc3a0ed8c9dc699c76f303dc91b524c4..7a4af86072179dcd6bcdb93860eeb4d28779377f 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -18,6 +18,7 @@ clk-test-y			:= clk_test.o \
 				   kunit_clk_assigned_rates_without_consumer.dtbo.o \
 				   kunit_clk_assigned_rates_zero.dtbo.o \
 				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
+				   kunit_clk_hw_get_dev_of_node.dtbo.o \
 				   kunit_clk_parent_data_test.dtbo.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-fixed-factor.o
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index f08feeaa3750bc86859294650de298762dea690a..3dcf7f0747aad9b93c41632db68ecb9b141e7daf 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -2794,43 +2794,40 @@ static struct kunit_suite clk_register_clk_parent_data_of_suite = {
 };
 
 /**
- * struct clk_register_clk_parent_data_device_ctx - Context for clk_parent_data device tests
+ * struct clk_register_device_ctx - Context for clock device tests
  * @dev: device of clk under test
  * @hw: clk_hw for clk under test
  * @pdrv: driver to attach to find @dev
  */
-struct clk_register_clk_parent_data_device_ctx {
+struct clk_register_device_ctx {
 	struct device *dev;
 	struct clk_hw hw;
 	struct platform_driver pdrv;
 };
 
-static inline struct clk_register_clk_parent_data_device_ctx *
-clk_register_clk_parent_data_driver_to_test_context(struct platform_device *pdev)
+static inline struct clk_register_device_ctx *
+clk_register_device_to_test_context(struct platform_device *pdev)
 {
 	return container_of(to_platform_driver(pdev->dev.driver),
-			    struct clk_register_clk_parent_data_device_ctx, pdrv);
+			    struct clk_register_device_ctx, pdrv);
 }
 
-static int clk_register_clk_parent_data_device_probe(struct platform_device *pdev)
+static int clk_register_device_probe(struct platform_device *pdev)
 {
-	struct clk_register_clk_parent_data_device_ctx *ctx;
+	struct clk_register_device_ctx *ctx;
 
-	ctx = clk_register_clk_parent_data_driver_to_test_context(pdev);
+	ctx = clk_register_device_to_test_context(pdev);
 	ctx->dev = &pdev->dev;
 
 	return 0;
 }
 
-static void clk_register_clk_parent_data_device_driver(struct kunit *test)
+static void clk_register_of_device_driver(struct kunit *test,
+					  const struct of_device_id *match_table)
 {
-	struct clk_register_clk_parent_data_device_ctx *ctx = test->priv;
-	static const struct of_device_id match_table[] = {
-		{ .compatible = "test,clk-parent-data" },
-		{ }
-	};
+	struct clk_register_device_ctx *ctx = test->priv;
 
-	ctx->pdrv.probe = clk_register_clk_parent_data_device_probe;
+	ctx->pdrv.probe = clk_register_device_probe;
 	ctx->pdrv.driver.of_match_table = match_table;
 	ctx->pdrv.driver.name = __func__;
 	ctx->pdrv.driver.owner = THIS_MODULE;
@@ -2839,6 +2836,16 @@ static void clk_register_clk_parent_data_device_driver(struct kunit *test)
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->dev);
 }
 
+static void clk_register_clk_parent_data_device_driver(struct kunit *test)
+{
+	static const struct of_device_id match_table[] = {
+		{ .compatible = "test,clk-parent-data" },
+		{ }
+	};
+
+	clk_register_of_device_driver(test, match_table);
+}
+
 static const struct clk_register_clk_parent_data_test_case
 clk_register_clk_parent_data_device_cases[] = {
 	{
@@ -2909,7 +2916,7 @@ KUNIT_ARRAY_PARAM(clk_register_clk_parent_data_device_test,
  */
 static void clk_register_clk_parent_data_device_test(struct kunit *test)
 {
-	struct clk_register_clk_parent_data_device_ctx *ctx;
+	struct clk_register_device_ctx *ctx;
 	const struct clk_register_clk_parent_data_test_case *test_param;
 	struct clk_hw *parent_hw;
 	struct clk_init_data init = { };
@@ -3016,7 +3023,7 @@ KUNIT_ARRAY_PARAM(clk_register_clk_parent_data_device_hw_test,
  */
 static void clk_register_clk_parent_data_device_hw_test(struct kunit *test)
 {
-	struct clk_register_clk_parent_data_device_ctx *ctx;
+	struct clk_register_device_ctx *ctx;
 	const struct clk_register_clk_parent_data_test_case *test_param;
 	struct clk_dummy_context *parent;
 	struct clk_hw *parent_hw;
@@ -3395,6 +3402,178 @@ static struct kunit_suite clk_assigned_rates_suite = {
 	.init = clk_assigned_rates_test_init,
 };
 
+/*
+ * struct clk_hw_get_dev_of_node_test_param - Test parameters clk_hw_get_dev/of_node tests
+ * @desc: Test description
+ * @has_ref: whether or not to pass the device/of_node to the register function
+ */
+struct clk_hw_get_dev_of_node_test_param {
+	const char *desc;
+	bool has_ref;
+};
+
+static const struct clk_hw_get_dev_of_node_test_param
+clk_hw_get_dev_test_params[] = {
+	{
+		.desc = "clock with device reference",
+		.has_ref = true,
+	}, {
+		.desc = "clock missing device reference",
+		.has_ref = false,
+	},
+};
+KUNIT_ARRAY_PARAM_DESC(clk_hw_get_dev, clk_hw_get_dev_test_params, desc)
+
+static const struct clk_init_data clk_hw_get_dev_of_node_init_data = {
+	.name = "clk_hw_get_dev_of_node",
+	.ops = &empty_clk_ops,
+};
+
+static void clk_hw_register_get_dev_test(struct kunit *test)
+{
+	const struct clk_hw_get_dev_of_node_test_param *test_param = test->param_value;
+	struct clk_register_device_ctx *ctx = test->priv;
+	struct device *dev = test_param->has_ref ? ctx->dev : NULL;
+
+	KUNIT_ASSERT_EQ(test, 0, clk_hw_register_kunit(test, dev, &ctx->hw));
+
+	KUNIT_EXPECT_PTR_EQ(test, dev, clk_hw_get_dev(&ctx->hw));
+}
+
+static void clk_hw_register_get_of_node_test(struct kunit *test)
+{
+	const struct clk_hw_get_dev_of_node_test_param *test_param = test->param_value;
+	struct clk_register_device_ctx *ctx = test->priv;
+	struct device *dev = test_param->has_ref ? ctx->dev : NULL;
+	struct device_node *np = NULL;
+
+	if (dev) {
+		np = dev_of_node(dev);
+
+		if (!np)
+			np = dev_of_node(dev->parent);
+	}
+
+	KUNIT_ASSERT_EQ(test, 0, clk_hw_register_kunit(test, dev, &ctx->hw));
+
+	KUNIT_EXPECT_PTR_EQ(test, np, clk_hw_get_of_node(&ctx->hw));
+}
+
+static int clk_hw_register_get_dev_of_node_test_init(struct kunit *test)
+{
+	struct clk_register_device_ctx *ctx;
+	static const struct of_device_id match_table[] = {
+		{ .compatible = "test,clk-hw-get-dev-of-node" },
+		{ }
+	};
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_hw_get_dev_of_node));
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+	test->priv = ctx;
+
+	clk_register_of_device_driver(test, match_table);
+	ctx->hw.init = &clk_hw_get_dev_of_node_init_data;
+
+	return 0;
+}
+
+static struct kunit_case clk_hw_register_get_dev_of_node_test_cases[] = {
+	KUNIT_CASE_PARAM(clk_hw_register_get_dev_test,
+			 clk_hw_get_dev_gen_params),
+	KUNIT_CASE_PARAM(clk_hw_register_get_of_node_test,
+			 clk_hw_get_dev_gen_params),
+	{}
+};
+
+/*
+ * Test suite to verify clk_hw_get_dev() and clk_hw_get_of_node() with
+ * registered through clk_hw_register()
+ */
+static struct kunit_suite clk_hw_register_get_dev_of_node_test_suite = {
+	.name = "clk_hw_register_get_dev_of_node_test_suite",
+	.init = clk_hw_register_get_dev_of_node_test_init,
+	.test_cases = clk_hw_register_get_dev_of_node_test_cases,
+};
+
+struct of_clk_register_ctx {
+	struct device_node *np;
+	struct clk_hw hw;
+};
+
+static const struct clk_hw_get_dev_of_node_test_param
+clk_hw_get_of_node_test_params[] = {
+	{
+		.desc = "clock with of_node reference",
+		.has_ref = true,
+	}, {
+		.desc = "clock missing of_node reference",
+		.has_ref = false,
+	},
+};
+KUNIT_ARRAY_PARAM_DESC(clk_hw_get_of_node, clk_hw_get_of_node_test_params, desc)
+
+static void of_clk_hw_register_get_dev_test(struct kunit *test)
+{
+	const struct clk_hw_get_dev_of_node_test_param *test_param = test->param_value;
+	struct of_clk_register_ctx *ctx = test->priv;
+	struct device_node *np = test_param->has_ref ? ctx->np : NULL;
+
+	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, np, &ctx->hw));
+
+	KUNIT_EXPECT_PTR_EQ(test, NULL, clk_hw_get_dev(&ctx->hw));
+}
+
+static void of_clk_hw_register_get_of_node_test(struct kunit *test)
+{
+	const struct clk_hw_get_dev_of_node_test_param *test_param = test->param_value;
+	struct of_clk_register_ctx *ctx = test->priv;
+	struct device_node *np = test_param->has_ref ? ctx->np : NULL;
+
+	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, np, &ctx->hw));
+
+	KUNIT_EXPECT_PTR_EQ(test, np, clk_hw_get_of_node(&ctx->hw));
+}
+
+static int of_clk_hw_register_get_dev_of_node_test_init(struct kunit *test)
+{
+	struct of_clk_register_ctx *ctx;
+
+	KUNIT_ASSERT_EQ(test, 0,
+			of_overlay_apply_kunit(test, kunit_clk_hw_get_dev_of_node));
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx);
+	test->priv = ctx;
+
+	ctx->np = of_find_compatible_node(NULL, NULL, "test,clk-hw-get-dev-of-node");
+	of_node_put_kunit(test, ctx->np);
+
+	ctx->hw.init = &clk_hw_get_dev_of_node_init_data;
+
+	return 0;
+}
+
+static struct kunit_case of_clk_hw_register_get_dev_of_node_test_cases[] = {
+	KUNIT_CASE_PARAM(of_clk_hw_register_get_dev_test,
+			 clk_hw_get_of_node_gen_params),
+	KUNIT_CASE_PARAM(of_clk_hw_register_get_of_node_test,
+			 clk_hw_get_of_node_gen_params),
+	{}
+};
+
+/*
+ * Test suite to verify clk_hw_get_dev() and clk_hw_get_of_node() with
+ * registered through of_clk_hw_register()
+ */
+static struct kunit_suite of_clk_hw_register_get_dev_of_node_test_suite = {
+	.name = "of_clk_hw_register_get_dev_of_node_test_suite",
+	.init = of_clk_hw_register_get_dev_of_node_test_init,
+	.test_cases = of_clk_hw_register_get_dev_of_node_test_cases,
+};
+
 kunit_test_suites(
 	&clk_assigned_rates_suite,
 	&clk_leaf_mux_set_rate_parent_test_suite,
@@ -3412,6 +3591,8 @@ kunit_test_suites(
 	&clk_register_clk_parent_data_device_suite,
 	&clk_single_parent_mux_test_suite,
 	&clk_uncached_test_suite,
+	&clk_hw_register_get_dev_of_node_test_suite,
+	&of_clk_hw_register_get_dev_of_node_test_suite,
 );
 MODULE_DESCRIPTION("Kunit tests for clk framework");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/kunit_clk_hw_get_dev_of_node.dtso b/drivers/clk/kunit_clk_hw_get_dev_of_node.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..760717da32359e85d946c53e47e72994b1d51417
--- /dev/null
+++ b/drivers/clk/kunit_clk_hw_get_dev_of_node.dtso
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	kunit-clock-controller {
+		compatible = "test,clk-hw-get-dev-of-node";
+		#clock-cells = <0>;
+	};
+};

-- 
2.47.2

