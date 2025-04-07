Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBF6253B51
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031600; cv=none; b=NQ8cjuF71UuTKAysJTMAmCe/AA8il9KYYxYe507haIqLO4Xy3RRy0cW2zgsw2yx62MDMcXDupPqZqsCmPs+T6Owcoo1eGRa4WGRPcCJEx0RKpWwkBvYRno9bNxUKRLZuNDE/uXlRqEBcfmHIK8uikhuw7NHN+pWNrh1H1I+3I8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031600; c=relaxed/simple;
	bh=ZYipNs+crvm5U+agBHLVdGPNoOm0fvljgZMQ2NaTkBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=S9SWdoUJ/KgoAhNlYUqvbjOO+rB4I9Dc2jm++Ndfc0b/UHNyFMPNzFfnFjZDLkz4tXwDhM6l0TYW72dACUUWK9i7LNQ4Xeg20GeBiUppzEDfiOkU1yJH5WEhgED/V9665b108/+6qDJz313qzBSbhm1JARbWOB2dxC8rXzEZWtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J2CJsjmv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J2CJsjmv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kj6PU5kJaei74PopQFAd4HOXHT8Ovro9cVP0ls9g+Yo=;
	b=J2CJsjmvLccKUcABfg43Ud2o0O/yKyay5exePThxSsfV09bclZ8NTecykKp02emUuGNgUQ
	seCGkOxBgG5jaeFJmwtr6JlvDCpymyGynet0S/ybRZEml+/wFEpy+sqKjQMcx6DehX9O01
	pwbT87e/GBV+JPIRXZrgq6zcOy8MCwc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-k3wcpzsJPTyjxBloQ4Ylmw-1; Mon, 07 Apr 2025 09:13:16 -0400
X-MC-Unique: k3wcpzsJPTyjxBloQ4Ylmw-1
X-Mimecast-MFC-AGG-ID: k3wcpzsJPTyjxBloQ4Ylmw_1744031596
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f0c089909aso30579446d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031596; x=1744636396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kj6PU5kJaei74PopQFAd4HOXHT8Ovro9cVP0ls9g+Yo=;
        b=EDYASOb18k9Do0za2u2eCkpVmJPNDfGl2PJAUp0zzg58v0hCWnpsiZNo8KzE7kVB13
         2NB/Ic8G0HCIao7pAmsIrhdkrF9vXauPZaq8ghgDd+BcYQ6uGk9H7CqoJknolz8m9x/e
         xOTVIprQghxtNfmDSAemdxIY2hX0nAPrycX8u2V4vseA9jKudao/jMOI9Z5uOXQrogc+
         x5+8KL16vxtoSI5QCHKUtdWvItKoBgqLvG2CCjsfY6T+HCs9TYKV9HwzXeE8yg7kr+uM
         +shy8RZY2eqIY/updD70SJAWHriWYeg8iaaia18FJGTPMe6HO85ZbDJT32z5Q+My8XTM
         59Yg==
X-Forwarded-Encrypted: i=1; AJvYcCV4B2yebs+m5FhFkvVv+CEJoCyx3ZmKQ1rBWGZ9g4odPwO67NOgaivvsReR3TOi4EOtyBHHk/3104hkNgo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFfWJiyE1LjlJH4BAwctuPzgepCAaZqpVxUT/1wNXimdKXzBj1
	TGPqVNMQEVStFkFkCFev+OHrUzHlL7yz7cRLwAy3Uiov0D9H332mHGi/oNUQjcPBbKnU6AHffSv
	UtbJy6H0r7KDR/h0zNVgdxtsAHASJG/0z3/3Pf4j8Ruft0Wpe5o/CSnMC1z54FA==
X-Gm-Gg: ASbGncvFPLkGkTS2b0ks7k5johrLrd19f+0v5fLvIXFPnPwm3p3qq/FrI7WKFBo7exA
	g5UGSU6Q28Ds/ocNgXz5U0t8ouaHmCgdRwzcudxJTdiDe5Q+EZFhbm4OD7WDNs2MVJ54GFDSX2v
	sa3qS00/BRdt6Z0RPnGIdz7+1TRt+WkfoRjjlvoajMK9GA3hRtN9OwisrDEFHeZGB0GHhSBD6mX
	jxWM64gtS3v8Z/ZH3t7Rij8I3xIzver2XYDHnQDLnD9XrgBKCPf1pYVPTaC04x82my/KWHOPs/G
	V5HP+w7Rdclf/0pl+K/BwBKNqDJqMLI4Bz74oGfZpQ==
X-Received: by 2002:a05:6214:1d2d:b0:6e8:ef80:bcbc with SMTP id 6a1803df08f44-6f00debc511mr203626156d6.5.1744031595743;
        Mon, 07 Apr 2025 06:13:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGByCpQR2AniaNCjBHDOmGlDE2aS5mpzlnF4QdIIC1rtfrWYX0CPYIvd3RuYJyKvftUvu52LQ==
X-Received: by 2002:a05:6214:1d2d:b0:6e8:ef80:bcbc with SMTP id 6a1803df08f44-6f00debc511mr203625856d6.5.1744031595407;
        Mon, 07 Apr 2025 06:13:15 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:13 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 3/8] clk: test: introduce test suite for sibling rate changes on a divider
Date: Mon,  7 Apr 2025 09:12:53 -0400
Message-ID: <20250407131258.70638-4-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407131258.70638-1-bmasney@redhat.com>
References: <20250407131258.70638-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Introduce a test suite that creates a parent with two divider-only
children, and ensure that changing the rate of one child does not
affect the rate of the sibling.

Some of the tests are disabled until the relevant issue(s) are fixed in
the clk core.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 135 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 4908fb9c0c46..7d4dd1a559db 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -653,6 +653,140 @@ clk_multiple_parents_mux_test_suite = {
 	.test_cases = clk_multiple_parents_mux_test_cases,
 };
 
+struct clk_rate_change_sibling_div_div_context {
+	struct clk_dummy_context parent;
+	struct clk_dummy_div child1, child2;
+	struct clk *parent_clk, *child1_clk, *child2_clk;
+};
+
+static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx;
+	int ret;
+
+	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+	test->priv = ctx;
+
+	ctx->parent.hw.init = CLK_HW_INIT_NO_PARENT("parent", &clk_dummy_rate_ops, 0);
+	ctx->parent.rate = DUMMY_CLOCK_RATE_24_MHZ;
+	ret = clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
+	if (ret)
+		return ret;
+
+	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->parent.hw,
+					     &clk_dummy_div_ops,
+					     CLK_SET_RATE_PARENT);
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
+	if (ret)
+		return ret;
+
+	ctx->child2.hw.init = CLK_HW_INIT_HW("child2", &ctx->parent.hw,
+					     &clk_dummy_div_ops,
+					     CLK_SET_RATE_PARENT);
+	ret = clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
+	if (ret)
+		return ret;
+
+	ctx->parent_clk = clk_hw_get_clk(&ctx->parent.hw, NULL);
+	ctx->child1_clk = clk_hw_get_clk(&ctx->child1.hw, NULL);
+	ctx->child2_clk = clk_hw_get_clk(&ctx->child2.hw, NULL);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_24_MHZ);
+
+	return 0;
+}
+
+static void clk_rate_change_sibling_div_div_test_exit(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+
+	clk_put(ctx->parent_clk);
+	clk_put(ctx->child1_clk);
+	clk_put(ctx->child2_clk);
+}
+
+/*
+ * Test that, for a parent with two divider-only children and one requests a
+ * rate compatible with the existing parent rate, the parent and sibling rates
+ * are not affected.
+ */
+static void clk_test_rate_change_sibling_div_div_1(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_6_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_24_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_6_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+}
+
+/*
+ * Test that, for a parent with two divider-only children and one requests a
+ * rate incompatible with the existing parent rate, the sibling rate is not
+ * affected.
+ */
+static void clk_test_rate_change_sibling_div_div_2(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+}
+
+/*
+ * Test that, for a parent with two divider-only children that request rates
+ * incompatible with the existing parent rate, both children end up with the
+ * requested rates.
+ */
+static void clk_test_rate_change_sibling_div_div_3(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_16_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate(ctx->child2_clk, DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_16_MHZ);
+}
+
+static struct kunit_case clk_rate_change_sibling_div_div_cases[] = {
+	KUNIT_CASE(clk_test_rate_change_sibling_div_div_1),
+	KUNIT_CASE(clk_test_rate_change_sibling_div_div_2),
+	KUNIT_CASE(clk_test_rate_change_sibling_div_div_3),
+	{}
+};
+
+/*
+ * Test suite that creates a parent with two divider-only children, and
+ * ensures that changing the rate of one child does not affect the rate
+ * of the other child.
+ */
+static struct kunit_suite clk_rate_change_sibling_div_div_test_suite = {
+	.name = "clk-rate-change-sibling-div-div",
+	.init = clk_rate_change_sibling_div_div_test_init,
+	.exit = clk_rate_change_sibling_div_div_test_exit,
+	.test_cases = clk_rate_change_sibling_div_div_cases,
+};
+
 static int
 clk_orphan_transparent_multiple_parent_mux_test_init(struct kunit *test)
 {
@@ -3445,6 +3579,7 @@ kunit_test_suites(
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
+	&clk_rate_change_sibling_div_div_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,
-- 
2.49.0

