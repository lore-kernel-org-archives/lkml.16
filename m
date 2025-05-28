Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B157F7FC
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474249; cv=none; b=OsgaNbazJEmw7haOdMWy1yd8N/R5JLpTuLMAkOjDmYXT7DkHMoZBNoudniB6vTpv8IbTCnpN8Rul50GwwDsVFhpWvWX4uwzlJQIPxZZn+Fohqywi5uyan7Qn3OWAJTBzYJvsO7KmD0AGpqPJDhVJ2Qk24HI+KWaIEEQDbnYXjOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474249; c=relaxed/simple;
	bh=IGEeR6GetpJ5C1jEWi5w6/QO0GccDmMEscoH2i9wX9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqIJRjnyZk8ppBWARd9Kzs3UjXdD0qWEIRRxjE5Mm+6QDH8WmTB8x/5FHT4Z+TQGM168jKBuvkojs4ta8NAh5GtkIermS1gr5p8JS0gO1EIVLT/eqJsDrlzk+rKKxynax3rlVKGbIiKvrvFRN8ukeXbMyW+bCxesTqL185oQFF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oe8FtQ9y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oe8FtQ9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G3a/LsUeYxbB9EWmt1iNbsdUxpfsyTRKAQHGwuVJdP0=;
	b=Oe8FtQ9ygq2UYcJsDDGhH2l6tQ/AH7RJBP8OFGBjn4tJKDems7XwwSw5TW1xTnHtT9W6u+
	dIpdW9nLpIeIAlAEs+Doj8f+A25s7BpghWiZyYJo7tV2oYsEwsVmiU3Wd+UHLqxOmKXoVf
	pXHF5gC9Gv74wc47LnlraMGreUaJR+g=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-UwruRHbiN6-T3XHQQJBHdQ-1; Wed, 28 May 2025 19:17:22 -0400
X-MC-Unique: UwruRHbiN6-T3XHQQJBHdQ-1
X-Mimecast-MFC-AGG-ID: UwruRHbiN6-T3XHQQJBHdQ_1748474242
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c793d573b2so47237585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474241; x=1749079041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3a/LsUeYxbB9EWmt1iNbsdUxpfsyTRKAQHGwuVJdP0=;
        b=tm9eraDzYXK6buzIuz6hBFhb0BVmWTd3czRJLpL2hxBxkxuZBq/KpVzImRoUvh6nD6
         lzxEBR16uupEl2v3UdX2CIA08p1SqXOtHM7flUCZpfIMDczxO1/6yrLK/KBkdNYo+rg1
         FnwnkB92fN6n6xqBHJDLvXXPWIrjPpuzEsFemeHYuyqQKnwDdt2zCcjJYLXqNAlYFTzZ
         iUAHb/u1KgBmeSOkpKLiK1iy3AKmxr+sRoR7V22a24dQ8LDqC8xx2iEzFpGUdUW0hJ0f
         3jaUvqAHOE5Xys8LH/CB7CY4y7kfv0J8bPQOvUUX6moaI1Moxe/omwHTER/BhZul8ATh
         R1bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXx3Xx6y3IqQ3LMbCflYuimw4C9mw6UoHwQupDCv8X9cU6QaHZwLPNdC4hITdjrdhsv1aM6BsfZRt91VAc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLzO0vpQopfclC26MLejLrfNwyhbeB0CSTJK1FvGqE8JYSI5zn
	ZBT+4BB+YYbe9pxtY9hEz/KPdV/uEDrdoRRzNhcJAvvYCkplEmrbdWFQZFLTIo5p4P9QgAbo3FA
	I9yr6plzqf6PjILJxeYli13loYXz95AeO18BWE8AuV12H2rCJqieGlTjxCtWdy7mkdsCQp0kwBd
	Ma1DvgZVi5kwdnt6jEZwdhjQ45o3L1LsIyi1DW59pNm5ISEK6YLXo=
X-Gm-Gg: ASbGncuxuu5eePaLuBaeRBpWNyfqkWg2/DjNlFKN3eKQgkQAJsF96+HXzLRCW9Bc3fJ
	leRMuGmn94Q7t+DuY33kkmsWaeuzD/i+0yEw63dgStuAoibtmj7sYDPH15bY5VrSlvW/V6dG6I8
	qt7VsR7HHFcrIJyl/odnL2tECNSHK2J/8qGBiPwdn0ji1ypPgR35Wobz/AkKmsVFu+PVpJsNc1B
	Pmc28CgJCzUPNMXsY82TUJwbiy4543PRShGJ556XDvxvCPuuIIr3Kn/e9A4PJngTzqywS1281mB
	eqjToAGLzQs8gQXjL6dTr0Jp5JrHkKKn2MpKCfcNmtwioqKmgg==
X-Received: by 2002:a05:620a:26a3:b0:7cd:148:d584 with SMTP id af79cd13be357-7d09ab46971mr19719785a.31.1748474240959;
        Wed, 28 May 2025 16:17:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmRPQZj12tCsTAJ/q6xHaiHddNwtxTaCIq44YvIyx/ySfBkz+7Y+7BxJoKx6jA0WadX/T3Eg==
X-Received: by 2002:a05:620a:26a3:b0:7cd:148:d584 with SMTP id af79cd13be357-7d09ab46971mr19714885a.31.1748474240415;
        Wed, 28 May 2025 16:17:20 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:18 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 28 May 2025 19:16:51 -0400
Subject: [PATCH v2 05/10] clk: test: introduce test suite for sibling rate
 changes on a divider
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-clk-wip-v2-v2-5-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
In-Reply-To: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=6278;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=IGEeR6GetpJ5C1jEWi5w6/QO0GccDmMEscoH2i9wX9o=;
 b=wz7OjZHAO1SRXStjvpw6TOd8nv7KQP7thAXi6sg6OB60ne0EEWbJghfSwYCkBwP2fyTfSNL03
 lG8HK4lbStRBLcmDcC8u7Z1uB/tcA6ES5Or+h5wqLCXCxjM0vuAt2en
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Introduce a test suite that creates a parent with two divider-only
children, and ensure that changing the rate of one child does not
affect the rate of the sibling.

Some of the tests are disabled until the relevant issue(s) are fixed in
the clk core.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 139 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 4908fb9c0c46e34063ecf696e49b48510da44538..35f516fd71a2e33ca19a0512bd2db02111ea644c 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -653,6 +653,144 @@ clk_multiple_parents_mux_test_suite = {
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
+ * requested rates. The internal divider for child1 will be changed from 0 to 2.
+ */
+static void clk_test_rate_change_sibling_div_div_3(struct kunit *test)
+{
+	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
+	int ret;
+
+	/* Validate initial child rates and divider states. */
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_24_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 0);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 0);
+
+	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_16_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate(ctx->child2_clk, DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	KUNIT_EXPECT_GE(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_16_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child1.div, 2);
+	KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_48_MHZ);
+	KUNIT_EXPECT_EQ(test, ctx->child2.div, 0);
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
@@ -3445,6 +3583,7 @@ kunit_test_suites(
 	&clk_leaf_mux_set_rate_parent_test_suite,
 	&clk_test_suite,
 	&clk_multiple_parents_mux_test_suite,
+	&clk_rate_change_sibling_div_div_test_suite,
 	&clk_mux_no_reparent_test_suite,
 	&clk_mux_notifier_test_suite,
 	&clk_orphan_transparent_multiple_parent_mux_test_suite,

-- 
2.49.0

